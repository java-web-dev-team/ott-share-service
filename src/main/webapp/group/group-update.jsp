<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
						<h3>그룹수정</h3>
					</div>
				</div>
				<div id="wrap" align="center">
					<form name="form" method="post" action="update.do">
						<table class="table">
							<th>OTT
							<td>
								<select name="ottId" style="border: 0;">
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
								<td>
									<input type="text" size="68" name="groupName" value="${sessionScope.group.groupName}"
									style="border: 0;">
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td>
									<textarea cols="70" rows="15" name="content" style="border: 0;">${sessionScope.group.content}</textarea>
								</td>
							</tr>
							<tr>
								<th>기간</th>
								<td><input type="text" name="period" size="1" value="${sessionScope.group.period}"
								style="border: 0; width: 40px;">개월</td>
							</tr>
						</table>
						<br>
						<button type="submit" style="border-radius: 20px; background: white; width: 70px;">수정</button>
						<button style="border-radius: 20px; background: white; width: 70px;"><a href="/group/list.do">취소</a></button>
					</form>
				</div>
			</section>
		</div>
	</div>

</body>
</html>
