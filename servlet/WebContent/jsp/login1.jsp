<%@page import="VO.MemberVO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.IOException"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %>
    <%
    	String id = request.getParameter("id");
		int password = Integer.parseInt(request.getParameter("password"));
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		MemberVO vo = new MemberVO(id,password,name,phone,email);
		String result ="";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 1.DB연결
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
			System.out.println("연결성공");
			String sql = "insert into member values(?,?,?,?,sysdate,?)";

			
			PreparedStatement pt = con.prepareStatement(sql);
			pt.setString(1, id);
			pt.setInt(2,password);
			pt.setString(3, name);
			pt.setString(4, phone);
			pt.setString(5, email);	
			
			int row =pt.executeUpdate();
			
			if(row==1)
				result= "<h2>회원가입 완료되었습니다.<h2>";
			con.close();
			System.out.println("연결해제 성공");
			//ResultSet rs = pt.executeQuery();  - select 문일 때
			//int result = pt.executeUpdate();  - insert/ update 문일때 
			
		} catch (Exception e) {
			result="<h2>회원가입 미완료되었습니다.<h2>";
			e.printStackTrace();
		}
	%>
<!-- 	request.getParameter("a"); -->
<%request.setAttribute("memberinfo",vo);%>  <!-- param으로 하기 힘드니까 --> 
	<jsp:include page ="login2.jsp">
		<jsp:param name="a" value="<%=result%>" />
	</jsp:include>
	<!-- login2.jsp로 forward --> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>login1.jsp입니다.</h1>
</body>
</html>