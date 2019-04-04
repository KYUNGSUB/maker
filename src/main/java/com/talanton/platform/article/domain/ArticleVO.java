package com.talanton.platform.article.domain;

import java.util.Date;

public class ArticleVO {
	private int bId;
	private int board_id;
	private String bName;
	private String bTitle;
	private String bContent;
	private String bIp;
	private String bSecret;
	private Date bCreatedAt;
	private Date bModifiedAt;
	private int bHit;
	private int bComment;
	private int bLike;
	private int bGroup;
	private int bStep;
	private int bIndent;
	private String[] files;
	
	public int getbId() {
		return bId;
	}
	public void setbId(int bId) {
		this.bId = bId;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getbIp() {
		return bIp;
	}
	public void setbIp(String bIp) {
		this.bIp = bIp;
	}
	public String getbSecret() {
		return bSecret;
	}
	public void setbSecret(String bSecret) {
		this.bSecret = bSecret;
	}
	public int getbComment() {
		return bComment;
	}
	public void setbComment(int bComment) {
		this.bComment = bComment;
	}
	public int getbLike() {
		return bLike;
	}
	public void setbLike(int bLike) {
		this.bLike = bLike;
	}
	public String getbName() {
		return bName;
	}
	public void setbName(String bName) {
		this.bName = bName;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public Date getbCreatedAt() {
		return bCreatedAt;
	}
	public void setbCreatedAt(Date bCreatedAt) {
		this.bCreatedAt = bCreatedAt;
	}
	public Date getbModifiedAt() {
		return bModifiedAt;
	}
	public void setbModifiedAt(Date bModifiedAt) {
		this.bModifiedAt = bModifiedAt;
	}
	public int getbHit() {
		return bHit;
	}
	public void setbHit(int bHit) {
		this.bHit = bHit;
	}
	public int getbGroup() {
		return bGroup;
	}
	public void setbGroup(int bGroup) {
		this.bGroup = bGroup;
	}
	public int getbStep() {
		return bStep;
	}
	public void setbStep(int bStep) {
		this.bStep = bStep;
	}
	public int getbIndent() {
		return bIndent;
	}
	public void setbIndent(int bIndent) {
		this.bIndent = bIndent;
	}
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	
	@Override
	public String toString() {
		return "ArticleVO [bId=" + bId + ", board_id=" + board_id + ", bName=" + bName + ", bTitle=" + bTitle
				+ ", bContent=" + bContent + ", bIp=" + bIp + ", bSecret=" + bSecret + ", bCreatedAt=" + bCreatedAt
				+ ", bModifiedAt=" + bModifiedAt + ", bHit=" + bHit + ", bComment=" + bComment + ", bLike=" + bLike
				+ ", bGroup=" + bGroup + ", bStep=" + bStep + ", bIndent=" + bIndent + ", files="
				+ java.util.Arrays.toString(files) + "]";
	}
}