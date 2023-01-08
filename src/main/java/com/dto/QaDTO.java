package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("QaDTO")
public class QaDTO {
	private int num;
	private String category;
	private String writeday;
	private String title;
	private String contents;
	private String userid;
	private String answer;
	
	public QaDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QaDTO(int num, String category, String writeday, String title, String contents, String userid,
			String answer) {
		super();
		this.num = num;
		this.category = category;
		this.writeday = writeday;
		this.title = title;
		this.contents = contents;
		this.userid = userid;
		this.answer = answer;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getWriteday() {
		return writeday;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	@Override
	public String toString() {
		return "QaDTO [num=" + num + ", category=" + category + ", writeday=" + writeday + ", title=" + title
				+ ", contents=" + contents + ", userid=" + userid + ", answer=" + answer + "]";
	}
	
}
