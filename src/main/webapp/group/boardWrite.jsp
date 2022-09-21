<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 쓰기</title>
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
					<h3>게시글 쓰기</h3>
				</div>
			</div>

			<table class="table">
			<tr>
			<th>OTT</th>
				<td><select style="width:100%; border: 0;">
						<option value="netflix" selected>Netflix</option>
						<option value="youtube">Youtube</option>
						<option value="disney">Disney+</option>
						<option value="watch">Wacha</option>
						<option value="tving">tving</option>
						<option value="wavve">wavve</option>
				</select></td>
						<th style=" width:190px;">비밀번호</th>
						<td><input type="password" name="text" style="width: 99%;height: 100%;border: 0;"></td>
				</tr>

				<tr>
					<th>닉네임</th>
					<td><input type="text" name="text" style="width: 99%;height: 100%;border: 0;"></td>
					<th>제목</th>
					<td><input type="text" name="text" style="width: 99%;height: 100%;border: 0;"></td>
				</tr>
				
				<tr>
					<th>내용</th>
					<td colspan="3"><textarea name="content" rows="10" style="width:98%; height:98%; border: 0; resize: none;"></textarea></td>
				</tr>
				
				<tr>
				<th>기간</th>
					<td><input type="text" name="text" style="width: 50%;height: 98%;border: 0;">개월</td>
					<th>모집인원</th>
					<td><input type="text" name="text" style="width: 30%;height: 100%;border: 0;">/
					<input type="text" name="text" style="width: 30%;height: 100%;border: 0;">명
				</tr>
			</table>
                </section>
                <br> <img src="등록.png" style="margin-left: 80px;"> 
						<img src="목록.png" style="margin-left: 80px;" onclick="location.href='list.do'">
                </div>
                </body>
                </html>