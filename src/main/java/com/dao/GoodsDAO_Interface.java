package com.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.dto.CartDTO;
import com.dto.GoodsDTO;
import com.dto.GoodsPagingDTO;
import com.dto.NoticeDTO;
import com.dto.NoticePagingDTO;
import com.dto.OrderDTO;

public interface GoodsDAO_Interface {

	void orderDone(OrderDTO oDTO) throws Exception;

	CartDTO orderConfirmByNum(int num) throws Exception;

	List<CartDTO> cartList(String userid) throws Exception;

	List<GoodsDTO> goodsList(String gCategory) throws Exception;

	GoodsDTO goodsRetrieve(String gCode) throws Exception;

	void cartAdd(CartDTO cart) throws Exception;

	void cartUpdate(Map<String, String> map) throws Exception;

	void cartDelete(int num) throws Exception;

	void delAllCart(ArrayList<String> list) throws Exception;

	int getgStock(OrderDTO oDTO) throws Exception;

	void setgStock(HashMap map) throws Exception;

	List<CartDTO> orderConfirmByCheck(ArrayList<String> list) throws Exception;

	void orderAllDone(List<OrderDTO> list_OrderDTO) throws Exception;

	void cartAllDelete(List<Integer> list_num) throws Exception;

	void setAllgStock(List<HashMap> list_map) throws Exception;

	void goodsRemove(String gCode) throws Exception;

	void goodsRemoveAll(ArrayList<String> list) throws Exception;	

	void goodsUpdate(GoodsDTO dto) throws Exception;

	void goodsAdd(GoodsDTO dto) throws Exception;

	GoodsDTO ingredients(String i) throws Exception;			
}