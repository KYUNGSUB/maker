package com.talanton.platform.monitoring.persistence;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.talanton.platform.monitoring.domain.EnvData;

@Repository
public class EnvDataDAOImpl implements EnvDataDAO {
	@Resource(name="sqlSession")
	private SqlSession session;
	
	public static String namespace = "com.talanton.platform.mapper.EnvDataMapper";

	@Override
	public int insert(EnvData environ) {
		return session.insert(namespace + ".insert", environ);
	}

	@Override
	public int getLastId() {
		return session.selectOne(namespace + ".getLastId");
	}
}
