package quizes;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UpdateQuizetServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // merren te dhenat 
        String quizTitle = request.getParameter("quizTitle");
        String question1 = request.getParameter("question1");
        String answer11 = request.getParameter("answer11");
        String answer12 = request.getParameter("answer12");
        String answer13 = request.getParameter("answer13");
        String answer14 = request.getParameter("answer14");

        String question2 = request.getParameter("question2");
        String answer21 = request.getParameter("answer21");
        String answer22 = request.getParameter("answer22");
        String answer23 = request.getParameter("answer23");
        String answer24 = request.getParameter("answer24");

        // lidhet me databasen 
        String url = "jdbc:mysql://localhost:3306/sys";
        String user = "root";
        String password = "root";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, user, password);

            //update query
            String updateQuery = "UPDATE questions SET question_1=?, answer_1_1=?, answer_1_2=?, answer_1_3=?, answer_1_4=?, "
                    + "question_2=?, answer_2_1=?, answer_2_2=?, answer_2_3=?, answer_2_4=? WHERE quiz_title=?";

            // Create a prepared statement
            PreparedStatement preparedStatement = connection.prepareStatement(updateQuery);
            preparedStatement.setString(1, question1);
            preparedStatement.setString(2, answer11);
            preparedStatement.setString(3, answer12);
            preparedStatement.setString(4, answer13);
            preparedStatement.setString(5, answer14);

            preparedStatement.setString(6, question2);
            preparedStatement.setString(7, answer21);
            preparedStatement.setString(8, answer22);
            preparedStatement.setString(9, answer23);
            preparedStatement.setString(10, answer24);

            preparedStatement.setString(11, quizTitle);

            // ekzekutohet prepared statement
            preparedStatement.executeUpdate();

            // mbyllen lidhjet 
            preparedStatement.close();
            connection.close();

            response.sendRedirect("QuizList.jsp");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("ErrorPage.jsp");
        }
    }
}
