<%@ page import="org.example.jsp_crud_db.dao.BoardDAO" %>
<%@ page import="org.example.jsp_crud_db.bean.BoardVO" %>

<%@ include file="top.jsp" %>

<%
    int seq = Integer.parseInt(request.getParameter("seq"));
    BoardDAO boardDAO = new BoardDAO();
    BoardVO u = boardDAO.getBoard(seq);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Post</title>
    <!-- Bootstrap CSS 링크 -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<!-- 네비게이션 바 -->
<header class="bg-primary text-white py-4">
    <div class="container d-flex justify-content-between align-items-center">
        <a href="index.jsp" class="text-white text-decoration-none">
            <h1 class="mb-0">JSP Project</h1>
        </a>
        <nav>
            <ul class="nav">
                <li class="nav-item">
                    <a class="nav-link text-white" href="list.jsp">List</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="write.jsp">Create</a>
                </li>
            </ul>
        </nav>
    </div>
</header>

<!-- Edit Form -->
<div class="container mt-5">
    <h1 class="mb-4 text-center">Edit Post</h1>
    <form action="edit_ok.jsp" method="post">
        <input type="hidden" name="seq" value="<%= u.getSeq() %>" />

        <div class="form-group">
            <label for="category">Category</label>
            <input type="text" class="form-control" id="category" name="category" value="<%= u.getCategory() %>" required>
        </div>

        <div class="form-group">
            <label for="title">Title</label>
            <input type="text" class="form-control" id="title" name="title" value="<%= u.getTitle() %>" required>
        </div>

        <div class="form-group">
            <label for="writer">Writer</label>
            <input type="text" class="form-control" id="writer" name="writer" value="<%= u.getWriter() %>" required>
        </div>

        <div class="form-group">
            <label for="content">Content</label>
            <textarea class="form-control" id="content" name="content" rows="5" required><%= u.getContent() %></textarea>
        </div>

        <div class="form-group d-flex justify-content-between">
            <input type="submit" value="Edit Post" class="btn btn-primary">
            <input type="button" value="Cancel" class="btn btn-secondary" onclick="history.back()">
        </div>
    </form>
</div>

<!-- Optional JavaScript and Bootstrap dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>

<%@ include file="bottom.jsp" %>
