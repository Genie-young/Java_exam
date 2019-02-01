<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
/* 	try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 1.DB연결

			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
			System.out.println("연결성공");
			
		} catch (Exception e) {
			e.printStackTrace();
		} */

try {
	
	//시작하려고 하는 프로젝트명이 어디니 -> servlet프로젝트 설정  내용 기억
	Context initContext = new InitialContext();
	// context.xml에 설정 내용 찾아와 
	Context envContext = (Context)initContext.lookup("java:/comp/env");
	//xml에 넣은 이름이 jdbc/myoracle 로 생성한 객체를 찾아와 
	DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
	for(int i= 1; i <= 1000; i++){
		//connectionpool ds로부터 con 전달받음
		Connection con = ds.getConnection();
		System.out.println(con+"==>"+i);
		//con을 ds 에게 반납
		con.close();
	}
	}catch(Exception e) {}
%>
</body>
</html>