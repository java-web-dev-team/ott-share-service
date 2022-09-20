<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-09-20
  Time: 오후 1:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>게시글 리스트</title>
  <link rel="stylesheet" type="text/css" href="../css/board.css">
  <link href="css/bootstrap.min.css" rel="stylesheet">
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
    <p class="card-text">Email : aaaa@naver.com</p>
    <p class="card-text">닉네임 : 나 홍길동</p>
    <a href="#" class="btn btn-primary">개인 정보 수정</a>
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
  <ul class="list-group list-group-flush">
    <li class="list-group-item"><a href="view.html">넷플릭스 구합니다.</a></li>
    <li class="list-group-item"><a href="view.html">왓챠 6개월 구합니다.</a></li>
    <li class="list-group-item"><a href="view.html">디즈니 같이하실분 구합니다.</a></li>
  </ul>
</div>
</div>

</body>
</html>
