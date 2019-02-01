<%@page import="VO.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp 액션태그 사용</h1>
<jsp:useBean id ="vo2" class ="VO.BoardVO" scope="session"/>
<!-- session.setAttribute("vo2",vo2) -->
<jsp:setProperty name ="vo2" property="*" />
<jsp:forward page ="usebean2.jsp"/>
</body>
</html>