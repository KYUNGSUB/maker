package com.talanton.platform.article.domain;

/*
 * 페이징 처리를 위한 설정 파라미터를 저장
 */
public class Criteria {
	private int page;			// 현재 페이지 번호
	private int perPageNum;		// 페이지당 보여주는 목록의 수
	
	public Criteria() {			// 생성자 : 기본 초기치를 할당
		this.page = 1;			// 1 page를 가리킴
		this.perPageNum = 10;	// 페이지당 10개를 기본으로 함
	}

	public void setPage(int page) {		// page 값이 0보다 작을 경우 page를 1로 설정
		if(page <= 0) {					// 그외는 입력된 페이지 값을 그대로 사용
			this.page = 1;
			return;
		}
		
		this.page = page;
	}
	
	public void setPerPageNum(int perPageNum) {		// 페이지당 보여주는 목록의 갯수를 0~100개로 가변할 수 있게함
		if(perPageNum <= 0 || perPageNum > 100) {	// 그외 다른 값을 설정하려고 하면 10개로 한정함
			this.perPageNum = 10;
			return;
		}
		
		this.perPageNum = perPageNum;
	}

	public int getPage() {
		return page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}
	
	public int getPageStart() {				// 해당 페이지의 첫번째 목록에 대한 인덱스 반환
		return (page - 1) * perPageNum;
	}
	
	public int getPageEnd() {				// 해당 페이지의 마지막 목록에 대한 인덱스 반환
		return page * perPageNum - 1;
	}
	
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
}
