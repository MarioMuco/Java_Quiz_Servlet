<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="klasat.Quiz" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.util.ArrayList" %>

<%@ page language="java" %>

<%
    // Quizet e krijuara
    List<Quiz> quizList = (List<Quiz>) getServletContext().getAttribute("quizList");
    if (quizList == null) {
        quizList = new ArrayList<>(); 
    }

    // Quizet ne database
    List<Quiz> quizListFromDB = (List<Quiz>) getServletContext().getAttribute("quizListFromDB");
    if (quizListFromDB == null) {
    	quizListFromDB = new ArrayList<>(); 
    }
%>
<%
    // Lidhja me databasen 
    String url = "jdbc:mysql://localhost:3306/sys";
    String user = "root";
    String password = "root";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }

    try (Connection con = DriverManager.getConnection(url, user, password)) {
        String selectQuery = "SELECT * FROM questions";

        try (PreparedStatement preparedStatement = con.prepareStatement(selectQuery)) {
            ResultSet resultSet = preparedStatement.executeQuery(); //ne resultset ruhen te gjithe quizet

            while (resultSet.next()) {
                // krijohen quiz object per cdo resultset 
                Quiz quiz = new Quiz();
                quiz.setQuizTitle(resultSet.getString("quiz_title"));

                List<String> questionTextList = new ArrayList<>();
                List<String> answersList = new ArrayList<>();
                List<String> correctAnswerList = new ArrayList<>();

                questionTextList.add(resultSet.getString("question_1"));
                answersList.add(resultSet.getString("answer_1_1"));
                answersList.add(resultSet.getString("answer_1_2"));
                answersList.add(resultSet.getString("answer_1_3"));
                answersList.add(resultSet.getString("answer_1_4"));
                correctAnswerList.add(resultSet.getString("correct_answer_1"));

                questionTextList.add(resultSet.getString("question_2"));
                answersList.add(resultSet.getString("answer_2_1"));
                answersList.add(resultSet.getString("answer_2_2"));
                answersList.add(resultSet.getString("answer_2_3"));
                answersList.add(resultSet.getString("answer_2_4"));
                correctAnswerList.add(resultSet.getString("correct_answer_2"));

                quiz.setQuestionText(questionTextList);
                quiz.setAnswers(answersList);
                quiz.setCorrectAnswer(correctAnswerList);

                // shton quiz object ne list
                quizListFromDB.add(quiz);
                quizList.add(quiz);
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    getServletContext().setAttribute("quizListFromDB", quizListFromDB);
    getServletContext().setAttribute("quizList", quizList);
%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz List</title>
    <script>
    function takeQuiz(quizTitle) {
        window.location.href = "TakeQuiz.jsp?quizTitle=" + encodeURIComponent(quizTitle);
    }
    function editQuiz(quizTitle) {
        window.location.href = "UpdateQuiz.jsp?quizTitle=" + encodeURIComponent(quizTitle);
    }

    function deleteQuiz(quizTitle) {
        window.location.href = "DeleteQuizServlet?quizTitle=" + encodeURIComponent(quizTitle);
    }
</script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            flex-direction: column; /* Updated to vertical flex-direction */
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px; /* Added margin-bottom to provide space between h2 and content */
        }

        .quiz-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 15px;
        }

        .quiz-box {
            background-color: #fff;
            padding: 10px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px; /* Adjust width as needed */
        }

        p {
            text-align: center;
            font-size: 16px;
            margin-bottom: 10px;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            margin-bottom: 5px;
        }

        a {
            display: block;
            width: 100%;
            padding: 10px;
            text-align: center;
            text-decoration: none;
            background-color: rgb(43, 198, 102);
            color: #fff;
            border-radius: 6px;
            margin-top: 10px;
        }

        a:hover {
            background-color: rgb(12, 186, 90);
        }
         .quiz-button {
	        background-color: rgb(43, 198, 102);
	        color: #fff;
	        padding: 10px;
	        border: none;
	        border-radius: 6px;
	        margin-top: 10px;
	        cursor: pointer;
	        transition: background-color 0.3s ease;
    	}

    .quiz-button:hover {
        background-color: rgb(12, 186, 90);
    }
    </style>
</head>
<body>

 <h2>Lista e Quiz-eve</h2>
   <div class="quiz-container">
<%
	//lidhja me databasen 
	Class.forName("com.mysql.cj.jdbc.Driver");

try (Connection con = DriverManager.getConnection(url, user, password)) {
    System.out.println("Connected to the database!");
    
    // Select query
    Statement statement = con.createStatement();
    String selectQuery = "SELECT * FROM questions";
    ResultSet resultSet = statement.executeQuery(selectQuery);
    
    while (resultSet.next()) {
%>

 <div class="quiz-box">
                    <p><strong>Titulli:</strong> <%= resultSet.getString("quiz_title") %></p>
                    <p><strong>Pyetjet:</strong></p>
                    <ul>
                       <%= resultSet.getString("question_1") %>
                    </ul>
                    <ul>
                       <%= resultSet.getString("question_2") %>
                    </ul>
					<button class="quiz-button" onclick="takeQuiz('<%= resultSet.getString("quiz_title") %>')">Take</button>
					<button class="quiz-button" onclick="editQuiz('<%= resultSet.getString("quiz_title") %>')">Edit</button>
					<button class="quiz-button" onclick="deleteQuiz('<%= resultSet.getString("quiz_title") %>')">Delete</button>
                </div>
<%
    }
%>

<%
	} catch (SQLException e) {
	    System.err.println("Failure");
	    e.printStackTrace();
	}
%>
</div>
  
</body>
</html>
