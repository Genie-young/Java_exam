<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String selection = request.getParameter("selection");

	String result = "";
	if (selection.equals("cash")){
		result = "{\"selection\":\"현금\" }";
	} 
	else if(selection.equals("credit")){
		result = "{\"selection\":\"신용카드\" }";
	}
	else if(selection.equals("phone")){
		result = "{\"selection\":\"핸드폰소액결제\" }";
	} 
%>
<%=result%>