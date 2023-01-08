package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("CartDTO")
	public class CartDTO {

	private int num;
	private String userid;
	private String gCode;
	private String gCategory;
	private String gName;
	private int gPrice;
	private int gAmount;
	private String gImage;
	public CartDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CartDTO(int num, String userid, String gCode, String gName, int gPrice, int gAmount, String gImage, String gCategory) {
		super();
		this.num = num;
		this.userid = userid;
		this.gCode = gCode;
		this.gName = gName;
		this.gPrice = gPrice;
		this.gAmount = gAmount;
		this.gImage = gImage;
		this.gCategory = gCategory;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getgCode() {
		return gCode;
	}
	public void setgCode(String gCode) {
		this.gCode = gCode;
	}
	public String getgName() {
		return gName;
	}
	public void setgName(String gName) {
		this.gName = gName;
	}
	public int getgPrice() {
		return gPrice;
	}
	public void setgPrice(int gPrice) {
		this.gPrice = gPrice;
	}
	public int getgAmount() {
		return gAmount;
	}
	public void setgAmount(int gAmount) {
		this.gAmount = gAmount;
	}
	public String getgImage() {
		return gImage;
	}
	public void setgImage(String gImage) {
		this.gImage = gImage;
	}
	public String getgCategory() {
		return gCategory;
	}
	public void setgCategory(String gCategory) {
		this.gCategory = gCategory;
	}
	@Override
	public String toString() {
		return "CartDTO [num=" + num + ", userid=" + userid + ", gCode=" + gCode + ", gName=" + gName + ", gPrice="
				+ gPrice + ", gAmount=" + gAmount + ", gImage=" + gImage + ", gCategory=" + gCategory + "]";
	}
}

