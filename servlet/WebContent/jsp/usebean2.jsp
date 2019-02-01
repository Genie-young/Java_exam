<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id ="vo2" class ="VO.BoardVO" scope="session"/>
<!-- request.setAttribute("vo2",vo) -->
<h1>번호 : <jsp:getProperty property="seq" name="vo2"/></h1>
<h1>제목 : <jsp:getProperty property="title" name="vo2"/></h1>
<h1>내용 : <jsp:getProperty property="contents" name="vo2"/></h1>
<h1>조회수 : <jsp:getProperty property="viewcount" name="vo2"/></h1>
</body>
</html>