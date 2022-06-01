<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

         Modal Content
        .modal-content {
            background-color: #fefefe;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }

         The Close Button
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
            <li><a href="/" class="active">Trang chủ</a></li>
            <c:if test="${name!= null}">
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

    <!-- Main -->
    <div id="main">
        <div class="inner">
            <form method="get">
                <a href="/customers"><h1 style="display: inline">Quản lý Khách Hàng</h1></a>
                <input type="submit" value="search" name="action" style="display: inline; float: right">
                <input type="text" name="name" placeholder="Nhập tên khách hàng mà bạn muốn tìm" style="display: inline; float: right; width: 30%">
            </form>
            <table>
                <tr>
                    <th>Tài khoản</th>
                    <th>Tên hiển thị</th>
                    <th>Số điện thoại</th>
                    <th>Chức vụ</th>
                    <th></th>
                    <th></th>
                </tr>
                <c:forEach var="i" begin="0" end="${users.size()-1}">
                    <tr>
                        <td>${users.get(i).username}</td>
                        <td>${users.get(i).name}</td>
                        <td>${users.get(i).phone}</td>
                        <td>${roles.get(i).name}</td>
                        <td><a href="/customers?action=edit&id=${users.get(i).id}" class="btn btn-secondary">Sửa</a></td>
                        <td>
                            <form action="/customers" method="get" id="delete${users.get(i).id}" style="display: inline">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="${users.get(i).id}">
                                <a class="btn btn-danger" onclick="acceptDelete(${users.get(i).id}) " style="color: white">Xoá</a>
                            </form>
                        </td>
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
<script>
    function acceptDelete(id) {
        if (confirm("Bạn có xác nhận xoá không ")){
            alert("Xoá thành công");
            document.getElementById("delete" +id).submit();
        }else alert("Xoá thất bại")
    }
</script>
</html>