<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Balance</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<%
    int userIndex = (int) session.getAttribute("userIndex");
    double[] balances = (double[]) application.getAttribute("balances");

    out.println("<p>Current balance: " + balances[userIndex] + "</p>");
%>
    <a href="operations.jsp">Back to Dashboard</a>
</body>
</html>
