package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("DashBoardDTO")
public class DashBoardDTO {

	private String gCategory;
	private String TotalPrice;

	public DashBoardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DashBoardDTO(String gCategory, String totalPrice) {
		super();
		this.gCategory = gCategory;
		TotalPrice = totalPrice;
	}

	public String getgCategory() {
		String kCategory = "";
		if (gCategory.equals("Seafood")) {
			kCategory = "수산·건어물";
		} else if (gCategory.equals("Vegetable")) {
			kCategory = "채소";
		} else if (gCategory.equals("Fruit")) {
			kCategory = "과일";
		} else if (gCategory.equals("Can")) {
			kCategory = "통조림·즉석밥·면";
		} else if (gCategory.equals("Meat")) {
			kCategory = "정육·계란";
		}else if (gCategory.equals("Bakery")) {
			kCategory = "베이커리";
		}else if (gCategory.equals("Snack")) {
			kCategory = "간식·떡·빙과";
		}else if (gCategory.equals("Spices")) {
			kCategory = "장·양념·소스";
		}else if (gCategory.equals("Retort")) {
			kCategory = "냉장·냉동·간편식";
		}else if (gCategory.equals("Grain")) {
			kCategory = "쌀·잡곡";
		}else if (gCategory.equals("Kimchi")) {
			kCategory = "김치·반찬";
		}else if (gCategory.equals("Beverage")) {
			kCategory = "커피·음료";
		}else if (gCategory.equals("Milk")) {
			kCategory = "우유·유제품";
		};
		
		return kCategory;
	}

	public void setgCategory(String gCategory) {
		this.gCategory = gCategory;
	}

	public String getTotalPrice() {
		return TotalPrice;
	}

	public void setTotalPrice(String totalPrice) {
		TotalPrice = totalPrice;
	}

	@Override
	public String toString() {
		return "DashBoardDTO [gCategory=" + gCategory + ", TotalPrice=" + TotalPrice + "]";
	}
}
