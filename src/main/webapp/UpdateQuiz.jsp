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
    // Lidhja me databazën 
    String url = "jdbc:mysql://localhost:3306/sys";
    String user = "root";
    String password = "root";
    Class.forName("com.mysql.cj.jdbc.Driver");

    // Quizet e krijuara
    List<Quiz> quizList = (List<Quiz>) getServletContext().getAttribute("quizList");
    if (quizList == null) {
        quizList = new ArrayList<>(); 
    }

    // Quizet në bazën e të dhënave
    List<Quiz> quizListFromDB = (List<Quiz>) getServletContext().getAttribute("quizListFromDB");
    if (quizListFromDB == null) {
        quizListFromDB = new ArrayList<>(); 
    }

    // Merr titullin e quiz-it që duhet të redaktohet nga parametri i URL-së
    String quizTitleToEdit = request.getParameter("quizTitle");
    Quiz quizToEdit = null;

    // Gjej quiz-in në bazë të titullit
    for (Quiz quiz : quizListFromDB) {
        if (quiz.getQuizTitle().equals(quizTitleToEdit)) {
            quizToEdit = quiz;
            break;
        }
    }

    if (quizToEdit == null) {
        // Quiz-i nuk u gjet, mund të ridrejtojmë në një faqe të gabuar ose të kryejmë ndonjë veprim tjetër
        response.sendRedirect("ErrorPage.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Quiz</title>
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
            flex-direction: column;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        form {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
            width: 600px;
        }

        label {
            text-align: left;
            margin-bottom: 5px;
            display: block;
        }

        input {
            width: calc(100% - 180px);
            padding: 8px;
            margin-bottom: 12px;
            box-sizing: border-box;
        }

        input[type="text"] {
                    margin-right: -30px;
            margin-bottom: 5px;
        }

        input[type="radio"] {
            margin-right: -30px;
            display: inline-block;
        }

        /* Align radio buttons and "Correct" text in the same line */
        .answer-container input[type="text"],
        .answer-container input[type="radio"] {
            display: inline-block;
            vertical-align: middle;
        }

        input[type="submit"] {
            background-color: rgb(43, 198, 102);
            color: #fff;
            border: none;
            border-radius: 6px;
            padding: 10px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: rgb(12, 186, 90);
        }

        /* Updated style for the div wrapper */
        .question-container {
            margin-bottom: 20px;
        }
        
        .title-container{
        margin-left: -250px;
        margin-top: -10px;
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
    </style>
</head>
<body>

    <h2>Edit Quiz</h2>
    <form action="UpdateQuizetServlet" method="post">
        <label  for="quizTitle">Titulli:</label>
        <input class="title-container" type="text" name="quizTitle" value="<%= quizToEdit.getQuizTitle() %>"  required readonly>

        <!-- Question 1 -->
        <div class="question-container">
            <label for="question1">Pyetja 1:</label>
            <input type="text" name="question1" required >
            <label>Pergjigjet:</label>
            <div class="answer-container">
                <input type="text" name="answer11" required><br/>
                <input type="text" name="answer12" required><br/>
                <input type="text" name="answer13" required><br/>
                <input type="text" name="answer14" required><br/>
            </div>
        </div>

        <!-- Question 2 -->
        <div class="question-container">
            <label for="question2">Pyetja 2:</label>
            <input type="text" name="question2" required>
            <label>Pergjigjet:</label>
            <div class="answer-container">
                <input type="text" name="answer21" required><br/>
                <input type="text" name="answer22" required><br/>
                <input type="text" name="answer23" required><br/>
                <input type="text" name="answer24" required><br/>
            </div>
        </div>
        <input type="submit" value="Edit Quiz">
    </form>

</body>
</html>
