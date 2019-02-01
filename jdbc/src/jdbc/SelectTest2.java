package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class SelectTest2 {
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
	String sql = "select count(id) as num from member";
	PreparedStatement pt = con.prepareStatement(sql);
	
/*-- 3.SQL결과 검색  -------------------------------------------------------------------*/
	ResultSet rs = pt.executeQuery();
	
	rs.next();
	System.out.println(rs.getInt("num"));
	
/*-- 4.DB 연결해제  -------------------------------------------------------------------*/
	con.close();
	System.out.println("연결해제 성공");
	}catch(Exception e) {
		e.printStackTrace();}
}
}
