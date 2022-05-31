<%--
  Created by IntelliJ IDEA.
  User: Viet Hoang Ngo
  Date: 5/30/2022
  Time: 11:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach var="item" items="${tempOrder}">
    <h3>${item.id}, ${item.book.name}, ${item.quantity}, <a href="/carts?action=delete&id=${item.id}">xóa</a></h3>
</c:forEach>
<a href="/carts?action=confirm">Đặt hàng</a>
</body>
</html>
