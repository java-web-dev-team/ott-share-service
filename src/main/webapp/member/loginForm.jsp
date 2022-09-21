<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>
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

.login-page {
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

#“msg” {
	height: auto;
	text-align : center;
	font-size: 16px;
	color: red;
}

</style>


</head>
<body>
<header style="height: 150px">
	<%@ include file="/common/header.jsp"%>
</header>

	<section>

		<div class="screen">

			<div class="login-page">
				<div class="form">

					<!-- 메시지 출력 -->
					<div id=“msg”>
						<c:if test="${not empty msg}">
							<i class="fa fa-exclamation-circle"> ${URLDecoder.decode(msg)}</i>
						</c:if>
					</div>

					<form class="login-form" action="login.do" method="post" name="frm" onsubmit="return loginCheck()">
						<input type="text" name="memberId" placeholder="아이디"	value="${cookie.userid.value}" autofocus />
						<input type="password" name="password" placeholder="비밀번호" />
						<div class="check" style="float: right;">
							<input type="checkbox" name="rememberId" value="on" style="margin: 0 auto; width: 30px;" ${empty cookie.userid.value ? "":"checked"}>
							<p style="display: inline; position: relative; top: -2px; font-size:12px;">아이디 기억하기</p>
						</div>

						<button>login</button>
						<p class="message">
							Not registered? <a href="register.do">Create an account</a>
						</p>

					</form>
				</div>
			</div>
		</div>
	</section>

	</body>
</html>