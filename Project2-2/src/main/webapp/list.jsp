<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="top.jsp" %>

<%
    // DAO를 JSP에서 직접 사용
    org.example.jsp_crud_db.dao.BoardDAO dao = new org.example.jsp_crud_db.dao.BoardDAO();
    java.util.List<org.example.jsp_crud_db.bean.BoardVO> list = dao.getBoardList();
    request.setAttribute("list", list);
%>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

<div class="container mt-5">
    <h2 class="text-center mb-4">Notice List</h2>
    <table class="table table-striped">
        <thead class="thead-dark">
        <tr>
            <th>Id</th>
            <th>Category</th>
            <th>Title</th>
            <th>Writer</th>
            <th>Regdate</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="u">
            <tr>
                <td>${u.seq}</td>
                <td>${u.category}</td>
                <td>${u.title}</td>
                <td>${u.writer}</td>
                <td>${u.regdate}</td>
                <td>
                    <a href="view.jsp?seq=${u.seq}" class="btn btn-info btn-sm">View</a>
                    <a href="edit.jsp?seq=${u.seq}" class="btn btn-warning btn-sm">Edit</a>
                    <a href="delete_ok.jsp?seq=${u.seq}" class="btn btn-danger btn-sm" onclick="return confirm('REALLY DELETE?');">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <a href="write.jsp" class="btn btn-primary btn-lg">Create a New Notice</a>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<%@ include file="bottom.jsp" %>