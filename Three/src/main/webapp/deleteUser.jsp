<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="style.css">
    <title>Delete User</title>
</head>
<body>
<div class="container">
<%
    String usernameToDelete = request.getParameter("username");
    if (usernameToDelete != null && !usernameToDelete.isEmpty()) {
        String[] usernames = (String[]) application.getAttribute("usernames");
        int userCount = (int) application.getAttribute("userCount");

        // Find the index of the user to delete
        int indexToDelete = -1;
        for (int i = 0; i < userCount; i++) {
            if (usernames[i].equals(usernameToDelete)) {
                indexToDelete = i;
                break;
            }
        }

        if (indexToDelete != -1) {
            // Shift array elements to remove the user
            for (int i = indexToDelete; i < userCount - 1; i++) {
                usernames[i] = usernames[i + 1];
            }

            // Update user count and attributes
            userCount--;
            application.setAttribute("usernames", usernames);
            application.setAttribute("userCount", userCount);

            out.println("<h2>User '" + usernameToDelete + "' deleted successfully.</h2>");
        } else {
            out.println("<h2>User '" + usernameToDelete + "' not found.</h2>");
        }
    } else {
        out.println("<h2>No username specified for deletion.</h2>");
    }
%>
    <button onclick="window.location.href='operations.jsp'">Back to Dashboard</button>
</div>
</body>
</html>
