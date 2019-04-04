package com.talanton.platform.member.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.talanton.platform.member.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Resource(name="sqlSession")
	private SqlSession session;
	
	public static String namespace = "com.talanton.platform.mapper.MemberMapper";

	// 아이디가 존재하면 false 반환, 아이디가 존재하지 않으면 true 반환
	@Override
	public String idCheck(String id) throws Exception {
		return session.selectOne(namespace + ".idCheck", id);
	}

	@Override
	public int joinMember(MemberVO member) {
		return session.insert(namespace + ".joinMember", member);
	}

	@Override
	public MemberVO loginPro(String id) throws Exception {
		return session.selectOne(namespace + ".loginPro", id);
	}

	@Override
	public int updateProfile(MemberVO member) throws Exception {
		return session.update(namespace + ".updateProfile", member);
	}

	@Override
	public void keepLogin(String id, String sessionId, Date next) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", id);
		paramMap.put("sessionId", sessionId);
		paramMap.put("next", next);
		
		session.update(namespace + ".keepLogin", paramMap);
	}

	@Override
	public MemberVO checkMemberWithSessionKey(String value) {
		return session.selectOne(namespace + ".checkUserWithSessionKey", value);
	}
}
