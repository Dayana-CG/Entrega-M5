package controlador;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

import dao.UsuarioDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelo.Usuario;

@WebServlet("/usuario")
public class UsuarioNuevoServlet extends HttpServlet {

    private final UsuarioDao usuarioDao = new UsuarioDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String idEmail = request.getParameter("email");
            String clave = request.getParameter("clave");
            String nombreApellido = request.getParameter("nombreApellido");
            int numeroCuenta = Integer.parseInt(request.getParameter("numeroCuenta"));
            double saldo = Double.parseDouble(request.getParameter("saldo"));
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate fechaRegistro = LocalDate.parse(request.getParameter("fechaRegistro"), formatter);

            Usuario us = new Usuario();
            us.setIdEmail(idEmail);
            us.setClave(clave);
            us.setNombreApellido(nombreApellido);
            us.setNumeroCuenta(numeroCuenta);
            us.setSaldo(saldo);
            us.setFechaRegistro(fechaRegistro);

            if (usuarioDao.emailExists(idEmail) && usuarioDao.nombreApellidoExists(nombreApellido)) {
                handleError(request, response, "Usuario o Correo Electrónico, Ya esta Registrado.");
                return;
            }
            usuarioDao.insertar(us);

            handleSuccess(request, response, "Usuario creado con éxito.");

        } catch (NumberFormatException e) {
            handleError(request, response, "Error de formato de número: " + e.getMessage());
        } catch (DateTimeParseException e) {
            handleError(request, response, "Error de formato de fecha: " + e.getMessage());
        } catch (Exception e) {
            handleError(request, response, "Error inesperado: " + e.getMessage());
        }
    }

    private void handleError(HttpServletRequest request, HttpServletResponse response, String errorMessage)
            throws ServletException, IOException {
        request.setAttribute("errorMessage", errorMessage);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    private void handleSuccess(HttpServletRequest request, HttpServletResponse response, String successMessage)
            throws ServletException, IOException {
        request.setAttribute("successMessage", successMessage);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

}
