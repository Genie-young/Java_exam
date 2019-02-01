package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Scanner;
import vo.MemberVO;
public class SelectTest3 {
public static void main(String[] args){

	Scanner sc= new Scanner(System.in);
	//0.jdbc driver 호출
	//1.DB연결
	//2.SQL전송
	//3.SQL결과 검색
	//4.DB 연결해제
	
	try {
/*-- 0.jdbc driver 호출  -------------------------------------------------------------------*/

	// 0.jdbc driver 호출  
	Class.forName("oracle.jdbc.driver.OracleDriver");

/*--1.DB연결  - SQLException -------------------------------------------------------------------*/
	
	//DriverManager.getConnection("jdbc:oracle:thin:연결하려고 하는 DB가 존재하는 위치 : DB이름","계정명","비밀번호");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","hr");
	System.out.println("연결성공");
	
	
/*-- 2.SQL전송  -------------------------------------------------------------------*/
	String sql = "select id, password, nvl(name,'무명') name, nvl(phone,'010') phone, nvl(indate,sysdate) indate, nvl(email, 'non') email from member";
	PreparedStatement pt = con.prepareStatement(sql);
	
/*-- 3.SQL결과 검색  -------------------------------------------------------------------*/
	ResultSet rs = pt.executeQuery();
	ArrayList<MemberVO> list = new ArrayList<>();
	while(rs.next())
	{
		String id = rs.getString("id");
		int pw = rs.getInt(2);
		String email = rs.getString("email");
		String phone = rs.getString("phone");
		String indate = rs.getString("indate");
		//java.sql.Date indate = rs.getDate("indate");
		String name = rs.getString("name");
		list.add(new MemberVO(id,pw,name,phone,indate,email));
	}
	
	
/*-- 4.DB 연결해제  -------------------------------------------------------------------*/
	con.close();
	System.out.println("연결해제 성공");
	for(MemberVO vo: list)
		System.out.println(vo);
	
	}catch(Exception e) {
		e.printStackTrace();}
}
}
