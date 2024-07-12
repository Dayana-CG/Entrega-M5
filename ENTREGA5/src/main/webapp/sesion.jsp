<%@page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@page import="modelo.Usuario" %> 
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
            </head>
        <title>TU SESION</title>
        <style>
        body {
            display: flex;
            justify-content: center;
            background-color: #88c8ef;
            min-height: 100vh;
            min-width: 100vh;
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

          <p>
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
            <div class="container text-center p-0">
                <div class="row p-5">
                    
                    <div class="col-12 col-sm-4 col-md-6 col-lg-12 text-secondary-emphasi bg-body-tertiary rounded-5"
                    style="max-width: 40%;">
                    <a style="text-decoration: none;"
                    class="sidebar-brand text-dark-emphasis d-flex align-items-center justify-content-center">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-solid fa-wallet"></i>
                    </div>
                    <div
                        class="text-primary-emphasis fs-4 p-3 mx-3">Bienvenid@</sup></div>
                    </a>
                    <br>
                    
                    <a style="text-decoration: none;"
                    class="sidebar-brand text-dark-emphasis d-flex align-items-center justify-content-center">
                    <i class="fas fa-sharp fa-regular fa-money-bill-wave"></i>
                                        <div class="text-primary-emphasis fs-4 mx-3">A tu Billetera Digital</div>
                                    </a>
    
                                    <br>
                                    <hr class="sidebar-divider">
                                    <br>
                                    <div class="sidebar-heading text-secondary">
                                        Que deseas hacer ?
                                    </div><br><br>
                                   
                                    <div>
                                        <i class="fas fa-fw fa-donate"></i>
                                          
                                            <button class="btn btn-secondary" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample1" aria-expanded="false" aria-controls="multiCollapseExample1">
                                                Depositar
                                            </button>
                                    </div> <br>
                                          
                                          <div style="min-height: 120px;">
                                            <div class="collapse multi-collapse" id="multiCollapseExample1">
                                              <div class="card card-body">
                                                <form action="/ENTREGA5/depositar"
                                                method="POST"
                                                class=" justify-content-center ml-3">
                                                <span>Ingrese Monto:</span>
                                                <input type="number" name="monto"
                                                    class="bg-white rounded border-1 mb-2"
                                                    required>
                                                <button type="submit"
                                                    class="btn btn-light btn-sm align-text-center">Depositar</button>
                                                    <br>
                                            </form>
                                              </div>
                                            </div>
                                          </div>
                                  
                                      <div class="col">
                                        
                                        <i class="fas fa-fw fa-download"></i>
                                        
                                        <button class="btn btn-secondary" type="button" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample2" aria-expanded="false" aria-controls="multiCollapseExample2" id="boton2">
                                         Transferir
                                        </button>
                                    </div> <br>
                               
                                      
                                      <div style="min-height: 120px;">
                                        <div class="collapse multi-collapse" id="multiCollapseExample2">
                                          <div class="card card-body">
                                            <form action="/ENTREGA5/retirar"
                                            method="POST"
                                            class=" justify-content-center ml-3">
                                            <span>Ingrese Monto:</span>
                                            <input type="number" name="monto"
                                                class="bg-white rounded border-1 mb-2"
                                                required>
                                            <button type="submit"
                                                class="btn btn-light btn-sm align-text-center">Transferir</button>
                                        </form>
                                          </div>
                                        </div>
                                      </div>
                                      <br>
                  </div> <!-- Cierra primera columna-->
    
    
                  <div class="col-12 col-sm-4 col-md-6 col-lg-12" style="max-width: 60%;">
    
                    <div class="row d-block">
                       
                      <div class="col-12">
                        <nav class="navbar navbar-expand-lg bg-body-tertiary rounded-1">
                            <div class="container-fluid">
                                <ul class="navbar-nav ms-auto">
                        
                                    <li class="nav-item dropdown rounded-4">
                                        <a class="nav-link dropdown-toggle btn-secondary" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                            <%=usuario.getNombreApellido() %>
                                            <i class="fas fa-solid fa-user"></i>
                                        </a>
                                        <ul class="dropdown-menu">
                                          <li> <a class="dropdown-item ms-auto"
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
                                            method="POST" class="ms-auto">
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
                                            class="dropdown-item ms-auto">
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
                      </div> <!--cierre importante-->
    
                    <br>
    
                      <div class="col-12">
    
                       <div class="row p-3">
                        <div class="col-8 text-primary-emphasis fs-5 rounded-4">
                            <br>
                            <p><b>Saldo en Linea:</b> </p><br>
                            <small>$ <%=usuario.getSaldo() %></small>
                           <br><br>
                        </div>
                        <div class="col-4 text-primary-emphasis fs-5 rounded-4 p-5">
                            

                        </div>
                       </div>
                       <br><br><br>
                       <div class="col-8">
                        <div class="border-left-secondary">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="text-primary-emphasis bg-body-tertiary fs-4">
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
    
                      </div> <!-- cierre importante 2 -->
    
                    </div> <!--fila de la segunda columna-->
    
                  </div><!-- cierra segunda columna-->
    
                </div><!-- cierre primera fila-->
            </div> <!-- cierre container-->
        
  <% } else { %>
                                                                                      <p>No se encontraron usuarios en la sesión.</p>

                                                                                  <% } %> 
  


     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
             integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
             crossorigin="anonymous"></script>
           
    </body>
</html>



