<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: mrhri
  Date: 29.01.2017
  Time: 17:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Login</title>
    <link href="<c:url value="../resources/css/style.css" />" rel="stylesheet">
    <link href="<c:url value="../resources/css/bootstrap.min.css" />" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="../resources/css/font-awesome/css/font-awesome.min.css"/>">
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


<div>
            <c:url value="/login" var="loginUrl" />
            <form action="${loginUrl}" method="post" class="forma_reg">
                <sec:authorize access="!isAuthenticated()">
                <c:if test="${param.logout != null}">
                    <div class="alert alert-success">
                        <p>Вы успешно вышли.</p>
                    </div>
                </c:if>
                <h2>Авторизизация</h2>
                <c:if test="${param.error != null}">
                    <div class="error-login">
                        <p>Неверный логин или пароль.</p>
                    </div>
                </c:if>
                    <p><input type="text" class="in" name="j_username" placeholder="Логин" ></p>
                    <p><input type="password" class="in" name="j_password" placeholder="Пароль" ></p>
                <p><button class="btn_login" type="submit">Войти</button></p>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <span class="text-center">Привет : ${pageContext.request.userPrincipal.name} <br>

                        <a href="/adminpage">Админка</a> </span><br>
                        <c:url value="/logout" var="logoutUrl" />
                        <button class="btn btn-lg btn-warning" href="${logoutUrl}">Выход</button>
                    </c:if>
                </sec:authorize>
            </form>
</div>
</div>
</body>
</html>
