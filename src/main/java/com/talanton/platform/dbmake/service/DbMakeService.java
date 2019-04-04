package com.talanton.platform.dbmake.service;

import java.util.List;

import com.talanton.platform.article.domain.Criteria;
import com.talanton.platform.dbmake.domain.MusicServer;
import com.talanton.platform.dbmake.domain.TblMusicServer;

public interface DbMakeService {
	int listMusicCount() throws Exception;
	int listCount() throws Exception;
	List<TblMusicServer> listMusicServer(Criteria cri) throws Exception;
	void create(MusicServer music) throws Exception;
	MusicServer read(int id) throws Exception;
	TblMusicServer readMusic(int _id) throws Exception;
}
