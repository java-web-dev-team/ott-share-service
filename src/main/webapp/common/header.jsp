<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: macbookpro
  Date: 2022/09/21
  Time: 7:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<div class="screen">
    <a href='${pageContext.request.contextPath}/index.do'> <img src="${pageContext.request.contextPath}/resources/img/pizza.png"
                              style="margin-right: 150px; margin-left: 70px; width: 185px;"></a>
    <ul class="menu" style="display: inline-table;">
        <c:if test="${sessionScope.member == null}">
            <li id="그룹모집"><a href='${pageContext.request.contextPath}/member/login.do'>로그인</a></li>
        </c:if>
        <c:if test="${sessionScope.member != null}">
            <li id="로그아웃"><a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a></li>
        </c:if>

        <c:if test="${sessionScope.member == null}">
            <li id="나의피자"><a href="${pageContext.request.contextPath}/member/login.do">나의 피자</a></li>
        </c:if>
        <c:if test="${sessionScope.member != null}">
            <li id="나의피자"><a href="${pageContext.request.contextPath}/member/mypage.do">나의 피자</a></li>
        </c:if>

        <li id="꿀잼추천"><a href="${pageContext.request.contextPath}/article/list.do">꿀잼 추천</a></li>
        <li id="그룹찾기"><a href="${pageContext.request.contextPath}/group/list.do">그룹 찾기</a></li>

        <c:if test="${sessionScope.member == null}">
            <li id="그룹모집"><a href='${pageContext.request.contextPath}/member/login.do'>그룹 모집</a></li>
        </c:if>
        <c:if test="${sessionScope.member != null}">
            <li id="그룹모집"><a href='${pageContext.request.contextPath}/group/recruit.do'>그룹 모집</a></li>
        </c:if>
    </ul>
</div>
<hr>
