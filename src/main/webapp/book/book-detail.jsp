<%--
  Created by IntelliJ IDEA.
  User: Viet Hoang Ngo
  Date: 5/27/2022
  Time: 4:31 PM
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
            <c:if test="${name != null && (roleId==1 ||roleId==2 || roleId==4)}">
                <li>
                    <span class="dropdown-toggle">Quản lý</span>

                    <ul>
                        <li><a href="/book-management">Quản lý sách</a></li>
                        <li><a href="/authors">Quản lý tác giả</a></li>
                        <li><a href="/customers">Quản lý khách hàng</a></li>
                        <c:if test="${roleId ==4}">
                            <li><a href="/users">Quản lý nhân viên</a></li>
                        </c:if>
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
                        <p><strong>Tác giả: </strong><a
                                href="book-details?action=searchAuthor&id=${book.author.id}">${book.author.name}</a></p>
                        <p><strong>Thể loại: </strong><a
                                href="book-details?action=searchCategory&id=${book.category.id}">${book.category.name}</a>
                        </p>
                        <p><strong>Số lượng sách còn trong kho: </strong>${book.numberOfBook} quyển</p>

                        <div class="row">
                            <div class="col-sm-12">
                                <c:if test="${name!= null}">
                                    <form method="post" action="/carts">
                                        <input type="hidden" name="id" value="${book.id}">
                                        <label class="control-label">Số lượng đặt hàng</label>
                                        <div class="row">
                                            <div class="col-sm-5">
                                                <div class="form-group">
                                                    <input type="number" value="1" name="numberOfOrder" id="name"
                                                           max="${book.numberOfBook}">
                                                </div>
                                            </div>
                                            <div class="col-sm-7">
                                                <input type="hidden" name="action" value="add">
                                                <input type="submit" class="primary" value="Thêm vào giỏ hàng">
                                            </div>
                                        </div>
                                    </form>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <br>
            <br>

            <div class="container-fluid">
                <h2 class="h2">Các sản phẩm khác</h2>

                <!-- Products -->
                <section class="tiles">
                    <c:forEach var="book" items="${books}">
                        <article class="style1">
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

                <p class="text-center"><a href="/books">More Books &nbsp;<i class="fa fa-long-arrow-right"></i></a></p>
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