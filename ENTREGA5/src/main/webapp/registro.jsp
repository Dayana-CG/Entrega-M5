<%@page language="java" contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous">
            <link rel="icon" href="<%= request.getContextPath() %>/img/icono.JPG" type="image/jpeg">

        <title>Nuevo Usuario</title>
        <style>
            body, html {
                height: 100%;
                margin: 0;
            }
            .bg-form {
                background-color: #88c8ef;
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .form-container {
                background: white;
                padding: 2rem;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                width: 100%;
                max-width: 500px;
            }

            </style>

    </head>
    <body>

        <% String successMessage = (String) request.getAttribute("successMessage"); %>
        <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
        <% if (successMessage != null) { %>
                 <p class="alert alert-success d-flex align-items-center" role="alert">


                    <%= successMessage %>
                </p>
        <% } %>
        <% if (errorMessage != null) { %>
            <p class="alert alert-danger d-flex align-items-center" role="alert">

                    <%= errorMessage %>

            </p>
        <% } %>

      
    <div class="bg-form">
        
        <div class="form-container text-center">
           
            <form class="p-3 text-secondary-emphasis bg-secondary-subtle border-secondary-subtle rounded-5"
            action="/ENTREGA5/usuario" method="POST">
            <p><h4 class="text-secondary gray-800" >Registrar: </h4></p>
            <div>
                <p>
                    <label class="form-label" for="email">Correo
                        Electrónico</label><br>
                    <input class="form-control-sm" type="email"
                        id="email" name="email" required />
    
                </p>
            </div>
    
            <div>
                <p>
                <label class="form-label"
                    for="clave">Password</label><br>
                <input class="form-control-sm" type="password"
                    id="clave" name="clave" required />
                </p>
            </div>
            <div>
                <p>
                    <label class="form-label"
                        for="nombreApellido">Nombre Apellido</label><br>
                    <input class="form-control-sm" type="text"
                        id="nombreApellido" name="nombreApellido" required />
    
                </p>
            </div>
    
            <div>
                <p>
                <label class="form-label" for="numeroCuenta">Numero
                    de Cuenta</label><br>
                <input class="form-control-sm" type="number"
                    id="numeroCuenta" name="numeroCuenta" required />
                </p>
            </div>
            <div>
                <p>
                    <label class="form-label" for="saldo">Saldo en
                        Linea</label> <br>
                    <input class="form-control-sm" type="number"
                        id="saldo" name="saldo" required />
    
                </p>
            </div>
    
            <div>
                <p>
                <label class="form-label" for="fechaRegistro">Fecha
                    de Registro</label> <br>
                <input class="form-control-sm" type="date"
                    id="fechaRegistro" name="fechaRegistro" required />
                </p>
            </div>
            <br>
            <div>
                <p>
                    <button type="submit" class="btn btn-outline-secondary">Registrar</button></p>
      <p><a class="text-secondary fs-5" href="/ENTREGA5/index.jsp">Volver</a>
                        </p>
            </div>
        </form >
        </div>
        <div class="form-container text-primary-emphasis text-center p-5">
            <h6 class="text-primary-emphasis fs-4">Billetera Virtual </h6>
            <p class="text-center fw-bold mx-3 mb-0 text-muted">Para
                ser parte de Nosotros... </p>
            <p
                class="text-center fw-bold mx-3 mb-0 text-muted">Llena
                el Formulario!</p> <br>
            <img src="img/logo.JPG" width="250px" height="250px"></div>
            
    </div>

<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
    crossorigin="anonymous"></script>
<script
    src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
    integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
    crossorigin="anonymous"></script>
<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
    integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
    crossorigin="anonymous"></script>
</body>
</html>