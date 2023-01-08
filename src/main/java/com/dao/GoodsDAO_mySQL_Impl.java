package com.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.dto.CartDTO;
import com.dto.GoodsDTO;
import com.dto.NoticeDTO;
import com.dto.NoticePagingDTO;
import com.dto.OrderDTO;

//@Repository
public class GoodsDAO_mySQL_Impl implements GoodsDAO_Interface {
	// SqlTemplate <= xml 주입
	@Override
	public void orderDone(OrderDTO oDTO) throws Exception {
		// TODO Auto-generated method stub
		// mysql 연동 Mapper id
	}

	@Override
	public void orderAllDone(List<OrderDTO> list_OrderDTO) throws Exception {
		// TODO Auto-generated method stub
	}

	@Override
	public CartDTO orderConfirmByNum(int num) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CartDTO> cartList(String userid) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<GoodsDTO> goodsList(String gCategory) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public GoodsDTO goodsRetrieve(String gCode) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void cartAdd(CartDTO cart) throws Exception {
		// TODO Auto-generated method stub
	}

	@Override
	public void cartUpdate(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
	}

	@Override
	public void cartDelete(int num) throws Exception {
		// TODO Auto-generated method stub
	}

	@Override
	public void delAllCart(ArrayList<String> list) throws Exception {
		// TODO Auto-generated method stub
	}

	@Override
	public int getgStock(OrderDTO oDTO) throws Exception {
		return 0;
	}

	@Override
	public void setgStock(HashMap map) throws Exception {
		// TODO Auto-generated method stub
	}

	@Override
	public List<CartDTO> orderConfirmByCheck(ArrayList<String> list) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void cartAllDelete(List<Integer> list_num) throws Exception {
		// TODO Auto-generated method stub
	}

	@Override
	public void setAllgStock(List<HashMap> list_map) throws Exception {
		// TODO Auto-generated method stub
	}

	@Override
	public void goodsRemove(String gCode) throws Exception {
		// TODO Auto-generated method stub
	}

	@Override
	public void goodsRemoveAll(ArrayList<String> list) throws Exception {
		// TODO Auto-generated method stub
	}

	@Override
	public void goodsUpdate(GoodsDTO dto) throws Exception {
		// TODO Auto-generated method stub
	}

	@Override
	public void goodsAdd(GoodsDTO dto) throws Exception {
		// TODO Auto-generated method stub
	}
	
	@Override
	public GoodsDTO ingredients(String i) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}
