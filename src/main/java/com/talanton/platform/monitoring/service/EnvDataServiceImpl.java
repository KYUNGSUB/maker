package com.talanton.platform.monitoring.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.talanton.platform.monitoring.domain.EnvData;
import com.talanton.platform.monitoring.persistence.EnvDataDAO;

@Service
public class EnvDataServiceImpl implements EnvDataService {
	@Inject
	private EnvDataDAO dao;

	@Override
	public int insert(EnvData environ) {
		return dao.insert(environ);
	}

	@Override
	public int getLastId() {
		return dao.getLastId();
	}
}
