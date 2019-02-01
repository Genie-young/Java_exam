<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import ="DAO.BoardDAO" %>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	//json형태 변수1 : { 변수2 [] } id -hr, pw -hr인 경우에만 정상로그인 취급 
	// ajax 요청 -> jason 형태로 { "auth":true   "time" : "2019-01-23" } 만들어 넘김 
	BoardDAO dao = new BoardDAO(); 
	int validation = dao.accountCheck(id, pw); 
	String result = "";
	switch(validation)
	{
	
	case -1: 
		result ="{\"auth\":false,\"id\":false }";
		break;
	case 0 :
		result ="{\"auth\":false,\"id\":true }";
		break;
	case 1 :
		result ="{\"auth\":true }";
		break;
	
	}
	
%>
<%=result%>