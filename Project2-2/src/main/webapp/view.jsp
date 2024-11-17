<%@ page import="org.example.jsp_crud_db.dao.BoardDAO" %>
<%@ page import="org.example.jsp_crud_db.bean.BoardVO" %>

<%
    int seq = Integer.parseInt(request.getParameter("seq"));
    BoardDAO dao = new BoardDAO();
    BoardVO board = dao.getBoard(seq); // seq 값을 이용해 게시물 가져오기

    // board 객체를 request에 저장
    request.setAttribute("board", board);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Board Details</title>
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

<!-- 게시물 세부 정보 표시 -->
<div class="container mt-5">
    <h2 class="mb-4 text-center">Board Details</h2>
    <div class="card">
        <div class="card-header">
            <h4>${board.title}</h4>
        </div>
        <div class="card-body">
            <p><strong>Category:</strong> ${board.category}</p>
            <p><strong>Writer:</strong> ${board.writer}</p>
            <p><strong>Content:</strong></p>
            <p>${board.content}</p>
            <p><strong>Regdate:</strong> ${board.regdate}</p>
        </div>
        <div class="card-footer">
            <a href="list.jsp" class="btn btn-primary">Back to List</a>
        </div>
    </div>
</div>

<!-- Optional JavaScript and Bootstrap dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
