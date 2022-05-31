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
<c:forEach var="i" begin="0" end="${tempOrder.size() - 1}">
    <h3>${tempOrder.get(i).book.name}, ${tempOrder.get(i).book.price}, ${tempOrder.get(i).quantity}, ${intoMoney.get(i)}, <a href="/carts?action=delete&id=${tempOrder.get(i).id}">xóa</a></h3>
</c:forEach>
<h3>${totalAmount}</h3>
<a href="/carts?action=confirm">Đặt hàng</a>
</body>
</html>
