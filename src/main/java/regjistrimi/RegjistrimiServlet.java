package regjistrimi;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public class RegjistrimiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public RegjistrimiServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  String username = request.getParameter("username");
	        String password = request.getParameter("password");
	        String email = request.getParameter("email");

	        // Kryeni regjistrimin e përdoruesit në bazën e të dhënave ose në një strukturë të dhënash të tjera.

	        // Përdorni sesionin për të ruajtur informacione të përdoruesit për faqen e profilit.
	        request.getSession().setAttribute("username", username);
	        request.getSession().setAttribute("email", email);

	        response.sendRedirect("Profili.jsp");
	}

}
