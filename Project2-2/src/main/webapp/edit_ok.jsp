<%@ page import="org.example.jsp_crud_db.dao.BoardDAO" %>
<%@ page import="org.example.jsp_crud_db.bean.BoardVO" %>

<%
    request.setCharacterEncoding("UTF-8");
    BoardDAO dao = new BoardDAO();
    BoardVO vo = new BoardVO();

    vo.setSeq(Integer.parseInt(request.getParameter("seq")));
    vo.setCategory(request.getParameter("category"));
    vo.setTitle(request.getParameter("title"));
    vo.setWriter(request.getParameter("writer"));
    vo.setContent(request.getParameter("content"));

    int result = dao.updateBoard(vo);
    if (result > 0) {
        response.sendRedirect("list.jsp");
    } else {
        out.println("<script>alert('Update Failed');history.back();</script>");
    }
%>
