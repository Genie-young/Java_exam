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
<script src="jquery-3.2.1.min.js"></script>
<script>
</script>
</head>

<body>
	<%
		String boardtitle = request.getParameter("boardtitle");
		String boardcontents = request.getParameter("boardcontents");
		String boardwriter = request.getParameter("boardwriter");
		System.out.println(boardtitle+"contents :   " + boardcontents+"writer :   "+ boardwriter );
		BoardVO vo = new BoardVO(boardtitle, boardcontents, boardwriter);
		BoardDAO dao = new BoardDAO();
		int seq = dao.insertBoard(vo);
		System.out.println(seq); 
		vo = dao.getBoardDetail(seq);
		out.println("<h1> 번호= " + vo.getBoardseq() + "</br> 제목 =" + vo.getBoardtitle() + "</br> 내용 ="+ vo.getBoardcontents() + "</br> 글쓴이  =" + vo.getBoardwriter() + "</br> 글쓴 시간 =" + vo.getBoardtime()+ "</br> 조회수  =" + vo.getBoardviewcount() + "  </h1>");
	%>
</body>
</html>