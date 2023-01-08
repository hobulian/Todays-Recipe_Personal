package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("GoodsListDTO")
public class GoodsListDTO {

	private int rownumber;
	private String gCode;
	private String gName;
	private int gPrice;
	private String gImage;

	public GoodsListDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public GoodsListDTO(int rownumber, String gCode, String gName, int gPrice, String gImage) {
		super();
		this.rownumber = rownumber;
		this.gCode = gCode;
		this.gName = gName;
		this.gPrice = gPrice;
		this.gImage = gImage;
	}

	public int getRownumber() {
		return rownumber;
	}

	public void setRownumber(int rownumber) {
		this.rownumber = rownumber;
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

	public String getgImage() {
		return gImage;
	}

	public void setgImage(String gImage) {
		this.gImage = gImage;
	}

	@Override
	public String toString() {
		return "GoodsListDTO [rownumber=" + rownumber + ", gCode=" + gCode + ", gName=" + gName + ", gPrice=" + gPrice
				+ ", gImage=" + gImage + "]";
	}

}
