<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 27/5/2022
  Time: 11:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post">
    <input type="hidden" name="action" value="edit">
    <input type="hidden" name="id" value="${users.id}">
    <input type="hidden" name="username" value="${users.username}">
    Tên <br>
    <input type="text" name="name" value="${users.name}"> <br>
    <input type="text" name="password" value="${users.password}">
    Số điện thoại <br>
    <input type="text" name="phone" value="${users.phone}"> <br>
    <select name="roleId">
        <option value="1">quản lý</option>
        <option value="2">nhân viên</option>
    </select>
   <input type="hidden" name="status" value="${users.status}">
    <button>Sửa</button>
</form>
</body>
</html>
