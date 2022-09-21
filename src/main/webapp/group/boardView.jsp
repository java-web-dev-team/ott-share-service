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

#screen2 {
	width: 1200px;
	margin: 0 auto;
}

#section {
	width: 1200px;
	height: auto;
	text-align: center;
	margin: 0 auto;
}

table {
	height:400px;
	border-radius: 20px;
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

.board-table {
	font-size: 13px;
	width: 100%;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

/* reset */
.clearfix:after {
	content: '';
	display: block;
	clear: both;
}

.container {
	width: 900px;
	margin: 0 auto;
}

.blind {
	position: absolute;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	margin: -1px;
	width: 1px;
	height: 1px;
}

table td, th {
	border: #d3d3d3 solid 1px; /* 경계선 색상 스타일 굵기 */
	padding: 5px; /* 안쪽 여백 */
}

.table {
	font-size: 18px;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	padding: 15px;
	width: 100%;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0
      rgba(0, 0, 0, 0.24);
}
</style>
</head>
<body>

	<header>
		<div class="screen">
			<a href='home.do'> <img src="../img/board/pizza.png"
				style="margin-right: 150px; margin-left: 70px; width: 185px;"></a>
			<ul class="menu" style="display: inline-table;">
				<li id="로그아웃"><a href="logout.do">로그아웃</a></li>
				<li id="나의피자"><a href="#">나의 피자</a></li>
				<li id="꿀잼추천"><a href="#">꿀잼 추천</a></li>
				<li id="그룹찾기"><a href="#">그룹 찾기</a></li>
				<li id="그룹모집"><a href='../board/list.do'>그룹 모집</a></li>
			</ul>
		</div>
		<hr>
	</header>

	<div id="section">
		<section class="notice">
			<div class="page-title">
				<div class="container">
					<h3>게시글 상세보기</h3>
				</div>
			</div>

			<table class="table">
				<tr>
					<th>OTT명</th>
					<td>${board.ott}</td>
					<th style=" width:190px;">닉네임</th>
					<td>${board.nickname}</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td><fmt:formatDate value="${board.writedate}" /></td>
					<th>모집여부</th>	<!-- 모집여부 모집중/모집마감-->
				<td>${board.state}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3">${board.title}</td>
				</tr>
				<tr>
					<th style="height:250px; width:190px;">내용</th> <!-- 이용기간 -->
					<td colspan="3"><pre>${board.content}</pre></td>
				</tr>
				<tr>
					<th>기간</th>  <!-- 이용기간  1~12개월-->
					<td>${board.period}</td>
				</tr>
			</table>
		</section>
		<img src="사람.jpg" style="width: 80px; margin:auto 0;">
		<img src="수정.png" style="margin-left: 200px;"> 
		<img src="삭제.png" style="margin-left: 80px;"> 
		<img src="참여하기.png" style="margin-left: 80px;">
			<!-- 게시글 수정/삭제를 위해 본인 확인이 필요하고, 이를 팝업창을 띄워서 하고 있음
			2. Ajax(javascript/jQuery)를 이용해서 서버와 통신하여 비밀번호 확인을 할 수 있음.-->
			
	</div>
</body>
</html>