<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="VO.*"%>
<%@ page import="DAO.BoardDAO"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<script src ="jquery-3.2.1.min.js" ></script>
<script>
$(document).ready(function(){
	$(".changepw").on('click', function(){
		location.href ="myinfo.jsp?newpw="+$(".newpw").val();
	}); 
});
</script>
<style>

header {
  position: fixed;
  right: 0; 
  width: 20%;
  padding: 20px;
  box-sizing: border-box;
 	border : 2px solid; 
}
 
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header>
  <nav>
    <h1>
    </h1>
    <ul>
    
    <h1> <%=session.getAttribute("sessionid") %></h1>
    
      <li>
      	<a class ="mine" href ="myboardlist.jsp">내 게시물</a>
      </li>
      <li>
     	 <a class ="mine" href ="mywriting.jsp">글쓰기</a>
      </li>
      <li>
         <a class ="mine" href ="myinfo.jsp">내정보</a>
      </li>
    </ul>
  </nav>
</header>
	<%String id = (String)session.getAttribute("sessionid");
		BoardDAO dao = new BoardDAO();
		MemberVO vo =  dao.getMyInfo(id); 
		
	%>
	<table>
		<tr>
		<td>아이디</td>
		<td><%=vo.getMemberid()%></td>
		</tr>
		<tr>
		<td>비밀번호 변경</td>
		<td><input type="text" class ="newpw"></td>
		<td><input class="changepw" type="button" value = "변경"></td>
		</tr>
		<tr>
		<td>이름</td>
		<td><%=vo.getMembername()%></td>
		</tr>
		<tr>
		<td>총게시물</td>
		<td><%=vo.getTotalcontents()%></td>
		</tr>
	</table>
	
	<%
	String pw = request.getParameter("newpw");
	int result = dao.setPw(id, pw);
	if(result==1)
	{
		
		out.println("<h1> 변경되었습니다.</h1>");
	}
	%>

</body>
</html>