<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registation</title>
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
                <h1 class="text-center text-uppercase h3">Đăng kí tài khoản</h1>
                <input type="hidden" name="action" value="create">
                <input type="hidden" name="id">
                <div class="form-group">
                    <label for="username">Tên tài khoản</label>
                    <input type="text" name="username" id="username" class="form-control" required pattern="^\w+$">
                </div>
                <div class="form-group">
                    <label for="password">Mật khẩu</label>
                    <input type="password" name="password" id="password" class="form-control" required pattern="^\w+$">
                </div>
                <div class="form-group">
                    <label for="name">Tên hiển thị</label>
                    <input type="text" name="name" id="name" class="form-control">
                </div>
                <div class="form-group">
                    <label for="phone">Số điện thoại</label>
                    <input type="text" name="phone" id="phone" class="form-control" pattern="^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$" title="Nhập không đúng định dạng">
                </div>
                <input type="hidden" name="roleId" value="3">
                <input type="hidden" name="status" value="true">
                <span style="color: red" class="text-center" >${mess}</span>
                <br>
                <input type="submit" value="Đăng ký" class="btn-primary btn-block btn">
            </form>
        </div>
    </div>
 </div>
</body>
</html>