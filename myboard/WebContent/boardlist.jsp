<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="VO.BoardVO"%>
<%@ page import="DAO.BoardDAO"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%
	BoardDAO dao = new BoardDAO();
	String sessionid = request.getParameter("id"); 
	System.out.println(request.getParameter("id"));
	session.setAttribute("sessionid", sessionid);
	
	int total =dao.getTotalBoard();
	int page_count = total/3;
	if((page_count%2) !=0){
		
		page_count+=page_count; 
	}
	%>

<script src="jquery-3.2.1.min.js"></script>
<script>
	$(document).ready(function() {

	});
</script>
<style>
.boardlisttable td{
	width :20%; 
	height:20%;
}
tr{
	border-bottom: solid gray 1px;
}
a {
	text-decoration: None;
	color : black; 
}
ul{
list-style: None;
}
.showdetail:hover, .mine:hover {
	text-decoration: underline;
	color : blue; 
}
.toplisttd
{
	wieght :0%;
	height : 40%;
}
.toplist {
	width: 400px;
    height: 300px;
}

.column{
text-align: center;
}

.service-box {
	position: relative;
	width: 25vw;
	height: 30vw;
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-ms-flex-flow: row wrap;
	flex-flow: row wrap;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	text-align: center;
	font-weight: 700;
	color: #fff;
	opacity: 1;
	background: no-repeat center center/cover scroll
}

.service-box.img-01 {
/* 	background-image:
		url(//d2hmp4n7p97ldw.cloudfront.net/assets/home/os-01-61135fdc48f0234fbef929928938f99d9f745549c406807590c90c58b0db3167.png)
 */}


.service-box:hover .service-box-caption {
	opacity: 0
}

.service-box:hover .service-box-overlay {
	opacity: 1
}

.service-box:hover .service-box-blur-wrapper .service-box-blur {
	opacity: 1
}

.service-box .line-4 {
	position: absolute;
	height: 12.5rem;
	top: -13rem;
	left: 50%;
	z-index: 10
}

.service-box .service-box-blur-wrapper {
	position: absolute;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	overflow: hidden
}

.service-box .service-box-blur-wrapper .service-box-blur {
	width: 100%;
	height: 100%;
	opacity: 0;
	background: no-repeat center center/cover scroll;
	-webkit-transition: all .3s;
	transition: all .3s;
	-webkit-filter: blur(10px);
	-moz-filter: blur(10px);
	-o-filter: blur(10px);
	-ms-filter: blur(10px);
	filter: blur(10px)
}

.service-box .service-box-blur-wrapper .service-box-blur.img-01 {
	/* background-image:
		url(//d2hmp4n7p97ldw.cloudfront.net/assets/home/os-01-61135fdc48f0234fbef929928938f99d9f745549c406807590c90c58b0db3167.png) */
}

.service-box .service-box-caption {
	position: relative;
	font-size: 1.5rem;
	text-transform: uppercase;
	-webkit-transition: all .25s;
	transition: all .25s
}

@media ( min-width : 768px) {
	.service-box .service-box-caption {
		font-size: 1.875rem
	}
}

.service-box .service-box-overlay {
	position: absolute;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	opacity: 0;
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-ms-flex-flow: column nowrap;
	flex-flow: column nowrap;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	text-align: center;
	background: rgba(184, 103, 10, 0.7);
	-webkit-transition: all .35s;
	transition: all .35s
}

.service-box .service-box-overlay .content-box-1 {
	text-transform: uppercase;
	padding: 1rem 1rem 2vw;
	font-size: 1.75rem;
	line-height: normal;
	letter-spacing: -0.01875rem
}

.service-box .service-box-overlay .content-box-2 {
	padding: 2vw 1rem 1rem;
	font-size: 1.2rem;
	letter-spacing: -0.0125rem
}

.service-box .service-box-overlay .content-box-2.box-ht {
	-ms-flex-item-align: stretch;
	align-self: stretch;
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-ms-flex-flow: row nowrap;
	flex-flow: row nowrap;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center;
	-webkit-box-align: start;
	-ms-flex-align: start;
	align-items: flex-start;
	text-align: left
}

.service-box .service-box-overlay .content-box-2>.item-ht {
	padding: 0 2rem;
	-webkit-box-flex: 1;
	-ms-flex: 1 1 0px;
	flex: 1 1 0
}

@media ( max-width : 991px) {
	.service-box {
		width: 100vw;
		height: 60vw
	}
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
<%
int page_num=1;
if(request.getParameter("page") !=null){
	page_num = Integer.parseInt(request.getParameter("page"));
}
%>

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
		<table>
		<tr><h1 class = "logo">Top3 viewcount</h1></tr>
		<tr>
		<%
			ArrayList<BoardVO> list = dao.getBoardTopList();
			
			for (int i = 0; i < 3; i++) {
		
			out.println("<td class ='toplisttd'><a href ='boarddetail.jsp?boardseq="+list.get(i).getBoardseq() +"'>");
		%>
		<div class="service-box img-01" style = "background-image:url('<%=list.get(i).getBoardimage()%>')">
		<img class="line-4 hidden-md-down"
			alt="Line 4" />

		<div class="service-box-blur-wrapper">
			<div class="service-box-blur img-01"></div>
		</div>

		<div class="service-box-caption">
			<%=list.get(i).getBoardtitle() %>
		</div>

		<div class="service-box-overlay">
			<div class="content-box-1">
				<font > <%=list.get(i).getBoardcontents() %></font><br>
			</div>
		</div>
	</div>
	</a></td>
			<%
				}
			%>
	</tr>
		</table>
		<table class = "boardlisttable">
			<tr>
			<td colspan='4'></br><hr></td>
		</tr>
		<tr>
			<td class ="column"> 게시물 번호 </td>
			<td class ="column"> 제목 </td>				
			<td class ="column"> 작성자 </td>	
			<td class ="column"> 조회수 </td>	
		</tr>
			<tr>
			<td colspan='4'><hr></td>
		</tr>



		<%
			list = dao.getBoardList();
			for (int i = 0; i < list.size(); i++) {
				BoardVO vo = list.get(i);

				out.println("<tr><td>"+vo.getBoardseq()+"</td><td>" +"<a class ='showdetail' href='boarddetail.jsp?boardseq="+vo.getBoardseq() +"'>"+vo.getBoardtitle()+ "</td><td>"+vo.getBoardwriter()+"</td><td>"+vo.getBoardtime()+"</td></tr>");
				out.println("<tr><td colspan='4'><hr></td></tr>");
			}
		%>

	</table>
	<%
	for(int i=0;i<=page_count;i++){
		
		out.println("<a href='boardlist.jsp?page=" +i+ "'>"+i+"</a>");
	}
		 %>
</body>

</html>