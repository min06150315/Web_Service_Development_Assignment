<%@ include file="top.jsp" %>

<h2>Create a New Post</h2>
<form action="write_ok.jsp" method="post" name="writeForm" onsubmit="return validateWriteForm()">
    <label for="title">Title: </label>
    <input type="text" id="title" name="title"><br><br>

    <label for="author">Author: </label>
    <input type="text" id="author" name="author"><br><br>

    <label for="content">Content: </label>
    <textarea id="content" name="content"></textarea><br><br>

    <input type="submit" value="Submit">
</form>

<script>
    function validateWriteForm() {
        var title = document.forms["writeForm"]["title"].value;
        var author = document.forms["writeForm"]["author"].value;
        var content = document.forms["writeForm"]["content"].value;

        // 제목, 작성자, 내용이 비어있으면 경고 메시지 표시
        if (title == "" || author == "" || content == "") {
            alert("All fields must be filled out.");
            return false;  // 폼 제출을 막음
        }

        return true;  // 폼 제출 허용
    }
</script>

<%@ include file="bottom.jsp" %>
