<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Logout</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<%
    session.invalidate();
    response.sendRedirect("index.html");
%>
</body>
</html>
