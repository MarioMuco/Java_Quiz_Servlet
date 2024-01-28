<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="klasat.Quiz" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Take Quiz</title>
     <script>
        // Countdown timer
        var secondsLeft = 59;

        function countdown() {
            var timerElement = document.getElementById("timer");
            timerElement.innerHTML = "Koha e mbetur: " + secondsLeft + " sekonda";

            if (secondsLeft <= 0) {
                // submit automatikisht kur timeri shkon ne 0
                document.getElementById("quizForm").submit();
            } else {
                secondsLeft--;
                setTimeout(countdown, 1000);
            }
        }

        // fillo timerin kur faqja behet load 
        window.onload = function() {
            countdown();
        };
    </script>
    <style>
     #timer {
            font-size: 18px;
            color: #e74c3c;
            margin-bottom: 20px;
            text-align: center;
        }
    
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
            text-align: center;
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
	//merren listat e kuizeve
	List<Quiz> quizListFromDB = (List<Quiz>) getServletContext().getAttribute("quizListFromDB");
	List<Quiz> quizList = (List<Quiz>) getServletContext().getAttribute("quizList");

	// merrrt titulli i kuizit te zgjedhur
	String quizTitle = request.getParameter("quizTitle");
	
	// gjendet kuizi i zgjedhur bazuar te titulli 
	Quiz selectedQuiz = null;
	if (quizList != null) {
	    for (Quiz quiz : quizList) {
	        if (quiz.getQuizTitle().equals(quizTitle)) {
	            selectedQuiz = quiz;
	            break;
	        }
	    }
	}
	if (selectedQuiz == null) {
	    response.sendRedirect("ErrorPage.jsp");
	    return;
	}
	    
	 // quizi i zgjedhur qe ndoshet ne database
	    Quiz selectedQuizFromDB = null;
	    for (Quiz quiz : quizListFromDB) {
	        if (quiz.getQuizTitle().equals(quizTitle)) {
	            selectedQuizFromDB = quiz;
	            break;
	        }
	    }
	    if (selectedQuizFromDB == null) {
	        response.sendRedirect("ErrorPage.jsp");
	        return;
	    }   
%>
    <div>
 		<!-- Timer 1 minuta -->
        <div id="timer"></div>
        
        <p><strong>Titulli:</strong> <%= selectedQuiz.getQuizTitle() %></p>
        <form id="quizForm" action="SubmitQuiz.jsp" method="post">
            <%
                for (int i = 0; i < selectedQuiz.getQuestionText().size(); i++) {
                    String questionText = selectedQuiz.getQuestionText().get(i);
            %>
                    <p><strong>Pyetja <%= i + 1 %> (5 pike) :</strong> <%= questionText %></p>
                    <%
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
    </div>

</body>
</html>
