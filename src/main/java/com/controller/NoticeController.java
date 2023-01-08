package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dto.MemberDTO;
import com.dto.NoticeDTO;
import com.dto.NoticePagingDTO;
import com.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	NoticeService service;
	
	@ExceptionHandler({Exception.class})
	public String errorPage() {
	  	return "error/error";//error/error.jsp
	  }

	// 비로그인 & 로그인
	@RequestMapping(value = "notice", method = RequestMethod.GET)
	public String notice(Model model, HttpSession session,
			NoticePagingDTO ndto
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="countPerPage", required=false)String countPerPage) throws Exception {
		int total = service.CountBoard();
		System.out.println("nowPage = " + nowPage);
		if(nowPage == null && countPerPage == null) {
				nowPage = "1";
				countPerPage = "10";
		} else if (nowPage ==null) {
				nowPage = "1";
		} else if (countPerPage == null) {
				countPerPage = "10";
		}
		ndto = new NoticePagingDTO(total, Integer.parseInt(nowPage), Integer.parseInt(countPerPage));
		model.addAttribute("paging", ndto);
		model.addAttribute("viewAll", service.SelectBoard(ndto));
		System.out.println("ndto 넘어오는 값 확인용 : "+ ndto.toString());
		return "notice";
	}

	// 로그인상태
//	@RequestMapping(value = "/loginCheck/notice", method = RequestMethod.GET)
//	public String notice2(Model model, HttpSession session,
//			NoticePagingDTO ndto
//			, @RequestParam(value="nowPage", required=false)String nowPage
//			, @RequestParam(value="countPerPage", required=false)String countPerPage) {
//		//List<NoticeDTO> list = service.notice(dto);
//		//System.out.println(list);
//		//model.addAttribute("noticelist", list);
//		MemberDTO mdto = (MemberDTO) session.getAttribute("login");
//		System.out.println(mdto.getUserid());
//		int total = service.CountBoard();
//		System.out.println("nowPage = " + nowPage);
//		if(nowPage == null && countPerPage == null) {
//				nowPage = "1";
//				countPerPage = "10";
//		} else if (nowPage ==null) {
//				nowPage = "1";
//		} else if (countPerPage == null) {
//				countPerPage = "10";
//		}
//		ndto = new NoticePagingDTO(total, Integer.parseInt(nowPage), Integer.parseInt(countPerPage));
//		model.addAttribute("paging", ndto);
//		model.addAttribute("viewAll", service.SelectBoard(ndto));
//		System.out.println("ndto 넘어오는 값 확인용 : "+ ndto.toString());
////		if (mdto.getUserid().equals("admin") && mdto.getPasswd().equals("admin")) {
////			return "notice"; // 관리자전용 notice jsp 만들고 지정할 것
////		} else {
//			return "notice"; // 일반회원 전용 notice jsp 만들고 지정할 것
////		}
//	}

	
	//공지사항 추가
	@RequestMapping(value = "/noticeAdd", method = RequestMethod.GET)
	public String noticeAdd(NoticeDTO dto, Model model, HttpSession session) throws Exception {
		MemberDTO mdto = (MemberDTO) session.getAttribute("login");
		//dto.setWriter(mdto.getUserid());
		
		dto.setWriter(mdto.getUsername());
		service.noticeAdd(dto);
		//System.out.println("추가된 정보가 담긴 리스트 : " + list);
		//m.addAttribute("noticelist", list);
		return "redirect:notice"; 
	}
	
	//공지사항 삭제
	@RequestMapping(value="/noticeDelete", method = RequestMethod.GET)
	@ResponseBody
	public void noticeDelete(@RequestParam("num") int num) throws Exception {
		System.out.println("num = " + num);
		service.noticeDelete(num);
	}
	
	//공지사항 상세보기
	@RequestMapping(value="/detail", method = RequestMethod.GET)
	public String noticedetail(@RequestParam(value="num" ,defaultValue="0")  int num, Model model, HttpSession session) throws Exception {
		System.out.println("num 값이 제대로 넘어오는지 = " + num);
		service.ViewCount(num); //해당글을 보면 조회가 올라가는 기능
		NoticeDTO datalist = service.detail(num);
		System.out.println("data값은 : "+datalist);
		model.addAttribute("datalist", datalist);
		return "detail";
	}
	
	//공지사항 수정
	@RequestMapping(value="/noticeUpdate", method = RequestMethod.GET)
	public String noticeUpdate(NoticeDTO dto, HttpSession session) throws Exception {
		System.out.println("업데이트 전 정보 : "+dto);
		service.noticeUpdate(dto);
		System.out.println("업데이트 후 정보 : "+dto);
		session.setAttribute("mesg", dto.getNum()); //공지사항 수정완료 메세지 전달위한 세션저장
		return "redirect:notice";
	}
	
	

}
