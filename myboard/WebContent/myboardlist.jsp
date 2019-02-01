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
				+"&boardwriter="+$("#sessionid").html(); 
	}); 
	
	$("#update").on('click',function(){
		location.href  = "boardupdate.jsp?boardseq="+$("#seq").html(); 
		
	})
	$("#delete").on('click',function(){
		location.href  = "boarddelete.jsp?boardseq="+$("#seq").html(); 
		
	})
});
</script>
<style>
.boardlisttable{
	width : 80%;
}
.boardlisttable td{
	width :10%; 
	height:20%;
}
#sessionid{
	display:None;
}

header {
  position: fixed;
  right: 0; 
  width: 20%;
  padding: 20px;
  box-sizing: border-box;
 	border : 2px solid; 
}
 

</style>
</head>
<body>

<p id ="sessionid" ><%=session.getAttribute("sessionid") %><p>

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
<table class = "boardlisttable">
			<tr>
			<td colspan='6'></br><hr></td>
		</tr>
		<tr>
			<td class ="column"> 게시물 번호 </td>
			<td class ="column"> 제목 </td>				
			<td class ="column"> 작성자 </td>	
			<td class ="column"> 조회수 </td>	
		</tr>
			<tr>
			<td colspan='6'><hr></td>
		</tr>



		<%	
		BoardDAO dao = new BoardDAO(); 
			ArrayList<BoardVO> list = dao.getMyBoardList((String)session.getAttribute("sessionid"));
			for (int i = 0; i < list.size(); i++) {
				BoardVO vo = list.get(i);

				out.println("<tr><td id='seq'>"+vo.getBoardseq()+"</td><td>" +"<a class ='showdetail' href='boarddetail.jsp?boardseq="+vo.getBoardseq() +"'>"+vo.getBoardtitle()+ "</td><td>"+vo.getBoardwriter()+"</td><td>"+vo.getBoardtime()+"</td><td><input type = 'button' value = '수정하기' id = 'update'><input type = 'button' value = '삭제하기' id = 'delete'></td></tr>");
				
				out.println("<tr><td colspan='6'><hr></td></tr>");
			}
		%>

	</table>
</body>
</html>