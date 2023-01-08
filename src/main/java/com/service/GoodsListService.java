package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.GoodsListDAO;
import com.dto.GoodsListDTO;
import com.dto.GoodsPagingDTO;

@Service
public class GoodsListService {
	
	@Autowired
	GoodsListDAO dao;

	public int countGoods(String gCategory) {
		return dao.countGoods(gCategory);
	}
	
	public List<GoodsListDTO> selectGoodsList(GoodsPagingDTO gdto){
		return dao.selectGoodsList(gdto);
	}
	
	public List<GoodsListDTO> searchGoodsList(String key){
		return dao.searchGoodsList(key);
	}

	public int countSearchGoods(String key) {
		return dao.countSearchGoods(key);
	}
}
