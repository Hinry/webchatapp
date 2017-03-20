<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: mrhri
  Date: 29.01.2017
  Time: 19:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Admin page</title>
    <link href="<c:url value="resources/css/bootstrap.min.css" />" rel="stylesheet">
    <link href="<c:url value="resources/css/style.css" />" rel="stylesheet">
</head>
<body>

<div class="cont">
    <div class="header">
        <a href="/"> <div class="logo"></div></a>

        <sec:authorize access="isAuthenticated()">
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <a class="btn_enter" href="/adminpage">админка</a> </span>
                <c:url value="login?logout" var="logoutUrl" />
                <a class="btn_enter" href="${logoutUrl}">Выход</a>
                <span class="login">Вы вошли как ${pageContext.request.userPrincipal.name}</span>
            </c:if>
        </sec:authorize>
        <sec:authorize access="!isAuthenticated()">
            <a class="btn_enter" href="/login">Вход</a>
            <a class="btn_reg" href="/registration"><i class="fa fa-info" aria-hidden="true">
            </i> Информация для регистрации пользователя</a>
        </sec:authorize>
    </div>
    <div class="container">

        <div id="list" class="span12">
            <h3>Список пользователей</h3>
        </div>

    <div class="table-view">
        <table class="table table-hover table-bordered">
            <thead>
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
                <tr class="tbody">
                    <td>${listValue.id}</td>
                    <td>${listValue.login}</td>
                    <td>${listValue.first_name}</td>
                    <td>${listValue.last_name}</td>
                    <td>${listValue.rol}</td>
                    <sec:authorize access="hasRole('ADMIN') or hasRole('DBA')">
                        <td><a href="<c:url value='/edit-user-${listValue.id}' />" class="btn btn-success custom-width">Редактировать</a></td>
                    </sec:authorize>
                    <sec:authorize access="hasRole('ADMIN')">
                        <td><a href="<c:url value='/delete-user-${listValue.id}' />" class="btn btn-danger custom-width">Удалить</a></td>
                    </sec:authorize>
                </tr>
            </c:forEach>
        </table>



        <a class="btn_new_user" href="/newuser">Добавить пользователя</a>
    </div>
    </div>
</div>
</body>
</html>
