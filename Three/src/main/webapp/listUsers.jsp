<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>List of Users</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<%
    int userCount = (int) application.getAttribute("userCount");
    String[] usernames = (String[]) application.getAttribute("usernames");

    out.println("<h2>List of Users:</h2>");
    out.println("<ul>");
    for (int i = 0; i < userCount; i++) {
        out.println("<li>" + usernames[i] + "</li>");
    }
    out.println("</ul>");
%>
    <a href="index.html">Back to Dashboard</a>
</body>
</html>
