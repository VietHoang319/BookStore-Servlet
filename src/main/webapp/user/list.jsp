<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <style>
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            padding-top: 100px; /* Location of the box */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0, 0, 0); /* Fallback color */
            background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
        }

        /* Modal Content */
        .modal-content {
            background-color: #fefefe;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }

        /* The Close Button */
        .close {
            color: #aaaaaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: #000;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
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
            <li><a href="index.html">Home</a></li>

            <li><a href="products.html" class="active">Product</a></li>

            <li><a href="checkout.html">Checkout</a></li>

            <li>
                <a href="#" class="dropdown-toggle">About</a>

                <ul>
                    <li><a href="about.html">About Us</a></li>
                    <li><a href="blog.html">Blog</a></li>
                    <li><a href="testimonials.html">Testimonials</a></li>
                    <li><a href="terms.html">Terms</a></li>
                </ul>
            </li>

            <li><a href="contact.html">Contact Us</a></li>
        </ul>
    </nav>

    <!-- Main -->
    <div id="main">
        <div class="inner">
            <form method="get">
                <a href="/users"><h1 style="display: inline">Quản lý nhân viên </h1></a>
                <input type="submit" value="search" name="action" style="display: inline; float: right">
                <input type="text" name="name" placeholder="Nhập tên nhân viên mà bạn muốn tìm" style="display: inline; float: right; width: 30%">
            </form>
        <%-- Tạo--%>
            <div style="margin-bottom: 20px">
                <button id="myBtn">Tạo Mới</button>
            </div>
            <!-- The Modal -->
            <div id="myModal" class="modal">
                <div class="modal-content">
                    <span class="close">&times;</span>
                    <form method="post">
                        <input type="hidden" name="action" value="create">
                        <input type="hidden" name="id">
                        Username <input type="text" name="username">
                        Password <input type="password" name="password">
                        Name <input type="text" name="name">
                        Phone <input type="text" name="phone">
                        <%--                        <input type="text" name="roleId"> Role--%>
                        <select name="roleId">
                            <option value="1">quản lý</option>
                            <option value="2">nhân viên</option>
<%--                            <option value="3">khách hàng</option>--%>
                        </select>
                         <input type="hidden" name="status" value="true">
<%--                        <select name="status">--%>
<%--                            <option value="0">false</option>--%>
<%--                            <option value="1">true</option>--%>
<%--                        </select>--%>
                        <div style="text-align: center;margin-top: 20px">
                            <button>Tạo</button>
                        </div>
                    </form>
                </div>
            </div>
            <script>
                let modal = document.getElementById("myModal");
                let btn = document.getElementById("myBtn");
                let span = document.getElementsByClassName("close")[0];
                btn.onclick = function () {
                    modal.style.display = "block";
                }
                span.onclick = function () {
                    modal.style.display = "none";
                }
                window.onclick = function (event) {
                    if (event.target == modal) {
                        modal.style.display = "none";
                    }
                }
            </script>
            <!-- Staffs -->
            <table>
                <tr>
                    <th>Tên</th>
                    <th>Số điện thoại</th>
                    <th>Chức vụ</th>
                    <th></th>
                    <th></th>
                </tr>
                <c:forEach var="i" begin="0" end="${users.size()-1}">
                    <tr>
                        <td>${users.get(i).name}</td>
                        <td>${users.get(i).phone}</td>
                        <td>${roles.get(i).name}</td>
                        <td><a href="/users?action=edit&id=${users.get(i).id}">Sửa</a></td>
                        <td><a href="/users?action=delete&id=${users.get(i).id}">Xoá</a></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>

    <!-- Footer -->
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