package com.talanton.platform.dbmake.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.talanton.platform.article.domain.Criteria;
import com.talanton.platform.dbmake.domain.MusicServer;
import com.talanton.platform.dbmake.domain.TblMusicServer;

@Repository
public class DbMakeDAOImpl implements DbMakeDAO {
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.talanton.platform.mapper.DbMakeMapper";

	@Override
	public int listCount() throws Exception {
		return session.selectOne(namespace + ".listCount");
	}

	@Override
	public List<TblMusicServer> listMusicServer(Criteria cri) throws Exception {
		return session.selectList(namespace + ".listMusicCriteria", cri);
	}

	@Override
	public void create(MusicServer music) throws Exception {
		session.insert(namespace + ".create", music);
	}

	@Override
	public MusicServer read(int id) throws Exception {
		return session.selectOne(namespace + ".read", id);
	}

	@Override
	public int listMusicCount() throws Exception {
		return session.selectOne(namespace + ".listMusicCount");
	}

	@Override
	public TblMusicServer readMusic(int _id) throws Exception {
		return session.selectOne(namespace + ".readMusic", _id);
	}
}