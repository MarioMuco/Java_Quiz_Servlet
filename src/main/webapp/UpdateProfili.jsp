<!DOCTYPE html>
<html>
<head>
    <title>Përditësimi i Profilit</title>
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
            margin-bottom: 20px; /* Added margin-bottom to provide space between h2 and form */
        }

        form {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px; /* Adjust width as needed */
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
    <h2>Përditësimi i Profilit</h2>
    <form action="UpdateProfiliServlet" method="post">
        New Username: <input type="text" name="newUser" required><br>
        New Email: <input type="email" name="newEmail" required><br>
        New Password: <input type="password" name="newPassword" required><br>
        
        <input type="submit" value="Përditëso Profilin">
    </form>
</body>
</html>
