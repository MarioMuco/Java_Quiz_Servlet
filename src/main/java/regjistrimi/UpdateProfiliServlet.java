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

public class UpdateProfiliServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateProfiliServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//te dhenat e reja 
		String newPassword = request.getParameter("newPassword");
        String newEmail = request.getParameter("newEmail");
        String newUser = request.getParameter("newUser");

        // perditesimi i te dhenave te perdoruesit ne session 
        request.getSession().setAttribute("password", newPassword);
        request.getSession().setAttribute("email", newEmail);
        request.getSession().setAttribute("username", newUser);
        
        // Te dhenat e lidhjes me databazen
        String url = "jdbc:mysql://localhost:3306/sys";
        String user = "root";
        String dbPassword = "root";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Krijoni lidhjen me databazën
            try (Connection connection = DriverManager.getConnection(url, user, dbPassword)) {
                String updateQuery = "UPDATE users SET password=?, email=? WHERE username=?";

                try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
                    // Vendosni parametrat për statement-in e përgatitur
                    preparedStatement.setString(1, newPassword);
                    preparedStatement.setString(2, newEmail);
                    preparedStatement.setString(3, newUser);

                    int rowsAffected = preparedStatement.executeUpdate();

                    if (rowsAffected > 0) {
                        response.sendRedirect("Profili.jsp");
                    } else {
                        response.sendRedirect("ErrorPage.jsp");
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("ErrorPage.jsp");
        }
	}
}
