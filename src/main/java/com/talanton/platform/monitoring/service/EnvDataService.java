package com.talanton.platform.monitoring.service;

import com.talanton.platform.monitoring.domain.EnvData;

public interface EnvDataService {
	int insert(EnvData environ);
	int getLastId();	// 마지막으로 추가된 ID 값을 구한다.
}