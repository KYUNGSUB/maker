package com.talanton.platform.monitoring.persistence;

import com.talanton.platform.monitoring.domain.EnvData;

public interface EnvDataDAO {
	int insert(EnvData environ);
	int getLastId();
}