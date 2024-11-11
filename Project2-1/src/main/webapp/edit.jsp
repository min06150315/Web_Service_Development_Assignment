<%@ include file="top.jsp" %>

<h2>Edit Post</h2>
<form action="edit_ok.jsp" method="post" name="editForm" onsubmit="return validateEditForm()">
    <input type="hidden" name="id" value="${param.id}">

    <label for="title">Title: </label>
    <input type="text" id="title" name="title" value="${param.title}"><br><br>

    <label for="author">Author: </label>
    <input type="text" id="author" name="author" value="${param.author}"><br><br>

    <label for="content">Content: </label>
    <textarea id="content" name="content">${param.content}</textarea><br><br>

    <input type="submit" value="Submit">
</form>

<script>
    function validateEditForm() {
        var title = document.forms["editForm"]["title"].value;
        var author = document.forms["editForm"]["author"].value;
        var content = document.forms["editForm"]["content"].value;

        // 제목, 작성자, 내용이 비어있으면 경고 메시지 표시
        if (title == "" || author == "" || content == "") {
            alert("All fields must be filled out.");
            return false;  // 폼 제출을 막음
        }

        return true;  // 폼 제출 허용
    }
</script>

<%@ include file="bottom.jsp" %>
