<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
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
	$("#write").on('click', function(){
		location.href = "boardwriteform.jsp"; 
		//boardwriteform 으로 이동 
	});
});
</script>
<style>
	.board_name_link{
		text-decoration: None; 
	}	
</style>
</head>
<body>
	<% 
	BoardDAO dao = new BoardDAO();
	ArrayList<BoardVO> list = dao.getBoardList();
	%>

	<table>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>시간</td>
		</tr>

		<% 
		for(int i=0;i<list.size(); i++){
			BoardVO vo = list.get(i);
			out.println("<tr><td>" + vo.getBoardseq()+"</td><td>" +"<a href='boarddetail.jsp?boardseq="+vo.getBoardseq() +"'>" +vo.getBoardtitle()+ "</a>" +"</td><td>" +vo.getBoardwriter()+"</td><td>"+vo.getBoardtime()+"</td></tr>" );
		
		} 
	
		%>
	</table>
	<input type = button id ="write" name "" value ="글쓰기 버튼">
</body>

</html>