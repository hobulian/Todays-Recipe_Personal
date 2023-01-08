package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("GoodsDTO")
public class GoodsDTO {
	private String gCode;
	private String gCategory;
	private String gName;
	private int gPrice;
	private String gImage;
	private String gUnit;
	private String gWeight;
	private String gStock;
	
	public GoodsDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public GoodsDTO(String gCode, String gCategory, String gName, int gPrice, String gImage, String gUnit,
			String gWeight, String gStock) {
		super();
		this.gCode = gCode;
		this.gCategory = gCategory;
		this.gName = gName;
		this.gPrice = gPrice;
		this.gImage = gImage;
		this.gUnit = gUnit;
		this.gWeight = gWeight;
		this.gStock = gStock;
	}

	public String getgCode() {
		return gCode;
	}

	public void setgCode(String gCode) {
		this.gCode = gCode;
	}

	public String getgCategory() {
		return gCategory;
	}

	public void setgCategory(String gCategory) {
		this.gCategory = gCategory;
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

	public String getgUnit() {
		return gUnit;
	}

	public void setgUnit(String gUnit) {
		this.gUnit = gUnit;
	}

	public String getgWeight() {
		return gWeight;
	}

	public void setgWeight(String gWeight) {
		this.gWeight = gWeight;
	}

	public String getgStock() {
		return gStock;
	}

	public void setgStock(String gStock) {
		this.gStock = gStock;
	}

	@Override
	public String toString() {
		return "GoodsDTO [gCode=" + gCode + ", gCategory=" + gCategory + ", gName=" + gName + ", gPrice=" + gPrice
				+ ", gImage=" + gImage + ", gUnit=" + gUnit + ", gWeight=" + gWeight + ", gStock=" + gStock + "]";
	}
	
	
	
}
