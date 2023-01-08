package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("GoodsPagingDTO")
public class GoodsPagingDTO {

	private String gCategory;
	private int nowPage; //현재페이지
	private int startPage; //시작페이지
	private int endPage; //끝페이지
	private int total; //게시글 총 갯수
	private int countPerPage; //페이지당 글 갯수
	private int lastPage; //마지막페이지
	private int start; //sql 쿼리용 start
	private int end; //sql 쿼리용 end
	private int countPage = 10; //밑의 페이징블럭을 5개씩 나누는 용도
	
	
	public GoodsPagingDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public GoodsPagingDTO(String gCategory, int total, int nowPage, int countPerPage) {
		setgCategory(gCategory);
		setNowPage(nowPage);
		setCountPerPage(countPerPage);
		setTotal(total);
		calcLastPage(getTotal(), getCountPerPage());
		calcStartEndPage(getNowPage(), countPage);
		calcStartEnd(getNowPage(), getCountPerPage());
	}
			

	//제일 마지막 페이지 계산
	public void calcLastPage(int total, int countPerPage) {
		setLastPage((int)Math.ceil((double)total/(double)countPerPage));
	}
	
	//시작, 끝 페이지 계산
	public void calcStartEndPage(int nowPage, int countPage) {
		setEndPage(((int)Math.ceil((double)nowPage / (double)countPage)) * countPage);
		if(getLastPage() < getEndPage()) {
				setEndPage(getLastPage());
		}
		setStartPage(getEndPage() - countPage + 1);
		if(getStartPage() < 1) {
			setStartPage(1);
		}
	}
	
	//DB 쿼리에서 사용할 start, end값 계산
	public void calcStartEnd(int nowPage, int countPerPage) {
		setEnd(nowPage * countPerPage);
		setStart(getEnd() - countPerPage + 1);
	}
	
	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCountPerPage() {
		return countPerPage;
	}

	public void setCountPerPage(int countPerPage) {
		this.countPerPage = countPerPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getCountPage() {
		return countPage;
	}

	public void setCountPage(int countPage) {
		this.countPage = countPage;
	}

	public String getgCategory() {
		return gCategory;
	}

	public void setgCategory(String gCategory) {
		this.gCategory = gCategory;
	}

	@Override
	public String toString() {
		return "GoodsPagingDTO [gCategory=" + gCategory + ", nowPage=" + nowPage + ", startPage=" + startPage
				+ ", endPage=" + endPage + ", total=" + total + ", countPerPage=" + countPerPage + ", lastPage="
				+ lastPage + ", start=" + start + ", end=" + end + ", countPage=" + countPage + "]";
	}	

}

	
