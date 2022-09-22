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


<section class="section1">
    <div class="screen">
        <div style="text-align: center; margin-top:100px;">
            <div class="ott">
                <%--				넷플릭스 - value = 1--%>
                <c:if test="${sessionScope.member == null}">
                    <a href="/member/login.do"><img src="${pageContext.request.contextPath}/img/member/netflix.png" style="margin: 50px" value="1"></a>
                </c:if>
                <c:if test="${sessionScope.member != null}">
                    <a href="/main/select-service.do"><img src="${pageContext.request.contextPath}/img/member/netflix.png" style="margin: 50px" value="1"></a>
                </c:if>

                <%--				왓챠 - value = 2--%>
                <c:if test="${sessionScope.member == null}">
                    <a href="/member/login.do"><img src="${pageContext.request.contextPath}/img/member/wacha.png" style="margin: 50px" value="2"></a>
                </c:if>
                <c:if test="${sessionScope.member != null}">
                    <a href="/main/select-service.do"><img src="${pageContext.request.contextPath}/img/member/wacha.png" style="margin: 50px"
                                                           value="2"></a>
                </c:if>

                <%--				유튜브 - value = 3--%>
                <c:if test="${sessionScope.member == null}">
                    <a href="/member/login.do"><img src="${pageContext.request.contextPath}/img/member/youtube.png" style="margin: 50px" value="3"></a>
                </c:if>
                <c:if test="${sessionScope.member != null}">
                    <a href="/main/select-service.do"><img src="${pageContext.request.contextPath}/img/member/youtube.png" style="margin: 50px" value="3"></a>
                </c:if>
                <br>

                <%--				티빙 = value = 4--%>
                <c:if test="${sessionScope.member == null}">
                    <a href="/member/login.do"><img src="${pageContext.request.contextPath}/img/member/tiving.png" style="margin: 50px" value="4"></a>
                </c:if>
                <c:if test="${sessionScope.member != null}">
                    <a href="/main/select-service.do"><img src="${pageContext.request.contextPath}/img/member/tiving.png" style="margin: 50px"
                                                           value="4"></a>
                </c:if>

                <%--				웨이브 = value = 5--%>
                <c:if test="${sessionScope.member == null}">
                    <a href="/member/login.do"><img src="${pageContext.request.contextPath}/img/member/wave.png" style="margin: 50px" value="5"></a>
                </c:if>
                <c:if test="${sessionScope.member != null}">
                    <a href="/main/select-service.do"><img src="${pageContext.request.contextPath}/img/member/wave.png" style="margin: 50px" value="5"></a>
                </c:if>

                <%--				디즈니 - value = 6--%>
                <c:if test="${sessionScope.member == null}">
                    <a href="/member/login.do"><img src="${pageContext.request.contextPath}/img/member/disney+.png" style="margin: 50px" value="6"></a>
                </c:if>
                <c:if test="${sessionScope.member != null}">
                    <a href="/main/select-service.do"><img src="${pageContext.request.contextPath}/img/member/disney+.png" style="margin: 50px"
                                                           value="6"></a>
                </c:if>

                <%--				아마존 - value = 7--%>
                <c:if test="${sessionScope.member == null}">
                    <a href="/member/login.do"><img src="${pageContext.request.contextPath}/img/member/amazon.jpeg" style="margin: 50px" value="7"></a>
                </c:if>
                <c:if test="${sessionScope.member != null}">
                    <a href="/main/select-service.do"><img src="${pageContext.request.contextPath}/img/member/amazon.jpeg" style="margin: 50px"
                                                           value="7"></a>
                </c:if>
            </div>
            <img src="${pageContext.request.contextPath}/img/member/notice1.png">
        </div>
        <div id="board-search" style="margin-bottom: 50px;">
            <div class="container">
                <div class="search-window">
                    <form action="">
                        <div class="search-wrap">
                            <label for="search" class="blind">상세 내용 검색</label>
                            <input id="search" type="search" name="" placeholder="검색어를 입력해주세요." value="">
                            <button type="submit" class="btn btn-dark">검색</button>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>
</section>

</body>
</html>