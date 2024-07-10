<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="style.css">
    <title>Update User</title>
</head>
<body>
<div class="container">
<%
    String usernameToUpdate = request.getParameter("username");
    if (usernameToUpdate != null && !usernameToUpdate.isEmpty()) {
        String[] usernames = (String[]) application.getAttribute("usernames");
        int userCount = (int) application.getAttribute("userCount");

        // Find the index of the user to update
        int indexToUpdate = -1;
        for (int i = 0; i < userCount; i++) {
            if (usernames[i].equals(usernameToUpdate)) {
                indexToUpdate = i;
                break;
            }
        }

        if (indexToUpdate != -1) {
%>
    <h2>Update User: <%= usernames[indexToUpdate] %></h2>
    <form action="processUpdate.jsp" method="post">
        <input type="hidden" name="username" value="<%= usernames[indexToUpdate] %>">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="" required><br>
        <label for="surname">Surname:</label>
        <input type="text" id="surname" name="surname" value="" required><br>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="" required><br>
        <button type="submit">Update</button>
        <button type="button" onclick="window.location.href='operations.jsp'">Back to Dashboard</button>
    </form>
<%
        } else {
            out.println("<h2>User '" + usernameToUpdate + "' not found.</h2>");
        }
    } else {
        out.println("<h2>No username specified for updating.</h2>");
    }
%>
</div>
</body>
</html>
