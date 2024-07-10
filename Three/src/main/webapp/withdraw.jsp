<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Withdrawal Result</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<%
    int userIndex = (int) session.getAttribute("userIndex");
    double[] balances = (double[]) application.getAttribute("balances");

    double withdrawAmount = Double.parseDouble(request.getParameter("amount"));
    if (withdrawAmount > 0 && withdrawAmount <= balances[userIndex]) {
        balances[userIndex] -= withdrawAmount;
        application.setAttribute("balances", balances);
        out.println("<p>Withdrawal successful. New balance: " + balances[userIndex] + "</p>");
    } else {
        out.println("<p>Invalid amount or insufficient balance. Withdrawal failed.</p>");
    }
%>
    <a href="operations.jsp">Back to Dashboard</a>
</body>
</html>
