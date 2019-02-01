<%@page import="VO.MemberVO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.IOException"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	h3{
	width = 500px;
	border : 1px dashed red;
	background-color : pink; 
	}
</style>
</head>
<body>
<h1> login2.jsp파일 영역입니다.</h1>
<h2><%=request.getParameter("a") %></h2>
<h1> 입력한 정보는 다음과 같습니다. </h1>
<% 
MemberVO vo= (MemberVO)request.getAttribute("memberinfo"); 

%>
<h3><%=vo%></h3>
</body>
</html>