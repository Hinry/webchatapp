<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%--
  Created by IntelliJ IDEA.
  User: mrhri
  Date: 10.02.2017
  Time: 12:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Registration Confirmation Page</title>
    <link href="<c:url value="../resources/css/bootstrap.css" />" rel="stylesheet">
    <link href="<c:url value="../resources/css/bootstrap.min.css" />" rel="stylesheet">
</head>
<body>
<div class="generic-container">


    <div class="alert alert-success lead">
        ${success}
    </div>

    <span class="well floatRight">
            Назад к <a href="<c:url value='/adminpage' />">списку пользователей.</a>
        </span>
</div>
</body>
</html>
