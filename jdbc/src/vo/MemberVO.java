package vo;

public class MemberVO {
	private String id, name,  phone,indate, email;
	private int pw;
	 
	public MemberVO(String id, int pw, String name, String phone, String indate, String email) {
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.indate = indate;
		this.email = email;
		this.pw = pw;
	} 
	// overriding 
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", name=" + name + ", phone=" + phone + ", indate=" + indate + ", email=" + email
				+ ", pw=" + pw + "]";
	}
	// Getter Setter 
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public int getPw() {
		return pw;
	}
	public void setPw(int pw) {
		this.pw = pw;
	}

	
}
