package com.talanton.platform.dbmake.domain;

public class TblMusicServer {
	private int _id;
	private long col_pid;
	private String title_ko;
	private String author_ko;
	private String title_en;
	private String author_en;
	private int col_genre;
	private String col_play_time;
	private int col_file_size;
	private String col_file_info;
	private String col_url_info;
	private int col_my_rate;
	private int col_download;
	private int col_bookmark;
	
	public MusicServer toMusic() {
		MusicServer music = new MusicServer();
		music.setPid("" + col_pid);
		music.setTitle_ko(title_ko);
		music.setAuthor_ko(author_ko);
		music.setTitle_en(title_en);
		music.setAuthor_en(author_en);
		music.setGenre(col_genre);
		music.setPlay_time(col_play_time);
		music.setFile_size(col_file_size);
		music.setFile_info(col_file_info);
		music.setUrl_info(col_url_info);
		return music;
	}

	public int get_id() {
		return _id;
	}

	public void set_id(int _id) {
		this._id = _id;
	}

	public long getCol_pid() {
		return col_pid;
	}

	public void setCol_pid(long col_pid) {
		this.col_pid = col_pid;
	}

	public String getTitle_ko() {
		return title_ko;
	}

	public void setTitle_ko(String title_ko) {
		this.title_ko = title_ko;
	}

	public String getAuthor_ko() {
		return author_ko;
	}

	public void setAuthor_ko(String author_ko) {
		this.author_ko = author_ko;
	}

	public String getTitle_en() {
		return title_en;
	}

	public void setTitle_en(String title_en) {
		this.title_en = title_en;
	}

	public String getAuthor_en() {
		return author_en;
	}

	public void setAuthor_en(String author_en) {
		this.author_en = author_en;
	}

	public int getCol_genre() {
		return col_genre;
	}

	public void setCol_genre(int col_genre) {
		this.col_genre = col_genre;
	}

	public String getCol_play_time() {
		return col_play_time;
	}

	public void setCol_play_time(String col_play_time) {
		this.col_play_time = col_play_time;
	}

	public int getCol_file_size() {
		return col_file_size;
	}

	public void setCol_file_size(int col_file_size) {
		this.col_file_size = col_file_size;
	}

	public String getCol_file_info() {
		return col_file_info;
	}

	public void setCol_file_info(String col_file_info) {
		this.col_file_info = col_file_info;
	}

	public String getCol_url_info() {
		return col_url_info;
	}

	public void setCol_url_info(String col_url_info) {
		this.col_url_info = col_url_info;
	}

	public int getCol_my_rate() {
		return col_my_rate;
	}

	public void setCol_my_rate(int col_my_rate) {
		this.col_my_rate = col_my_rate;
	}

	public int getCol_download() {
		return col_download;
	}

	public void setCol_download(int col_download) {
		this.col_download = col_download;
	}

	public int getCol_bookmark() {
		return col_bookmark;
	}

	public void setCol_bookmark(int col_bookmark) {
		this.col_bookmark = col_bookmark;
	}
}
