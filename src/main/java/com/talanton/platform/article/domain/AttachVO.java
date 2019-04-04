package com.talanton.platform.article.domain;

import java.util.Date;

public class AttachVO {
	private String fullName;
	private int bId;	// 0: 게시글 아님, 기타: 게시물
	private int kind;	// 1: 첨부, 2: 본문 이미지
	private Date regdate;
	
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public int getbId() {
		return bId;
	}
	public void setbId(int bId) {
		this.bId = bId;
	}
	public int getKind() {
		return kind;
	}
	public void setKind(int kind) {
		this.kind = kind;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
}
