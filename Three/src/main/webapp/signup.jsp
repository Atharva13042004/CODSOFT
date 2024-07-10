<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Signup Result</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<%
    // Existing signup logic
    final int MAX_USERS = 100;
    int userCount = (application.getAttribute("userCount") != null) ? (int) application.getAttribute("userCount") : 0;
    String[] names = (application.getAttribute("names") != null) ? (String[]) application.getAttribute("names") : new String[MAX_USERS];
    String[] surnames = (application.getAttribute("surnames") != null) ? (String[]) application.getAttribute("surnames") : new String[MAX_USERS];
    String[] dobs = (application.getAttribute("dobs") != null) ? (String[]) application.getAttribute("dobs") : new String[MAX_USERS];
    String[] addresses = (application.getAttribute("addresses") != null) ? (String[]) application.getAttribute("addresses") : new String[MAX_USERS];
    String[] emails = (application.getAttribute("emails") != null) ? (String[]) application.getAttribute("emails") : new String[MAX_USERS];
    String[] genders = (application.getAttribute("genders") != null) ? (String[]) application.getAttribute("genders") : new String[MAX_USERS];
    String[] accountTypes = (application.getAttribute("accountTypes") != null) ? (String[]) application.getAttribute("accountTypes") : new String[MAX_USERS];
    String[] usernames = (application.getAttribute("usernames") != null) ? (String[]) application.getAttribute("usernames") : new String[MAX_USERS];
    String[] passwords = (application.getAttribute("passwords") != null) ? (String[]) application.getAttribute("passwords") : new String[MAX_USERS];
    double[] balances = (application.getAttribute("balances") != null) ? (double[]) application.getAttribute("balances") : new double[MAX_USERS];

    if (userCount >= MAX_USERS) {
        out.println("<p>User limit reached. Cannot sign up more users.</p>");
    } else {
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String dob = request.getParameter("dob");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String accountType = request.getParameter("accountType");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        boolean usernameExists = false;
        for (int i = 0; i < userCount; i++) {
            if (usernames[i].equals(username)) {
                usernameExists = true;
                break;
            }
        }

        if (usernameExists) {
            out.println("<p>Username already exists. Please choose a different username.</p>");
        } else if (!password.equals(confirmPassword)) {
            out.println("<p>Passwords do not match. Signup failed.</p>");
        } else {
            // Store user information
            names[userCount] = name;
            surnames[userCount] = surname;
            dobs[userCount] = dob;
            addresses[userCount] = address;
            emails[userCount] = email;
            genders[userCount] = gender;
            accountTypes[userCount] = accountType;
            usernames[userCount] = username;
            passwords[userCount] = password;
            balances[userCount] = 0.0;
            userCount++;

            // Update application scope attributes
            application.setAttribute("names", names);
            application.setAttribute("surnames", surnames);
            application.setAttribute("dobs", dobs);
            application.setAttribute("addresses", addresses);
            application.setAttribute("emails", emails);
            application.setAttribute("genders", genders);
            application.setAttribute("accountTypes", accountTypes);
            application.setAttribute("usernames", usernames);
            application.setAttribute("passwords", passwords);
            application.setAttribute("balances", balances);
            application.setAttribute("userCount", userCount);

            out.println("<p>Signup successful!</p>");
            out.println("<p>Name: " + name + "</p>");
            out.println("<p>Surname: " + surname + "</p>");
            out.println("<p>Date of Birth: " + dob + "</p>");
            out.println("<p>Address: " + address + "</p>");
            out.println("<p>Email: " + email + "</p>");
            out.println("<p>Gender: " + gender + "</p>");
            out.println("<p>Account Type: " + accountType + "</p>");
            out.println("<p>Username: " + username + "</p>");
        }
    }
%>
    <a href="index.html">Back to Dashboard</a>
</body>
</html>
