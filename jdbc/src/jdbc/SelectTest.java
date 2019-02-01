package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class SelectTest {
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
/*	
	String sql = "select * from member";
	//preparedStatement 객체
	PreparedStatement pt = con.prepareStatement(sql);

*/	
	
/*
	String sql = "select id,to_char(nvl(indate, sysdate), 'yyyy/mm/dd') from member where id like ?";
	PreparedStatement pt = con.prepareStatement(sql);
	pt.setString(1, "ora%");
*/
	//함수를 전체 받을 때는 (as) 별명 붙여주기 or 컬럼위치로 사용  
	String sql = "select id,to_char(nvl(indate, sysdate), 'yyyy/mm/dd') as indate from member where id like ?";
	PreparedStatement pt = con.prepareStatement(sql);
	pt.setString(1, "ora%");
	
	
		
/*-- 3.SQL결과 검색  -------------------------------------------------------------------*/
/*
 * 	//리턴한 테이블 객체 저장하기 ResultSet 
	ResultSet rs= pt.executeQuery();
	while(rs.next())
	{
		String id = rs.getString("id");
		int pw = rs.getInt(2);
		String email = rs.getString("email");
		String phone = rs.getString("phone");
		String indate = rs.getString("indate");
		//java.sql.Date indate = rs.getDate("indate");
		String name = rs.getString("name");
		System.out.println(id +" - " + pw+" - " + email +" - " + phone + " - " +indate +" - " + name);
	}
 */
/*
	ResultSet rs= pt.executeQuery();
	while(rs.next())
	{
		String id = rs.getString("id");
		String indate = rs.getString(2);
		System.out.println(id +" - "  +indate );

	}
*/
	ResultSet rs= pt.executeQuery();
	while(rs.next())
	{
		String id = rs.getString("id");
		String indate = rs.getString("indate");
		System.out.println(id +" - "  +indate );

	}
/*-- 4.DB 연결해제  -------------------------------------------------------------------*/
	con.close();
	System.out.println("연결해제 성공");
	}catch(Exception e) {
		e.printStackTrace();}
}
}
