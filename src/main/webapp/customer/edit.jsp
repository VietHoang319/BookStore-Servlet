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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <meta charset="utf-8"/>
</head>
<body>
<div id="wrapper">
    <div class="container">
        <div class="row justify-content-around">
            <form method="post" class="col-md-6 bg-light p-3 my-3">
                <h1 class="text-center text-uppercase h3">Sửa thông tin khách hàng</h1>
                <input type="hidden" name="action" value="edit">
                <input type="hidden" name="id">
                <div class="form-group">
                    <label for="username">Tên tài khoản</label>
                    <span name="username" id="username" class="form-control">${users.username}</span>
                </div>
                <div class="form-group">
                    <label for="password" >Mật khẩu</label>
                    <input type="text" name="password" id="password" class="form-control" value="${users.password}">
                </div>
                <div class="form-group">
                    <label for="name">Tên hiển thị</label>
                    <input type="text" name="name" id="name" class="form-control" value="${users.name}">
                </div>
                <div class="form-group">
                    <label for="phone">Số điện thoại</label>
                    <input type="text" name="phone" id="phone" class="form-control" value="${users.phone}" pattern="^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$" title="Nhập không đúng định dạng">
                </div>
                <div class="form-group">
                    <input type="hidden" name="roleId" value="3">
                </div>
                <input type="hidden" name="status" value="true">
                <input type="submit" value="Sửa" class="btn-primary btn-block btn">
            </form>
        </div>
    </div>
</div>
</body>
<%--<script>--%>
<%--    function acceptEdit(id) {--%>
<%--        if (confirm("Bạn có xác nhận sửa hay không")){--%>
<%--            alert("Sửa thành công");--%>
<%--            document.getElementById("edit" +id).submit();--%>
<%--        }--%>
<%--        else alert("Sửa thất bại")--%>
<%--    }--%>
<%--</script>--%>
</html>
