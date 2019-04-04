package com.talanton.platform.member.persistence;

import java.util.Date;

import com.talanton.platform.member.domain.MemberVO;

public interface MemberDAO {

	String idCheck(String id) throws Exception;

	int joinMember(MemberVO member) throws Exception;

	MemberVO loginPro(String id) throws Exception;

	void keepLogin(String id, String sessionId, Date next) throws Exception;

	MemberVO checkMemberWithSessionKey(String value) throws Exception;

	int updateProfile(MemberVO member) throws Exception;

}
