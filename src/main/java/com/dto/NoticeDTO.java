package com.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("NoticeDTO")
public class NoticeDTO {

	private int num;
	private int rownumber;
	private Date writeday;
	private String title;
	private String contents;
	private String writer;
	private int viewcount;
	
	public NoticeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public NoticeDTO(int num, int rownumber, Date writeday, String title, String contents, String writer, int viewcount) {
		super();
		this.num = num;
		this.rownumber = rownumber;
		this.writeday = writeday;
		this.title = title;
		this.contents = contents;
		this.writer = writer;
		this.viewcount = viewcount;
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

	public void setRownumber(int rownum) {
		this.rownumber = rownum;
	}

	public Date getWriteday() {
		return writeday;
	}

	public void setWriteday(Date writeday) {
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getViewcount() {
		return viewcount;
	}

	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}

	@Override
	public String toString() {
		return "NoticeDTO [num=" + num + ", rownumber=" + rownumber + ", writeday=" + writeday + ", title=" + title
				+ ", contents=" + contents + ", writer=" + writer + ", viewcount=" + viewcount + "]";
	}
	

	
	
	
}
