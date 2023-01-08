package com.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.MemberDTO;
import com.service.MemberService;

@Controller
public class LoginController {
	@Autowired
	MemberService service;

//에러처리
	@ExceptionHandler({ Exception.class })
	public String errorPage() {
		return "error/error";
	}

	@RequestMapping(value = "/loginCheck/logout")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:../"; // main.jsp
	}

	@RequestMapping(value = "/login")
	public String login(@RequestParam Map<String, String> map, Model model, HttpSession session) throws Exception {
		MemberDTO dto = service.login(map);
		// System.out.println(map);

		// 관리자 인경우
		System.out.println((map.get("userid")));
		System.out.println((map.get("passwd")));
		if (map.get("userid").equals("admin") && map.get("passwd").equals("admin")) { // 관리자 인 경우
			session.setAttribute("login", dto);
			return "adminForm"; // context-servlet.xml에 저장
		} else {
			if (dto != null) {
				session.setAttribute("login", dto);
				return "redirect:/goodsList?gCategory=Vegetable";
			} else {
				model.addAttribute("mesg", "아이디 또는 비번이 잘못되었습니다.");
				return "loginForm";
			}
		}

	}
}
