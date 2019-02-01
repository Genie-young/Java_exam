<%@page import="com.oracle.jrockit.jfr.RequestableEvent"%>
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
<script src ="jquery-3.2.1.min.js" ></script>
<script>
$(document).ready(function(){
	$("#tolist").on('click', function(){
		
		location.href = "boardlist.jsp"; 
		//boardwriteform 으로 이동 
	});
});
</script>
</head>
<body>
<% 

	BoardDAO dao = new BoardDAO();
int seq =Integer.parseInt(request.getParameter("boardseq"));
String title = request.getParameter("boardtitle");
String contents = request.getParameter("boardcontents");
int result = dao.updateboard(seq,title,contents);
if(result==1)
	out.println("<h1> 수정되었습니다.</h1>");
	BoardVO vo = dao.getBoardDetail( Integer.parseInt(request.getParameter("boardseq")));
	
	out.println("<h1> 번호= "+vo.getBoardseq() +"</br> 제목 ="+ vo.getBoardtitle() + "</br> 내용 ="+ vo.getBoardcontents() +"</br> 글쓴이  ="+ vo.getBoardwriter() +
			"</br> 글쓴 시간 ="+ vo.getBoardtime() + "</br> 조회수  ="+ vo.getBoardviewcount()+"  </h1>");
	%>
<h1> </h1>	
<input id ="tolist" type= "button" value ="목록으로"> 
</body>
</html>