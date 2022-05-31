<%--
  Created by IntelliJ IDEA.
  User: sonvu
  Date: 27/05/2022
  Time: 9:17 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>PHPJabbers.com | Free Book Online Store Website Template</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
</head>
<body class="is-preload">
<!-- Wrapper -->
<div id="wrapper">

    <!-- Header -->
    <header id="header">
        <div class="inner">

            <!-- Logo -->
            <a href="index.html" class="logo">
                <span class="fa fa-book"></span> <span class="title">Book Online Store Website</span>
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
            <c:if test="${name ==null}">
                <a href="logins">Đăng nhập</a>
            </c:if>
            <li><a href="/" class="active">Trang chủ</a></li>
            <c:if test="${name != null}">
                <li><a href="contact.html">${name}</a></li>
            </c:if>
            <li><a href="/books">Sách</a></li>
            <c:if test="${name != null&&(roleId==1 || roleId==2)}">
                <li>
                    <a href="" class="dropdown-toggle">Quản lý</a>

                    <ul>
                        <li><a href="/book-management">Quản lý sách</a></li>
                        <li><a href="/authors">Quản lý tác giả</a></li>
                        <li><a href="/customers">Quản lý khách hàng</a></li>
                        <li><a href="/users">Quản lý nhân viên</a></li>
                    </ul>
                </li>
            </c:if>
            <li><a href="contact.html">Liên hệ</a></li>
            <c:if test="${name != null}">
                <li><a href="contact.html">Đăng xuất</a></li>
            </c:if>
        </ul>
    </nav>

    <!-- Main -->
    <div id="main">
        <div class="inner">
            <h1>Quản Lý Tác Giả</h1>
            <div style="margin-bottom: 20px">
                <button id="myBtn"><a href="/authors?action=create">Tạo Mới</a></button>
            </div>
            <div id="myModal" class="modal">
                <div class="modal-content">
                    <span class="close">&times;</span>
                    <form method="post">
                        <input type="hidden" name="action" value="create">
                        <input type="hidden" name="id">
                        Name <input type="text" name="name">

                        Role
                        <select name="roleId">
                            <option value="1">quản lý</option>
                            <option value="2">Tác Giả</option>
                            <option value="3">khách hàng</option>
                        </select>
                        <select name="status">
                            <option value="0">false</option>
                            <option value="1">true</option>
                        </select>
                        <div style="text-align: center;margin-top: 20px">
                            <button>Tạo</button>
                            <button>Huỷ</button>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>

  <!--Author-->
    <script>
    </script>
    <table>
        <tr>
            <td>Id</td>
            <td>Tên</td>
            <td>Sửa</td>
            <td>Xóa</td>
        </tr>
        <c:forEach var="i" items="${authorList}">
            <tr>
                <td>${i.id}</td>
                <td>${i.name}</td>
                <td><a href="/authors?action=edit&id=${i.id} " class="btn btn-secondary">Sửa</a></td>
                <td><a href="/authors?action=delete&id=${i.id}" class="btn btn-secondary">Xóa</a></td>
            </tr>
        </c:forEach>
    </table>
</div>
<footer id="footer">
    <div class="inner">
        <section>
            <ul class="icons">
                <li><a href="#" class="icon style2 fa-twitter"><span class="label">Twitter</span></a></li>
                <li><a href="#" class="icon style2 fa-facebook"><span class="label">Facebook</span></a></li>
                <li><a href="#" class="icon style2 fa-instagram"><span class="label">Instagram</span></a></li>
                <li><a href="#" class="icon style2 fa-linkedin"><span class="label">LinkedIn</span></a></li>
            </ul>

            &nbsp;
        </section>

        <ul class="copyright">
            <li>Copyright © 2020 Company Name </li>
            <li>Template by: <a href="https://www.phpjabbers.com/">PHPJabbers.com</a></li>
        </ul>
    </div>
</footer>

<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/jquery.scrolly.min.js"></script>
<script src="assets/js/jquery.scrollex.min.js"></script>
<script src="assets/js/main.js"></script>
</body>
</html>
