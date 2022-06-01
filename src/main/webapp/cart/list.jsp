<%--
  Created by IntelliJ IDEA.
  User: Viet Hoang Ngo
  Date: 5/30/2022
  Time: 11:10 PM
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
            <form method="">
                <a href="/books"><h1 style="display: inline">Tất cả sách</h1></a>
            </form>
            <table>
                <tr>
                    <th>Tên sách</th>
                    <th>Giá</th>
                    <th>Số lượng</th>
                    <th>Thành tiền</th>
                    <th></th>
                </tr>
                <c:forEach var="i" begin="0" end="${tempOrder.size() - 1}">
                    <tr>
                        <td>${tempOrder.get(i).book.name}</td>
                        <td>${tempOrder.get(i).book.price}</td>
                        <td>${tempOrder.get(i).quantity}</td>
                        <td>${intoMoney.get(i)}</td>
                        <td>
                            <a href="/carts?action=delete&id=${tempOrder.get(i).id}" class="btn btn-danger">Xoá</a>
<%--                            <form action="/carts" method="get" id="delete${tempOrder.get(i).id}" style="display: inline">--%>
<%--                                <input type="hidden" name="action" value="delete">--%>
<%--                                <input type="hidden" name="id" value="${tempOrder.get(i).id}">--%>
<%--                                <a class="btn btn-danger" onclick="acceptDelete(${tempOrder.get(i).id})" style="color: white">Xoá</a>--%>
<%--                            </form>--%>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            ${mess}
            <span>Thành tiền : ${totalAmount}</span> <br>
            <a href="/carts?action=confirm" class="btn btn-primary">Đặt hàng</a>
        </div>
        <br>
        <br>
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
<%--<body>--%>
<%--<c:forEach var="i" begin="0" end="${tempOrder.size() - 1}">--%>
<%--    <h3>${tempOrder.get(i).book.name}, ${tempOrder.get(i).book.price}, ${tempOrder.get(i).quantity}, ${intoMoney.get(i)}, <a href="/carts?action=delete&id=${tempOrder.get(i).id}">xóa</a></h3>--%>
<%--</c:forEach>--%>
<%--<h3>${totalAmount}</h3>--%>
<%--<a href="/carts?action=confirm">Đặt hàng</a>--%>
<%--</body>--%>
<%--<c:forEach var="order" items="${orders}">--%>
<%--<h3>${order.id}, ${order.orderDate}, ${order.totalAmount}</h3>--%>
<%--<a href="/unconfirmed-orders?action=delete&id=${order.id}">Hủy</a>--%>
<%--</c:forEach>--%>
</html>