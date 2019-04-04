package com.talanton.platform.dbmake.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.talanton.platform.article.domain.Criteria;
import com.talanton.platform.dbmake.domain.MusicServer;
import com.talanton.platform.dbmake.domain.TblMusicServer;
import com.talanton.platform.dbmake.persistence.DbMakeDAO;

@Service
public class DbMakeServiceImpl implements DbMakeService {
	@Inject
	private DbMakeDAO dao;

	@Override
	public int listCount() throws Exception {
		return dao.listCount();
	}

	@Override
	public List<TblMusicServer> listMusicServer(Criteria cri) throws Exception {
		return dao.listMusicServer(cri);
	}

	@Override
	public void create(MusicServer music) throws Exception {
		dao.create(music);
	}

	@Override
	public MusicServer read(int id) throws Exception {
		return dao.read(id);
	}

	@Override
	public int listMusicCount() throws Exception {
		return dao.listMusicCount();
	}

	@Override
	public TblMusicServer readMusic(int _id) throws Exception {
		return dao.readMusic(_id);
	}
	
}