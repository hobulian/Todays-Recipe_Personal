package com.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dto.MemberDTO;
import com.dto.QaDTO;
import com.service.QaService;
import com.utils.PagingVO;

@Controller
public class QaController {
	
	@Autowired
	QaService service;
	
	//에러처리
	@ExceptionHandler({Exception.class})
	public String errorPage() {
		return "error/error";
	}
	
	// 문의작성폼 열기
	@RequestMapping("/userQA")
	public String userQA() throws Exception {
		return "question";
	}
	
	// 답변작성폼 열기
	@RequestMapping("/managerQA")
	public String managerQA(@RequestParam("num") int num, HttpSession session) throws Exception {
		System.out.println(num);
		QaDTO qdto = service.selectOne(num);
		System.out.println(qdto);
		session.setAttribute("manager_qdto", qdto);
		return "answer";
	}
	
	// 답변 등록하여 테이블 업데이트 하기(관리자)
	@RequestMapping("/answerUpdate")
	public String answerUpdate(@RequestParam Map<Integer, String> map, HttpSession session) throws Exception {
		System.out.println(map);
		int n = service.answerUpdate(map);
		if (n == 1) {
			System.out.println("업데이트 성공");
		} else {
			System.out.println("업데이트 실패");
		}
		session.setAttribute("qmesg", "답변이 등록되었습니다.");
		return "redirect:/manager_qaList";
	}
	
	// 해당 사용자의 문의 리스트 불러오기
	@RequestMapping("/loginCheck/user_qaList")
	public String user_qaList(HttpSession session) throws Exception {
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		String userid = dto.getUserid();
		
		List<QaDTO> list = service.selectAll(userid);
		
		session.setAttribute("qlist", list);
		System.out.println(list);
		
		return "redirect:../user_qaList";
	}
	
	// 문의 작성하여 테이블에 추가하기
	@RequestMapping(value="/loginCheck/question", method=RequestMethod.POST)
	public String question(QaDTO qdto, HttpSession session) throws Exception {
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		String userid = dto.getUserid();
		qdto.setUserid(userid);
		System.out.println(qdto);
		
		int n = service.addQ(qdto);
		System.out.println(qdto);
		System.out.println(n);
		
		session.setAttribute("qmesg", "문의가 등록되었습니다.");
		
		return "redirect:../loginCheck/user_qaList";
	}
	
	// 답변 불러오기
	@RequestMapping("/lookAnswer")
	public String lookAnswer(int num, HttpSession session) throws Exception {
		System.out.println(num);
		
		QaDTO qdto = service.selectOne(num);
		session.setAttribute("answerDto", qdto);
		
		return "lookAnswer";
	}
	
	// 문의 상세 보기 화면 불러오기 
	@RequestMapping("/lookQuestion")
	public String lookQuestion(int num, HttpSession session) throws Exception {
		System.out.println(num);
		
		QaDTO qdto = service.selectOne(num);
		session.setAttribute("questionDto", qdto);
		
		return "lookQuestion";
	}
	
	// 문의 수정하여 테이블 업데이트 하기
	@RequestMapping("/updateQuestion")
	public String updateQuestion(QaDTO qdto, HttpSession session) throws Exception {
		System.out.println(qdto);
		int n = service.updateQuestion(qdto);
		if (n == 1) {
			System.out.println("문의 내용 업데이트 완료");
		} else {
			System.out.println("문의 없데이트 실패");
		}
		session.setAttribute("qmesg", "문의가 수정되었습니다.");
		return "redirect:/loginCheck/user_qaList";
	}
	
	// 문의 삭제하기
	@RequestMapping("/deleteQuestion")
	public String deleteQuestion(int num, HttpSession session) throws Exception {
		System.out.println(num);
		int n = service.deleteQuestion(num);
		if (n == 1) {
			System.out.println("문의 삭제 완료");
		} else {
			System.out.println("문의 삭제 실패");
		}
		session.setAttribute("qmesg", "문의가 삭제되었습니다.");
		return "redirect:/loginCheck/user_qaList";
	}

	// 모든 문의 리스트 불러오기(관리자)
	@GetMapping("/manager_qaList")
	public String boardList(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage
			, String answerYet) throws Exception {
		
		int total = service.countBoard();
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		model.addAttribute("paging", vo);
		model.addAttribute("manager_qlist", service.selectBoard(vo));
		
		return "manager_qaList";
	}
	
}
