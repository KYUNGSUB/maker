package com.talanton.platform.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.talanton.platform.article.domain.Criteria;
import com.talanton.platform.board.domain.BoardVO;
import com.talanton.platform.board.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {
	@Inject
	private BoardDAO dao;

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		return dao.countPaging(cri);
	}

	@Override
	public void register(BoardVO board) throws Exception {
		dao.create(board);
	}

	@Override
	public BoardVO read(int board_id) throws Exception {
		return dao.read(board_id);
	}

	@Override
	public void modify(BoardVO board) throws Exception {
		dao.update(board);
	}

	@Override
	public void remove(int board_id) throws Exception {
		dao.delete(board_id);
	}

}
