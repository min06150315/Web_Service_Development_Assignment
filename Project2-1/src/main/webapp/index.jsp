<!-- index.jsp -->
<%@ include file="top.jsp" %>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

<div class="container mt-5">
    <div class="text-center mb-4">
        <h2 class="display-4">Web Service Development</h2>
        <p class="lead">Welcome to the JSP Project - CRUD Frontend page </p>
    </div>

    <!-- Navigation Links -->
    <div class="d-flex justify-content-center">
        <div class="list-group w-50">
            <a href="list.jsp" class="list-group-item list-group-item-action list-group-item-info mb-2 rounded-3 shadow-sm">View Notice List</a>
            <a href="write.jsp" class="list-group-item list-group-item-action list-group-item-primary mb-2 rounded-3 shadow-sm">Create a New Notice</a>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<%@ include file="bottom.jsp" %>