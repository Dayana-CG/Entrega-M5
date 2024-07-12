package controlador;

import java.io.IOException;

import dao.UsuarioDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modelo.Usuario;

@WebServlet("/clave")
public class CambioClaveServlet extends HttpServlet {

    private UsuarioDao usuarioDao = new UsuarioDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("usuario") != null) {
            Usuario usuario = (Usuario) session.getAttribute("usuario");
            String claveActual = request.getParameter("claveActual");
            String nuevaClave = request.getParameter("nuevaClave");

            // Validar que la clave actual coincida con la almacenada en la base de datos
            if (validarClaveActual(usuario, claveActual)) {
                // Actualizar la clave del usuario en la base de datos
                usuarioDao.actualizarClave(usuario.getIdEmail(), nuevaClave);
                // Agregar mensaje de éxito
                request.setAttribute("successMessage", "El Cambio se realizo con éxito.");
                request.getRequestDispatcher("/registro.jsp").forward(request, response);


            } else {
                 request.getRequestDispatcher("/cambio.jsp").forward(request, response);
            }
        } else {
            // Sesión no válida o usuario no autenticado
            request.setAttribute("errorMessage", "Sesión no válida o usuario no autenticado.");
            response.sendRedirect(request.getContextPath() + "/sesion.jsp");
        }
    }

    private boolean validarClaveActual(Usuario usuario, String claveActual) {
        // Lógica para validar que la clave actual coincida con la almacenada en la base de datos
        return usuario.getClave().equals(claveActual);
    }
}