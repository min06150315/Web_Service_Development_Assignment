<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.example.jsp_crud_db.dao.BoardDAO, org.example.jsp_crud_db.bean.BoardVO, java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h1>List</h1>
<%
    BoardDAO boardDAO = new BoardDAO();
    List<BoardVO> list = boardDAO.getBoardList();
    request.getAttribute();
%>


<table>
    <tr
</table>