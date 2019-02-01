package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class DeleteTest {
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
	
	//키보드 입력 2개, java 한서진 id java인 회원의 이름을 한서진 변경 
	String id = sc.next();
	String sql ="delete from member where to_date(indate, 'yy/mm/dd') = (select to_date(indate, 'yy/mm/dd') from member  where id = ?)";
	
	PreparedStatement pt = con.prepareStatement(sql);
	pt.setString(1, id);

		
/*-- 3.SQL결과 검색  -------------------------------------------------------------------*/

	// DB에 갱신할 게 있으면 갱신해  결과가 적용된 row의 갯수를 return함 
		int insertRow = pt.executeUpdate(); 
		System.out.println("삽입행의 갯수 : "+ insertRow);
		
	
	
/*-- 4.DB 연결해제  -------------------------------------------------------------------*/
	con.close();
	System.out.println("연결해제 성공");
	}catch(Exception e) {System.out.println(e.getMessage());}
}
}
