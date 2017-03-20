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

      <div class="main-page">
          <div class="welcome">
              <img src="resources/images/CHATAPP.png">
              <h3>Хочешь завести иностранных друзей?</h3>
              <h3>У тебя уже есть друзья из другой страны но не знаешь как с ними пообщаться?</h3>
              <h3>Зарегистрируйся и общайся со своими друзьями из других стран с помощью удобного мессенджера</h3>
              <h3><a class="btn-link-upload" href="/">Ссылка на скачивание</a></h3>
          </div>
          <div class="btn_wrap">

          </div>
      </div>
  </div>

  </body>
</html>
