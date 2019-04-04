package com.talanton.platform.member.service;

import java.util.Date;

import com.talanton.platform.member.domain.MemberVO;

public interface MemberService {

	boolean idCheck(String id) throws Exception;

	int joinMember(MemberVO member) throws Exception;

	MemberVO loginPro(String id) throws Exception;

	void keepLogin(String id, String id2, Date sessionLimit) throws Exception;

	MemberVO checkLoginBefore(String value) throws Exception;

	String getPassword(String id) throws Exception;

	int updateProfile(MemberVO member) throws Exception;

}
