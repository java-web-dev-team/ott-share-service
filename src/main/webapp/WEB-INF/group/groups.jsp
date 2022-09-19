<%--
  Created by IntelliJ IDEA.
  User: macbookpro
  Date: 2022/09/19
  Time: 2:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>groups</title>
</head>
<body>

<table>
    <thead>
    <th>그룹이름</th>
    <th>ott종류</th>
    <th>그룹생성일</th>
    </thead>
    <tbody>
    <c:forEach var="group" items="${groups}">
        <tr>
            <td>${group.groupName}</td>
            <td>${group.ottId}</td>
            <td>${group.createdDate}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>
