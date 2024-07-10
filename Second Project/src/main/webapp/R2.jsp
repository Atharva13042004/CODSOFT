<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Information Result</title>
    <link rel="stylesheet" href="S2.css">
</head>
<body>
    <div class="container">
        <h1>Student Information</h1>
        <%
            String name = request.getParameter("name");
            String studentClass = request.getParameter("studentClass");
            String department = request.getParameter("department");
            String roll = request.getParameter("roll");

            int subject1 = 0, subject2 = 0, subject3 = 0, subject4 = 0, subject5 = 0;

            // Parse each subject's mark with error handling
            try {
                subject1 = Integer.parseInt(request.getParameter("subject1"));
                subject2 = Integer.parseInt(request.getParameter("subject2"));
                subject3 = Integer.parseInt(request.getParameter("subject3"));
                subject4 = Integer.parseInt(request.getParameter("subject4"));
                subject5 = Integer.parseInt(request.getParameter("subject5"));
            } catch (NumberFormatException e) {
                // Handle parsing errors here
                // For example, set default values or display an error message
                out.println("Error parsing marks: " + e.getMessage());
            }

            int sum = subject1 + subject2 + subject3 + subject4 + subject5;
            int average = (sum / 5);
            double percentage = (sum / 500.0) * 100; // Assuming total marks are 500
            
            String overallGrade = calculateGrade(average);
            String overallPassFail = (average >= 40) ? "Pass" : "Fail";
        %>
        <p><strong>Name:</strong> <%= name %></p>
        <p><strong>Class:</strong> <%= studentClass %></p>
        <p><strong>Department:</strong> <%= department %></p>
        <p><strong>Roll No:</strong> <%= roll %></p>

        <h2>Marks, Grades, and Pass/Fail Status:</h2>
        <p><strong>Marks of subject 1:</strong> <%= subject1 %></p>
        <p><strong>Grade:</strong> <%= calculateGrade(subject1) %></p>
        <p><strong>Status:</strong> <%= (subject1 >= 40) ? "Pass" : "Fail" %></p>

        <p><strong>Marks of subject 2:</strong> <%= subject2 %></p>
        <p><strong>Grade:</strong> <%= calculateGrade(subject2) %></p>
        <p><strong>Status:</strong> <%= (subject2 >= 40) ? "Pass" : "Fail" %></p>

        <p><strong>Marks of subject 3:</strong> <%= subject3 %></p>
        <p><strong>Grade:</strong> <%= calculateGrade(subject3) %></p>
        <p><strong>Status:</strong> <%= (subject3 >= 40) ? "Pass" : "Fail" %></p>

        <p><strong>Marks of subject 4:</strong> <%= subject4 %></p>
        <p><strong>Grade:</strong> <%= calculateGrade(subject4) %></p>
        <p><strong>Status:</strong> <%= (subject4 >= 40) ? "Pass" : "Fail" %></p>

        <p><strong>Marks of subject 5:</strong> <%= subject5 %></p>
        <p><strong>Grade:</strong> <%= calculateGrade(subject5) %></p>
        <p><strong>Status:</strong> <%= (subject5 >= 40) ? "Pass" : "Fail" %></p>

        <h2>Overall Results:</h2>
        <p><strong>Total Marks:</strong> <%= sum %></p>
        <p><strong>Average Marks:</strong> <%= average %></p>
        <p><strong>Percentage:</strong> <%= String.format("%.2f", percentage) %>%</p>
        <p><strong>Overall Grade:</strong> <%= overallGrade %></p>
        <p><strong>Overall Result:</strong> <%= overallPassFail %></p>
    </div>

    <%! 
        public String calculateGrade(int marks) {
            if (marks >= 90) return "A";
            else if (marks >= 80) return "B";
            else if (marks >= 70) return "C";
            else if (marks >= 60) return "D";
            else if (marks >= 50) return "E";
            else return "F";
        }
    %>
</body>
</html>
