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
	if(session.getAttribute("sessionid") != null)
		out.println(session.getAttribute("sessionid")+"회원님 글쓰기 가능합니다.");
	else{
		out.println("<h1> 로그임 먼저 </h1>"); // session의 모든 속성은 object 를 return 
		out.println("<a href = '../session/loginform.html'> 로그인 ㄱ? </a>");
	}
	%> 
</body>
</html>		