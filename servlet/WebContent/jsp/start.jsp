<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#a").on('click', function() {
			location.href = "../shop?menu=productlist";

		});
		$("#b").on('click', function() {
			location.href = "cartview.jsp";

		});
		$("#c").on('click', function() {
			location.href = "pay.jsp";

		});
	});
</script>
</head>
<body>
	<h1>우리 쇼핑몰에 오신 것을 환영합니다.</h1>
	<form action ="../shop.Servlet" >
	<input type="button" value="상품리스트" name ="productlist" id="a"> 
	<input type="button" value="장바구나"  name ="cart" id="b">
	<input type="button" value="결제" name ="pay" id="c">

	<h1>오늘은 생필품을 세일하고 있습니다.</h1>
	</form>
	<!-- 	name 은 action으로 전달할때 속성 이름으로 사용하려구 
	id는 css,java에서 읽어가려고  -->
</body>
</html>