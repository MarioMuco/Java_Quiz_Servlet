package regjistrimi;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public class UpdateProfiliServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UpdateProfiliServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String newPassword = request.getParameter("newPassword");
        String newEmail = request.getParameter("newEmail");
        String newUser = request.getParameter("newUser");

        // Kryeni përditësimin e profilin në bazën e të dhënave ose në një strukturë të dhënash të tjera.

        // Përdorni sesionin për të përditësuar informacionet e përdoruesit.
        request.getSession().setAttribute("password", newPassword);
        request.getSession().setAttribute("email", newEmail);
        request.getSession().setAttribute("username", newUser);

        response.sendRedirect("Profili.jsp");
	}

}
