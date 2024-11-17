<%@ page import="org.example.jsp_crud_db.dao.BoardDAO" %>
<%@ page import="org.example.jsp_crud_db.bean.BoardVO" %>

<%
    int seq = Integer.parseInt(request.getParameter("seq"));
    BoardDAO boardDAO = new BoardDAO();
    BoardVO boardVO = new BoardVO();
    boardVO.setSeq(seq);

    boardDAO.deleteBoard(boardVO);
    response.sendRedirect("list.jsp");
%>
