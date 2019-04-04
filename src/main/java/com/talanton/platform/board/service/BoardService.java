package com.talanton.platform.board.service;

import java.util.List;

import com.talanton.platform.article.domain.Criteria;
import com.talanton.platform.board.domain.BoardVO;

public interface BoardService {
	public List<BoardVO> listCriteria(Criteria cri) throws Exception;
	public int listCountCriteria(Criteria cri) throws Exception;
	public void register(BoardVO board) throws Exception;
	public BoardVO read(int board_id) throws Exception;
	public void modify(BoardVO board) throws Exception;
	public void remove(int board_id) throws Exception;
}
