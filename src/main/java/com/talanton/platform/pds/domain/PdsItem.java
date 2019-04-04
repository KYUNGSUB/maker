package com.talanton.platform.pds.domain;

/*
 * 
 */
public class PdsItem {
	private int id;				// 파일을 고유하게 구분하는 ID
	private String fileName;	// 원래 파일의 이름
	private String realPath;	// 저장되는 결로의 파일 (결와+변경된 파일명)
	private long fileSize;		// 파일 크기
	private int downloadCount;	// 파일을 다운로드 한 수
	private String description;	// 파일의 대 분류자 : 용도에 따른 분류 (게시판의 종류 또는 기능명)
	private int articleId;		// 중분류 : 예) 게시글의 ID (대분류 게시판에 속함)
	private String kind;		// 하나의 게시물에 여러 개의 파일이 속할 때, 그를 구분하는 구분자
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getRealPath() {
		return realPath;
	}
	public void setRealPath(String realPath) {
		this.realPath = realPath;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public int getDownloadCount() {
		return downloadCount;
	}
	public void setDownloadCount(int downloadCount) {
		this.downloadCount = downloadCount;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getArticleId() {
		return articleId;
	}
	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
}