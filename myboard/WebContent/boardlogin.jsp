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

</style>
<script src="jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.6/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.6/js/swiper.min.js"></script>
<script>

	$(document).ready(function() {
		new Swiper( '.swiper-container', {

			effect : 'fade', // 페이드 효과 사용

			loop : true, // 무한 반복
			pagination : { // 페이징 설정
				el : '.swiper-pagination',
				clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
			},
			navigation : { // 네비게이션 설정
				nextEl : '.swiper-button-next', // 다음 버튼 클래스명
				prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
			},
		});
		
		$(".login_button").on('click', function() {
			requestAjax();
		}); //general on end

	}); // ready end

	function requestAjax() {
		$.ajax({ //ajax방식으로 요청할게
			url : 'loginsession.jsp', //jsp 파일 이름
			type : 'POST', //보내는 방식 'POST' | 'GET'
			data : {
				'id' : $("#id").val(),
				'pw' : $("#pw").val()
			}, //post 방식이라 data에 쿼리 스트링을 넣어줌 형식  data : {'name1' : 'value1', 'name2' : 'value2'},  
			success : function(server_output) { //서버에서 동작의 결과를 받아오는 함수 success를 오버라이딩을 사용함. 
				var jsonobj = JSON.parse(server_output);
				if (jsonobj.auth) {
					location.href = "boardlist.jsp?id="+$("#id").val();
				} else {
					if (jsonobj.id)
						$("#here").html("로그인 정보를 확인하세요.");
					else
						$("#here").html("회원이 아닙니다.");
				}
			},
			error : function() {
				alert("error");
			},
			complete : function() {
			}

		})
	}

</script>

<style>

img{
	
	width : 1000px;
	height : 500px;
}

.swiper-container {
	top:100px;
    width:70%;
    height:60%;
}
.swiper-slide {
    text-align:center;
    display:flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
    align-items:center; /* 위아래 기준 중앙정렬 */
    justify-content:center; /* 좌우 기준 중앙정렬 */
}

.board_name_link {
	text-decoration: None;
}

.login_button {
	height: 50px;
	border: None;
	background-color: white;
	box-shadow: 1px 1px 4px black;
}

.login_button:hover {
	box-shadow: inset 1px 1px 4px black;
}

.login {
	position: fixed;
	top: 75%;
	left: 60%;
}

.statusshow {
	color :red; 
	position: fixed;
	top: 80%;
	left: 65%;
}
</style>
</head>
<body>
	<div class="swiper-container">
	<div class="swiper-wrapper">
		<div class="swiper-slide"><img src= "images/main1.jpg"></div>
		<div class="swiper-slide"><img src="images/main2.jpg"></div>
		<div class="swiper-slide"><img src="images/main3.jpg"></div>
		<div class="swiper-slide"><img src="images/main4.jpg"></div>
		<div class="swiper-slide"><img src="images/main5.jpg"></div>

	</div>

	<!-- 네비게이션 버튼 -->
<!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	<!-- 이전 버튼 -->
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
	<!-- 페이징 -->
	<div class="swiper-pagination"></div>
</div>
	
 		<form action="loginsession.jsp" class="login">
			<table>
				<tr>
					<td>아이디</td>
					<td><input class="login_info" id="id" type="text"
						name="boardid"></td>
					<td rowspan="2"><input class="login_button" type=button
						id="write" value="로그인"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input class="login_info" id="pw" type="password"
						name="boardid"></td>
				</tr>
			</table>
		</form> 

		<p class="statusshow" id="here"></p>
</body>

</html>