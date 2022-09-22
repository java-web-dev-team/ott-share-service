<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.MemberDaoImpl"%>
<%@ page import="java.lang.reflect.Member" %>
<%@ page import="dao.MemberDao" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
<script type="text/javascript" src="../js/member.js"></script>
<style>
.screen {
	width: 1280px;
	margin: 0 auto
}

.menu li {
	margin-top: 35px;
	list-style-type: none; /* 불릿 없앰 */
	display: block; /* 영역 만듦 */
	width: 8em; /* 너비 */
	height: 3em; /* 높이 */
	float: right; /* 왼쪽으로 플로팅 */
	text-align: center; /* 가운데 정렬 */
	font-family: "Lucida Grande", sans-serif; /* 글꼴 */
	border: 1px #818181 solid; /* 테두리 */
	box-shadow: 1px 1px 1px #bbb; /* 박스 그림자 */
	margin-right: 20px;
}

.menu img {
	border: none;
	float: left;
	margin-top: 35px;
	margin-right: 100px;
}

/* 메뉴 링크 스타일 */
.menu li a {
	display: block; /* 영역 만듦 */
	padding: .8em .5em .5em .5em; /* 안여백 */
	text-decoration: none; /* 밑줄 없앰 */
	color: #292929; /* 글자색 */
	text-shadow: 1px 1px 0px #cccccc; /* 텍스트 그림자 */
}

/* 메뉴 링크 위로 마우스 오버했을 때의 스타일 */
.menu li:hover {
	background-color: #333333; /* 배경색 */
}

/* 메뉴 링크 위로 마우스 오버한 후 링크 스타일 */
.menu li:hover>a {
	color: #FFF; /* 글자색 */
	text-shadow: 0px 1px 0px #fff; /* 텍스트 그림자 */
}

@import url(https://fonts.googleapis.com/css?family=Roboto:300);

.join-page {
	width: 360px;
	padding: 8% 0 0;
	margin: auto;
}

.form {
	position: relative;
	z-index: 1;
	background: #FFFFFF;
	max-width: 360px;
	margin: 0 auto 100px;
	padding: 45px;
	text-align: center;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0
		rgba(0, 0, 0, 0.24);
}

.form input {
	font-family: "Roboto", sans-serif;
	outline: 0;
	background: #f2f2f2;
	width: 100%;
	border: 0;
	margin: 0 0 15px;
	padding: 15px;
	box-sizing: border-box;
	font-size: 14px;
}

.form button {
	font-family: "Roboto", sans-serif;
	text-transform: uppercase;
	outline: 0;
	background: #000000;
	width: 100%;
	border: 0;
	padding: 15px;
	color: #FFFFFF;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}

.form button:hover, .form button:active, .form button:focus {
	background: #F2F2F2;
}

.form .message {
	margin: 15px 0 0;
	color: #b3b3b3;
	font-size: 12px;
}

.form .message a {
	color: #000000;
	text-decoration: none;
}

body {
	font-family: "Roboto", sans-serif;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}
</style>
</head>
<body>
	<header style="height: 150px">
		<div class="screen">
			<a href="home.do"> <img src="pizza.png"
				style="margin-right: 150px; margin-left: 70px; width: 185px;"></a>
			<ul class="menu" style="display: inline-table;">
				<li id="로그인" onclick="location.href='login.do'"><a href="#">로그인</a></li>
				<li id="나의피자"><a href="#">나의 피자</a></li>
				<li id="꿀잼추천"><a href="#">꿀잼 추천</a></li>
				<li id="그룹찾기"><a href="#">그룹 찾기</a></li>
				<li id="그룹모집"><a href="../board/list.do">그룹 모집</a></li>
			</ul>
		</div>
		<hr>
	</header>

	<section>

		<div class="screen">

			<div class="register-page">
				<div class="form">
					<form class="register-form" action="register.do" method="post" name="frm">
						<p style="margin-top: -15px">회원가입</p>
						<input type="text" id="id" name="id" placeholder="아이디" required/>
						<button type="submit" id="reId" name="reId" value="중복확인" style="margin-bottom: 15px" onclick="" >중복확인</button>
						<input type="text" name="nickname" placeholder="닉네임" required >
						<input type="password" id="pwd" name="pwd" placeholder="비밀번호" onchange="check_pw()" required>
						<input type="password" id="pwd_check" name="pwd_check" placeholder="비밀번호 확인" onchange="check_pw()" required>
						<input type="number" name="phone" placeholder="휴대폰번호">
						<button>회원가입</button>
						<p class="message">
							즐거운 공유공간 '피자'
						</p>
					</form>
				</div>
			</div>
		</div>
	</section>

	<script>
		function  check_pw(){

			if(document.getElementById('pwd').value == document.getElementById('pwd_check').value){
				document.getElementById('pwd').style.color = 'green';
				document.getElementById('pwd_check').style.color = 'green';
			} else{
				document.getElementById('pwd').style.color = 'green';
				document.getElementById('pwd_check').style.color = 'red';;
			}

		}
	</script>


</body>
</html>