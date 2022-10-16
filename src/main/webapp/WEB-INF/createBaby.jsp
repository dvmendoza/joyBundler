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
  <title>Create a name</title>
</head>
<body>

<h1>Add a name!</h1>
<div class="row justify-content-center">
  <div class="col-auto">
    <div class="card">
      <div class="card-body">
        <form:form action="/names/${baby.id}" method="post" modelAttribute="baby">
          <form:hidden path="user" value="${user.id}"/>
          <p class="form-control d-flex flex-column">
            <form:label path="name">New Name:</form:label>
            <form:errors path="name" cssClass="text-danger"/>
            <form:input path="name"/>
          </p>
          <p class="form-control d-flex flex-column">
            <form:label path="gender">Gender</form:label>
            <form:select path="gender">
            	<form:option value="gender" label="--- Select ---"/>
            	<form:option value="Male" path="Male">Male</form:option>
            	<form:option value="Female" path="Female">Female</form:option>
            	<form:option value="Neutral" path="Neutral">Neutral</form:option>
            </form:select>
          </p>
          <p class="form-control d-flex flex-column">
            <form:label path="origin">Origin</form:label>
            <form:errors path="origin" cssClass="text-danger"/>
            <form:input path="origin"/>
          </p>
          <p class="form-control d-flex flex-column">
            <form:label path="thoughts">Meaning</form:label>
            <form:errors path="thoughts" cssClass="text-danger"/>
            <form:textarea rows="5" cols="30" path="thoughts"/>
          </p>
          <input class="mt-3 btn btn-primary" type="submit" value="Submit">
        </form:form>
      </div>
    </div>
  </div>
  <a class="btn btn-secondary" href="/home">Cancel</a>
</div>


</body>
</html>