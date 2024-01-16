package quizes;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import klasat.Quiz;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


 
public class KrijoQuizServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public KrijoQuizServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	 // Retrieve quiz details from the form
        String quizTitle = request.getParameter("quizTitle");

        // Create a Quiz object
        Quiz quiz = new Quiz();
        quiz.setQuizTitle(quizTitle);

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

        quiz.setQuestionText(questionTextList);
        quiz.setAnswers(answersList);
        quiz.setCorrectAnswer(correctAnswerList);

        // Add the quiz to a list or database
        List<Quiz> quizList = (List<Quiz>) getServletContext().getAttribute("quizList");

        if (quizList == null) {
            quizList = new ArrayList<>();
        }

        quizList.add(quiz);

        // Store data in the database
        saveQuizToDatabase(quiz);

        getServletContext().setAttribute("quizList", quizList);

        // Redirect to a success page or handle as needed
        response.sendRedirect("QuizList.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
    
    
    private void saveQuizToDatabase(Quiz quiz) {
        // Your database connection details
        String url = "jdbc:mysql://localhost:3306/sys";
        String user = "root";
        String password = "root";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try (Connection con = DriverManager.getConnection(url, user, password)) {
            String insertQuery = "INSERT INTO questions (quiz_title, question_1, answer_1_1, answer_1_2, answer_1_3, answer_1_4, " +
                    "correct_answer_1, question_2, answer_2_1, answer_2_2, answer_2_3, answer_2_4, correct_answer_2) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            try (PreparedStatement preparedStatement = con.prepareStatement(insertQuery)) {
                // Set parameters for the prepared statement
                preparedStatement.setString(1, quiz.getQuizTitle());
                preparedStatement.setString(2, quiz.getQuestionText().get(0));
                preparedStatement.setString(3, quiz.getAnswers().get(0));
                preparedStatement.setString(4, quiz.getAnswers().get(1));
                preparedStatement.setString(5, quiz.getAnswers().get(2));
                preparedStatement.setString(6, quiz.getAnswers().get(3));
                preparedStatement.setString(7, quiz.getCorrectAnswer().get(0));
                preparedStatement.setString(8, quiz.getQuestionText().get(1));
                preparedStatement.setString(9, quiz.getAnswers().get(4));
                preparedStatement.setString(10, quiz.getAnswers().get(5));
                preparedStatement.setString(11, quiz.getAnswers().get(6));
                preparedStatement.setString(12, quiz.getAnswers().get(7));
                preparedStatement.setString(13, quiz.getCorrectAnswer().get(1));

                // Execute the prepared statement
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database errors as needed
        }
    }
    
    
}
