<%--
  Created by IntelliJ IDEA.
  User: Viet Hoang Ngo
  Date: 5/31/2022
  Time: 12:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach var="order" items="${orders}">
    <h3>${order.id}, ${order.orderDate}, ${order.totalAmount}</h3>
    <a href="/unconfirmed-orders?action=delete&id=${order.id}">Hủy</a>
</c:forEach>
</body>
</html>
