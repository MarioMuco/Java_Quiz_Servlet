<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="klasat.Quiz" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Take Quiz</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            height: 100vh;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        p {
            font-size: 16px;
            color: #333;
        }

        #quizForm {
		    background-color: #fff;
		    padding: 30px; /* Adjusted padding for a larger quiz box */
		    border-radius: 8px;
		    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		    margin-top: 20px;
		    width: 60%; /* Adjusted width for a larger quiz box */
		    margin: auto; /* Center the form on the page */
		}

        input[type="radio"] {
            margin-right: 5px;
        }

        input[type="submit"] {
            background-color: #3498db;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        #timer {
            font-size: 18px;
            color: #e74c3c;
            margin-bottom: 20px;
        }
    </style>

</head>
<body>

    <h2>Take Quiz</h2>

    <%
        // Record start time
        long startTime = System.currentTimeMillis();

        // Retrieve the quiz list from the servlet context
        List<Quiz> quizList = (List<Quiz>) getServletContext().getAttribute("quizList");

        // Get the selected quiz index from the parameter
        int quizIndex = Integer.parseInt(request.getParameter("quizIndex"));

        // Get the selected quiz based on the index
        Quiz selectedQuiz = quizList.get(quizIndex);
    %>

    <div>
        <p id="timer"></p> <!-- Display the timer -->

        <p><strong>Titulli:</strong> <%= selectedQuiz.getQuizTitle() %></p>

        <!-- Display questions with radio buttons for options -->
        <form id="quizForm" action="SubmitQuiz.jsp" method="post">
            <%
                // Loop through questions
                for (int i = 0; i < selectedQuiz.getQuestionText().size(); i++) {
                    String questionText = selectedQuiz.getQuestionText().get(i);
            %>
                    <p><strong>Pyetja <%= i + 1 %> (5 pike) :</strong> <%= questionText %></p>

                    <%
                        // Loop through options
                        for (int j = 0; j < 4; j++) {
                            String option = selectedQuiz.getAnswers().get(i * 4 + j);
                    %>
                            <input type="radio" name="answer<%= i %>" value="<%= option %>">
                            <%= option %><br>
                    <%
                        }
                    %>
                    <br>
            <%
                }
            %>

            <input type="submit" value="Submit Quiz">
        </form>

        <!-- Hidden form to submit time to the second page -->
        <form id="timeForm" action="SubmitQuiz.jsp" method="post">
            <input type="hidden" name="startTime" value="<%= startTime %>">
        </form>
    </div>

</body>
</html>
