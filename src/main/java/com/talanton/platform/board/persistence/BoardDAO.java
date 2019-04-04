package com.talanton.platform.board.persistence;

import java.util.List;

import com.talanton.platform.article.domain.Criteria;
import com.talanton.platform.board.domain.BoardVO;

public interface BoardDAO {
	List<BoardVO> listCriteria(Criteria cri) throws Exception;
	int countPaging(Criteria cri) throws Exception;
	void create(BoardVO board) throws Exception;
	BoardVO read(int board_id) throws Exception;
	void update(BoardVO board) throws Exception;
	void delete(int board_id) throws Exception;

}
