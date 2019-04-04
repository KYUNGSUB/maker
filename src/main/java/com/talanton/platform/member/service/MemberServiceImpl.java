package com.talanton.platform.member.service;

import java.util.Date;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.talanton.platform.member.domain.MemberVO;
import com.talanton.platform.member.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	private MemberDAO dao;

	@Override
	public boolean idCheck(String id) throws Exception {
		return dao.idCheck(id) == null;
	}

	@Override
	public int joinMember(MemberVO member) throws Exception {
		return dao.joinMember(member);
	}

	@Override
	public MemberVO loginPro(String id) throws Exception {
		return dao.loginPro(id);
	}

	@Override
	public void keepLogin(String id, String sessionId, Date next) throws Exception {
		dao.keepLogin(id, sessionId, next);
	}

	@Override
	public MemberVO checkLoginBefore(String value) throws Exception {
		return dao.checkMemberWithSessionKey(value);
	}

	@Override
	public String getPassword(String id) throws Exception {
		return dao.idCheck(id);
	}

	@Override
	public int updateProfile(MemberVO member) throws Exception {
		return dao.updateProfile(member);
	}

}
