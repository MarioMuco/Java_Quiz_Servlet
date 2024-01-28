package regjistrimi;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("loginUsername");
        String password = request.getParameter("loginPassword");

        // Your database connection details
        String url = "jdbc:mysql://localhost:3306/sys";
        String user = "root";
        String dbPassword = "root";

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Create a connection to the database
            try (Connection connection = DriverManager.getConnection(url, user, dbPassword)) {
                // Prepare the select query
                String selectQuery = "SELECT * FROM users WHERE username = ? AND password = ?";

                try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
                    // Set parameters for the prepared statement
                    preparedStatement.setString(1, username);
                    preparedStatement.setString(2, password);

                    // Execute the select query
                    ResultSet resultSet = preparedStatement.executeQuery();

                    if (resultSet.next()) {
                        // Login successful
                    	request.getSession().setAttribute("username", username);
                        response.sendRedirect("Profili.jsp");
                    } else {
                        // Login failed
                        response.sendRedirect("ErrorPage.jsp");
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Handle database errors as needed
            response.sendRedirect("ErrorPage.jsp");
        }
    }
}
