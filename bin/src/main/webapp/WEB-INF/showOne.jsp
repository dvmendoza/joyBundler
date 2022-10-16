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

<h1><c:out value="${baby.name}"/></h1>
<h3>(Added by <c:out value="${user.userName}."/>)</h3>
<p>Gender: <c:out value="${baby.gender}"/> </p>
<p>Origin: <c:out value="${baby.origin}"/> </p>
<p>Meaning: <c:out value="${baby.thoughts}"/> </p>

<c:if test="${user.getId() == baby.user.getId()}">
    <a class="btn btn-secondary" href="/names/edit/${baby.id}">Edit</a>
        <form action="/names/destroy/${baby.id}" method="post">
            <input type="hidden" name="_method" value="delete">
            <input class="btn btn-danger" type="submit" value="Delete">
        </form>

    </c:if>

</body>
</html>