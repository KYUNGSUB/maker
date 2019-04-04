package com.talanton.platform.parameter.persistence;

import java.util.List;

import com.talanton.platform.article.domain.Criteria;
import com.talanton.platform.parameter.domain.SettingItem;

public interface ParameterDAO {
	List<SettingItem> listCriteria(Criteria cri) throws Exception;
	int listCountCriteria(Criteria cri) throws Exception;
	void create(SettingItem parameter) throws Exception;
	SettingItem read(String parameterName) throws Exception;
	void update(SettingItem parameter) throws Exception;
	void delete(String parameterName) throws Exception;
}