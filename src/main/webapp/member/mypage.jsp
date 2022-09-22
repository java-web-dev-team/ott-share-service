<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
    <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
</head>
<body>

<header style="height: 150px">
    <%@ include file="/common/header.jsp" %>
</header>

            <script src="/docs/5.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
            <script src="sidebars.js"></script>
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
                         ${group.groupName}
                            </c:forEach>
                        </div>
                        
                        </div>
  
  </body>
  </html>