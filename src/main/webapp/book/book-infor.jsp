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
            <c:if test="${name == null}">
                <a href="logins">Đăng nhập</a>
            </c:if>
            <li><a href="" class="active">Trang chủ</a></li>
            <c:if test="${name != null}">
                <li><a href="contact.html">${name}</a></li>
                <li>
                    <span class="dropdown-toggle">Đơn hàng</span>
                    <ul>
                        <li><a href="/carts">Giỏ hàng</a></li>
                        <li><a href="/authors">Đơn hàng chờ xác nhận</a></li>
                    </ul>
                </li>
            </c:if>
            <li><a href="/books">Sách</a></li>

            <li>
                <a href="" class="dropdown-toggle">Quản lý</a>

                <ul>
                    <li><a href="/book-management">Quản lý sách</a></li>
                    <li><a href="/authors">Quản lý tác giả</a></li>
                    <li><a href="/customers">Quản lý khách hàng</a></li>
                    <li><a href="/users">Quản lý nhân viên</a></li>
                    <li>
                        <span class="dropdown-toggle">Quản lý đơn hàng</span>
                        <ul>
                            <li><a href="/book-management">Quản lý đơn hàng</a></li>
                            <li><a href="/authors">Đơn hàng chưa xác nhận</a></li>
                        </ul>
                    </li>
                </ul>
            </li>

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
                        <img src="${book.image}" class="img-fluid" alt="Lỗi rồi" style="height: 100%">
                    </div>

                    <div class="col-md-7">
                        <p><strong>Tác giả: </strong><a href="#">${book.author.name}</a></p>
                        <p><strong>Thể loại: </strong><a href="#">${book.category.name}</a></p>
                        <p><strong>Số lượng sách còn trong kho: </strong>${book.numberOfBook} quyển</p>

                        <div class="row">
                            <div class="col-sm-11">
                                <div class="row">
                                    <div>
                                        <button class="primary" data-toggle="modal" data-target="#staticBackdrop">Sửa sách</button>
<%--                                        <input type="button" class="primary" value="Sửa sách">--%>
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

    <!-- Modal -->
    <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1"
         aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">Sửa sách</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form method="post" enctype="multipart/form-data">
                    <div class="modal-body">
                        <label>Tên sách </label><input type="text" name="name" value="${book.name}">
                        <label>Chọn tác giả</label>
                        <select class="form-control" name="authorId">
                            <option value="${book.author.id}">${book.author.name}</option>
                            <c:forEach var="author" items="${authors}">
                                <option value="${author.id}">${author.name}</option>
                            </c:forEach>
                        </select>
                        <label>Chọn thể loại</label>
                        <select class="form-control" name="categoryId">
                            <option value="${book.category.id}">${book.category.name}</option>
                            <c:forEach var="category" items="${categories}">
                                <option value="${category.id}">${category.name}</option>
                            </c:forEach>
                        </select>
                        <label></label>
                        <label for="price" style="float: left">Nhập giá</label>
                        <input type="text" name="price" id="price" value="${book.price}">
                        <label>Nhập số lượng sách</label>
                        <input type="text" name="numberOfBook" value="${book.numberOfBook}">
                        <label>Chọn ảnh</label>
                        <input type="text" id="fileName" name="image" value="${book.image}">
                        <input type="file" id="file" name="file" style="display: none">
                    </div>
                    <div class="modal-footer">
                        <button type="button" data-dismiss="modal">Hủy</button>
                        <input type="submit" name="action" value="Sửa">
                    </div>
                </form>
                <div>
                    <input type="file" name="file" id="upload" onchange="upload()"></div>
                <div style="color: white">error404error404error404error404error404error404error404error404error404error404error404error404error404error404error404</div>
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
<script src="assets/js/upload.js"></script>
</body>
</html>