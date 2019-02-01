package VO;

import java.io.IOException;

public class BoardVO {
	private int seq;
	private String title;
	private String contents;
	private int viewcount;

	public BoardVO() {}
	// 생성자
	public BoardVO(int seq, String title, String contents, int viewcount) {
		super();
		this.seq = seq;
		this.title = title;
		this.contents = contents;
		this.viewcount = viewcount; 
	}
	
	@Override // toString()오버라이드
	public String toString() {
		String str =  seq +"=" + title + "=" + contents + "=" + viewcount;
		return str;
	}
	

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getViewcount() {
		return viewcount;
	}

	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}
}
