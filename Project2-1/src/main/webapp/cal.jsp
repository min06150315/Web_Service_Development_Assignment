<%--
  Created by IntelliJ IDEA.
  User: min06
  Date: 2024-11-08
  Time: 오전 3:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <jsp:useBean id="c1" class="org.example.project21.Calculator" />
    <%= ("10 + 20 = " + c1.sum(10, 20)) %>

</body>
</html>
