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
    <jsp:useBean id="user" class="org.example.project21.User" />
    <jsp:setProperty name="user" property="userid" value="민경빈" />
    안녕하세요 저는 <jsp:getProperty name="user" property="userid" /> 입니다. 일단 죄송합니다.

</body>
</html>
