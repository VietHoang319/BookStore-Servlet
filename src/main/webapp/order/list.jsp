<%--
  Created by IntelliJ IDEA.
  User: Viet Hoang Ngo
  Date: 5/31/2022
  Time: 5:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach var="item" items="${orders}">
  <h3>${item.id}, ${item.customer.name}, ${item.staff.name}, ${item.orderDate}, ${item.totalAmount}, ${item.status}</h3>
</c:forEach>
</body>
</html>
