<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>
<c:forEach  var="i" begin="0" end="${users.size()-1}">
    <h2>${users.get(i).id},${users.get(i).name},${roles.get(i).name}
    </h2>
</c:forEach>
</body>
</html>