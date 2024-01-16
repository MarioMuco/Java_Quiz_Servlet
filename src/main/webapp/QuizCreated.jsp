<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="klasat.Quiz" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Your existing head content -->
</head>
<body>

    <div class="quiz-container">
        <%
            // Retrieve the quiz list from the servlet context
            List<Quiz> quizList = (List<Quiz>) getServletContext().getAttribute("quizList");

            if (quizList != null) {
                for (Quiz quiz : quizList) {
        %>
                    <div class="quiz-box">
                        <!-- Your existing code to display quiz details -->
                    </div>
        <%
                }
            } else {
                out.println("No quizzes available.");
            }
        %>
    </div>

    <!-- Your existing code for additional links -->

</body>
</html>
