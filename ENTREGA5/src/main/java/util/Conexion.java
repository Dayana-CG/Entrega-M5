package util;

import java.sql.*;

public class Conexion {
    

public Connection getConexion(){
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        final String URL = "jdbc:mysql://localhost:3306/alke_wallet?serverTimezone=UTC";
         String user = "root"; //bd usuario
         String pass = "hijos2721"; //pass usuario bd
        Connection conexion = DriverManager.getConnection(URL, user, pass);
        return conexion;
        
    } catch (SQLException | ClassNotFoundException e) {
        System.out.println(e.toString());
        return null;
    }
}


}


