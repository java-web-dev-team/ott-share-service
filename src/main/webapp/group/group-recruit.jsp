<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그룹 모집</title>
	<link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
</head>
<body>

<header style="height: 150px">
	<%@ include file="/common/header.jsp"%>
</header>

	<div id="screen">
		<div id="section">
			<section class="notice" style="padding-bottom: 5px; padding-top: 40px;">
				<div class="page-title">
					<div class="container">
						<h3>게시글 쓰기</h3>
					</div>
				</div>
				<div id="wrap" align="center">
					<form name="form" method="post" action="/group/recruit.do">
						<table class="table">
							<th>OTT</th>
							<td><select style="width: 100%; border: 0;" name="ottId">
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
								<th>그룹명</th>
								<td><input type="text" name="groupName" style="width: 99%; height: 100%; border: 0;" required></td>
							</tr>
							<tr>
								<th>내용</th>
								<td colspan="3"><textarea rows="15" name="content" style="width:98%; height:90%; border: 0; resize: none;" required></textarea></td>
							</tr>
							<tr>
								<th>기간</th>
								<td><input type="text" name="period" style="width: 5%;height: 98%;border: 0;" required>개월</td>
							</tr>
						</table>
					</form>
				</div>
			</section>
			<br>
			<img src="${pageContext.request.contextPath}/img/group/등록.png" style="margin-left: 80px;">
			<img src="${pageContext.request.contextPath}/img/group/목록.png" style="margin-left: 80px;" onclick="location.href='list.do'">
		</div>
	</div>
</body>
</html>

