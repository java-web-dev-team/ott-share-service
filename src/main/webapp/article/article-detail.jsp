<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세 페이지</title>
	<link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
</head>
<body>

<header style="height: 150px">
	<%@ include file="/common/header.jsp"%>
</header>

<div class="screen">
	<div id="section">
		<section class="notice" style="padding-top: 40px;">
			<div class="page-title">
				<div class="container">
					<h3>게시글 상세보기</h3>
				</div>
			</div>

			<div id="wrap" align="center">
			<table class="table">
				<tr>
					<th>OTT</th>
					<c:if test="${article.ottId == 1}">
						<td>넷플릭스</td>
					</c:if>
					<c:if test="${article.ottId == 2}">
						<td>왓챠</td>
					</c:if>
					<c:if test="${article.ottId == 3}">
						<td>유튜브</td>
					</c:if>
					<c:if test="${article.ottId == 4}">
						<td>티빙</td>
					</c:if>
					<c:if test="${article.ottId == 5}">
						<td>웨이브</td>
					</c:if>
					<c:if test="${article.ottId == 6}">
						<td>디즈니플러스</td>
					</c:if>
					<c:if test="${article.ottId == 7}">
						<td>아마존플러스</td>
					</c:if>
				</tr>
			<tr>
				<th>제목</th>
				<td>${article.title}</td>
			</tr>
				<tr>
					<th>작성일</th>
					<td>${article.createdDate}</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td colspan="3">${nickname}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3"><pre>${article.content}</pre></td>
				</tr>
			</table>
				<c:if test="${sessionScope.member.nickname == nickname}">
				<form action="/article/update.do" method="get">
					<button type="submit" style="border-radius: 20px; background: white; margin-top: 20px;">게시물 수정
					</button>
				</form>
				<form action="/article/delete.do" method="post">
					<button type="submit" style="border-radius: 20px; background: white; margin-top: 20px;">게시물 삭제
					</button>
				</form>
				</c:if>

		</section>
	</div>
</div>
</body>
</html>

