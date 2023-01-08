package com.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.CartDTO;
import com.dto.GoodsDTO;
import com.dto.NoticeDTO;
import com.dto.NoticePagingDTO;
import com.dto.OrderDTO;

@Repository
public class GoodsDAO implements GoodsDAO_Interface {
	@Autowired
	SqlSessionTemplate template; // oracle

	@Override
	public void orderDone(OrderDTO oDTO) throws Exception {
		int n = template.insert("CartMapper.orderDone", oDTO);
	}

	@Override
	public void orderAllDone(List<OrderDTO> list_OrderDTO) throws Exception {
		int n = template.insert("CartMapper.orderAllDone", list_OrderDTO);

	}

	@Override
	public CartDTO orderConfirmByNum(int num) throws Exception {
		CartDTO dto = template.selectOne("CartMapper.cartByNum", num);
		return dto;
	}

	@Override
	public List<CartDTO> orderConfirmByCheck(ArrayList<String> list) throws Exception {
		List<CartDTO> dto_list = template.selectList("CartMapper.cartByCheck", list);
		return dto_list;
	}

	@Override
	public List<CartDTO> cartList(String userid) throws Exception {
		List<CartDTO> list = template.selectList("CartMapper.cartList", userid);
		return list;
	}

	@Override
	public List<GoodsDTO> goodsList(String gCategory) throws Exception {
		List<GoodsDTO> list = template.selectList("GoodsMapper.goodsList", gCategory);
		return list;
	}

	@Override
	public GoodsDTO goodsRetrieve(String gCode) throws Exception {
		GoodsDTO dto = template.selectOne("GoodsMapper.goodsRetrieve", gCode);
		return dto;
	}

	@Override
	public void cartAdd(CartDTO cart) throws Exception {
		template.insert("CartMapper.cartAdd", cart);
	}

	@Override
	public void cartUpdate(Map<String, String> map) throws Exception {
		int n = template.update("CartMapper.cartUpdate", map);

	}

	@Override
	public void cartDelete(int num) throws Exception {
		int n = template.delete("CartMapper.cartDel", num);
	}

	@Override
	public void cartAllDelete(List<Integer> list_num) throws Exception {
		int n = template.delete("CartMapper.cartAllDel", list_num);

	}

	@Override
	public void delAllCart(ArrayList<String> list) throws Exception {
		int n = template.delete("CartMapper.cartAllDel", list);
	}

	@Override
	public int getgStock(OrderDTO oDTO) throws Exception {
		return template.selectOne("CartMapper.getgStock", oDTO);
	}

	@Override
	public void setgStock(HashMap map) throws Exception {
		int n = template.update("CartMapper.setgStock", map);
	}

	@Override
	public void setAllgStock(List<HashMap> list_map) throws Exception {
		int n = template.update("CartMapper.setAllgStock", list_map);

	}

	@Override
	public void goodsAdd(GoodsDTO dto) throws Exception {
		int n = template.insert("GoodsMapper.goodsAdd", dto);
		System.out.println(n);
	}

	@Override
	public void goodsRemove(String gCode) throws Exception {
		int n = template.delete("GoodsMapper.goodsRemove", gCode);
	}

	@Override
	public void goodsRemoveAll(ArrayList<String> list) throws Exception {
		int n = template.delete("GoodsMapper.goodsRemoveAll", list);
	}

	@Override
	public void goodsUpdate(GoodsDTO dto) throws Exception {
		int n = template.update("GoodsMapper.goodsUpdate", dto);
		System.out.println(n);
	}
	
	@Override
	public GoodsDTO ingredients(String i) throws Exception {
		GoodsDTO dto = template.selectOne("GoodsMapper.getIngredient", i);
		return dto;
	}
}
