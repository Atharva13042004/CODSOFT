<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Deposit Result</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<%
    int userIndex = (int) session.getAttribute("userIndex");
    double[] balances = (double[]) application.getAttribute("balances");

    double depositAmount = Double.parseDouble(request.getParameter("amount"));
    if (depositAmount > 0) {
        balances[userIndex] += depositAmount;
        application.setAttribute("balances", balances);
        out.println("<p>Deposit successful. New balance: " + balances[userIndex] + "</p>");
    } else {
        out.println("<p>Invalid amount. Deposit failed.</p>");
    }
%>
    <a href="operations.jsp">Back to Dashboard</a>
</body>
</html>
