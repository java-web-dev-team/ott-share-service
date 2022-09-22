<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 폼</title>
    <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet">
</head>
<body>

<header style="height: 150px">
    <%@ include file="/common/header.jsp" %>
</header>

<section>

    <div class="screen">

        <div class="login-page">
            <div class="form">

                <!-- 메시지 출력 -->
                <div id=“msg”>
                    <c:if test="${not empty msg}">
                        <i class="fa fa-exclamation-circle"> ${URLDecoder.decode(msg)}</i>
                    </c:if>
                </div>

                <form class="login-form" action="login.do" method="post" name="frm" onsubmit="return loginCheck()">
                    <input type="text" name="memberId" placeholder="아이디" value="${cookie.userid.value}" autofocus/>
                    <input type="password" name="password" placeholder="비밀번호"/>
                    <div class="check" style="float: right;">
                        <input type="checkbox" name="rememberId" value="on"
                               style="margin: 0 auto; width: 30px;" ${empty cookie.userid.value ? "":"checked"}>
                        <p style="display: inline; position: relative; top: -2px; font-size:12px;">아이디 기억하기</p>
                    </div>

                    <button>login</button>
                    <p class="message">
                        Not registered? <a href="register.do">Create an account</a>
                    </p>

                </form>
            </div>
        </div>
    </div>
</section>

</body>
</html>