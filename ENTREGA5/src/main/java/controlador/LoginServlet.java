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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private UsuarioDao usuarioDao = new UsuarioDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idEmail = request.getParameter("idEmail");
        String clave = request.getParameter("clave");

        try {
            Usuario usuario = usuarioDao.verificando(idEmail, clave);
            if (usuario != null) {
                HttpSession session = request.getSession();
                session.setAttribute("usuario", usuario);
                response.sendRedirect("/ENTREGA5/saldo");
            } else {
                request.setAttribute("errorMessage", "Usuario o contraseña incorrectos.");
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Ocurrió un error interno. Por favor, inténtelo de nuevo más tarde.");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
}