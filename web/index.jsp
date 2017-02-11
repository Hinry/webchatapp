<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: mrhri
  Date: 29.01.2017
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
    <link href="<c:url value="resources/css/style.css" />" rel="stylesheet">
      <link href="<c:url value="resources/css/bootstrap.min.css" />" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="resources/css/font-awesome/css/font-awesome.min.css"/>">
  </head>
  <body>

  <div class="header">
       <div class="logo"></div>

      <sec:authorize access="isAuthenticated()">
          <c:if test="${pageContext.request.userPrincipal.name != null}">
              <span class="welcome-chat" style="float: right">Welcome : ${pageContext.request.userPrincipal.name} <a href="/adminpage">админка</a> </span>
              <c:url value="login?logout" var="logoutUrl" />
              <a class="btn_enter" href="${logoutUrl}">Выход</a>
          </c:if>
      </sec:authorize>
      <sec:authorize access="!isAuthenticated()">
       <a class="btn_enter" href="/login">Вход</a>
       <a class="btn_reg" href="/registration"><i class="fa fa-info" aria-hidden="true">
          </i> Информация для регистрации пользователя</a>
      </sec:authorize>
  </div>
  <div class="welcome">
        <div><p>Добро пожаловать на сайт</p></div>
        <img src="resources/images/CHATAPP.png">
        <div class="welcome-chat"><p>чат с моментальным переводом текста!</p></div>
        <div class="welcome-friends"><p>лучшее решение для тех кто имеет иностранных друзей</p></div>
  </div>
  <div class="btn_wrap">

  </div>

  </body>
</html>
