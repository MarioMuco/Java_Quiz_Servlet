<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="klasat.Quiz" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>

<%@ page language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz List</title>
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
            gap: 20px;
        }

        .quiz-box {
            background-color: #fff;
            padding: 30px;
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
    </style>
</head>
<body>

 <h2>Lista e Quiz-eve</h2>
   <div class="quiz-container">
<%
String url = "jdbc:mysql://localhost:3306/sys";
String user = "root";
String password = "root";
Class.forName("com.mysql.cj.jdbc.Driver");

try (Connection con = DriverManager.getConnection(url, user, password)) {
    System.out.println("Connected to the database!");
    
    // Select query
    Statement statement = con.createStatement();
    String selectQuery = "SELECT * FROM questions";
    ResultSet resultSet = statement.executeQuery(selectQuery);
    
    // Process the select results
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

                    <!-- Link to Take Quiz -->
               
                </div>
<%
    }
%>



<%
    // Disconnect from the database
} catch (SQLException e) {
    System.err.println("Failure");
    e.printStackTrace();
}
%>
</div>
  <a href="Profili.jsp">Profili</a>

</body>
</html>
