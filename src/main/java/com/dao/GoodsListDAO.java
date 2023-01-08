package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.GoodsListDTO;
import com.dto.GoodsPagingDTO;


@Repository
public class GoodsListDAO {
	
	@Autowired
	SqlSessionTemplate template;
	
	public List<GoodsListDTO> searchGoodsList(String key) {
		return template.selectList("GoodsMapper.searchGoodsList", key);
	}
	
	public List<GoodsListDTO> selectGoodsList(GoodsPagingDTO gDTO) {
		return template.selectList("GoodsMapper.selectGoodsList", gDTO);
	}
	
	public int countGoods(String gCategory) {
		return template.selectOne("GoodsMapper.countGoods", gCategory);
	}

	public int countSearchGoods(String key) {
		return template.selectOne("GoodsMapper.countSearchGoods", key);
	}

}
