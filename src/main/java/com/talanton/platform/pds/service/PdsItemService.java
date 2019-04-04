package com.talanton.platform.pds.service;

import java.util.List;

import com.talanton.platform.article.domain.Criteria;
import com.talanton.platform.pds.domain.PdsItem;

public interface PdsItemService {
	List<PdsItem> listCriteria(Criteria cri) throws Exception;	// 파일 목록을 페이지 단위로 가져오기
	int listCount(Criteria cri) throws Exception;				// 전체 파일 갯수 구하기
	void create(PdsItem pds) throws Exception;					// 파일정보를 추가
	PdsItem read(String id) throws Exception;					// 파일 정보를 id로 검색
}