package com.talanton.platform.parameter.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.talanton.platform.article.domain.Criteria;
import com.talanton.platform.parameter.domain.SettingItem;

@Repository
public class ParameterDAOImpl implements ParameterDAO {
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.talanton.platform.mapper.ParamterMapper";

	@Override
	public List<SettingItem> listCriteria(Criteria cri) throws Exception {
		return session.selectList(namespace + ".listCriteria", cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		return session.selectOne(namespace + ".countPaging", cri);
	}

	@Override
	public void create(SettingItem vo) throws Exception {
		session.insert(namespace + ".create", vo);
	}

	@Override
	public SettingItem read(String parameterName) throws Exception {
		return session.selectOne(namespace + ".read", parameterName);
	}

	@Override
	public void update(SettingItem vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(String parameterName) throws Exception {
		session.delete(namespace + ".delete", parameterName);
	}

}
