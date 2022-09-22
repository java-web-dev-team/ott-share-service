<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>메인</title>
    <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
</head>
<body>

<header style="height: 150px">
    <%@ include file="/common/header.jsp" %>
</header>


<table>
    <div class="screen">
        <div style="text-align: center; margin-top: 100px;">
            <img src="${pageContext.request.contextPath}/img/member/notice.png"> <br>
            <img src="${pageContext.request.contextPath}/img/member/iphone.png">
            <div style="position: absolute;">
                <div style="position: relative; top:-225px;left:262px;">
                    <a href='board/list.do'><img src="${pageContext.request.contextPath}/img/member/recruit.png"></a>
                </div>
            </div>
            <div style="position: absolute;">
                <div style="position: relative; top:-225px;left:550px;">
                    <img src="${pageContext.request.contextPath}/img/member/join.png">
                </div>
            </div>
        </div>
    </div>
</table>

</body>
</html>

