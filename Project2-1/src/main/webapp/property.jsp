<%--
  Created by IntelliJ IDEA.
  User: min06
  Date: 2024-11-07
  Time: 오전 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <jsp:useBean id="user" class="org.example.project21.User" />
    <jsp:setProperty name="user" property="userid" value="민경빈"/>
    안녕하세요 <jsp:getProperty name="user" property="userid" /> 입니다.
</body>
</html>
