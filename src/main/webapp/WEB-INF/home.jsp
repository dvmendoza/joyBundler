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
  <h1 class="text-center">Hello, <c:out value="${user.userName}."/> Here are some name suggestions..</h1>
<div class="row justify-content-center">
  <div class="col-auto">
    <div class="card">
      <div class="card-body">
        <table class="table table-hover table-striped">
          <tr>
            <th>Name</th>
            <th>Gender</th>
            <th>Origin</th>
          </tr>
          <c:forEach var="baby" items="${baby}">
            <tr>
              <td><a href="/names/${baby.id}"><c:out value="${baby.name}"/></a></td>
              <td><c:out value="${baby.gender}"/></td>
              <td><c:out value="${baby.origin}"/></td>
            </tr>
           </c:forEach>
        </table>
      </div>
    </div>
  </div>
  <a href="/names/new">&#171; new name</a>

  <a class="btn btn-danger" href="/logout">Logout</a>
</div>
</body>
</html>
