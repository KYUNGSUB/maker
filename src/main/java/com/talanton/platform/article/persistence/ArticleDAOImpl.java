package com.talanton.platform.article.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.talanton.platform.article.domain.AttachVO;
import com.talanton.platform.article.domain.ArticleVO;
import com.talanton.platform.article.domain.BCriteria;
import com.talanton.platform.article.domain.BSearchCriteria;

@Repository
public class ArticleDAOImpl implements ArticleDAO {
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.talanton.platform.mapper.ArticleMapper";

	@Override
	public void create(ArticleVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
	}

	@Override
	public ArticleVO read(Integer bId) throws Exception {
		session.update(namespace + ".upHit", bId);
		return session.selectOne(namespace + ".read", bId);
	}

	@Override
	public void update(ArticleVO vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(Integer bId) throws Exception {
		session.delete(namespace + ".delete", bId);
	}

	@Transactional
	@Override
	public void reply(ArticleVO article) throws Exception {
		session.update(namespace + ".replyShape", article);
		session.insert(namespace + ".reply", article);
	}

	@Override
	public List<ArticleVO> listAll() throws Exception {
		return session.selectList(namespace + ".listAll");
	}

	@Override
	public List<ArticleVO> listCriteria(BCriteria cri) throws Exception {
		return session.selectList(namespace + ".listCriteria", cri);
	}

	@Override
	public int countPaging(BCriteria cri) throws Exception {
		return session.selectOne(namespace + ".countPaging", cri);
	}

	@Override
	public List<ArticleVO> listSearch(BSearchCriteria cri) throws Exception {
		return session.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int listSearchCount(BSearchCriteria cri) throws Exception {
		return session.selectOne(namespace + ".listSearchCount", cri);
	}

	@Override
	public void addAtach(AttachVO attach) throws Exception {
		session.insert(namespace + ".addAttach", attach);
	}

	@Override
	public List<String> getAttach(Integer bId) throws Exception {
		return session.selectList(namespace + ".getAttach", bId);
	}

	@Override
	public void deleteAttach(Integer bId) throws Exception {
		session.delete(namespace + ".deleteAttach", bId);
	}

	@Override
	public void replaceAttach(AttachVO attach) throws Exception {
		session.insert(namespace + ".replaceAttach", attach);
	}

	@Override
	public int getLastId() throws Exception {
		Object result = session.selectOne(namespace + ".getLastId");
		if(result == null) {
			return 0;
		} else {
			return Integer.parseInt(result.toString());
		}
	}
}
