<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Operations Dashboard</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<%
    int userIndex = (int) session.getAttribute("userIndex");
    double[] balances = (double[]) application.getAttribute("balances");

    double initialBalance = balances[userIndex];
%>
    <h2>Welcome to the Operations Dashboard</h2>
    <p>Initial Balance: <%= initialBalance %></p>
    <form action="operations.jsp" method="post">
        <button name="operation" value="deposit" type="submit">Deposit</button>
        <button name="operation" value="withdraw" type="submit">Withdraw</button>
        <button name="operation" value="displayBalance" type="submit">Display Balance</button>
        <button name="operation" value="listUsers" type="submit">List Users</button>
        <button name="operation" value="logout" type="submit">Logout</button>
    </form>

<%
    String operation = request.getParameter("operation");
    if (operation != null) {
        switch (operation) {
            case "deposit":
%>
    <h3>Deposit</h3>
    <form action="deposit.jsp" method="post">
        <label for="amount">Enter amount to deposit:</label>
        <input type="number" id="amount" name="amount" required>
        <button type="submit">Deposit</button>
    </form>
<%
                break;
            case "withdraw":
%>
    <h3>Withdraw</h3>
    <form action="withdraw.jsp" method="post">
        <label for="amount">Enter amount to withdraw:</label>
        <input type="number" id="amount" name="amount" required>
        <button type="submit">Withdraw</button>
    </form>
<%
                break;
            case "displayBalance":
%>
    <h3>Current Balance</h3>
    <p>Your current balance is: <%= initialBalance %></p>
    <a href="operations.jsp">Back to Dashboard</a>
<%
                break;
            case "listUsers":
                int userCount = (int) application.getAttribute("userCount");
                String[] usernames = (String[]) application.getAttribute("usernames");
%>
    <h3>List of Users</h3>
    <ul>
<%
                for (int i = 0; i < userCount; i++) {
%>
        <li><%= usernames[i] %> 
            <a href="deleteUser.jsp?username=<%= usernames[i] %>">Delete</a> 
            <a href="updateUser.jsp?username=<%= usernames[i] %>">Update</a>
        </li>
<%
                }
%>
    </ul>
    <a href="operations.jsp">Back to Dashboard</a>
<%
                break;
            case "logout":
                session.invalidate();
                response.sendRedirect("index.html");
                break;
            default:
                out.println("<p>Invalid operation. Please try again.</p>");
        }
    }
%>
</body>
</html>
