<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 리스트</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

	<header>
        <%@include file="/common/header.jsp"%>
	</header>
    <div>
        <div class="card">
              <style>
                  .card {
                      width: 40%;
                      margin:auto;
                      text-align: center;
                  }
              </style>
                          <h5 class="card-header">회원 정보</h5>
                          <div class="card-body">
                            <h5 class="card-title">개인 정보</h5>
                              <p class="card-text">id : ${sessionScope.member.memberId}</p>
                              <p class="card-text1">닉네임 : ${sessionScope.member.nickname}</p>
                              <p class="card-text2">휴대폰 : ${sessionScope.member.phone}</p>
                              <a href="update.do" class="btn btn-primary">개인 정보 수정</a>
                              <br>
                              <a href="memberDelete.do" class="btn btn-primary">회원 탈퇴</a>

                          </div>
                        </div>
                        <div class="card" style="margin-top: 1%;">
                          <div class="card-header">
                              <style>
                                  li {
                                      text-align: left;
                                  }
                              </style>
                              내가 쓴 게시물
                          </div>
                            <c:forEach var="group" items="${myGroup}">
                                <a href="/group/detail.do?groupName=${group.groupName}">${group.groupName}</a>
                            </c:forEach>
                        </div>
                        
                        </div>
  
  </body>
  </html>