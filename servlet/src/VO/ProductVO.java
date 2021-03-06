package VO;

public class ProductVO {
	//productVO code 이름 가격 재고 설명 이미지파일 
	int code;
	String name;
	int price; 
	int balance;
	public ProductVO(int code, String name, int price, int balance) {
		super();
		this.code = code;
		this.name = name;
		this.price = price;
		this.balance = balance;
	} 

	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}

	@Override
	public String toString() {
		return "ProductVO [code=" + code + ", name=" + name + ", price=" + price + ", balance=" + balance + "]";
	}
}
