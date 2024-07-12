package controlador;

import java.io.IOException;
import java.sql.SQLException;

import dao.UsuarioDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modelo.Usuario;

@WebServlet("/saldo")
public class SesionServlet extends HttpServlet{
private UsuarioDao usuarioDao = new UsuarioDao();

protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    HttpSession session = request.getSession(false);
    if (session != null && session.getAttribute("usuario") != null) {

        Usuario loginUsuario = (Usuario) session.getAttribute("usuario");
        try {
            Usuario usuario = usuarioDao.getUserById(loginUsuario.getIdEmail());

            request.setAttribute("usuario", usuario);
            request.getRequestDispatcher("/sesion.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Ocurrió un error interno. Por favor, inténtelo de nuevo más tarde.");
        }
    } else {
        System.out.println("Sesión o usuario no encontrados");
        response.sendRedirect("/ENTREGA5/index.jsp");
    }
}

}