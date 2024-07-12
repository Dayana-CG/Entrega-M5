<%@page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@page import="modelo.*" %>
<%@page import="java.util.List" %> 
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
               <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
               <link rel="icon" href="<%= request.getContextPath() %>/img/icono.JPG" type="image/jpeg">
        <title>TU SESION</title>
        <style>
        body {
            display: flex;
            justify-content: center;
            background-color: #88c8ef;
            min-height: 100vh;
            margin: 0;
        }
        .collapse {
  &:not(.show) {
    display: none;
  }
}
    </style>

    </head>
    <body>

   <%
    String successMessage = (String) request.getAttribute("successMessage");
    String errorMessage = (String) request.getAttribute("errorMessage");

    if (successMessage != null) { %>
       <p class="alert alert-success d-flex align-items-center" role="alert">


                <%= successMessage %>

        </p>
    <% } %>

    <% if (errorMessage != null) { %>
        <p class="alert alert-danger d-flex align-items-center" role="alert">
                     <%= errorMessage %>


        </p>
    <% } %>

            <%
            Usuario usuario = (Usuario) session.getAttribute("usuario");
            if (usuario != null) {
            %>
        
    
        <div class="container text-center p-5">
            <div class="row p-5">
                <div class="col-12 col-sm-6 col-md-4 col-lg-12 text-secondary-emphasis bg-body-tertiary rounded-1 border-secondary-subtle rounded-2"
                style="max-width: 30%;">
                <a style="text-decoration: none;"
                class="sidebar-brand text-dark-emphasis d-flex align-items-center justify-content-center">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-solid fa-wallet"></i>
                </div>
                <div
                    class="sidebar-brand-text fs-3 p-3 mx-3">Bienvenid@</sup></div>
                </a>
                <br>
                
                <a style="text-decoration: none;"
                class="sidebar-brand text-dark-emphasis d-flex align-items-center justify-content-center">
                <i class="fas fa-sharp fa-regular fa-money-bill-wave"></i>
                    <div class="sidebar-brand-text fs-5 mx-3">A tu Billetera Digital</div>
                </a>  <br> <hr>
            </div>
                                 
                           
              <div class="col-12 col-sm-6 col-md-4 col-lg-12"
              style="max-width: 70%;">
              <div>
                <nav class="navbar navbar-expand-lg bg-body-tertiary">
                    <div class="container-fluid">
                        <ul class="navbar-nav">
                
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle btn-secondary" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <%=usuario.getNombreApellido() %>
                                    <i class="fas fa-solid fa-user"></i>
                                </a>
                                <ul class="dropdown-menu">
                                  <li> <a class="dropdown-item"
                                    href="/ENTREGA5/mostrar.jsp">
                                        <i
                                            class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        <button
                                            class="bg-white border-0"
                                            type="submit"> Datos
                                            Personales
                                        </button>
                                    </a></li>
                                  <li><a class="dropdown-item" href="#">
                                    <form class="dropdown-item"
                                    action="/ENTREGA5/clave"
                                    method="POST">
                                    <i
                                        class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                
                                    <button
                                        class="bg-white border-0"
                                        type="submit"> Cambiar
                                        Clave
                                    </button>
                                </form>
                                        </a></li>
                                  <li><a class="dropdown-item" href="#">
                                    <form action="/ENTREGA5/logout"
                                    method="GET"
                                    class="dropdown-item">
                                    <i
                                        class="fas fa-solid fa-door-open mr-2 text-gray-400"></i>
                                    <button
                                        class="bg-white border-0"
                                        type="submit"> Cerrar
                                        Sesión
                                    </button>
                                </form>
                                  </a></li>
                                </ul>
                              </li>
                        </ul>
                
                
                    </div>
                </nav>
                  </div> <br>
                  <div>
                 
                  
                  <div class="row">
                    <div
                    class="border-left-primary h-300 py-2">
                    <div class="card-body">
                        <div
                            class="row no-gutters align-items-center">
                            <div
                                class="h4 text-gray-800">
                                 <form class="p-3 text-secondary-emphasis border-secondary-subtle rounded-5"action="/ENTREGA5/clave" method="POST">
                                    <label class="form-label fs-5" for="claveActual">Clave Actual:</label><br>
                                    <input class="form-control-sm" type="password" id="claveActual" name="claveActual" required><br><br>
                                    
                                    <label class="form-label fs-5" for="nuevaClave">Nueva Clave:</label><br>
                                    <input class="form-control-sm" type="password" id="nuevaClave" name="nuevaClave" required><br><br>
                                    
                                    <input class="btn btn-outline-secondary" type="submit" value="Cambiar Clave">
                                </form>
                                
                                <br>
                                <a class="text-secondary fs-5" href="/ENTREGA5/sesion.jsp">Volver</a>
                            </div>
                        </div>
                    </div>
                </div>

                  <br><br><br>

             
                  </div>
                
              </div>
            </div>
          </div>

        
  <% } else { %>
                                                                                      <p>No se encontraron usuarios en la sesión.</p>

                                                                                  <% } %>
    


     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
             integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
             crossorigin="anonymous"></script>
           
    </body>
</html>
