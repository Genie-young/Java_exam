<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.sql.DriverManager, DAO.BoardDAO, VO.BoardVO"
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>html 태그 영역입니다.</h1>
	<% System.out.println("콘솔 출력 jsp문장 영역입니다."); 
		out.println("브라우저 출력 jsp문장 영역입니다.");
		request.getParameter("id");
	BoardVO a = new BoardVO(); 
	
	String s1 = "local";
	
	%>
	<%!String s2 = "global"; %>
	<%="<H2>브라우저 출력 전용 태그입니다.</H2>"+request.getParameter("id") %> <!-- out.println("<H2>브라우저 출력 전용 태그입니다.</H2>") 와 같은 표현 -->
	<%=request.getMethod() %> <!-- 결과 : GET || POST -->
	
	<%
		if(request.getMethod().equals("GET"))
		{
			//get 방식이면 실행되야 하는 것
		}
		else{
			// post 면 실행되야 하는 것
		}
	%>
	<%-- JSP주석문 --%>
	<input type="text" name ="n" value = "<%=request.getParameter("id") %>">
	
	
	
</body>
</html>