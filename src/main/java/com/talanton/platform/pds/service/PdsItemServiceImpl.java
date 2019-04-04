package com.talanton.platform.pds.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.talanton.platform.article.domain.Criteria;
import com.talanton.platform.pds.domain.PdsItem;
import com.talanton.platform.pds.persistence.PdsItemDAO;

@Service
public class PdsItemServiceImpl implements PdsItemService {
	@Inject
	private PdsItemDAO dao;			// 스프링 컨테이너로부터 DAO를 주입 받는다

	@Override
	public List<PdsItem> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public int listCount(Criteria cri) throws Exception {
		return dao.listCount(cri);
	}

	@Override
	public void create(PdsItem pds) throws Exception {
		dao.create(pds);
	}

	@Override
	public PdsItem read(String id) throws Exception {
		return dao.read(id);
	}
}