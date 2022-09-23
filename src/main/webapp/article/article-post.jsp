<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
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
						<h3>꿀잼 추천하기</h3>
					</div>
				</div>
				<div id="wrap" align="center">
					<form name="form" method="post" action="/article/post.do">
						<table class="table">
							<th>OTT
							<td>
								<select name="ottId">
									<option value="1" selected>Netflix</option>
									<option value="2">Watcha</option>
									<option value="3">Youtube</option>
									<option value="4">Tving</option>
									<option value="5">Wavve</option>
									<option value="6">Disney+</option>
									<option value="7">Amazon+</option>
								</select>
							</td>

							<tr>
								<th>제목</th>
								<td><input type="text" size="68" name="title" required></td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea cols="70" rows="15" name="content" required></textarea></td>
							</tr>
						</table>
						<br>
						<button type="submit">등록</button>
						<button><a href="/article/list.do">취소</a></button>
					</form>
				</div>
			</section>
		</div>
	</div>

</body>
</html>
