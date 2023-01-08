package com.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.NoticePagingDTO;
import com.dto.OrderCheckDTO;
import com.dto.OrderDTO;

@Repository
public class OrderCheckDAO {
	
	@Autowired
	SqlSessionTemplate	template;

	public List<OrderCheckDTO> listMyOrderGoods(String userid) {
		return template.selectList("OrderCheckMapper.selectMyOrderGoodsList", userid);
	}

	public void orderDelete(int num) {
		int n = template.delete("OrderCheckMapper.OrderDelete", num);
		System.out.println("주문삭제 정상적으로 되는지 확인 : " + n);	
	}

	public void receiptStatus(Map<String, String> map) {
		int n = template.update("OrderCheckMapper.receiptStatusUpate", map);
		System.out.println("정상적으로 주문상태 변경되는지 확인 - DAO  : " + n);
		
	}

	public List<OrderCheckDTO> listOrderGoods() {
		return template.selectList("OrderCheckMapper.selectOrderGoodsList");
	}

	public void receiptStatusAdmin(Map<String, String> map) {
		int n = template.update("OrderCheckMapper.receiptStatusUpateAdmin", map);
		System.out.println("정상적으로 주문상태 변경되는지 확인 - DAO  : " + n);
		
	}

	//페이징처리 추후 구현
//	public List<OrderCheckDTO> listMyOrderGoods(NoticePagingDTO ndto) {
//		return template.selectList("OrderCheckMapper.selectMyOrderGoodsList", ndto);
//	}

//	public int CountBoard(String userid) {
//		return template.selectOne("OrderCheckMapper.CountBoard", userid);
//	}

}
