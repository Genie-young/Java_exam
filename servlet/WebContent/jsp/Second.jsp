<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    buffer="8kb" autoFlush="true" 
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>

<% 
out.println(out.getBufferSize());
out.println(new Date()); // 응답하면 서버 출력 버퍼에 임시로 저장, 수행 완료 후 클라이언트 전송 시작 
// out.clear();  // 버퍼 삭제 
out.println(out.getRemaining());
%>

</h1>
</body>
</html>