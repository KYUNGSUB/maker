package com.talanton.platform.article.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

/*
 * 목록보기에서 페이징 처리를 위한 정보를 저장하는 클래스
 */
public class PageMaker {
	private int totalCount;		// 전체 목록의 수
	private int startPage;		// 목록을 표시하기 위한 시작 페이지 번호
	private int endPage;		// 목록을 표시하기 위한 마지막 페이지 번호
	private boolean prev;		// 현재 보여지는 페이지에서 이전 페이지가 있는지 여부를 표시하는 플래그
	private boolean next;		// 현재 보여지는 페이지에서 다음 페이지가 있는지 여부를 표시하는 플래그
	
	private int displayPageNum = 10;	// 페이징 처리를 위해 보여주는 페이지의 갯수 (디폴트 값)
	private Criteria cri;				// 페이징 처리를 위한 기준 정보
	
	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;	// 전제 목록의 수를 저장하고
		
		calcData();						// 이를 토대로 페이징을 위한 데이터를 만든다.
	}

	private void calcData() {	// 현재 페이지 정보를 토대로 페이징 처리를 위한 데이터를 만들어냄
		endPage = (int)(Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;
		int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
		if(endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		
		prev = startPage == 1 ? false : true;
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public Criteria getCri() {
		return cri;
	}
	
	public String makeQuery(int page) {		// 질의를 위한 파라미터 생성 매소드 : 현재 페이지 기준
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum())
				.build();
		return uriComponents.toUriString();
	}
	
	public String makeSearch(int page) {	// 검색기능 사용 시, 질의 파라미터 생성 매소드
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum())
				.queryParam("searchType", ((SearchCriteria) cri).getSearchType())
				.queryParam("keyword", encoding(((SearchCriteria) cri).getKeyword()))
				.build();
		return uriComponents.toUriString();
	}

	private String encoding(String keyword) {
		if(keyword == null || keyword.trim().length() == 0) {
			return "";
		}
		try {
			return URLEncoder.encode(keyword, "UTF-8");
		} catch(UnsupportedEncodingException e) {
			return "";
		}
	}
}
