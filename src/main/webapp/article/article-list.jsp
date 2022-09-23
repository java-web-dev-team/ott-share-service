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
	<link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
</head>

<body>

	<header style="height: 150px">
		<%@ include file="/common/header.jsp"%>
	</header>
	<div id="screen2">


		<div id="section">
			<section class="notice">
				<div class="page-title">
					<div class="container">
						<h3>꿀잼 목록</h3>
						<a href="/article/post.do"><img src="button.png" style="float: right;"></a>
					</div>
				</div>


				<!-- article list area -->
				<div id="board-list">
					<div class="container">
						<table class="board-table">
							<thead>
								<th>OTT</th>
								<th>제목</th>
								<th>글쓴이</th>
								<th>작성일</th>
							</thead>
							<tbody>
								<c:forEach var="article" items="${articles}" varStatus="status">
									<tr>
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
										<td><a href="/article/detail.do?title=${article.title}">${article.title}</a></td>
										<td>${nicknames[status.index]}</td>
										<td>${article.createdDate}</td>
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