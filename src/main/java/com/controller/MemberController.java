package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dto.GoodsDTO;
import com.dto.MemberDTO;
import com.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	MemberService service;
	  @ExceptionHandler({Exception.class})
	  public String errorPage() {
	  	return "error/error";
	  }
	@RequestMapping(value = "/idDuplicateCheck", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String idDuplicatedCheck(@RequestParam("id") String userid)throws Exception {
		MemberDTO dto= service.myPage(userid);
		System.out.println("idDuplicatedCheck====   "+ userid);
		String mesg="아이디 사용가능";
		if(dto != null) {
			mesg="아이디 중복";
		}
		return mesg;
	}

	@RequestMapping(value = "/loginCheck/memberUpdate")
	public String memberUpdate(MemberDTO m, HttpSession session) throws Exception{
		System.out.println("memberUpdate====="+ m);
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
		String userid= dto.getUserid();
		String passwd= dto.getPasswd();
		m.setUserid(userid);
		m.setPasswd(passwd);
		service.memberUpdate(m);
		return "redirect:../loignCheck/myPage";
	}
	@RequestMapping(value = "/loignCheck/myPage")
	public String myPage(HttpSession session)throws Exception {
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
		String userid= dto.getUserid();
		dto= service.myPage(userid);
		session.setAttribute("login", dto);
		System.out.println("mypage함수 호출 =======");
		return "redirect:../myPage"; //servlet-context에등록		
	}
	@RequestMapping(value = "/memberAdd")
	public String memberAdd(MemberDTO m,Model model) throws Exception{
		service.memberAdd(m);
		model.addAttribute("success", "회원가입성공");
		return "main";
	}
	
	  @RequestMapping(value = "/loginCheck/serviceCenter") 
	  public String login_serviceCenter() throws Exception {
		return "redirect:../serviceCenter";  
	  }
	  
	  @RequestMapping(value = "/serviceCenter") 
	  public String serviceCenter() throws Exception {
		return "serviceCenter";  
	  }
	  
	  	@RequestMapping(value = "/adminMedit")
	public String adminList(HttpSession session) throws Exception {
		return "redirect:/memberEdit";
	}
	
	@RequestMapping(value = "/memberEdit")//memberEdit.jsp
	public ModelAndView memberEdit()throws Exception {
		List<MemberDTO> list= service.memberEdit();
		ModelAndView mav= new ModelAndView();
		mav.addObject("memberEdit", list);
		//request.setAttribute("goodsList", list)와 동일
		mav.setViewName("adminMedit"); //main.jsp
		return mav;	
	}
	@RequestMapping(value = "/mUpdate")
	@ResponseBody
	public void mUpdate(MemberDTO m) throws Exception {
		System.out.println(m);
		service.memberUpdate(m);
	}

	@RequestMapping(value = "/memberDelete")
	@ResponseBody
	public void memberDelete(@RequestParam("userid") String userid) throws Exception {
		System.out.println(userid);
		service.memberDelete(userid);
	}
}
