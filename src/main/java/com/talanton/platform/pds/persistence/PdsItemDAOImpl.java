package com.talanton.platform.pds.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.talanton.platform.article.domain.Criteria;
import com.talanton.platform.pds.domain.PdsItem;

@Repository
public class PdsItemDAOImpl implements PdsItemDAO {
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.talanton.platform.mapper.PdsItemMapper";

	@Override
	public List<PdsItem> listCriteria(Criteria cri) throws Exception {
		return session.selectList(namespace + ".listCriteria", cri);
	}

	@Override
	public int listCount(Criteria cri) {
		return session.selectOne(namespace + ".listCount", cri);
	}

	@Override
	public void create(PdsItem pds) throws Exception {
		session.insert(namespace + ".create", pds);
	}

	@Override
	public PdsItem read(String id) throws Exception {
		return session.selectOne(namespace + ".read", id);
	}
}