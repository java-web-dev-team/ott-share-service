<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 폼</title>
    <script type="text/javascript" src="../resources/js/member.js"></script>
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
    <%@ include file="/common/header.jsp"%>
</header>

<div class="screen">
    <div class="card" style="width: 400px;">

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

