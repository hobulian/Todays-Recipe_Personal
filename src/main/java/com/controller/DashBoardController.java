package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dto.DashBoardDTO;
import com.dto.GoodsDTO;
import com.dto.OrderdaySalesDTO;
import com.service.DashBoardService;

@Controller
public class DashBoardController {

	@Autowired
	DashBoardService service;

	// 에러처리
	@ExceptionHandler({ Exception.class })
	public String errorPage() {
		return "error/error";
	}

	@RequestMapping(value = "/DDashBoard")
	public String DDashBoard(HttpSession session) throws Exception {
		return "redirect:/DdashBoard";
	}

	@RequestMapping(value = "/CDashBoard")
	public String CDashBoard(HttpSession session) throws Exception {
		return "redirect:/CdashBoard";
	}

	@RequestMapping(value = "/DdashBoard")
	public ModelAndView dashBoard() throws Exception {
		List<OrderdaySalesDTO> list = service.getDaySales();

		// Map으로 변환
		Map<String, Integer> map = new HashMap<String, Integer>();

		for (int i = 0; i < list.size(); i++) {
			map.put(list.get(i).getOrderday(), list.get(i).getSales());
		}

		// 차트로 표현 가능하도록 데이터 가공 [항목, 값]
		String result = "";
		Set<String> keys = map.keySet();

		for (String key : keys) {
			if (result != "") {
				result += ",";
			}
			result += "['" + key + "', " + map.get(key) + "]";
		}

		System.out.println(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("daysales", result);
		mav.setViewName("DDashBoard"); // main.jsp
		return mav;
	}

	@RequestMapping(value = "/selectDay")
	public ModelAndView dashBoard(String startDay, String endDay) throws Exception {
		// 날짜 형식 변환
		startDay = startDay.replaceAll("-", "/");
		endDay = endDay.replaceAll("-", "/");

		// map으로 변환
		Map<String, String> mapDay = new HashMap<String, String>();
		mapDay.put("startDay", startDay);
		mapDay.put("endDay", endDay);

		// orderday, orderday로 그룹화하여 더한 값(sum)
		List<OrderdaySalesDTO> list = service.getDaySalesMap(mapDay);

		// Map으로 변환
		Map<String, Integer> map = new HashMap<String, Integer>();

		for (int i = 0; i < list.size(); i++) {
			map.put(list.get(i).getOrderday(), list.get(i).getSales());
		}

		// 차트로 표현 가능하도록 데이터 가공 [항목, 값]
		String result = "";
		Set<String> keys = map.keySet();

		for (String key : keys) {
			if (result != "") {
				result += ",";
			}
			result += "['" + key + "', " + map.get(key) + "]";
		}

		System.out.println(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("daysales", result);
		// request.setAttribute("goodsList", list)와 동일
		mav.setViewName("DDashBoard"); // main.jsp
		return mav;
	}

	@RequestMapping(value = "/CdashBoard")
	public ModelAndView totalByCategory() throws Exception {
		List<DashBoardDTO> list = service.totalByCategory();
		// 데이터 가공 후 전달
		String result = "";
		for (DashBoardDTO s : list) {
			if (result != "") {
				result += ",";
			}
			String Category = s.getgCategory();
			int Price = Integer.parseInt(s.getTotalPrice());

			result += "['" + Category + "', " + Price + "]";
		}
		System.out.println(result);
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result);
		// request.setAttribute("goodsList", list)와 동일
		mav.setViewName("CDashBoard"); // main.jsp
		return mav;
	}
}
