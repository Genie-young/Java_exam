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
	
String product = (String)session.getAttribute("sessionproduct");
int balance = (int)session.getAttribute("sessionbalance");
String name = product.split(":")[0];
int price = Integer.parseInt(product.split(":")[1]); 
%>
<%=balance%>

<H1> 선택한 제품은 <%=product.split(":")[0]%>이고 가격은 <%=product.split(":")[1]%>입니다. </H1>
<H1> 구입수량은 <%=balance%>입니다. </H1>
<H1> 총가격은 <%=balance*price%> 입니다. </H1>
<%-- 
<H1> 선택한 제품은 <%=product.split(":")[0]%>이고 가격은 <%=product.split(":")[1]%>입니다. </H1>
<H1> 구입수량은 <%=balance%>입니다. </H1>
<H1> 총가격은 <%=balance*price%> 입니다. </H1> --%>
</body>
</html>