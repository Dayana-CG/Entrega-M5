package controlador;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import java.util.List;


import dao.UsuarioDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modelo.Usuario;

@WebServlet("/depositar")
public class DepositoServlet extends HttpServlet {
    
    private UsuarioDao usuarioDao = new UsuarioDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        
        if (session != null && session.getAttribute("usuario") != null) {
            Usuario usuario = (Usuario) session.getAttribute("usuario");
            double monto = Double.parseDouble(request.getParameter("monto"));

            try {
                usuarioDao.depositar(usuario.getIdEmail(), monto);
                usuario.setSaldo(usuario.getSaldo() + monto); // Actualiza el saldo en la sesión
                response.sendRedirect("saldo");

            } catch (NumberFormatException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Formato de monto inválido.");
                request.getRequestDispatcher("/sesion.jsp").forward(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Ocurrió un error interno. Por favor, inténtelo de nuevo más tarde.");
                request.getRequestDispatcher("/sesion.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("/ENTREGA5/index.jsp");
        }
    }





}

