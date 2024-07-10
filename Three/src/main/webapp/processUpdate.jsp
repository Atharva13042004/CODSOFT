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
    String name = request.getParameter("name");
    String surname = request.getParameter("surname");
    String email = request.getParameter("email");

    if (usernameToUpdate != null && !usernameToUpdate.isEmpty()) {
        String[] usernames = (String[]) application.getAttribute("usernames");
        String[] names = (String[]) application.getAttribute("names");
        String[] surnames = (String[]) application.getAttribute("surnames");
        String[] emails = (String[]) application.getAttribute("emails");
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
            // Update user details
            names[indexToUpdate] = name;
            surnames[indexToUpdate] = surname;
            emails[indexToUpdate] = email;

            application.setAttribute("names", names);
            application.setAttribute("surnames", surnames);
            application.setAttribute("emails", emails);

            out.println("<h2>User '" + usernameToUpdate + "' updated successfully.</h2>");
        } else {
            out.println("<h2>User '" + usernameToUpdate + "' not found.</h2>");
        }
    } else {
        out.println("<h2>No username specified for updating.</h2>");
    }
%>
    <button onclick="window.location.href='operations.jsp'">Back to Dashboard</button>
</div>
</body>
</html>
