<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
  <script src="/webjars/jquery/jquery.min.js"></script>
  <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
  <title>Login/Registration</title>
</head>
<body>

<div class="container">
    <h1  class="align-content-center">Edit Name</h1>
    <div class="row">
        <div class="col">
            <div class="form-group">
                <form:form action="/home" method="post" modelAttribute="baby">
                    <input type="hidden" name="_method" value="put">
                    <form:hidden  path="user" value="${baby.setUser(user)}" ></form:hidden>
                    <div class="form-group">
                        <form:label path="name">Name</form:label>
                        <form:input  class="form-control" path="name"/>
                        <form:errors path="name"/>
                    </div>
                    <p class="form-control d-flex flex-column">
            <form:label path="gender">Gender</form:label>
            <form:select path="gender">
            	<form:option value="gender" label="--- Select ---"/>
            	<form:option value="Male" path="Male">Male</form:option>
            	<form:option value="Female" path="Female">Female</form:option>
            	<form:option value="Neutral" path="Neutral">Neutral</form:option>
            </form:select>
          </p>
                    <div>
                        <form:label path="thoughts">myThoughts</form:label>
                        <form:input type="textarea"  class="form-control" path="thoughts"/>
                        <form:errors path="thoughts"/>
                    </div>
                    <input type="submit" value="submit">
                </form:form>
            </div>
        </div>

    </div>
</div>

</body>
</html>