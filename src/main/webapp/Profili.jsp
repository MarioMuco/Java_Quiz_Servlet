<!DOCTYPE html>
<html>
<head>
    <title>Faqja e Profilit</title>
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

        p {
            text-align: center;
            font-size: 16px;
            margin-bottom: 10px;
        }

        a {
            display: block;
            width: 280px; /* Adjust width as needed */
            padding: 10px;
            text-align: center;
            text-decoration: none;
            background-color: rgb(43,198,102);
            color: #fff;
            border-radius: 6px;
            margin-bottom: 10px;
        }

        a:hover {
            background-color:  rgb(12,186,90);
        }
        
        div {
        	background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px; /* Adjust width as needed */
        }
    </style>
</head>
<body>

    <h2>Faqja e Profilit</h2>
    <div>
    <p>Email: <%= session.getAttribute("email") %></p>
    <a href="UpdateProfili.jsp">Perditeso Profilin</a>
    <a href="KrijoQuiz.jsp">Krijo Quiz </a>
    <a href="QuizList.jsp">Lista e Quiz-eve</a> 
    </div>
    
</body>
</html>
