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
	$("#save").on('click', function(){
		
		location.href = "boardupdatedetail.jsp?boardtitle="+$("#boardtitle").val()+"&boardcontents="+$("#boardcontents").val()+"&boardseq="+$("#seq").html(); 
		//boardwriteform 으로 이동 
	});
	
});
</script>
<style>
	textarea{
		width : 1000px;
		height : 1000px; 
	}
	#boardtitle{
		width : 900px; 
		height : 100px;
		border-color: white;
		color : #9E9E9E;
	}
	#boardcontents
	{
		width : 900px;
		height : 1000px;
		border-color: white;
		color : #9E9E9E;
	}
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
#seq{
display:None;
}
</style>
</head>
<body>

<header>
  <nav>
    <h1>
    </h1>
    <ul>
    
    <h1 > <%=session.getAttribute("sessionid") %></h1>
    
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

<% 
	BoardDAO dao = new BoardDAO();
	BoardVO vo = dao.getBoardDetail( Integer.parseInt(request.getParameter("boardseq")));
/* 	out.println("</br> 제목  "+ vo.getBoardtitle() + "</br> 내용 ="+ vo.getBoardcontents() +"</br> 글쓴이  ="+ vo.getBoardwriter() +
			"</br> 글쓴 시간 ="+ vo.getBoardtime() + "</br> 조회수  ="+ vo.getBoardviewcount()+"  </h1>");
	 */%>
	<table>
		<tr>
		<td id="seq"><%=vo.getBoardseq()%></td>
				<td><h1><input type="text" id="boardtitle" name="boardtitle" value ="<%=vo.getBoardtitle()%>"/></h1></td>
			</tr>
			<tr><hr></tr>
			<tr>
				<td><input type ="text" rows="10" cols="50" id="boardcontents" name="boardcontents " value ="<%=vo.getBoardtitle()%>"></td>
			</tr>
	</table>
<h1> </h1>	
<input id ="save" type= "button" value ="저장하기"> 
<input id ="tolist" type= "button" value ="목록으로"> 


<%

%>
</body>
</html>