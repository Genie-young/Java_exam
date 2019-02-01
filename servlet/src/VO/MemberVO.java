package VO;

public class MemberVO {
//한사람의 정보는 변수로 선언하고/getter - setter 메소드 
	String id; 
	int pw;
	String name; 
	String phone;
	String indate;
	String email;
	public MemberVO(String id, int pw, String name, String phone, String email) {
		super();
		this.id = id;
		this.pw = pw;
		this.phone = phone;
		this.email = email;
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPw() {
		return pw;
	}
	public void setPw(int pw) {
		this.pw = pw;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getIndate() {
		return indate;
	}
	public void setIndate(String indate) {
		this.indate = indate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public void setName(String name) {
		this.name = name;
	}	
	public String getName() {
		return name;
	}
	@Override
	public String toString() {
		
		return id+pw+name+phone+email; 
	} 
	
	
}
