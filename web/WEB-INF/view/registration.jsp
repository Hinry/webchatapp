<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: mrhri
  Date: 03.02.2017
  Time: 12:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Registration</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="<c:url value="../resources/css/style.css" />" rel="stylesheet">
    <link href="<c:url value="../resources/css/bootstrap.min.css" />" rel="stylesheet">
</head>
<body>

<div class="generic-container">


    <div class="well lead">Форма регистрации пользователя</div>
    <form:form method="POST" modelAttribute="user" class="form-horizontal">
        <form:input type="hidden" path="id" id="id"/>

        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="firstName">Имя</label>
                <div class="col-md-7">
                    <form:input type="text" path="first_name" id="firstName" class="form-control input-sm"/>
                    <div class="has-error">
                        <form:errors path="first_name" class="help-inline"/>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="lastName">Фамилия</label>
                <div class="col-md-7">
                    <form:input type="text" path="last_name" id="lastName" class="form-control input-sm" />
                    <div class="has-error">
                        <form:errors path="last_name" class="help-inline"/>
                    </div>
                </div>
            </div>
        </div>


        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="password">Пароль</label>
                <div class="col-md-7">
                    <form:input type="password" path="password" id="password" class="form-control input-sm" />
                    <div class="has-error">
                        <form:errors path="password" class="help-inline"/>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="login">Логин</label>
                <div class="col-md-7">
                    <form:input type="text" path="login" id="login" class="form-control input-sm" />
                    <div class="has-error">
                        <form:errors path="login" class="help-inline"/>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="userRoles">Роли</label>
                <div class="col-md-7">
                    <form:select path="userRoles" items="${roles}" multiple="true" itemValue="id" itemLabel="type"  class="form-control input-sm" />
                    <div class="has-error">
                        <form:errors path="userRoles" class="help-inline"/>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="form-actions">
                <c:choose>
                    <c:when test="${edit}">
                        <input type="submit" value="Сохранить" class="btn btn-primary btn-sm"/> или <a href="<c:url value='/adminpage' />">Отмена</a>
                    </c:when>
                    <c:otherwise>
                        <input type="submit" value="Регистрация" class="btn btn-primary btn-sm"/> или <a href="<c:url value='/adminpage' />">Отмена</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </form:form>
</div>

</body>
</html>
