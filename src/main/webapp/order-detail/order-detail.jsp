<%--
  Created by IntelliJ IDEA.
  User: Viet Hoang Ngo
  Date: 5/31/2022
  Time: 4:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>${order.id}</h3>
<c:forEach var="item" items="${orderDetails}">
    <h3>${item.book.name}, ${item.numberOfOrder}, ${item.intoMoney}</h3>
</c:forEach>
<h3>${order.totalAmount}</h3>
</body>
</html>
