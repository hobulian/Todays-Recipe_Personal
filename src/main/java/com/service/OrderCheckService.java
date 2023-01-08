package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.OrderCheckDAO;
import com.dto.NoticePagingDTO;
import com.dto.OrderCheckDTO;

@Service
public class OrderCheckService {
	
	@Autowired
	OrderCheckDAO dao;


	public List<OrderCheckDTO> listMyOrderGoods(String userid) {
		return dao.listMyOrderGoods(userid);
	}

	public void orderDelete(int num) {
		dao.orderDelete(num);	
	}

	public void receiptStatus(Map<String, String> map) {
		dao.receiptStatus(map);
		
	}

	public List<OrderCheckDTO> listOrderGoods() {
		return dao.listOrderGoods();
	}

	public void receiptStatusAdmin(Map<String, String> map) {
		dao.receiptStatusAdmin(map);
		
	}
	
	
	//페이징처리 향후 구현
//	public List<OrderCheckDTO> listMyOrderGoods(NoticePagingDTO ndto) {
//	return dao.listMyOrderGoods(ndto);
//}

//public int CountBoard(String userid) {
//	return dao.CountBoard(userid);
//}

}
