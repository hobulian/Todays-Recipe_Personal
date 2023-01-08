package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.QaDAO;
import com.dto.QaDTO;
import com.utils.PagingVO;

@Service
public class QaService {
	@Autowired
	QaDAO dao;

	public List<QaDTO> selectAll(String userid) throws Exception {
		List<QaDTO> list = dao.selectAll(userid);
		return list;
	}

	public int addQ(QaDTO qdto) throws Exception {
		int n = dao.addQ(qdto);
		return n;
	}

	public List<QaDTO> manager_selectAll() throws Exception {
		List<QaDTO> list = dao.manager_selectAll();
		return list;
	}

	public QaDTO selectOne(int num) throws Exception {
		QaDTO qdto = dao.selectOne(num);
		return qdto;
	}

	public int answerUpdate(Map<Integer, String> map) throws Exception {
		int n = dao.answerUpdate(map);
		return n;
	}

	public int updateQuestion(QaDTO qdto) throws Exception {
		int n = dao.updateQuestion(qdto);
		return n;
	}

	public int deleteQuestion(int num) throws Exception {
		int n = dao.deleteQuestion(num);
		return n;
	}

	public int countBoard() throws Exception {
		return dao.countBoard();
	}
	
	public List<QaDTO> selectBoard(PagingVO vo) throws Exception {
		return dao.selectBoard(vo);
	}

}
