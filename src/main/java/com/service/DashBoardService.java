package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.DashBoardDAO;
import com.dto.DashBoardDTO;
import com.dto.OrderdaySalesDTO;

@Service
public class DashBoardService {
	
	@Autowired
	DashBoardDAO dao;
	
	public List<OrderdaySalesDTO> getDaySales() throws Exception {
		// TODO Auto-generated method stub
		List<OrderdaySalesDTO> list = dao.getDaySales();
		return list;
	}

	public List<OrderdaySalesDTO> getDaySalesMap(Map<String, String> mapDay) throws Exception {
		// TODO Auto-generated method stub
		List<OrderdaySalesDTO> list = dao.getDaySalesMap(mapDay);
		return list;
	}

	public List<DashBoardDTO> totalByCategory() throws Exception {
		List<DashBoardDTO> list = dao.totalByCategory();
		return list;
	}
}
