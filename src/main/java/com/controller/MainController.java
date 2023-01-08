package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dto.GoodsPagingDTO;
import com.service.GoodsListService;
import com.service.GoodsService;

@Controller
public class MainController {

	@Autowired
	GoodsService service;
	@Autowired
	GoodsListService lService;

	@ExceptionHandler({ Exception.class })
	public String errorPage() {
		return "error/error";// error/error.jsp
	}

	@RequestMapping("/")
	public String goodsList(Model model, GoodsPagingDTO gDTO) throws Exception {
		gDTO = new GoodsPagingDTO("Vegetable", lService.countGoods("Vegetable"), 1, 20);
		model.addAttribute("paging", gDTO);
		model.addAttribute("goodsList", lService.selectGoodsList(gDTO));
		return "main";
	}

	@RequestMapping("/loginCheck/main")
	public String main() throws Exception {
		return "redirect:../";
	}
}