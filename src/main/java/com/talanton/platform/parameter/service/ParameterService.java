package com.talanton.platform.parameter.service;

import java.util.List;

import com.talanton.platform.article.domain.Criteria;
import com.talanton.platform.parameter.domain.SettingItem;

public interface ParameterService {
	List<SettingItem> listCriteria(Criteria cri) throws Exception;
	int listCountCriteria(Criteria cri) throws Exception;
	void register(SettingItem parameter) throws Exception;
	SettingItem read(String parameterName) throws Exception;
	void modify(SettingItem parameter) throws Exception;
	void remove(String parameterName) throws Exception;
}
