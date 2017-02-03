<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: mrhri
  Date: 03.02.2017
  Time: 12:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration</title>
    <link href="<c:url value="../resources/css/style.css" />" rel="stylesheet">
    <link href="<c:url value="../resources/css/bootstrap.min.css" />" rel="stylesheet">
</head>
<body>

<div class="generic-container">


    <div class="well lead">User Registration Form</div>
    <form:form method="POST" modelAttribute="user" class="form-horizontal">
        <form:input type="hidden" path="id" id="id"/>

        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="firstName">First Name</label>
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
                <label class="col-md-3 control-lable" for="lastName">Last Name</label>
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
                <label class="col-md-3 control-lable" for="password">Password</label>
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
                <label class="col-md-3 control-lable" for="login">Login</label>
                <div class="col-md-7">
                    <form:input type="text" path="login" id="login" class="form-control input-sm" />
                    <div class="has-error">
                        <form:errors path="login" class="help-inline"/>
                    </div>
                </div>
            </div>
        </div>

        <%--<div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="roles">Roles</label>
                <div class="col-md-7">
                    <form:select path="roles" items="${roles}" multiple="true"  class="form-control input-sm" />
                    <div class="has-error">
                        <form:errors path="roles" class="help-inline"/>
                    </div>
                </div>
            </div>
        </div>--%>

        <div class="row">
            <div class="form-actions floatRight">
                <c:choose>
                    <c:when test="${edit}">
                        <input type="submit" value="Update" class="btn btn-primary btn-sm"/> or <a href="<c:url value='/adminpage' />">Отмена</a>
                    </c:when>
                    <c:otherwise>
                        <input type="submit" value="/registration" class="btn btn-primary btn-sm"/> or <a href="<c:url value='/adminpage' />">Отмена</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </form:form>
</div>

</body>
</html>
