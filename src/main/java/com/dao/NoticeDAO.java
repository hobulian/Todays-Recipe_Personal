package com.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.NoticeDTO;
import com.dto.NoticePagingDTO;


@Repository
public class NoticeDAO {
	
	@Autowired
	SqlSessionTemplate	template;

	public List<NoticeDTO> notice(NoticeDTO dto) {
		return template.selectList("NoticeMapper.NoticeList", dto);
	}

	public void noticeAdd(NoticeDTO dto) {
		int n = template.insert("NoticeMapper.NoticeAdd", dto);
		System.out.println("공지사항 정상적으로 추가되는지 확인 : "+ n);
		
	}

	public void noticeDelete(int num) {
		int n = template.delete("NoticeMapper.NoticeDelete", num);
		System.out.println("공지사항 정상적으로 삭제되는지 확인 : "+ n);
	}

	public NoticeDTO detail(int num) {
		return template.selectOne("NoticeMapper.NoticeSelect", num);
	}

	public void noticeUpdate(NoticeDTO dto) {
		int n = template.update("NoticeMapper.NoticeUpdate", dto);
		System.out.println("공지사항 정상적으로 수정되는지 확인 : "+ n);
		
	}

	public void ViewCount(int num) {
		int n = template.update("NoticeMapper.ViewCount", num);
		System.out.println("조회수 count가 정상적으로 실행되는지 확인 : "+n);	
		
	}
	
	public int CountBoard() {
		return template.selectOne("NoticeMapper.CountBoard");
	}
	
	public List<NoticeDTO> SelectBoard(NoticePagingDTO ndto) {
		return template.selectList("NoticeMapper.SelectBoard",ndto);
	}






}
