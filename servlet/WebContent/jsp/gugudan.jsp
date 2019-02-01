<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action ="gugudan.jsp" method = "post">
단을 입력하세요 <input type = "text" name = dan>
<input type ="submit" value = "calculation">
</form>

<% 
int dan=2; 
if(request.getMethod().equals("POST"))
{
String input_dan = request.getParameter("dan");

if(input_dan !=null)
	dan = Integer.parseInt(input_dan);
}

%>
<table>
<style> 
	table,td  {
		border : 2px solid blue;
		text-align : center;  
	}
	tr {
		width : 400px; 
	}
</style>
<%
for(int i=2;i<dan ;i++){
	out.println("<tr>");
	for(int j=1;j<10;j++){
			out.println("<td>"+j + "*"+ i +" ="+ j*i+"</td>");
	}
	out.println("</tr>");
}

%>
</table>
</body>
</html>