<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	//json형태 변수1 : { 변수2 [] } id -hr, pw -hr인 경우에만 정상로그인 취급 
	// ajax 요청 -> jason 형태로 { "auth":true   "time" : "2019-01-23" } 만들어 넘김 

	String result = "";
	if (id.equals("hr") && pw.equals("hr")) {
		result = "{\"auth\":true,\"time\":\"2019-0123\" }";
	} else{
		result = "{\"auth\":false }";
	}
%>
<%=result%>