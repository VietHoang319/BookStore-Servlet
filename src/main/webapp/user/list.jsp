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
    <%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">--%>
    <%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>--%>
    <%--    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>--%>
    <%--    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>--%>
    <%--    <meta charset="utf-8"/>--%>
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
                <span class="fa fa-book"></span> <span class="title">Nh?? s??ch b??ng b??ng</span>
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
                <li><a href="logins">????ng nh???p</a></li>
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
            <c:if test="${name != null && (roleId==1 || roleId==2)}">
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
            <form method="get">
                <a href="/users"><h1 style="display: inline">Qu???n l?? nh??n vi??n </h1></a>
                <input type="submit" value="search" name="action" style="display: inline; float: right">
                <input type="text" name="name" placeholder="Nh???p t??n nh??n vi??n m?? b???n mu???n t??m"
                       style="display: inline; float: right; width: 30%">
            </form>
            <%-- T???o--%>
            <div style="margin-bottom: 20px">
                <button id="myBtn">T???o M???i</button>
            </div>
            <!-- The Modal -->
            <div id="myModal" class="modal">
                <div class="modal-content">
                    <span class="close">&times;</span>
                    <form method="post" class="col-md-12 bg-light p-3 my-3">
                        <h1 class="text-center text-uppercase h3">????ng k?? nh??n vi??n</h1>
                        <input type="hidden" name="action" value="create">
                        <input type="hidden" name="id">
                        <div class="form-group">
                            <label for="username">T??n t??i kho???n</label>
                            <input type="text" name="username" id="username" class="form-control" required pattern="^\w+$">
                        </div>
                        <div class="form-group">
                            <label for="password">M???t kh???u</label>
                            <input type="password" name="password" id="password" class="form-control" required pattern="^\w+$">
                        </div>
                        <div class="form-group">
                            <label for="name">T??n hi???n th???</label>
                            <input type="text" name="name" id="name" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="phone">S??? ??i???n tho???i</label>
                            <input type="text" name="phone" id="phone" class="form-control" pattern="^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$" title="Nh???p kh??ng ????ng ?????nh d???ng">
                        </div>
                        <div class="form-group">
                            <label for="role">Ch???c v??? </label>
                            <select name="roleId" id="role">
                                <option value="1">qu???n l??</option>
                                <option value="2">nh??n vi??n</option>
                            </select>
                        </div>
                        <input type="hidden" name="status" value="true">
                        <input type="submit" value="T???o" class="btn-primary btn-block btn">
                    </form>
                </div>
            </div>
            <!-- Staffs -->
            <table>
                <tr>
                    <th>T??i kho???n</th>
                    <th>T??n hi???n th???</th>
                    <th>S??? ??i???n tho???i</th>
                    <th>Ch???c v???</th>
                    <th></th>
                    <th></th>
                </tr>
                <c:forEach var="i" begin="0" end="${users.size()-1}">
                    <tr>
                        <td>${users.get(i).username}</td>
                        <td>${users.get(i).name}</td>
                        <td>${users.get(i).phone}</td>
                        <td>${roles.get(i).name}</td>
                        <td><a href="/users?action=edit&id=${users.get(i).id}" class="btn btn-secondary">S???a</a></td>
                        <td>
<%--                            <a href="/users?action=delete&id=${users.get(i).id}" class="btn btn-danger"--%>
<%--                               onclick="acceptDelete(${users.get(i).id})">Xo??</a>--%>
                            <form action="/users"  id="delete${users.get(i).id}" style="display: inline">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="${users.get(i).id}">
                                <a class="btn btn-danger" onclick="acceptDelete(${users.get(i).id})" style="color: white">Xo??</a>
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
</body>
</html>