package com.talanton.platform.article.persistence;

import java.util.List;

import com.talanton.platform.article.domain.AttachVO;
import com.talanton.platform.article.domain.ArticleVO;
import com.talanton.platform.article.domain.BCriteria;
import com.talanton.platform.article.domain.BSearchCriteria;

public interface ArticleDAO {
	public void create(ArticleVO vo) throws Exception;
	
	public ArticleVO read(Integer bId) throws Exception;
	
	public void update(ArticleVO vo) throws Exception;
	
	public void delete(Integer bId) throws Exception;

	public void reply(ArticleVO article) throws Exception;
	
	public List<ArticleVO> listAll() throws Exception;
	
	public List<ArticleVO> listCriteria(BCriteria cri) throws Exception;
	
	public int countPaging(BCriteria cri) throws Exception;
	
	public List<ArticleVO> listSearch(BSearchCriteria cri) throws Exception;
	
	public int listSearchCount(BSearchCriteria cri) throws Exception;
	
	public void addAtach(AttachVO attach) throws Exception;
	
	public List<String> getAttach(Integer bId) throws Exception;
	
	public void deleteAttach(Integer bId) throws Exception;
	
	public void replaceAttach(AttachVO attach) throws Exception;

	public int getLastId() throws Exception;
}
