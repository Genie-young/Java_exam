<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "VO.BoardVO" %> 
<%@ page import = "DAO.BoardDAO" %> 
<%@ page import = "java.util.*" %> 
<!DOCTYPE html>
<html>
<head>
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
      	<a class ="mine" href ="boardlist.jsp">게시물 홈으로</a>
      </li>
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
header {
  position: fixed;
  right: 0; 
  width: 20%;
  padding: 20px;
  box-sizing: border-box;
 	border : 2px solid; 
}
li{
	list-style: None;
}
	<%
		int boardseq=Integer.parseInt(request.getParameter("boardseq"));
		BoardDAO dao = new BoardDAO();
		int result = dao.deleteBoard(boardseq,(String)session.getAttribute("sessionid"));
		System.out.println(result); 
		if(result==1)
			out.println("<h1> 삭제되었습니다.</h1>");

%>
</body>
</html>