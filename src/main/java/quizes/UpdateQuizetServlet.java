package quizes;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import klasat.Quiz;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UpdateQuizetServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // merren te dhenat
        String quizTitle = request.getParameter("quizTitle");

        List<String> questionTextList = new ArrayList<>();
        List<String> answersList = new ArrayList<>();
        List<String> correctAnswerList = new ArrayList<>();

        for (int i = 1; i <= 2; i++) {
            String questionText = request.getParameter("question" + i);
            questionTextList.add(questionText);

            for (int j = 1; j <= 4; j++) {
                String answer = request.getParameter("answer" + i + j);
                answersList.add(answer);

                if (request.getParameter("correctAnswer" + i + j) != null) {
                    correctAnswerList.add(answer);
                }
            }
        }

        // lidhet me databazen
        String url = "jdbc:mysql://localhost:3306/sys";
        String user = "root";
        String password = "root";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, user, password);

            // update query
            String updateQuery = "UPDATE questions SET question_1=?, answer_1_1=?, answer_1_2=?, answer_1_3=?, answer_1_4=?, correct_answer_1=?, "
                    + "question_2=?, answer_2_1=?, answer_2_2=?, answer_2_3=?, answer_2_4=?, correct_answer_2=? WHERE quiz_title=?";

            // Create a prepared statement
            PreparedStatement preparedStatement = connection.prepareStatement(updateQuery);
            preparedStatement.setString(1, questionTextList.get(0));
            preparedStatement.setString(2, answersList.get(0));
            preparedStatement.setString(3, answersList.get(1));
            preparedStatement.setString(4, answersList.get(2));
            preparedStatement.setString(5, answersList.get(3));
            preparedStatement.setString(6, correctAnswerList.get(0));
            preparedStatement.setString(7, questionTextList.get(1));
            preparedStatement.setString(8, answersList.get(4));
            preparedStatement.setString(9, answersList.get(5));
            preparedStatement.setString(10, answersList.get(6));
            preparedStatement.setString(11, answersList.get(7));
            preparedStatement.setString(12, correctAnswerList.get(1));

            preparedStatement.setString(13, quizTitle);

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
