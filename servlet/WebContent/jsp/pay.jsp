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
		
		$(".selected_button").on('click', function() {
		$.ajax({ //ajax방식으로 요청할게
			
			url : 'payview.jsp', //jsp 파일 이름
			type : 'POST', //보내는 방식 'POST' | 'GET'
			data : {//[name="radioTxt"]:checked'
				'selection' : $('input[name = "selection"]:checked').val()
			}, //post 방식이라 data에 쿼리 스트링을 넣어줌 형식  
			success : function(server_output){ //서버에서 동작의 결과를 받아오는 함수 success를 오버라이딩을 사용함. 
				
				var jsonobj = JSON.parse(server_output);
				$("#paymentMethod").html("선택하신 지불 수단은  " + jsonobj.selection +" 입니다.");
				$("#cartStatus").html("장바구니를 비웠습니다.");
			},
			error : function() {
				alert("error");
			},
			complete : function() {
			}
			})//ajax end

		
		});// on end
}); // ready end
</script>
</head>
<body>

	<%
		String product = (String) session.getAttribute("sessionproduct");
		int balance = (int) session.getAttribute("sessionbalance");
		String name = product.split(":")[0];
		int price = Integer.parseInt(product.split(":")[1]);

		session.setAttribute("sessionproduct", product);
		session.setAttribute("sessionbalance", balance);
	%>
	<h1>지불 수단을 선택하세요</h1>
	</br>
	<form action="payview.jsp" method="POST">
	
		<input type="radio" class="selection" name="selection" value="cash" />현금
		<input type="radio" class="selection" name="selection" value="credit" />신용카드
		<input type="radio" class="selection" name="selection" value="phone" />핸드폰소액결제
		<input type="button" class="selected_button" value ="선택">
	</form>
	<H1>
		선택한 제품은
		<%=product.split(":")[0]%>이고 가격은
		<%=product.split(":")[1]%>입니다.
	</H1>
	<H1>
		구입수량은
		<%=balance%>입니다.
	</H1>
	<H1>
		총가격은
		<%=balance * price%>
		입니다.
	</H1>
	<h1 id="paymentMethod"></h1>
	<%
	session.invalidate(); 
	%>
	 <h1 id="cartStatus"></h1>
	</body>
</body>
</html>