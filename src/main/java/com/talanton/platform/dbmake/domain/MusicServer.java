package com.talanton.platform.dbmake.domain;

public class MusicServer {
	private int id;
	private String pid;
	private String title_ko;
	private String author_ko;
	private String title_en;
	private String author_en;
	private int genre;
	private String play_time;
	private int file_size;
	private String file_info;
	private String url_info;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
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
	public int getGenre() {
		return genre;
	}
	public void setGenre(int genre) {
		this.genre = genre;
	}
	public String getPlay_time() {
		return play_time;
	}
	public void setPlay_time(String play_time) {
		this.play_time = play_time;
	}
	public int getFile_size() {
		return file_size;
	}
	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}
	public String getFile_info() {
		return file_info;
	}
	public void setFile_info(String file_info) {
		this.file_info = file_info;
	}
	public String getUrl_info() {
		return url_info;
	}
	public void setUrl_info(String url_info) {
		this.url_info = url_info;
	}
}
