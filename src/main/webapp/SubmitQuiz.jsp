<!-- SubmitQuiz.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="klasat.Quiz" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Submit Quiz</title>
     <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            margin: 20px;
        }

        h2 {
            color: #333;
            text-align: center;
        }

        div {
            background-color: #fff;
            padding: 20px;
            margin: 20px auto;
            max-width: 300px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        p {
            margin: 0;
        }

        strong {
            color: #007bff;
        }


        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }
    </style>
</head>
    <h2>Rezultatet e Quiz-it</h2>

    <%
        // Retrieve the quiz list from the servlet context
        List<Quiz> quizList = (List<Quiz>) getServletContext().getAttribute("quizList");
		//Retrieve the quiz list from the servlet context (using quizListFromDB)
		List<Quiz> quizListFromDB = (List<Quiz>) getServletContext().getAttribute("quizListFromDB");
		
		quizList.addAll(quizListFromDB);

         // Get the selected quiz index from the parameter
            int quizIndex = 0; // Default value or any appropriate default
    
           // Check if the parameter is not null before parsing
            String quizIndexParam = request.getParameter("quizIndex");
           if (quizIndexParam != null && !quizIndexParam.isEmpty()) {
                quizIndex = Integer.parseInt(quizIndexParam);
            }
    
           // Get the selected quiz based on the index
            Quiz selectedQuiz = quizList.get(quizIndex);


        // Initialize the score
        int score = 0;

        // Loop through questions
        for (int i = 0; i < selectedQuiz.getQuestionText().size(); i++) {
            String correctAnswer = selectedQuiz.getCorrectAnswer().get(i);
            String chosenAnswer = request.getParameter("answer" + i);

            // Check if the chosen answer is correct
            if (correctAnswer.equals(chosenAnswer)) {
                score += 5; // Increment the score by 5 for each correct answer
            }
    %>

            <div>
                <p><strong>Pyetja <%= i + 1 %> (5 pike):</strong> <%= selectedQuiz.getQuestionText().get(i) %></p>
                <p><strong>Pergjigjia e sakte:</strong> <%= correctAnswer %></p>
                <p><strong>Pergjigjia juaj:</strong> <%= chosenAnswer %></p>
            </div>
           

    <%
        }
    %>

    <div>
        <p><strong>Piket totale:</strong> <%= score %> pike</p>
    </div>
    <a  href="Profili.jsp" > Profili</a>

</body>
</html>
