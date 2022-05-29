<%--
  Created by IntelliJ IDEA.
  User: Viet Hoang Ngo
  Date: 5/29/2022
  Time: 10:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>PHPJabbers.com | Free Book Online Store Website Template</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="assets/css/main.css"/>
    <noscript>
        <link rel="stylesheet" href="assets/css/noscript.css"/>
    </noscript>
</head>
<body class="is-preload">
<!-- Wrapper -->
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
            <li><a href="contact.html">Người dùng</a></li>
            <li><a href="" class="active">Trang chủ</a></li>

            <li><a href="/books">Sách</a></li>

            <li>
                <a href="" class="dropdown-toggle">Quản lý</a>

                <ul>
                    <li><a href="/book-management">Quản lý sách</a></li>
                    <li><a href="/authors">Quản lý tác giả</a></li>
                    <li><a href="/customers">Quản lý khách hàng</a></li>
                    <li><a href="/users">Quản lý nhân viên</a></li>
                </ul>
            </li>

            <li><a href="contact.html">Liên hệ</a></li>
            <li><a href="contact.html">Đăng xuất</a></li>
        </ul>
    </nav>

    <!-- Main -->
    <div id="main">
        <div class="inner">
            <h1>${book.name}<span class="pull-right">${book.price} đồng</span></h1>

            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-5" style="height: 310px; display:flex; justify-content: center">
                        <img src="${book.image}" class="img-fluid" alt="" style="height: 100%">
                    </div>

                    <div class="col-md-7">
                        <p><strong>Tác giả: </strong><a href="#">${book.author.name}</a></p>
                        <p><strong>Thể loại: </strong><a href="#">${book.category.name}</a></p>
                        <p><strong>Số lượng sách còn trong kho: </strong>${book.numberOfBook} quyển</p>

                        <div class="row">
                            <div class="col-sm-11">
                                <div class="row">
                                    <div>
                                        <input type="button" class="primary" value="Sửa sách">
                                    </div>
                                    <div class="col-sm-6">
                                        <a href="/book-infors?action=delete&id=${book.id}"><input type="button" class="primary" value="Xóa sách"></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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

<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/jquery.scrolly.min.js"></script>
<script src="assets/js/jquery.scrollex.min.js"></script>
<script src="assets/js/main.js"></script>

</body>
</html>