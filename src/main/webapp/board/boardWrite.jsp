<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 리스트</title>
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

section.notice {
	margin: 0 auto;
	padding: 80px;
}

.page-title {
	margin-bottom: 60px;
}

.page-title h3 {
	font-size: 28px;
	color: #333333;
	font-weight: 400;
	text-align: center;
}

#screen2 {
	width: 1200px;
	margin: 0 auto;
}

#section {
	width: 1200px;
	text-align: center;
	margin: 0 auto;
}

.table {
	font-size: 15px;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	padding: 15px;
	width: 100%;
}
</style>
</head>
<body>

	<header style="height: 150px">
		<div class="screen">
			<a href='home.do'> <img src="pizza.png"
				style="margin-right: 150px; margin-left: 70px; width: 185px;"></a>
			<ul class="menu" style="display: inline-table;">
				<li id="로그아웃" onclick="location.href='logout.do'"><a href="#">로그아웃</a></li>
				<li id="나의피자"><a href="#">나의 피자</a></li>
				<li id="꿀잼추천"><a href="#">꿀잼 추천</a></li>
				<li id="그룹찾기"><a href="#">그룹 찾기</a></li>
				<li id="그룹모집"><a href='../board/list.do'>그룹 모집</a></li>
			</ul>
		</div>
		<hr>
	</header>

	<div id="screen2">

		<div id="section">
			<section class="notice">
				<div class="page-title">
					<div class="container">
						<h3>그룹모집</h3>
					</div>
				</div>
				<div id="wrap" align="center">
					<form name="frm" method="post" action="write.do">
						<table class="table">
							<th>OTT
							<td><select>
									<option value="netflix" selected>Netflix</option>
									<option value="youtube">Youtube</option>
									<option value="disney">Disney+</option>
									<option value="watch">Wacha</option>
									<option value="tving">tving</option>
									<option value="wavve">wavve</option>
							</select></td>
							</th>

							<tr>
								<th>비밀번호</th>
								<td><input type="password" name="pass" required></td>
							</tr>
							<tr>
								<th>닉네임</th>
								<td><input type="text" name="nickname" required></td>
							</tr>
							<tr>
								<th>제목</th>
								<td><input type="text" size="68" name="title" required>
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea cols="70" rows="15" name="content" required></textarea></td>
							</tr>
							<tr>
								<th>기간</th>
								<td><input type="text" name="jdate" size="1" required>개월</td>
							</tr>
							<tr>
								<th>모집인원</th>
								<td><input type="text" size="1" name="person" required>/<input
									type="text" size="1" name="person" required>명
							</tr>
						</table>
						<br> <img src="등록하기.png"> 
						<img src="다시쓰기.png">
						 <img src="목록.png" onclick="location.href='list.do'">
					</form>
				</div>
			</section>
		</div>
	</div>

</body>
</html>
