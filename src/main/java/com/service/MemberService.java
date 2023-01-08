package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.MemberDAO;
import com.dto.MemberDTO;

@Service
public class MemberService {
	@Autowired
	MemberDAO dao;
	
	public void memberAdd(MemberDTO m) throws Exception{
		dao.memberAdd(m);
	}

	public MemberDTO login(Map<String, String> map) throws Exception{
		MemberDTO dto = dao.login(map); 
		return dto;
	}

	public MemberDTO myPage(String userid)throws Exception {
		MemberDTO dto= dao.myPage(userid);
		return dto;
	}

	public void memberUpdate(MemberDTO m)throws Exception {
		dao.memberUpdate(m);		
	}

	public void memberDelete(String userid) throws Exception {
		dao.memberDelete(userid);
	}

	public List<MemberDTO> memberEdit() throws Exception {
		List<MemberDTO> list = dao.memberEdit();
		return list;
	}
}
