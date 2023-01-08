package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("OrderdaySalesDTO")
public class OrderdaySalesDTO {
	private String orderday;
	private int sales;
	
	public OrderdaySalesDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public OrderdaySalesDTO(int sales, String orderday) {
		super();
		this.sales = sales;
		this.orderday = orderday;
	}
	
	public String getOrderday() {
		return orderday;
	}

	public void setOrderday(String orderday) {
		this.orderday = orderday;
	}

	public int getSales() {
		return sales;
	}

	public void setSales(int sales) {
		this.sales = sales;
	}

	@Override
	public String toString() {
		return "orderdaySalesDTO [sales=" + sales + ", orderday=" + orderday + "]";
	}
	
}
