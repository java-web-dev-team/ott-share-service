<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 폼</title>
    <script type="text/javascript" src="../js/member.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/login.css">
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
    <div class="screen">
        <a href="/index.do"> <img src="../img/member/pizza.png"
                                style="margin-right: 150px; margin-left: 70px; width: 185px;"></a>
        <ul class="menu" style="display: inline-table;">
            <li id="로그아웃" onclick="location.href='logout.do'"><a href="#">로그아웃</a></li>
            <li id="나의피자"><a href="#">나의 피자</a></li>
            <li id="꿀잼추천"><a href="#">꿀잼 추천</a></li>
            <li id="그룹찾기"><a href="#">그룹 찾기</a></li>
            <li id="그룹모집"><a href="../board/list.do">그룹 모집</a></li>
        </ul>
    </div>
    <hr>
</header>

<div class="screen">
    <div class="card">

        <div class="card-header">

            <h5 class="card-title" style="font-size: 20px">개인 정보 수정</h5>
            <hr>
        </div>
        <div class="card-body" style="margin: 10px;">

        <form class="update-form" action="update.do" method="POST" name="frm">

            <div class="id" style="margin-bottom: 15px;">아이디 : ${sessionScope.member.memberId}</div>

            <div class="nickname" style="margin-bottom: 15px;">
                닉네임 : <input type="text" name="nickname" style="border-radius: 15px; height: 25px;"
                                placeholder="변경할 닉네임">
            </div>
            <div class="password" style="margin-bottom: 15px;">
                <label for="inputPassword2" class="visually-hidden">비밀번호 변경 :</label>
                <input type="password" name="password" id="inputPassword1"
                       style="border-radius: 15px; height: 25px;" placeholder="비밀번호 변경">
            </div>
            <div class="password" style="margin-bottom: 15px;">
                <label for="inputPassword2" class="visually-hidden">비밀번호 확인 :</label>
                <input type="password" name="password" id="inputPassword2"
                       style="border-radius: 15px; height: 25px;" placeholder="비밀번호 확인">
            </div>
            <div class="phone" style="margin-bottom: 15px;">
                기존 휴대폰 : <input type="phone" name="phone" style="border-radius: 15px; height: 25px;"
                                placeholder="변경할 휴대폰 번호">
            </div>
            <div class="button">
                    <button type="submit" class="button"
                            style="margin-top: 15px; border-radius: 10px;">변경하기</button>
            </div>
        </form>

    </div>
</div>
</div>
</body>

</html>

