package com.controller;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dto.CartDTO;
import com.dto.GoodsDTO;
import com.service.GoodsService;

@Controller
public class RecipeController {
	@Autowired
	GoodsService service;

	@ExceptionHandler({ Exception.class })
	public String errorPage() {
		return "error/error";// error/error.jsp
	}

	@RequestMapping(value = "/loginCheck/recipeRecomm")
	public String recipeRecomm(@RequestParam("check") ArrayList<String> list, HttpSession session,
			RedirectAttributes attr) throws Exception {
		System.out.println("장바구니에서 받아온 정보" + list);
		session.setAttribute("cartNum", list);

		List<CartDTO> cartList = service.orderConfirmByCheck(list);

		String path = "C:\\GitTeam\\" + cartList.get(0).getNum() + ".txt";

		try (FileWriter fw = new FileWriter(path);) {
			for (CartDTO cart : cartList) {
				fw.write(cart.getgName() + '\n');
			}

			System.out.println("Successfully wrote to the file.");
		} catch (Exception e) {
			System.out.println("An error occurred.");
			e.printStackTrace();
		}

		// json 받아와서 코드, 이미지, 유알엘 넘겨주기
		JSONParser parser = new JSONParser();

		try {
			FileReader reader = new FileReader("C:\\recipe.json");
			Object obj = parser.parse(reader);
			JSONObject jsonObject = (JSONObject) obj;

			reader.close();

			System.out.println(jsonObject);

			attr.addFlashAttribute("recipe", jsonObject.get("data"));

		} catch (IOException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "redirect:../recipeRecomm";
	}

	@RequestMapping(value = "/recipeIngred")
	public String recipeIngred(RedirectAttributes attr, @RequestParam("check") ArrayList<String> list,
			@RequestParam("code") String code, HttpSession session, Model model) throws Exception {
		System.out.println("레시피에서 받아온 정보" + list);

		System.out.println("code=" + code);

		// json 받아와서 코드, 이미지, 유알엘 넘겨주기
		JSONParser parser = new JSONParser();

		try {
			FileReader reader = new FileReader("C:\\recipe.json");
			Object obj = parser.parse(reader);
			JSONObject jsonObject = (JSONObject) obj;

			reader.close();

			ArrayList<JSONObject> jsonlst = (ArrayList<JSONObject>) jsonObject.get("data");
			System.out.println(jsonlst);

			List<String> ing = new ArrayList<String>(); // 최초 json 재료 목록
			HashSet<String> ingred = new HashSet<String>(); // (HashSet) json 재료 목록
			HashSet<String> ingred2 = new HashSet<String>(); // cartDTO에 있는 재료 목록
			List<GoodsDTO> recipeGoods = new ArrayList<GoodsDTO>(); // 재료에 해당하는 goods를 db에서 가져옴
			List<CartDTO> cartdto = new ArrayList<CartDTO>(); // 주문정보 가져오기

			// json에서 일치하는 레시피코드 찾아 재료 뽑기
			for (JSONObject j : jsonlst) {
				String jcode = String.valueOf(j.get("code"));

				if (jcode.equals(code)) {
					ing = (ArrayList<String>) j.get("ingredients");
				}
			}

			// 재료 목록을 해쉬셋으로(json을 해쉬셋으로 직접 저장 불가, 원소 하나씩 해쉬셋에 추가해야 함)
			for (String i : ing) {
				ingred.add(i);
			}

			// 주문정보 가져와서 해쉬셋에 추가
			List<CartDTO> cartList = service.orderConfirmByCheck(list);
			for (CartDTO dto : cartList) {
				ingred2.add(dto.getgName());
			}

			// cartList에 일치하는 재료를 빼기(해시셋 차집합)
			ingred.removeAll(ingred2);

			// 재료와 일치하는 상품 정보 가져오기
			for (String i : ingred) {
				// userid, gName 기준으로 insert문 실행 > 수량은 1
				GoodsDTO dto = service.ingredients(i);

				recipeGoods.add(dto);

				// 같은 재료는 삭제하고 없는 재료만 추가
				String gCategory = dto.getgCategory();
				String gName = dto.getgName();
				String gCode = dto.getgCode();
				int gPrice = dto.getgPrice();
				String userid = cartList.get(0).getUserid();
				int gAmount = 1;
				String gImage = dto.getgImage();

				// CartDTO에 값 넣기
				CartDTO cartDto = new CartDTO();

				cartDto.setgAmount(gAmount);
				cartDto.setgCategory(gCategory);
				cartDto.setgCode(gCode);
				cartDto.setgImage(gImage);
				cartDto.setgName(gName);
				cartDto.setgPrice(gPrice);
				cartDto.setUserid(userid);

				service.cartAdd(cartDto);
			}

			String userid = cartList.get(0).getUserid();
			List<CartDTO> list2 = service.cartList(userid);
			session.setAttribute("cartList", list2);
			session.setAttribute("firstCartList", ingred2); // 장바구니에 원래 있던 상품은 cartList.jsp에서 체크하게 하기 위해서 전달

		} catch (IOException e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return "recipeIngred";
	}
}
