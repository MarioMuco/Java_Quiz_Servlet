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
        List<Quiz> quizList = (List<Quiz>) getServletContext().getAttribute("quizList");
		List<Quiz> quizListFromDB = (List<Quiz>) getServletContext().getAttribute("quizListFromDB");
		quizList.addAll(quizListFromDB);

         		// indeksi i kuizit te zgjedhur
        		 int quizIndex = 0; 
            	String quizIndexParam = request.getParameter("quizIndex");
          			 if (quizIndexParam != null && !quizIndexParam.isEmpty()) {
               			 quizIndex = Integer.parseInt(quizIndexParam);
            		}
          		Quiz selectedQuiz = quizList.get(quizIndex);


        // variabli ku mbahen piket
        int score = 0;

        // Loop permes pyrtjeve
        for (int i = 0; i < selectedQuiz.getQuestionText().size(); i++) {
            String correctAnswer = selectedQuiz.getCorrectAnswer().get(i);
            String chosenAnswer = request.getParameter("answer" + i);

            // kontrollo nese pergjigja e zgjedhur eshte e sakte 
            if (correctAnswer.equals(chosenAnswer)) {
                score += 5; // cdo pyetje e sakte te jepe 5 pike 
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
