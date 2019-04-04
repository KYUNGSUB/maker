package com.talanton.platform.parameter.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.talanton.platform.article.domain.Criteria;
import com.talanton.platform.parameter.domain.SettingItem;
import com.talanton.platform.parameter.persistence.ParameterDAO;

@Service
public class ParameterServiceImpl implements ParameterService {
	@Inject
	private ParameterDAO dao;

	@Override
	public List<SettingItem> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		return dao.listCountCriteria(cri);
	}

	@Override
	public void register(SettingItem parameter) throws Exception {
		dao.create(parameter);
	}

	@Override
	public SettingItem read(String parameterName) throws Exception {
		return dao.read(parameterName);
	}

	@Override
	public void modify(SettingItem parameter) throws Exception {
		dao.update(parameter);
	}

	@Override
	public void remove(String parameterName) throws Exception {
		dao.delete(parameterName);
	}
}