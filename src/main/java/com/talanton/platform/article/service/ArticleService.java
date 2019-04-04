package com.talanton.platform.article.service;

import java.util.List;

import com.talanton.platform.article.domain.ArticleVO;
import com.talanton.platform.article.domain.BSearchCriteria;
import com.talanton.platform.article.domain.BCriteria;

public interface ArticleService {
	public void register(ArticleVO article) throws Exception;
	public ArticleVO read(Integer bId) throws Exception;
	public void modify(ArticleVO article) throws Exception;
	public void remove(Integer bId) throws Exception;
	public void reply(ArticleVO article) throws Exception;
	public List<ArticleVO> listAll() throws Exception;
	public List<ArticleVO> listCriteria(BCriteria cri) throws Exception;
	public int listCountCriteria(BCriteria cri) throws Exception;
	public List<ArticleVO> listSearchCriteria(BSearchCriteria cri) throws Exception;
	public int listSearchCount(BSearchCriteria cri) throws Exception;
	public List<String> getAttach(Integer bId) throws Exception;
}
