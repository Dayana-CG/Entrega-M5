package modelo;

import java.time.LocalDate;

public class Usuario {

    private String idEmail;
    private String clave;
    private String nombreApellido;
    private int numeroCuenta;
    private double saldo;
    private LocalDate fechaRegistro;
    
    public Usuario() {
    }
   
    public Usuario(String idEmail, String clave, String nombreApellido, int numeroCuenta, double saldo,
            LocalDate fechaRegistro) {
        this.idEmail = idEmail;
        this.clave = clave;
        this.nombreApellido = nombreApellido;
        this.numeroCuenta = numeroCuenta;
        this.saldo = saldo;
        this.fechaRegistro = fechaRegistro;
    }

    public String getIdEmail() {
        return idEmail;
    }
    public void setIdEmail(String idEmail) {
        this.idEmail = idEmail;
    }
    public String getClave() {
        return clave;
    }
    public void setClave(String clave) {
        this.clave = clave;
    }
    public String getNombreApellido() {
        return nombreApellido;
    }
    public void setNombreApellido(String nombreApellido) {
        this.nombreApellido = nombreApellido;
    }
    public double getSaldo() {
        return saldo;
    }
    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }
    public LocalDate getFechaRegistro() {
        return fechaRegistro;
    }
    public void setFechaRegistro(LocalDate fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }
    public int getNumeroCuenta() {
        return numeroCuenta;
    }

    public void setNumeroCuenta(int numeroCuenta) {
        this.numeroCuenta = numeroCuenta;
    }


}
