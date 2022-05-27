<%--
  Created by IntelliJ IDEA.
  User: sonvu
  Date: 27/05/2022
  Time: 9:17 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>

</head>
<body>

<h1>Danh Sách Tác Giả</h1>
<a href="/authors?action=create">Thêm Tác Giả</a>
<c:forEach var="aut" items="${authorList}">
   <h2>${aut.id}, ${aut.name}, ${aut.status} <a href="/authors?action=edit&id=${aut.id}">Sửa</a></h2>
</c:forEach>
</body>
</html>
