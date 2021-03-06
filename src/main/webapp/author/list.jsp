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
            <a href="/" class="logo">
                <span class="fa fa-book"></span> <span class="title">Nh?? S??ch B??ng B??ng</span>
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
                <a href="logins">????ng nh???p</a>
            </c:if>
            <li><a href="/" class="active">Trang ch???</a></li>
            <c:if test="${name != null}">
                <li><a href="/logins?action=view">${name}</a></li>
                <li>
                    <span class="dropdown-toggle">????n h??ng</span>
                    <ul>
                        <li><a href="/carts">Gi??? h??ng</a></li>
                        <li><a href="/unconfirmed-orders">????n h??ng ch??? x??c nh???n</a></li>
                    </ul>
                </li>
            </c:if>
            <li><a href="/books">S??ch</a></li>
            <c:if test="${name != null&&(roleId==1 || roleId==2)}">
                <li>
                    <span class="dropdown-toggle">Qu???n l??</span>
                    <ul>
                        <li><a href="/book-management">Qu???n l?? s??ch</a></li>
                        <li><a href="/authors">Qu???n l?? t??c gi???</a></li>
                        <li><a href="/customers">Qu???n l?? kh??ch h??ng</a></li>
                        <li><a href="/users">Qu???n l?? nh??n vi??n</a></li>
                        <li>
                            <span class="dropdown-toggle">Qu???n l?? ????n h??ng</span>
                            <ul>
                                <li><a href="/order-management">Qu???n l?? ????n h??ng</a></li>
                                <li><a href="/order-management?action=unconfirm">????n h??ng ch??a x??c nh???n</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
            </c:if>
            <li><a href="#footer">Li??n h???</a></li>
            <c:if test="${name != null}">
                <li><a href="/logins?action=logout">????ng xu???t</a></li>
            </c:if>
        </ul>
    </nav>

    <!-- Main -->
    <div id="main">
        <div class="inner">
            <a href="/authors"><h1 style="display: inline">Qu???n l?? T??c Gi???</h1></a>
            <form method="get">
                <button id="myBtn"><a href="/authors?action=create">T???o M???i</a></button>

            </form>
            <table>
                <tr>
                    <th> Id</th>
                    <th> T??n</th>
                    <th> S???a</th>
                    <th> X??a</th>
                </tr>

                <c:forEach var="i" items="${authorList}">
                    <c:if test="${i.status}">
                        <tr>
                            <td>${i.id}</td>
                            <td>${i.name}</td>
                            <td><a href="/authors?action=edit&id=${i.id} " class="btn btn-secondary">S???a</a></td>
                            <td>
                                <form action="/authors" method="get" id="delete${i.id}" style="display: inline">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="id" value="${i.id}">
                                    <a class="btn btn-danger" onclick="acceptDelete(${i.id})" style="color: white">Xo??</a>
                                </form>
                            </td>

                        </tr>
                    </c:if>
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
                <li>Copyright ?? 2020 Company Name</li>
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

    function acceptDelete(id) {
        if (confirm("B???n c?? x??c nh???n xo?? kh??ng ")) {
            alert("Xo?? th??nh c??ng");
            document.getElementById("delete" + id).submit();
        } else alert("Xo?? th???t b???i")
    }
</script>
</html>
