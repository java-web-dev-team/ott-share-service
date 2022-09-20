<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="dto.GroupDto" %>
<%@ page import="dao.GroupDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
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
	height:auto;
	text-align: center;
	margin: 0 auto;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

section.notice {
	margin :0 auto;
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

#board-search .search-window {
	padding: 15px 0;
	}

#board-search .search-window .search-wrap {
	position: relative;
	/*   padding-right: 124px; */
	margin: 0 auto;
	width: 80%;
	max-width: 564px;
}

#board-search .search-window .search-wrap input {
	height: 40px;
	width: 100%;
	font-size: 14px;
	padding: 7px 14px;
	border: 1px solid #ccc;
}

#board-search .search-window .search-wrap input:focus {
	border-color: #333;
	outline: 0;
	border-width: 1px;
}

#board-search .search-window .search-wrap .btn {
	position: absolute;
	right: 0;
	top: 0;
	bottom: 0;
	width: 108px;
	padding: 0;
	font-size: 16px;
}

.board-table {
	font-size: 13px;
	width: 100%;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

.board-table a {
	color: #333;
	display: inline-block;
	line-height: 1.4;
	word-break: break-all;
	vertical-align: middle;
}

.board-table a:hover {
	text-decoration: underline;
}

.board-table th {
	text-align: center;
}

.board-table .th-ott {
	width: 130px;
	text-align: center;
}

.board-table .th-date {
	width: 100px;
	text-align: center;
}

.board-table .th-group {
	text-align: center;
}

.board-table th, .board-table td {
	padding: 14px 0;
}

.board-table tbody td {
	border-top: 1px solid #e7e7e7;
	text-align: center;
}

.board-table tbody th {
	padding-left: 28px;
	padding-right: 14px;
	border-top: 1px solid #e7e7e7;
	text-align: left;
}

.board-table tbody th p {
	display: none;
}

.btn {
	display: inline-block;
	padding: 0 30px;
	font-size: 15px;
	font-weight: 400;
	background: transparent;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	-ms-touch-action: manipulation;
	touch-action: manipulation;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	border: 1px solid transparent;
	text-transform: uppercase;
	-webkit-border-radius: 0;
	-moz-border-radius: 0;
	border-radius: 0;
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	-ms-transition: all 0.3s;
	-o-transition: all 0.3s;
	transition: all 0.3s;
}

.btn-dark {
	background: #555;
	color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
	background: #373737;
	border-color: #373737;
	color: #fff;
}

.btn-dark {
	background: #555;
	color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
	background: #373737;
	border-color: #373737;
	color: #fff;
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
</style>
</head>
<body>

	<header>
		<div class="screen">
			<a href='home.do'> <img src="pizza.png"
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
	<div id="screen2">


		<div id="section">
			<section class="notice">
				<div class="page-title">
					<div class="container">
						<h3>그룹모집</h3>
						<a href="write.do"><img src="button.png" style="float: right;"></a>
					</div>
				</div>


				<!-- board list area -->
				<div id="board-list">
					<div class="container">
						<table class="board-table">
							<thead>
								<th>OTT</th>
								<th>그룹 이름</th>
								<th>이용기간</th>
								<th>모집여부</th>
							</thead>
							<tbody>
								<c:forEach var="group" items="${groups}">
									<tr>
										<c:if test="${group.ottId == 1}">
											<td>넷플릭스</td>
										</c:if>
										<c:if test="${group.ottId == 2}">
											<td>왓챠</td>
										</c:if>
										<c:if test="${group.ottId == 3}">
											<td>유튜브</td>
										</c:if>
										<c:if test="${group.ottId == 4}">
											<td>티빙</td>
										</c:if>
										<c:if test="${group.ottId == 5}">
											<td>웨이브</td>
										</c:if>
										<c:if test="${group.ottId == 6}">
											<td>디즈니플러스</td>
										</c:if>
										<c:if test="${group.ottId == 7}">
											<td>아마존플러스</td>
										</c:if>
										<td>${group.groupName}</td>
										<td>${group.period}개월</td>
										<c:if test="${group.memberCount < 4}">
											<td>모집중</td>
										</c:if>
										<c:if test="${group.memberCount >= 4}">
											<td>마감</td>
										</c:if>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<!-- board seach area -->
				<div id="board-search">
					<div class="container">
						<div class="search-window">
							<form action="">
								<div class="search-wrap">
									<label for="search" class="blind">공지사항 내용 검색</label> <input
										id="search" type="search" name="" placeholder="검색어를 입력해주세요."
										value="">
									<button type="submit" class="btn btn-dark">검색</button>
								</div>
							</form>
						</div>
					</div>
				</div>

			
			<td colspan=i><a href="#"><img src="화살표2.png"
					style="border: 1px"></a> <a href="#"><img src="1.png"
					style="border: 1px"></a> <a href="#"><img src="2.png"
					style="border: 1px"></a> <a href="#"><img src="3.png"
					style="border: 1px"></a> <a href="#"><img src="4.png"
					style="border: 1px"></a> <a href="#"><img src="5.png"
					style="border: 1px"></a> <a href="#"><img src="화살표.png"
					style="border: 1px"></a></td>
			</section>
	
		</div>
	</div>
</body>
</html>