package VO;

public class BoardVO {
	int boardseq=0;
	String boardtitle="";
	String boardcontents="";
	String boardwriter="";
	String boardtime="";
	int boardviewcount=0;
	
	
	public BoardVO(int boardseq, String boardtitle, String boardcontents, String boardwriter, String boardtime,int boardviewcount) {
		this.boardseq = boardseq;
		this.boardtitle = boardtitle;
		this.boardcontents = boardcontents;
		this.boardwriter = boardwriter;
		this.boardtime = boardtime;
		this.boardviewcount = boardviewcount;
	}
	
	public BoardVO(String boardtitle, String boardcontents, String boardwriter) {
		this.boardtitle = boardtitle;
		this.boardcontents = boardcontents;
		this.boardwriter = boardwriter;
	}
	
	public BoardVO(int boardseq, String boardtitle, String boardwriter, String boardtime) {
		super();
		this.boardseq = boardseq;
		this.boardtitle = boardtitle;
		this.boardcontents = boardcontents;
		this.boardwriter = boardwriter;
		this.boardtime = boardtime;
		this.boardviewcount = boardviewcount;
	}
	
	public BoardVO() {}
	@Override
	public String toString() {
		return "BoardVO [boardseq=" + boardseq + ", boardtitle=" + boardtitle + ", boardcontents=" + boardcontents
				+ ", boardwriter=" + boardwriter + ", boardtime=" + boardtime + ", boardviewcount=" + boardviewcount
				+ "]";
	}

	public int getBoardseq() {
		return boardseq;
	}
	public void setBoardseq(int boardseq) {
		this.boardseq = boardseq;
	}
	public String getBoardtitle() {
		return boardtitle;
	}
	public void setBoardtitle(String boardtitle) {
		this.boardtitle = boardtitle;
	}
	public String getBoardcontents() {
		return boardcontents;
	}
	public void setBoardcontents(String boardcontents) {
		this.boardcontents = boardcontents;
	}
	public String getBoardwriter() {
		return boardwriter;
	}
	public void setBoardwriter(String boardwriter) {
		this.boardwriter = boardwriter;
	}
	public String getBoardtime() {
		return boardtime;
	}
	public void setBoardtime(String boardtime) {
		this.boardtime = boardtime;
	}
	public int getBoardviewcount() {
		return boardviewcount;
	}
	public void setBoardviewcount(int boardviewcount) {
		this.boardviewcount = boardviewcount;
	} 
	
}
