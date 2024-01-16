<!-- EditQuiz.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="klasat.Quiz" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Quiz</title>
</head>
<body>

    <h2>Edit Quiz</h2>

    <%
        // Retrieve the quiz list from the servlet context
        List<Quiz> quizList = (List<Quiz>) getServletContext().getAttribute("quizList");

        // Get the index of the quiz to be edited from the request parameter
        String indexString = request.getParameter("quizIndex");
        int quizIndex = Integer.parseInt(indexString);

        // Retrieve the quiz to be edited
        Quiz quizToEdit = quizList.get(quizIndex);
    %>

    <form action="UpdateQuizServlet" method="post">
        <!-- Quiz details -->
        <label for="quizTitle">Quiz Title:</label>
        <input type="text" name="quizTitle" value="<%= quizToEdit.getQuizTitle() %>" required><br><br>

        <!-- Questions and Answers -->
        <%
            // Loop through questions and answers
            for (int i = 0; i < quizToEdit.getQuestionText().size(); i++) {
        %>
                <label for="question<%= i %>">Question <%= i + 1 %>:</label>
                <input type="text" name="question<%= i %>" value="<%= quizToEdit.getQuestionText().get(i) %>" required><br>

                <!-- Answers -->
                <label>Answers:</label><br>
                <%
                    // Loop through answers
                    for (int j = 0; j < 4; j++) {
                        String answer = quizToEdit.getAnswers().get(i * 4 + j);
                        boolean isCorrect = answer.equals(quizToEdit.getCorrectAnswer());
                %>
                        <input type="text" name="answer<%= i %>" value="<%= answer %>" required>
                        <input type="radio" name="correctAnswer<%= i %>" value="<%= j %>" <%= isCorrect ? "checked" : "" %>> Correct<br>
                <%
                    }
                %>
                <br>
        <%
            }
        %>

        <!-- Hidden input field to store the quiz index -->
        <input type="hidden" name="quizIndex" value="<%= quizIndex %>">

        <!-- Submit button -->
        <input type="submit" value="Update Quiz">
    </form>

    <p><a href="QuizCreated.jsp">Go back to quiz list</a></p>

</body>
</html>
