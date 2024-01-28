<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Krijo Quiz</title>
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
    </style>
</head>
<body>
    <h2>Krijo Quiz</h2>

    <form action="KrijoQuizServlet" method="post">
        <label  for="quizTitle">Titulli:</label>
        <input class="title-container" type="text" name="quizTitle" required>

        <!-- Question 1 -->
        <div class="question-container">
            <label for="question1">Pyetja 1:</label>
            <input type="text" name="question1" required>
            <label>Pergjigjet:</label>
            <div class="answer-container">
                <input type="text" name="answer11" required>
                <input type="radio" name="correctAnswer11"> Correct
                <input type="text" name="answer12" required>
                <input type="radio" name="correctAnswer12"> Correct
                <input type="text" name="answer13" required>
                <input type="radio" name="correctAnswer13"> Correct
                <input type="text" name="answer14" required>
                <input type="radio" name="correctAnswer14"> Correct
            </div>
        </div>

        <!-- Question 2 -->
        <div class="question-container">
            <label for="question2">Pyetja 2:</label>
            <input type="text" name="question2" required>
            <label>Pergjigjet:</label>
            <div class="answer-container">
                <input type="text" name="answer21" required>
                <input type="radio" name="correctAnswer21"> Correct
                <input type="text" name="answer22" required>
                <input type="radio" name="correctAnswer22"> Correct
                <input type="text" name="answer23" required>
                <input type="radio" name="correctAnswer23"> Correct
                <input type="text" name="answer24" required>
                <input type="radio" name="correctAnswer24"> Correct
            </div>
        </div>
        <input type="submit" value="Create Quiz">
    </form>

</body>
</html>
