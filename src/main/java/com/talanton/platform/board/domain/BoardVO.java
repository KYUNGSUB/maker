package com.talanton.platform.board.domain;

import java.sql.Timestamp;

public class BoardVO {
	private int board_id;
	private String board_name;
	private String board_type;
	private String url;
	private String secret;
	private String read_allow;
	private String write_allow;
	private String reply;
	private String modify;
	private String remove;
	private String download;
	private String upload;
	private int nAttach;
	private String aSize;
	private int display_format;
	private Timestamp createdAt;
	private String board_desc;
	private int nofArticle;		// 게시글 수

	public Timestamp getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getBoard_name() {
		return board_name;
	}
	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}
	public String getBoard_type() {
		return board_type;
	}
	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}
	public String getBoard_desc() {
		return board_desc;
	}
	public void setBoard_desc(String board_desc) {
		this.board_desc = board_desc;
	}
	public String getSecret() {
		return secret;
	}
	public void setSecret(String secret) {
		this.secret = secret;
	}
	public int getnAttach() {
		return nAttach;
	}
	public void setnAttach(int nAttach) {
		this.nAttach = nAttach;
	}
	public String getaSize() {
		return aSize;
	}
	public void setaSize(String aSize) {
		this.aSize = aSize;
	}
	public int getNofArticle() {
		return nofArticle;
	}
	public void setNofArticle(int nofArticle) {
		this.nofArticle = nofArticle;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getRead_allow() {
		return read_allow;
	}
	public void setRead_allow(String read_allow) {
		this.read_allow = read_allow;
	}
	public String getWrite_allow() {
		return write_allow;
	}
	public void setWrite_allow(String write_allow) {
		this.write_allow = write_allow;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getModify() {
		return modify;
	}
	public void setModify(String modify) {
		this.modify = modify;
	}
	public String getRemove() {
		return remove;
	}
	public void setRemove(String remove) {
		this.remove = remove;
	}
	public String getDownload() {
		return download;
	}
	public void setDownload(String download) {
		this.download = download;
	}
	public String getUpload() {
		return upload;
	}
	public void setUpload(String upload) {
		this.upload = upload;
	}
	public int getDisplay_format() {
		return display_format;
	}
	public void setDisplay_format(int display_format) {
		this.display_format = display_format;
	}
	@Override
	public String toString() {
		return "BoardVO [board_id=" + board_id + ", board_name=" + board_name + ", board_type=" + board_type + ", url="
				+ url + ", secret=" + secret + ", read_allow=" + read_allow + ", write_allow=" + write_allow
				+ ", reply=" + reply + ", modify=" + modify + ", remove=" + remove + ", download=" + download
				+ ", upload=" + upload + ", nAttach=" + nAttach + ", aSize=" + aSize + ", display_format="
				+ display_format + ", createdAt=" + createdAt + ", board_desc=" + board_desc + ", nofArticle="
				+ nofArticle + "]";
	}
}