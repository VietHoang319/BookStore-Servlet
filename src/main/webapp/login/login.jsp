<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 30/5/2022
  Time: 8:15 AM
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
                <h1 class="text-center text-uppercase h3">Đăng nhập tài khoản</h1>
                <input type="hidden" name="action" value="login">
                <input type="hidden" name="id">
                <div class="form-group">
                    <label for="username">Tên tài khoản</label>
                    <input type="text" name="username" id="username" class="form-control">
                </div>
                <div class="form-group">
                    <label for="password">Mật khẩu</label>
                    <input type="password" name="password" id="password" class="form-control">
                </div>
                <input type="submit" value="Đăng nhập" class="btn-primary btn-block btn">
                <a class="btn-primary btn-block btn" href="registers">Đăng ký</a>
            </form>
        </div>
    </div>
</div>
</body>
</html>
