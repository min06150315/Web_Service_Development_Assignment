<%--
  Created by IntelliJ IDEA.
  User: min06
  Date: 2024-11-15
  Time: 오전 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="org.example.jsp_crud_db.dao.BoardDAO" %>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="u" class="org.example.jsp_crud_db.bean.BoardVO" />
<jsp:setProperty name="u" property="*" />

<%
    BoardDAO boardDAO = new BoardDAO();
    int i = boardDAO.insertBoard(u);
    String msg = "데이터 추가 성공!";
    if (i == 0) msg = "[에러] 데이터 추가 ";
%>

<script>
    alert('<%=msg%>');
    location.href='list.jsp';
</script>

