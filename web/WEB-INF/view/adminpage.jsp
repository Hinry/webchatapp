<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%--
  Created by IntelliJ IDEA.
  User: mrhri
  Date: 29.01.2017
  Time: 19:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin page</title>
    <link href="<c:url value="resources/css/style.css" />" rel="stylesheet">
    <link href="<c:url value="resources/css/bootstrap.min.css" />" rel="stylesheet">
</head>
<body>

    <div class="table-view">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>id</th>
                <th>Логин</th>
                <th>Имя</th>
                <th>Фамилия</th>
                <th>Роль</th>
            </tr>
            </thead>

            <c:forEach var="listValue" items="${list}">
                <tr>
                    <td>${listValue.id}</td>
                    <td>${listValue.login}</td>
                    <td>${listValue.first_name}</td>
                    <td>${listValue.last_name}</td>
                    <td>${listValue.rol}</td>
                </tr>
            </c:forEach>
        </table>

        <a href="/newuser">Добавить пользователя</a>
    </div>
</body>
</html>
