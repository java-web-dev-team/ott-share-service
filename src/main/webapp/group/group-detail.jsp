<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
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
					<h3>그룹 상세</h3>
				</div>
			</div>

			<div id="wrap" align="center">
			<table class="table" style="font-size: 16px;">
					<th>OTT명</th>
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

				<tr>
					<th>작성일</th>
					<td>${group.createdDate}</td>
				</tr>
				<tr>
					<th>그룹명</th>
					<td colspan="3">${group.groupName}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3"><pre>${group.content}</pre></td>
				</tr>
					<th>그룹 참여자</th>
					<td colspan="3">
						<c:forEach var="nickname" items="${nicknames}">
						<p>${nickname}</p>
					</c:forEach>
						<form action="detail.do" method="post">
							<c:if test="${group.memberCount < 4}">
							<button type="submit" style="border-radius: 20px; background: white; width: 70px; height:30px;">참여</button>
							</c:if>
							<c:if test="${group.memberCount >= 4}">
							<button>모집마감</button>
							</c:if></form>
					</td>
			</table>
				<c:forEach var="nickname" items="${nicknames}">
					<c:if test="${sessionScope.member.nickname == nickname}">
						<form action="update.do" method="get">
							<button type="submit" style="border-radius: 20px; background: white; margin-top: 20px;">게시물 수정
							</button>
							<button type="submit" style="border-radius: 20px; background: white; margin-top: 20px;">게시물 삭제
							</button>
						</form>
					</c:if>
				</c:forEach>
			</div>
		</section>
	</div>
	</div>
</body>
</html>

