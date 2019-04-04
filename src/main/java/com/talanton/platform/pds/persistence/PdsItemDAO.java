package com.talanton.platform.pds.persistence;

import java.util.List;

import com.talanton.platform.article.domain.Criteria;
import com.talanton.platform.pds.domain.PdsItem;

public interface PdsItemDAO {
	List<PdsItem> listCriteria(Criteria cri) throws Exception;
	int listCount(Criteria cri) throws Exception;
	void create(PdsItem pds) throws Exception;
	PdsItem read(String id) throws Exception;
}