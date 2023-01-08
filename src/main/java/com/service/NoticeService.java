package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.NoticeDAO;
import com.dto.NoticeDTO;
import com.dto.NoticePagingDTO;

@Service
public class NoticeService {
	
	@Autowired
	NoticeDAO dao;
	
	public int CountBoard() {
		return dao.CountBoard();
	};
	
	public List<NoticeDTO> SelectBoard(NoticePagingDTO ndto){
		return dao.SelectBoard(ndto);
	};

	public List<NoticeDTO> notice(NoticeDTO dto) {
		return dao.notice(dto);
	}

	public void noticeAdd(NoticeDTO dto) {
		dao.noticeAdd(dto);
	}

	public void noticeDelete(int num) {
		dao.noticeDelete(num);
		
	}

	public NoticeDTO detail(int num) {
		return dao.detail(num);
	}


	public void noticeUpdate(NoticeDTO dto) {
		dao.noticeUpdate(dto);
		
	}

	public void ViewCount(int num) {
		dao.ViewCount(num);
		
	}











}
