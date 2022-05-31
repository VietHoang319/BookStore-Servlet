<%--
  Created by IntelliJ IDEA.
  User: Viet Hoang Ngo
  Date: 5/31/2022
  Time: 9:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>mã đơn hàng, tên khách hàng, ngày đặt hàng, tổng tiền</h3>
<c:forEach var="item" items="${orders}">
    <h3><a href="/order-management?action=search&id=${item.id}">${item.id}</a>, ${item.customer.name}, ${item.orderDate}, ${item.totalAmount}, <a href="/order-management?action=confirm&id=${item.id}">Xác nhận</a>, <a href="/order-management?action=delete&id=${item.id}">Hủy</a>
    </h3>
</c:forEach>
</body>
</html>
