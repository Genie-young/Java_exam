<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="VO.BoardVO"%>
<%@ page import="DAO.BoardDAO"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시물 작성</title>
<script src ="jquery-3.2.1.min.js" ></script>
<script>
$(document).ready(function(){
	$("#save").on('click', function(){
		location.href = "boardwriteresult.jsp?boardtitle="+$("#boardertitle").val()+"&boardcontents="+$("#boardcontents").val()
				+"&boardwriter="+$("#boardwriter").val(); 
	}); 
});
</script>
</head>
<body>
	<form>
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" id="boardertitle" name="boardtitle"/></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" cols="50" id="boardcontents"
						name="boardcontents"></textarea></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><p id="boardwriter" name="boardwriter"> <%=session.getAttribute("sessionid") %></td>
			</tr>
			<tr>
				<td colspan=2><input type="button" id ="save" value="저장버튼"> </td>
			</tr>
		</table>

	</form>
</body>
</html>