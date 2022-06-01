<%--
  Created by IntelliJ IDEA.
  User: sonvu
  Date: 27/05/2022
  Time: 1:45 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Book Online Store Website</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="assets/css/main.css"/>
    <noscript>
        <link rel="stylesheet" href="assets/css/noscript.css"/>
    </noscript>
</head>
<body class="is-preload">
<div id="wrapper">
    <!-- Header -->
    <header id="header">
        <div class="inner">

            <!-- Logo -->
            <a href="/" class="logo">
                <span class="fa fa-book"></span> <span class="title">Nhà sách bông bông</span>
            </a>

            <!-- Nav -->
            <nav>
                <ul>
                    <li><a href="#menu">Menu</a></li>
                </ul>
            </nav>

        </div>
    </header>

    <!-- Menu -->
    <nav id="menu">
        <h2>Menu</h2>
        <ul>
            <c:if test="${name == null}">
                <li><a href="logins">Đăng nhập</a></li>
            </c:if>
            <li><a href="/" class="active">Trang chủ</a></li>
            <c:if test="${name != null}">
                <li><a href="/logins?action=view">${name}</a></li>
                <li>
                    <span class="dropdown-toggle">Đơn hàng</span>
                    <ul>
                        <li><a href="/carts">Giỏ hàng</a></li>
                        <li><a href="/unconfirmed-orders">Đơn hàng chờ xác nhận</a></li>
                    </ul>
                </li>
            </c:if>
            <li><a href="/books">Sách</a></li>
            <c:if test="${name != null && (roleId==1 || roleId==2)}">
                <li>
                    <span class="dropdown-toggle">Quản lý</span>
                    <ul>
                        <li><a href="/book-management">Quản lý sách</a></li>
                        <li><a href="/authors">Quản lý tác giả</a></li>
                        <li><a href="/customers">Quản lý khách hàng</a></li>
                        <li><a href="/users">Quản lý nhân viên</a></li>
                        <li>
                            <span class="dropdown-toggle">Quản lý đơn hàng</span>
                            <ul>
                                <li><a href="/order-management">Quản lý đơn hàng</a></li>
                                <li><a href="/order-management?action=unconfirm">Đơn hàng chưa xác nhận</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
            </c:if>
            <li><a href="#footer">Liên hệ</a></li>
            <c:if test="${name != null}">
                <li><a href="/logins?action=logout">Đăng xuất</a></li>
            </c:if>
        </ul>
    </nav>
    </header>
    <div id="main">
        <div class="container">
            <div class="row justify-content-around">
                <form method="post" class="col-md-6 bg-light p-3 my-3" id="edit${authorEdit.id}">
                    <h1 class="text-center text-uppercase h3">Sửa thông tin tác giả</h1>
                    <input type="hidden" name="action" value="edit">
                    <input type="hidden" name="id">
                    <div class="form-group">
                        <label for="name">Tên Tác Giả</label>
                        <input type="text" name="name" id="name" class="form-control" value="${authorEdit.name}" required pattern="^\w+$">
                    </div>
                    <input type="hidden" name="status" value="true">
                    <input type="submit" value="Sửa" class="btn-primary btn-block btn">
                </form>
            </div>
        </div>
    </div>
    <!-- Footer -->
    <footer id="footer">
        <div class="inner">
            <section>
                <ul class="icons">
                    <li><a href="#" class="icon style2 fa-facebook"><span class="label">Facebook</span></a></li>
                    <li><a href="#" class="icon style2 fa-instagram"><span class="label">Instagram</span></a></li>
                </ul>

                &nbsp;
            </section>

            <ul class="copyright">
                <li>Copyright © 2020 Company Name</li>
                <li>Template by: <a href="https://www.phpjabbers.com/">PHPJabbers.com</a></li>
            </ul>
        </div>
    </footer>
</div>

</body>
<script>
</script>
</html>
