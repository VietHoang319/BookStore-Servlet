<%--
  Created by IntelliJ IDEA.
  User: sonvu
  Date: 27/05/2022
  Time: 1:45 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Title</title>
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
<div id="wrapper">
    <header id="header">
        <div class="inner">

            <!-- Logo -->
            <a href="/" class="logo">
                <span class="fa fa-book"></span> <span class="title">Nhà sách bông bông</span>
            </a>
        </div>
    </header>
    <div id="main">
        <div class="container">
            <div class="row justify-content-around">
                <form method="post" class="col-md-6 bg-light p-3 my-3" id="edit${authorEdit.id}">
                    <h1 class="text-center text-uppercase h3">Sửa thông tin tác giả</h1>
                    <input type="hidden" name="action" value="edit">
                    <input type="hidden" name="id">
                    <div class="form-group">
                        <label for="name">Tên Tác Giả</label>
                        <input type="text" name="name" id="name" class="form-control" value="${authorEdit.name}">
                    </div>
                    <input type="hidden" name="status" value="true">
                    <input type="submit" value="Sửa" class="btn-primary btn-block btn">
                </form>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    // function acceptEdit(id) {
    //     if (confirm("Bạn có xác nhận sửa hay không")){
    //         alert("Sửa thành công");
    //         document.getElementById("edit" +id).submit();
    //     }
    //     else alert("Sửa thất bại")
    // }
</script>
</html>
