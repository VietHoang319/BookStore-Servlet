<%--
  Created by IntelliJ IDEA.
  User: Viet Hoang Ngo
  Date: 5/27/2022
  Time: 10:00 AM
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
            <li><a href="/" class="active">Trang chủ</a></li>

            <li><a href="/books">Sách</a></li>

            <li>
                <a href="" class="dropdown-toggle">Quản lý</a>

                <ul>
                    <li><a href="about.html">Quản lý sách</a></li>
                    <li><a href="blog.html">Quản lý tác giả</a></li>
                    <li><a href="testimonials.html">Quản lý người dùng</a></li>
                    <li><a href="terms.html">Quản lý nhân viên</a></li>
                </ul>
            </li>

            <li><a href="contact.html">Liên hệ</a></li>
            <li><a href="contact.html">Đăng xuất</a></li>
        </ul>
    </nav>

    <!-- Main -->
    <div id="main">
        <div class="inner">
            <form method="">
                <a href="/books"><h1 style="display: inline">Tất Cả Sách</h1></a>
                <input type="submit" value="search" name="action" style="display: inline; float: right">
                <input type="text" name="name" placeholder="Nhập tên sách mà bạn muốn tìm" style="display: inline; float: right; width: 30%">
            </form>
            <div class="image main">
                <img src="images/banner-image-6-1920x500.jpg" class="img-fluid" alt=""/>
            </div>

            <!-- Products -->
            <section class="tiles">
                <c:forEach var="book" items="${books}">
                    <article class="style2">
									<span class="image">
										<img src="${book.image}" alt="" height="425px"/>
									</span>
                        <a href="/book-details?id=${book.id}">
                            <h2>${book.name}</h2>

                            <p>
                                <strong>${book.price} đồng</strong>
                            </p>
                        </a>
                    </article>
                </c:forEach>
            </section>
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