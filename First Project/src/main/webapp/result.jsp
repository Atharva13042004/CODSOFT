<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Number Guessing Game</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<%
    int targetNumber;
    int attempts;
    int difficulty = Integer.parseInt(request.getParameter("difficulty"));
    int maxAttempts;

    switch(difficulty) {
        case 1:
            maxAttempts = 10;
            break;
        case 2:
            maxAttempts = 5;
            break;
        case 3:
            maxAttempts = 3;
            break;
        default:
            maxAttempts = 5;
    }

    if (request.getParameter("guess") != null) {
        int guess = Integer.parseInt(request.getParameter("guess"));
        targetNumber = Integer.parseInt(request.getParameter("targetNumber"));
        attempts = Integer.parseInt(request.getParameter("attempts")) + 1;

        String message = "";
        boolean guessCorrectly = false;

        if (guess == targetNumber) {
            guessCorrectly = true;
            message = "Congratulations! You have guessed the correct number in " + attempts + " attempts.";
        } else if (guess > targetNumber) {
            message = "Too High!!! Attempts remaining: " + (maxAttempts - attempts);
        } else {
            message = "Too Low!!! Attempts remaining: " + (maxAttempts - attempts);
        }

        if (attempts >= maxAttempts && !guessCorrectly) {
            message = "Oops, You didn't guess the correct number. The correct number was " + targetNumber + ".";
        }
%>
    <div class="container">
        <h1>Number Guessing Game</h1>
        <p><%= message %></p>
        <% if (!guessCorrectly && attempts < maxAttempts) { %>
            <form action="result.jsp" method="post">
                <input type="number" name="guess" min="1" max="100" required>
                <input type="hidden" name="targetNumber" value="<%= targetNumber %>">
                <input type="hidden" name="attempts" value="<%= attempts %>">
                <input type="hidden" name="difficulty" value="<%= difficulty %>">
                <button type="submit">Submit</button>
            </form>
        <% } else { %>
           <button><a href="index.html">Play Again</a></button> 
        <% } %>
    </div>
</body>
</html>
<%
    } else {
        targetNumber = new Random().nextInt(100) + 1;
        attempts = 0;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Number Guessing Game</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h1>Number Guessing Game</h1>
        <p>Guess the Number</p>
        <form action="result.jsp" method="post">
            <input type="number" name="guess" min="1" max="100" required>
            <input type="hidden" name="targetNumber" value="<%= targetNumber %>">
            <input type="hidden" name="attempts" value="<%= attempts %>">
            <input type="hidden" name="difficulty" value="<%= difficulty %>">
            <button type="submit">Submit</button>
        </form>
    </div>
</body>
</html>
<%
    }
%>
