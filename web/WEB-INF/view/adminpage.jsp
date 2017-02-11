<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
    <link href="<c:url value="resources/css/bootstrap.min.css" />" rel="stylesheet">
</head>
<body>

    <div class="table-view">
        <table class="table table-striped table-hover">
            <thead class="bg-primary">
            <tr>
                <th>id</th>
                <th>Логин</th>
                <th>Имя</th>
                <th>Фамилия</th>
                <th>Роль</th>
                <sec:authorize access="hasRole('ADMIN') or hasRole('DBA')">
                    <td></td>
                </sec:authorize>
                <sec:authorize access="hasRole('ADMIN') or hasRole('DBA')">
                    <td></td>
                </sec:authorize>
            </tr>
            </thead>

            <c:forEach var="listValue" items="${list}">
                <tr class="">
                    <td>${listValue.id}</td>
                    <td>${listValue.login}</td>
                    <td>${listValue.first_name}</td>
                    <td>${listValue.last_name}</td>
                    <td>${listValue.rol}</td>
                    <sec:authorize access="hasRole('ADMIN') or hasRole('DBA')">
                        <td><a href="<c:url value='/edit-user-${listValue.id}' />" class="btn btn-success custom-width">edit</a></td>
                    </sec:authorize>
                    <sec:authorize access="hasRole('ADMIN')">
                        <td><a href="<c:url value='/delete-user-${listValue.id}' />" class="btn btn-danger custom-width">delete</a></td>
                    </sec:authorize>
                </tr>
            </c:forEach>
        </table>



        <a href="/newuser">Добавить пользователя</a>
    </div>
</body>
</html>
