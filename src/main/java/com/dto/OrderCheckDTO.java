package com.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("OrderCheckDTO")
public class OrderCheckDTO {

	private int num;
	private int rownumber;
	private String gname;
	private int gprice;
	private String gimage;
	private Date orderday;
	private int gamount;
	private String status;
	private String userid;
	
	public OrderCheckDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrderCheckDTO(int num, int rownumber, String gname, int gprice, String gimage, Date orderday, int gamount,
			String status, String userid) {
		super();
		this.num = num;
		this.rownumber = rownumber;
		this.gname = gname;
		this.gprice = gprice;
		this.gimage = gimage;
		this.orderday = orderday;
		this.gamount = gamount;
		this.status = status;
		this.userid = userid;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getRownumber() {
		return rownumber;
	}

	public void setRownumber(int rownumber) {
		this.rownumber = rownumber;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public int getGprice() {
		return gprice;
	}

	public void setGprice(int gprice) {
		this.gprice = gprice;
	}

	public String getGimage() {
		return gimage;
	}

	public void setGimage(String gimage) {
		this.gimage = gimage;
	}

	public Date getOrderday() {
		return orderday;
	}

	public void setOrderday(Date orderday) {
		this.orderday = orderday;
	}

	public int getGamount() {
		return gamount;
	}

	public void setGamount(int gamount) {
		this.gamount = gamount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	@Override
	public String toString() {
		return "OrderCheckDTO [num=" + num + ", rownumber=" + rownumber + ", gname=" + gname + ", gprice=" + gprice
				+ ", gimage=" + gimage + ", orderday=" + orderday + ", gamount=" + gamount + ", status=" + status
				+ ", userid=" + userid + "]";
	}



	
	
	
}
