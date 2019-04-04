package com.talanton.platform.article.domain;

public class BCriteria extends Criteria{
	private int board_id;
	
	public BCriteria() {
		this.board_id = 1;
	}

	public int getBoard_id() {
		return board_id;
	}

	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}

	@Override
	public String toString() {
		return "BCriteria [board_id=" + board_id + "]";
	}
}
