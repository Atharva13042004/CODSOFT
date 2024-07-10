<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Login Result</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h2>Login Result</h2>
    <div id="form-container">
        <%
            // Existing login logic
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String[] usernames = (String[]) application.getAttribute("usernames");
            String[] passwords = (String[]) application.getAttribute("passwords");
            int userCount = (int) application.getAttribute("userCount");

            boolean userExists = false;
            int userIndex = -1;
            for (int i = 0; i < userCount; i++) {
                if (usernames[i].equals(username)) {
                    userExists = true;
                    userIndex = i;
                    break;
                }
            }

            if (!userExists) {
        %>
                <p id="login-message" style="color:red;">Username does not exist. Please sign up first.</p>
        <%
            } else {
                if (passwords[userIndex].equals(password)) {
                    session.setAttribute("userIndex", userIndex);
                    response.sendRedirect("operations.jsp");
                } else {
        %>
                    <p id="login-message" style="color:red;">Incorrect password. Login failed.</p>
        <%
                }
            }
        %>
        <a href="index.html">Back to Dashboard</a>
    </div>
</body>
</html>
