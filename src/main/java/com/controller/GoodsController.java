package com.controller;

import java.io.FileWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dto.CartDTO;
import com.dto.GoodsDTO;
import com.dto.GoodsPagingDTO;
import com.dto.MemberDTO;
import com.dto.NoticePagingDTO;
import com.dto.OrderDTO;
import com.service.GoodsListService;
import com.service.GoodsService;
import com.service.MemberService;

@Controller
public class GoodsController {
	@Autowired
	GoodsService service;
	@Autowired
	GoodsListService lService;
	@Autowired
	MemberService mService;

	// 에러처리
	@ExceptionHandler({ Exception.class })
	public String errorPage() {
		return "error/error";
	}

	@RequestMapping("/loginCheck/orderDone")
	public String orderDone(@RequestParam("payMethod") String payMethod, HttpSession session, RedirectAttributes xxx,
			@RequestParam("orderName") String orderName, @RequestParam("post") String postcode,
			@RequestParam("addr1") String roadAddress, @RequestParam("addr2") String jibunAddress,
			@RequestParam("phone") String phone) throws Exception {
		System.out.println("컨트롤러 들어옴");
		System.out.println("결제수단: " + payMethod);

		List<CartDTO> list_CartDTO = (List<CartDTO>) session.getAttribute("list_CartDTO");
		System.out.println(list_CartDTO);
		MemberDTO mDTO = (MemberDTO) session.getAttribute("mDTO");
		System.out.println(mDTO);

		List<OrderDTO> list_OrderDTO = new ArrayList<OrderDTO>();
		int i = 0;
		for (CartDTO cDTO : list_CartDTO) {
			OrderDTO oDTO = new OrderDTO();
			oDTO.setNum(cDTO.getNum());
			oDTO.setUserid(mDTO.getUserid());
			oDTO.setgCode(cDTO.getgCode());
			oDTO.setgName(cDTO.getgName());
			oDTO.setgPrice(cDTO.getgPrice());
			oDTO.setgAmount(cDTO.getgAmount());
			oDTO.setgImage(cDTO.getgImage());
			oDTO.setOrderName(orderName);
			oDTO.setgCategory(cDTO.getgCategory());
			oDTO.setPost(postcode);
			oDTO.setAddr1(roadAddress);
			oDTO.setAddr2(jibunAddress);
			oDTO.setPhone(phone);
			oDTO.setPayMethod(payMethod);
			list_OrderDTO.add(oDTO);
		}
		System.out.println(list_OrderDTO);

		List<HashMap> list_map = new ArrayList<HashMap>();
		List<Integer> list_num = new ArrayList<Integer>();
		// 재고 파악

		for (OrderDTO oDTO : list_OrderDTO) {
			System.out.println("결제수단: " + oDTO.getPayMethod());
			HashMap map = new HashMap();

			int Stock = service.getgStock(oDTO); // 주문하려는 상품의 재고
			int gAmount = oDTO.getgAmount(); // 주문하려는 양
			String gCode = oDTO.getgCode(); // 주문하려는 제품코드
			int AfterStock = Stock - gAmount; // 주문완료 후 남은 재고의 양

			map.put("gCode", oDTO.getgCode());
			map.put("gStock", AfterStock);

			list_map.add(map);
			list_num.add(oDTO.getNum());

			if (AfterStock < 1) { // 재고가 없는 경우
				session.setAttribute("mesg", oDTO.getgCode() + "상품의 재고가 없습니다");
				session.setAttribute("gStock", Stock);
				return "redirect:../loginCheck/cartList";
			}
		}

		System.out.println(list_map);
		service.orderAllDone(list_OrderDTO, list_num, list_map);
		xxx.addFlashAttribute("list_OrderDTO", list_OrderDTO);
		return "redirect:../orderDone";
	}

	@RequestMapping("/loginCheck/orderConfirm")
	public String orderConfirm(@RequestParam("num") int num, HttpSession session, RedirectAttributes xxx)
			throws Exception {
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
		String userid = mDTO.getUserid();
		mDTO = mService.myPage(userid); // 사용자 정보 가져오기
		CartDTO cart = service.orderConfirmByNum(num); // 장바구니 정보가져오기
		xxx.addFlashAttribute("mDTO", mDTO); // request에 회원정보저장
		xxx.addFlashAttribute("cDTO", cart); // request에 카트정보저장
		return "redirect:../orderConfirm"; // servlet-context에 등록
	}

	@RequestMapping(value = "/loginCheck/orderAllCart")
	public String orderAllCart(@RequestParam("check") ArrayList<String> list, HttpSession session,
			RedirectAttributes xxx) throws Exception {
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
		String userid = mDTO.getUserid();
		mDTO = mService.myPage(userid); // 사용자 정보 가져오기
		List<CartDTO> cart_list = service.orderConfirmByCheck(list); // 장바구니 정보가져오기
		System.out.println(cart_list);
		
		
		
		xxx.addFlashAttribute("mDTO", mDTO); // request에 회원정보저장
		xxx.addFlashAttribute("cDTO_list", cart_list); // request에 카트정보저장

		return "redirect:../orderConfirm"; // servlet-context에 등록
	}

	@RequestMapping(value = "/loginCheck/delAllCart")
	public String delAllCart(@RequestParam("check") ArrayList<String> list) throws Exception {
		System.out.println(list);
		service.delAllCart(list);
		return "redirect:../loginCheck/cartList";
	}

	@RequestMapping(value = "/loginCheck/cartDelete")
	@ResponseBody
	public void cartDelte(@RequestParam("num") int num) throws Exception {
		System.out.println(num);
		service.cartDelete(num);
	}

	@RequestMapping(value = "/loginCheck/cartUpdate")
	@ResponseBody
	public void cartUpdate(@RequestParam Map<String, String> map) throws Exception {
		System.out.println(map);
		service.cartUpdate(map);
	}

	@RequestMapping("/loginCheck/cartList")
	public String cartList(RedirectAttributes attr, HttpSession session) throws Exception {
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		String userid = dto.getUserid();
		List<CartDTO> list = service.cartList(userid);
		attr.addFlashAttribute("cartList", list);// 리다이렉트시 데이터 유지
		return "redirect:../cartList"; // servlet-context에 등록

	}

	@RequestMapping("/loginCheck/cartAdd")
	public String cartAdd(CartDTO cart, HttpSession session) throws Exception {
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
		cart.setUserid(mDTO.getUserid());
		session.setAttribute("mesg", cart.getgCode());
		service.cartAdd(cart);
		return "redirect:../goodsRetrieve?gCode=" + cart.getgCode();
	}

	@RequestMapping("/goodsRetrieve") // goodsRetrieve.jsp
	@ModelAttribute("goodsRetrieve") // key값
	public GoodsDTO goodsRetrieve(@RequestParam("gCode") String gCode) throws Exception {
		GoodsDTO dto = service.goodsRetrieve(gCode);
		return dto;
	}
	@RequestMapping(value = "/adminGedit")
	public String adminGedit(HttpSession session) throws Exception {
		return "redirect:/goodsEdit?gCategory=Vegetable";
	}

	@RequestMapping(value = "/goodsAdd")
	@ResponseBody
	public String goodsRemove(GoodsDTO dto) throws Exception {
		System.out.println(dto);
		service.goodsAdd(dto);
		return "redirect:../goodsEdit";
	}

	@RequestMapping(value = "/goodsRemove")
	@ResponseBody
	public void goodsRemove(@RequestParam("gCode") String gCode) throws Exception {
		System.out.println(gCode);
		service.goodsRemove(gCode);
	}
	
	@RequestMapping(value = "/goodsRemoveAll")
	public String goodsRemoveAll(@RequestParam("gCcheck") ArrayList<String> list, @RequestParam("gCategoryEdit") String gCategoryEdit) throws Exception {
		System.out.println(list);
		service.goodsRemoveAll(list);
		return "redirect:/goodsEdit?gCategory="+gCategoryEdit;
	}
	
	@RequestMapping(value = "/goodsUpdate")
	@ResponseBody
	public void goodsUpdate(GoodsDTO dto) throws Exception {
		System.out.println(dto);
		service.goodsUpdate(dto);
	}
		
	@RequestMapping(value = "/goodsEdit") // goodsEdit.jsp
	public ModelAndView goodsEdit(@RequestParam("gCategory") String gCategory) throws Exception {
		if (gCategory == null) {
			gCategory = "Vegetable";
		}
		List<GoodsDTO> list = service.goodsList(gCategory);
		ModelAndView mav = new ModelAndView();
		mav.addObject("goodsEdit", list);
		// request.setAttribute("goodsList", list)와 동일
		mav.setViewName("adminGedit"); // main.jsp
		return mav;
	}
		
	@RequestMapping(value = "goodsList", method = RequestMethod.GET)
	public String goodsList(Model model, HttpSession session,
			GoodsPagingDTO gDTO
			, @RequestParam("gCategory") String gCategory
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="countPerPage", required=false)String countPerPage) throws Exception {
		if (gCategory == null) {
			gCategory = "Vegetable";
		}
		int total = lService.countGoods(gCategory);
		System.out.println("nowPage = " + nowPage);
		if(nowPage == null && countPerPage == null) {
				nowPage = "1";
				countPerPage = "20";
		} else if (nowPage ==null) {
				nowPage = "1";
		} else if (countPerPage == null) {
				countPerPage = "20";
		}
		gDTO = new GoodsPagingDTO(gCategory, total, Integer.parseInt(nowPage), Integer.parseInt(countPerPage));
		model.addAttribute("paging", gDTO);
		model.addAttribute("goodsList", lService.selectGoodsList(gDTO));
		return "main";
	}
	
	@RequestMapping(value = "search", method = RequestMethod.GET)
	public String searchList(Model model, HttpSession session, @RequestParam("key") String key) throws Exception {
		if (key == null) {
			System.out.println("검색어가 없습니다");			;
		}
		model.addAttribute("searchCount", lService.countSearchGoods(key));
		model.addAttribute("goodsList", lService.searchGoodsList(key));
		model.addAttribute("isSearch", true);
		return "main";
	}
}
