<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
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
	text-shadow: 1px 1px 0 #cccccc; /* 텍스트 그림자 */
}

/* 메뉴 링크 위로 마우스 오버했을 때의 스타일 */
.menu li:hover {
	background-color: #333333; /* 배경색 */
}

/* 메뉴 링크 위로 마우스 오버한 후 링크 스타일 */
.menu li:hover>a {
	color: #FFF; /* 글자색 */
	text-shadow: 0 1px 0 #fff; /* 텍스트 그림자 */
}

.ott :hover {
transform: scale(2.2);
}

.down{
display: inline-block;
margin: 0 0.5rem;

animation : bounce;
animation-duration : 2s;
}


</style>
</head>
<body>

	<header style="height: 150px">
		<%@ include file="/common/header.jsp"%>
	</header>


	<section class="section1">
		<div class="screen">
			<div style="text-align: center; margin-top:100px;">
			<div class="ott">
<%--				넷플릭스 - value = 1--%>
				<c:if test="${sessionScope.member == null}">
					<a href="${pageContext.request.contextPath}/member/login.do"><img src="${pageContext.request.contextPath}/resources/img/netflix.png" style="margin: 50px" value = "1"></a>
				</c:if>
				<c:if test="${sessionScope.member != null}">
					<a href="${pageContext.request.contextPath}/main/select-service.do"><img src="${pageContext.request.contextPath}/resources/img/netflix.png" style="margin: 50px" value="1"></a>
				</c:if>

	<%--				왓챠 - value = 2--%>
				<c:if test="${sessionScope.member == null}">
					<a href="${pageContext.request.contextPath}/member/login.do"><img src="${pageContext.request.contextPath}/resources/img/wacha.png" style="margin: 50px" value="2"></a>
				</c:if>
				<c:if test="${sessionScope.member != null}">
					<a href="${pageContext.request.contextPath}/main/select-service.do"><img src="${pageContext.request.contextPath}/resources/img/wacha.png" style="margin: 50px" value="2"></a>
				</c:if>

<%--				유튜브 - value = 3--%>
				<c:if test="${sessionScope.member == null}">
					<a href="${pageContext.request.contextPath}/member/login.do"><img src="${pageContext.request.contextPath}/resources/img/youtube.png" style="margin: 50px" value="3"></a>
				</c:if>
				<c:if test="${sessionScope.member != null}">
					<a href="${pageContext.request.contextPath}/main/select-service.do"><img src="${pageContext.request.contextPath}/resources/img/youtube.png" style="margin: 50px" value="3"></a>
				</c:if>
				<br>

<%--				티빙 = value = 4--%>
				<c:if test="${sessionScope.member == null}">
					<a href="${pageContext.request.contextPath}/member/login.do"><img src="${pageContext.request.contextPath}/resources/img/tiving.png" style="margin: 50px" value="4"></a>
				</c:if>
				<c:if test="${sessionScope.member != null}">
					<a href="${pageContext.request.contextPath}/main/select-service.do"><img src="${pageContext.request.contextPath}/resources/img/tiving.png" style="margin: 50px" value="4"></a>
				</c:if>

<%--				웨이브 = value = 5--%>
				<c:if test="${sessionScope.member == null}">
					<a href="${pageContext.request.contextPath}/member/login.do"><img src="${pageContext.request.contextPath}/resources/img/wave.png" style="margin: 50px" value="5"></a>
				</c:if>
				<c:if test="${sessionScope.member != null}">
					<a href="${pageContext.request.contextPath}/main/select-service.do"><img src="${pageContext.request.contextPath}/resources/img/wave.png" style="margin: 50px" value="5"></a>
				</c:if>

<%--				디즈니 - value = 6--%>
				<c:if test="${sessionScope.member == null}">
					<a href="${pageContext.request.contextPath}/member/login.do"><img src="${pageContext.request.contextPath}/resources/img/disney.png" style="margin: 50px" value="6"></a>
				</c:if>
				<c:if test="${sessionScope.member != null}">
					<a href="${pageContext.request.contextPath}/main/select-service.do"><img src="${pageContext.request.contextPath}/resources/img/disney.png" style="margin: 50px" value="6"></a>
				</c:if>

<%--				아마존 - value = 7--%>
				<c:if test="${sessionScope.member == null}">
					<a href="${pageContext.request.contextPath}/member/login.do"><img src="${pageContext.request.contextPath}/resources/img/amazon.png" style="margin: 50px" value="7"></a>
				</c:if>
				<c:if test="${sessionScope.member != null}">
					<a href="${pageContext.request.contextPath}/main/select-service.do"><img src="${pageContext.request.contextPath}/resources/img/amazon.png" style="margin: 50px" value="7"></a>
				</c:if>
			</div>
					<img src="notice1.png">
				</div>
		</div>
		</section>

	</body>
</html>