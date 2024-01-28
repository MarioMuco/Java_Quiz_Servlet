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
import java.sql.SQLException;


public class RegjistrimiServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RegjistrimiServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        // Your database connection details
        String url = "jdbc:mysql://localhost:3306/sys";
        String user = "root";
        String dbPassword = "root";

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Create a connection to the database
            try (Connection connection = DriverManager.getConnection(url, user, dbPassword)) {
                // Prepare the insert query
                String insertQuery = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";

                try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
                    // Set parameters for the prepared statement
                    preparedStatement.setString(1, username);
                    preparedStatement.setString(2, email);
                    preparedStatement.setString(3, password);

                    // Execute the insert query
                    int rowsAffected = preparedStatement.executeUpdate();

                    if (rowsAffected > 0) {
                        // Registration successful
                        request.getSession().setAttribute("username", username);
                        request.getSession().setAttribute("email", email);
                        response.sendRedirect("Profili.jsp");
                    } else {
                        // Registration failed
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