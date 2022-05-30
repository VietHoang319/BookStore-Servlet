<%--
  Created by IntelliJ IDEA.
  User: Viet Hoang Ngo
  Date: 5/28/2022
  Time: 2:18 PM
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
            <form method="">
                <a href="/book-management"><h1 style="display: inline">Quản Lý Sách</h1></a>
                <input type="submit" value="search" name="action" style="display: inline; float: right">
                <input type="text" name="name" placeholder="Nhập tên sách mà bạn muốn tìm"
                       style="display: inline; float: right; width: 30%">
            </form>
            <div style="margin-bottom: 20px">
                <button type="button" data-toggle="modal" data-target="#staticBackdrop" style="width: 30%;">
                    Thêm sách
                </button>
            </div>
            <hr>

            <!-- Modal -->
            <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1"
                 aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" class="modal-dialog modal-dialog-scrollable">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="staticBackdropLabel">Thêm sách</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form method="post" enctype="multipart/form-data">
                            <div class="modal-body">
                                <label>Nhập tên sách </label><input type="text" name="name" placeholder="Nhập tên sách">
                                <label>Chọn tác giả</label>
                                <select class="form-control" name="authorId">
                                    <option></option>
                                    <c:forEach var="author" items="${authors}">
                                        <option value="${author.id}">${author.name}</option>
                                    </c:forEach>
                                </select>
                                <label>Chọn thể loại</label>
                                <select class="form-control" name="categoryId">
                                    <option></option>
                                    <c:forEach var="category" items="${categories}">
                                        <option value="${category.id}">${category.name}</option>
                                    </c:forEach>
                                </select>
                                <label></label>
                                <label for="price" style="float: left">Nhập giá</label>
                                <input type="text" name="price" id="price" placeholder="Nhập giá sách">
                                <label>Nhập số lượng sách</label>
                                <input type="text" name="numberOfBook" placeholder="Nhập số lượng sách">
                                <label>Chọn ảnh</label>
                                <input type="text" id="fileName" name="image">
                                <input type="file" id="file" name="file" style="display: none">
                            </div>
                            <div class="modal-footer">
                                <button type="button" data-dismiss="modal">Hủy</button>
                                <input type="submit" name="action" value="Thêm">
                            </div>
                        </form>
                        <input type="file" name="file" id="upload" onchange="upload()">
                    </div>
                </div>
            </div>

            <!-- Products -->
            <section class="tiles">
                <c:forEach var="book" items="${books}">
                    <article class="style2">
            									<span class="image">
            										<img src="${book.image}" alt="" height="425px"/>
            									</span>
                        <a href="/book-infors?id=${book.id}">
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
<script>
    function upload() {
        var fullPath = document.getElementById('upload').value;
        if (fullPath) {
            var startIndex = (fullPath.indexOf('\\') >= 0 ? fullPath.lastIndexOf('\\') : fullPath.lastIndexOf('/'));
            var filename = fullPath.substring(startIndex);
            if (filename.indexOf('\\') === 0 || filename.indexOf('/') === 0) {
                filename = filename.substring(1);
            }
            document.getElementById('fileName').value = filename;
            document.getElementById('file').value = filename;
        }
    }
</script>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/jquery.scrolly.min.js"></script>
<script src="assets/js/jquery.scrollex.min.js"></script>
<script src="assets/js/main.js"></script>
</body>
</html>
