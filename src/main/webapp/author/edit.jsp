<%--
  Created by IntelliJ IDEA.
  User: sonvu
  Date: 27/05/2022
  Time: 1:45 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post">
    <input type="text" name="name" value="${authorEdit.name}">
    <input type="text" name="id" value="${authorEdit.id}" hidden>
    <input type="submit" value="sửa">
</form>
</body>
</html>
