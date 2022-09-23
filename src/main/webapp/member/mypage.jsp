<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
    <script type="text/javascript" src="../js/member.js"></script>
    <link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet">
    <style>
        .card {
            width: 60%;
            margin: 3% auto;
            padding: 20px;
            text-align: center;
            border: solid 1px;
            border-radius: 20px;
            text-align: center;
        }
    </style>
</head>
<body>

<header style="height: 150px">
    <%@ include file="/common/header.jsp" %>
</header>

    <div class="screen">
            <div class="card" style="margin-top: 5%; width: 400px;">
                          <h5 class="card-header">회원 정보</h5>
                <hr>
                          <div class="card-body">
                              <p class="card-text">아이디 : ${sessionScope.member.memberId}</p>
                              <p class="card-text1">닉네임 : ${sessionScope.member.nickname}</p>
                              <p class="card-text2">휴대폰 : ${sessionScope.member.phone}</p>
                              <a href="update.do" class="btn btn-primary">
                                  <button style="border-radius: 20px; background: white">개인 정보 수정</button></a>
                              <a href="memberDelete.do" class="btn btn-primary">
                                  <button style="border-radius: 20px; background: white">
                                      회원 탈퇴</button></a>

                          </div>
                        </div>
                        <div class="card" style="margin-top: 1%; width: 400px;">
                          <div class="card-header">
                             <h5 class="card-header">내가 가입한 그룹</h5>
                              <hr>
                          </div>
                            <p style="margin: 50px; font-size: 14px;"><c:forEach var="group" items="${myGroup}">
                         ${group.groupName}
                            </c:forEach></p>
                        </div>
    </div>
</body>
</html>
