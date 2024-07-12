package dao;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import modelo.Usuario;
import util.Conexion;

public class UsuarioDao {

    Connection conexion;

    public UsuarioDao() {
        Conexion conn = new Conexion();
        conexion = conn.getConexion();
    }

    public Usuario verificando(String idEmail, String clave) throws SQLException {
        String sql = "SELECT * FROM usuarios WHERE idEmail = ? AND clave = ?";
        try (
                PreparedStatement stmt = (conexion.prepareStatement(sql))) {
            stmt.setString(1, idEmail);
            stmt.setString(2, clave);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setIdEmail(rs.getString("idEmail"));
                usuario.setClave(rs.getString("clave"));
                usuario.setNombreApellido(rs.getString("nombreApellido"));
                usuario.setNumeroCuenta(rs.getInt("numeroCuenta"));
                usuario.setSaldo(rs.getDouble("saldo"));
                usuario.setFechaRegistro(rs.getDate("fechaRegistro").toLocalDate());
                return usuario;
            }
        }
        return null;
    }

    public Usuario getUserById(String idEmail) throws SQLException {
        String sql = "SELECT * FROM usuarios WHERE idEmail = ?";
        try (
                PreparedStatement stmt = conexion.prepareStatement(sql)) {
            stmt.setString(1, idEmail);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setIdEmail(rs.getString("idEmail"));
                usuario.setClave(rs.getString("clave"));
                usuario.setNombreApellido(rs.getString("nombreApellido"));
                usuario.setNumeroCuenta(rs.getInt("numeroCuenta"));
                usuario.setSaldo(rs.getDouble("saldo"));
                usuario.setFechaRegistro(rs.getDate("fechaRegistro").toLocalDate());
                return usuario;
            }
        }
        return null;
    }

    public boolean emailExists(String idEmail) {
        String query = "SELECT COUNT(*) FROM usuarios WHERE idEmail = ?";
        try (PreparedStatement stmt = conexion.prepareStatement(query)) {
            stmt.setString(1, idEmail);
            ResultSet rs = stmt.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean nombreApellidoExists(String nombreApellido) {
        String query = "SELECT COUNT(*) FROM usuarios WHERE nombreApellido = ?";
        try (PreparedStatement stmt = conexion.prepareStatement(query)) {
            stmt.setString(3, nombreApellido);
            ResultSet rs = stmt.executeQuery();
            if (rs.next() && rs.getInt(3) > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean insertar(Usuario usuario) {

        PreparedStatement stmt;
        try {
            stmt = conexion.prepareStatement(
                    "INSERT INTO usuarios(idEmail,clave,nombreApellido,numeroCuenta,saldo,fechaRegistro) VALUES (?,?,?,?,?,?)");
            stmt.setString(1, usuario.getIdEmail());
            stmt.setString(2, usuario.getClave());
            stmt.setString(3, usuario.getNombreApellido());
            stmt.setInt(4, usuario.getNumeroCuenta());
            stmt.setDouble(5, usuario.getSaldo());
            stmt.setDate(6, Date.valueOf(usuario.getFechaRegistro()));
            stmt.execute();
            return true;

        } catch (SQLException e) {
            System.out.println(e.toString());
            return false;
        }
    }


    public boolean actualizarClave(String idEmail, String nuevaClave) {
        PreparedStatement stmt;

        try {
            // Verificar si el idEmail ya existe en la base de datos
            if (!existeIdEmail(idEmail)) {
                System.out.println("El idEmail especificado no existe en la base de datos.");
                return false;
            }

            stmt = conexion.prepareStatement("UPDATE usuarios SET clave=? WHERE idEmail=?");
            stmt.setString(1, nuevaClave);
            stmt.setString(2, idEmail);

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private boolean existeIdEmail(String idEmail) {
        PreparedStatement stmt;
        ResultSet rs;

        try {
            stmt = conexion.prepareStatement("SELECT 1 FROM usuarios WHERE idEmail=?");
            stmt.setString(1, idEmail);
            rs = stmt.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public void depositar(String idEmail, double monto) throws SQLException {

        String sql = "UPDATE usuarios SET saldo = saldo + ? WHERE idEmail = ?";
        try (PreparedStatement stmt = conexion.prepareStatement(sql)) {
            stmt.setDouble(1, monto);
            stmt.setString(2, idEmail);

            stmt.executeUpdate();
        }
    }

    public void retirar(String idEmail, double monto) throws SQLException {
        String sql = "UPDATE usuarios SET saldo = saldo - ? WHERE idEmail = ? AND saldo >= ?";
        try (PreparedStatement stmt = conexion.prepareStatement(sql)) {
            stmt.setDouble(1, monto);
            stmt.setString(2, idEmail);
            stmt.setDouble(3, monto);
            stmt.executeUpdate();
        }
    }

}