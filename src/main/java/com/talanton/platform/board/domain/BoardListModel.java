package com.talanton.platform.board.domain;

import java.util.ArrayList;
import java.util.List;

public class BoardListModel {
	private List<BoardVO> boardList;
	private int requestPage;
	private int totalPageCount;
	private int startRow;
	private int endRow;
	
	public BoardListModel() {
		this(new ArrayList<BoardVO>(), 0, 0, 0, 0);
	}

	public BoardListModel(List<BoardVO> boardList, int requestPageNumber,
			int totalPageCount, int startRow, int endRow) {
		this.boardList = boardList;
		this.requestPage = requestPageNumber;
		this.totalPageCount = totalPageCount;
		this.startRow = startRow;
		this.endRow = endRow;
	}

	public List<BoardVO> getBoardList() {
		return boardList;
	}

	public boolean isHasBoard() {
		return ! boardList.isEmpty();
	}
	
	public int getRequestPage() {
		return requestPage;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public int getStartRow() {
		return startRow;
	}

	public int getEndRow() {
		return endRow;
	}
}