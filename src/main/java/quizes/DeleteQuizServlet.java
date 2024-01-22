package quizes;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class DeleteQuizServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve the quiz title from the request parameter
        String quizTitle = request.getParameter("quizTitle");

        // Your database connection details
        String url = "jdbc:mysql://localhost:3306/sys";
        String user = "root";
        String password = "root";

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Create a connection to the database
            try (Connection con = DriverManager.getConnection(url, user, password)) {
                // Prepare the delete query
                String deleteQuery = "DELETE FROM questions WHERE quiz_title = ?";

                try (PreparedStatement preparedStatement = con.prepareStatement(deleteQuery)) {
                    // Set the quiz title parameter in the prepared statement
                    preparedStatement.setString(1, quizTitle);

                    // Execute the delete query
                    int rowsAffected = preparedStatement.executeUpdate();

                    if (rowsAffected > 0) {
                        // Quiz successfully deleted
                        response.sendRedirect("QuizList.jsp"); // Redirect to your quiz list page
                    } else {
                        // Quiz not found or not deleted
                        response.sendRedirect("ErrorPage.jsp"); // Redirect to an error page or handle it as needed
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Handle database errors as needed
        }
    }
    
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	 doPost(request, response);
    }
    
    
    
}