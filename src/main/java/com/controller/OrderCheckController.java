package com.controller;

import java.util.List;
import java.util.Map;

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
import com.dto.OrderCheckDTO;
import com.service.OrderCheckService;


@Controller
public class OrderCheckController {

	@Autowired
	OrderCheckService service;
	
	@ExceptionHandler({Exception.class})
	public String errorPage() {
	  	return "error/error";//error/error.jsp
	  }
	
	//주문목록 불러오기
	@RequestMapping(value="/orderCheck", method=RequestMethod.GET)
	public String orderCheckList (Model model, HttpSession session, OrderCheckDTO odto) throws Exception {
		MemberDTO mdto = (MemberDTO) session.getAttribute("login");
		String userid = mdto.getUserid();	
		List<OrderCheckDTO> myOrderList = service.listMyOrderGoods(userid);
		//System.out.println("주문목록 리스트 잘 담기는지 확인 : " + myOrderList);
		model.addAttribute("myOrderList", myOrderList);
		return "orderCheck";
	}
	
	//주문목록 삭제
	@RequestMapping(value="/orderDelete", method = RequestMethod.GET)
	@ResponseBody
	public void orderDelete(@RequestParam("num") int num) throws Exception {
		System.out.println("num = " + num);
		service.orderDelete(num);
	}
	
	//수취확인상태 변경
	@RequestMapping(value="/receiptStatus", method = RequestMethod.GET)
	@ResponseBody
	public void receiptStatus(@RequestParam Map<String, String> map) throws Exception {
		System.out.println("수정전 항목이 제대로 넘어오는지 확인 : " + map);
		service.receiptStatus(map);
	}
	

//	페이징 처리 - 향후 구현
//	@RequestMapping(value="/orderCheck", method=RequestMethod.GET)
//	public String orderCheckList (
//			//@RequestParam(value="message", required=false) String message,
//			Model model, HttpSession session, OrderCheckDTO odto,
//			NoticePagingDTO ndto
//			, @RequestParam(value="nowPage", required=false)String nowPage
//			, @RequestParam(value="countPerPage", required=false)String countPerPage)
//			 {
//		
//		MemberDTO mdto = (MemberDTO) session.getAttribute("login");
//		String userid = mdto.getUserid();
//		int total = service.CountBoard(userid);
//		//System.out.println("total 찍어보기 : " + total);
////		MemberDTO mdto = (MemberDTO) session.getAttribute("login");
////		String userid = mdto.getUserid();
//		System.out.println("유저id 제대로 나오는지 찍어보기용 : " +userid);
////		List<OrderCheckDTO> myOrderList = service.listMyOrder(userid);
////		//System.out.println("주문목록 제대로 나오는지 찍어보기용 : " + myOrderList);
////		model.addAttribute("myOrderList", myOrderList);
//		
//		if(nowPage == null && countPerPage == null) {
//			nowPage = "1";
//			countPerPage = "10";
//	} else if (nowPage ==null) {
//			nowPage = "1";
//	} else if (countPerPage == null) {
//			countPerPage = "10";
//	}
//	ndto = new NoticePagingDTO(total, Integer.parseInt(nowPage), Integer.parseInt(countPerPage));
//	model.addAttribute("paging", ndto);
//	model.addAttribute("viewAllorder", service.listMyOrderGoods(ndto));
//	System.out.println(service.listMyOrderGoods(ndto));
//	System.out.println("ndto 넘어오는 값 확인용 : "+ ndto.toString());	
//		return "orderCheck";
//	}
	
	// 관리자용
	@RequestMapping(value="/orderCheckAdmin", method=RequestMethod.GET)
	public String orderCheckListAdmin (Model model, OrderCheckDTO odto) throws Exception {

		List<OrderCheckDTO>OrderList = service.listOrderGoods();
		System.out.println("주문목록 리스트 잘 담기는지 확인 : " + OrderList);
		model.addAttribute("OrderList", OrderList);
		return "orderCheckAdmin";
	}
	
	//배송완료상태 변경
	@RequestMapping(value="/receiptStatusAdmin", method = RequestMethod.GET)
	@ResponseBody
	public void receiptStatusAdmin(@RequestParam Map<String, String> map) throws Exception {
		System.out.println("수정전 항목이 제대로 넘어오는지 확인 : " + map);
		service.receiptStatusAdmin(map);
	}

}
