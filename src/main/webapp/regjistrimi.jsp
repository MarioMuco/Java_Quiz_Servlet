<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Regjistrimi dhe Log-in</title>
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

        .forms-container {
            display: flex;
            justify-content: space-around; /* Ndarja horizontale e ekranit */
            width: 100%;
        }

        .form-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px; /* Adjust width as needed */
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px; /* Added margin-bottom to provide space between h2 and forms */
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 15px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 16px;
        }

        input[type="submit"] {
            background-color: rgb(43,198,102);
            color: #fff;
            padding: 15px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color:  rgb(12,186,90);
        }
    </style>
</head>
<body>
    <div class="forms-container">
        <div class="form-container">
            <h2>Regjistrim</h2>
            <form action="RegjistrimiServlet" method="post">
                Username: <input type="text" name="username" required><br>
                Email: <input type="email" name="email" required><br>
                Password: <input type="password" name="password" required><br>
                <input type="submit" value="Regjistrohu">
            </form>
        </div>

        <div class="form-container">
            <h2>Log-in</h2>
            <form action="LoginServlet" method="post">
                Username: <input type="text" name="loginUsername" required><br>
                Password: <input type="password" name="loginPassword" required><br>
                <input type="submit" value="Log-in">
            </form>
        </div>
    </div>
</body>
</html>
