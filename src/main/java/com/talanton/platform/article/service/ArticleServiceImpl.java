package com.talanton.platform.article.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.talanton.platform.article.domain.ArticleVO;
import com.talanton.platform.article.domain.AttachVO;
import com.talanton.platform.article.domain.BCriteria;
import com.talanton.platform.article.domain.BSearchCriteria;
import com.talanton.platform.article.persistence.ArticleDAO;

@Service
public class ArticleServiceImpl implements ArticleService {
	@Inject
	private ArticleDAO dao;
	
	@Inject
	private AttachVO attach;

	@Transactional
	@Override
	public void register(ArticleVO article) throws Exception {
		int bId = dao.getLastId();
		article.setbId(bId + 1);
		
		dao.create(article);
		
		attach.setbId(article.getbId());
		String[] files = article.getFiles();
		if(files == null)
			return;
		for(String fileName : files) {
			attach.setFullName(fileName);
			dao.addAtach(attach);
		}
	}

	@Override
	public ArticleVO read(Integer bId) throws Exception {
		return dao.read(bId);
	}

	@Transactional
	@Override
	public void modify(ArticleVO article) throws Exception {
		dao.update(article);
		Integer bId = article.getbId();
		dao.deleteAttach(bId);
		attach.setbId(bId);
		String[] files = article.getFiles();
		if(files == null)
			return;
		for(String fileName : files) {
			attach.setFullName(fileName);
			dao.replaceAttach(attach);
		}
	}

	@Transactional
	@Override
	public void remove(Integer bId) throws Exception {
		dao.deleteAttach(bId);
		dao.delete(bId);
	}

	@Override
	public void reply(ArticleVO article) throws Exception {
		dao.reply(article);
	}
	@Override
	public List<ArticleVO> listAll() throws Exception {
		return dao.listAll();
	}

	@Override
	public List<ArticleVO> listCriteria(BCriteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(BCriteria cri) throws Exception {
		return dao.countPaging(cri);
	}

	@Override
	public List<ArticleVO> listSearchCriteria(BSearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(BSearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

	@Override
	public List<String> getAttach(Integer bId) throws Exception {
		return dao.getAttach(bId);
	}
}