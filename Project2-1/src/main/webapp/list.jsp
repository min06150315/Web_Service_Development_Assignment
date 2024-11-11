<%@ include file="top.jsp" %>

<h2>Post List</h2>
<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Author</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <%-- Mock Data --%>
    <tr>
        <td>1</td>
        <td>Post Title 1</td>
        <td>John</td>
        <td><a href="edit.jsp?id=1" style="color: blue">Edit</a> | <a href="delete_ok.jsp?id=1" style="color: red">Delete</a></td>
    </tr>
    <tr>
        <td>2</td>
        <td>Post Title 2</td>
        <td>Jane</td>
        <td><a href="edit.jsp?id=2" style="color: blue">Edit</a> | <a href="delete_ok.jsp?id=2" style="color: red">Delete</a></td>
    </tr>
    <tr>
        <td>3</td>
        <td>Post Title 3</td>
        <td>Tom</td>
        <td><a href="edit.jsp?id=3" style="color: blue">Edit</a> | <a href="delete_ok.jsp?id=3" style="color: red">Delete</a></td>
    </tr>
    <tr>
        <td>4</td>
        <td>Post Title 4</td>
        <td>Henry</td>
        <td><a href="edit.jsp?id=4" style="color: blue">Edit</a> | <a href="delete_ok.jsp?id=4" style="color: red">Delete</a></td>
    </tr>
    <tr>
        <td>5</td>
        <td>Post Title 5</td>
        <td>Bryan</td>
        <td><a href="edit.jsp?id=5" style="color: blue">Edit</a> | <a href="delete_ok.jsp?id=5" style="color: red">Delete</a></td>
    </tr>
    </tbody>
</table>

<%@ include file="bottom.jsp" %>
