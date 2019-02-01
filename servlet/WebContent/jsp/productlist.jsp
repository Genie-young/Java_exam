<%@page import="VO.ProductVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style> 
	table, td{
		border : blue 2px solid; 
	}
</style>
</head>
<body>
<form action ='jsp/cart.jsp'>
<%-- name="product" value="<%=vo.getName()%>" --%>
<select name = "product"> 
<%
ArrayList<ProductVO> list = (ArrayList<ProductVO>)request.getAttribute("productlist");
for(ProductVO vo : list){
%>
	
	<option value="<%=vo.getName()+':'+vo.getPrice()%>"> <%=vo.getName()%> </option>
	
<%
}
//+":"+vo.getPrice()
%>
 </select>
<input type='text' name = "balance" >
<input type=submit value='장바구니 저장' >
 </form>


<!-- 1. productlist 속성 값 읽어오기 
2. 1번 조회 : productVO들 5개 
<form action ="cart.jsp">
3. xxx.getName() : select-option 태그로 구성하기
4. 선택 상품명 구입수량 입력 <input type= text name = "balance"> 
5.option태그 선택 상품명, 구입수량을 cart.jsp를 보내기 
 </form>
 
  -->
</body>
</html>