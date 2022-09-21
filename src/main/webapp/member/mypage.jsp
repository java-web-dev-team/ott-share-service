<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 리스트</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/board.css">
</head>
<body>

	<header>
		<div class="screen">
			<a href='home.do'> <img src="pizza.png"
				style="margin-right: 150px; margin-left: 70px; width: 185px;"></a>
			<ul class="menu" style="display: inline-table;">
				<li id="로그아웃"><a href="logout.do">로그아웃</a></li>
				<li id="나의피자"><a href="#">나의 피자</a></li>
				<li id="꿀잼추천"><a href="#">꿀잼 추천</a></li>
				<li id="그룹찾기"><a href="#">그룹 찾기</a></li>
				<li id="그룹모집"><a href='../board/list.do'>그룹 모집</a></li>
                <li id="home"><a href="/index.do">home</a></li>
			</ul>
		</div>
		<hr>
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