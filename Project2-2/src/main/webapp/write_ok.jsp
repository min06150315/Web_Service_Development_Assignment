<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="org.example.jsp_crud_db.dao.BoardDAO" %>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="u" class="org.example.jsp_crud_db.bean.BoardVO" />
<jsp:setProperty name="u" property="*" />

<%
    BoardDAO boardDAO = new BoardDAO();
    int i = boardDAO.insertBoard(u);
    String msg;
    if (i == 1) {
        msg = "데이터 추가 성공!";
    } else {
        msg = "데이터 추가 실패! 다시 시도해주세요.";
    }
%>

<script>
    alert('<%=msg%>');
    if ('<%=i %>' == '1') {
        location.href = 'list.jsp';
    } else {
        history.back();
    }
</script>

