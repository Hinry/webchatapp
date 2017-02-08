<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: mrhri
  Date: 29.01.2017
  Time: 17:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link href="<c:url value="../resources/css/style.css" />" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="../resources/css/font-awesome/css/font-awesome.min.css"/>">
</head>
<body>

<div class="main">
    <div class="login-form">

        <c:url value="/login" var="loginUrl" />
        <form action="${loginUrl}" method="post" class="forma_reg">
            <h2 class="form-signin-heading">Please sign in</h2>
            <p><label>Login<input type="text" class="input" name="j_username" placeholder="Login" ></label></p>
            <p><label>Password<input type="password" class="input" name="j_password" placeholder="Password" ></label></p>
            <button class="btn_enter" type="submit">Войти</button>
        </form>
    </div>
</div>

</body>
</html>
