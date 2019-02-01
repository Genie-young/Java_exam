package VO;

public class MemberVO {
	String memberid;
	String memberpw; 
	String membername;
	int totalcontents;
	
	public MemberVO(String memberid,  String membername, int totalcontents) {
		super();
		this.memberid = memberid;
		this.membername = membername;
		this.totalcontents = totalcontents;
	} 
	public MemberVO(String memberid, String memberpw, String membername, int totalcontents) {
		super();
		this.memberid = memberid;
		this.membername = membername;
		this.totalcontents = totalcontents;
		this.memberpw = memberpw;
	} 
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getMemberpw() {
		return memberpw;
	}
	@Override
	public String toString() {
		return "MemberVO [memberid=" + memberid + ", memberpw=" + memberpw + ", membername=" + membername
				+ ", totalcontents=" + totalcontents + "]";
	}
	public void setMemberpw(String memberpw) {
		this.memberpw = memberpw;
	}
	public String getMembername() {
		return membername;
	}
	public void setMembername(String membername) {
		this.membername = membername;
	}
	public int getTotalcontents() {
		return totalcontents;
	}
	public void setTotalcontents(int totalcontents) {
		this.totalcontents = totalcontents;
	}

}
