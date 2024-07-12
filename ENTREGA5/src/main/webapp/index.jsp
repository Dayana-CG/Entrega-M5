<%@page language="java" contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LOGIN</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
     <link rel="icon" href="<%= request.getContextPath() %>/img/icono.JPG" type="image/jpeg">
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
        .text-primary-emphasis{
            font-size: medium;
        }
       .text-primary-emphasis :hover{
        color: white;
        font-size: larger;
        text-decoration: none;
        
       }

     </style>
</head>
<body>
         <%
        String logout = request.getParameter("logout");
        if ("true".equals(logout)) {
        %>
        <div class="alert alert-info" role="alert">
            Ha cerrado la sesión con éxito.
        </div>
        <%
        }
        %>
        <%
        String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null) {
        %>
        <div class="alert alert-danger d-flex align-items-center" role="alert">

                           <%= errorMessage %>

          </div>
        <%
        }
        %>

        <div class="bg-form">
        
            <div class="form-container text-center">
                <h6 class="text-primary-emphasis">Billetera Virtual </h6>
                <img src="img/logo.JPG" width="250px" height="250px" border-radius="10px"><br><br>
                <form class="p-3 text-secondary-emphasis bg-body-tertiary rounded-5" action="/ENTREGA5/login" method="POST">
                    <p><h5 class="text-secondary gray-800">Ingresar: </h5></p>
            
                    <div class="mb-3">
                        <b><label class="form-label"
                            for="idEmail">Correo Electrónico</label></b><br>
                        <input class="form-control-sm" type="email" id="idEmail"
                        name="idEmail" required  />
                        <div id="emailHelp" class="form-text">Nunca compartiremos tu correo electrónico con nadie más.</div>
                    </div>
                    <div class="mb-3">
                        <b><label class="form-label"
                            for="clave">Contraseña</label></b><br>
                                        <input class="form-control-sm" type="password" id="clave" name="clave"
                                        required /> <br>
                    </div>
                  
                    <button type="submit" class="btn btn-outline-secondary">INGRESA</button> <br><br>
                </form>
            </div>
            <div>
            <p class="text-center fw-bold mx-3 mb-0 text-primary-emphasis">No tienes una cuenta?...
                <a href="/ENTREGA5/registro.jsp" class="text-primary-emphasis opacity-50" >Creala AQUI!</a></p></div>
        </div>
    
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
    </html>

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






  