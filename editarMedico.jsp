<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Médico</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./styles.css">
    <link rel="icon" href="./imagenes/logoperfil.png">
    <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    </head>
    <body>
        <!--===== HEADER =====-->
        <header class="bg-success text-white text-center py-3">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">
                        <img src="imagenes/logoperfil.png" alt="Mascott Logo" width="30" height="30" class="d-inline-block align-text-top">
                        Mascott
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="adicionarMedico.jsp">Mascotas</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="consulta.jsp">Consulta</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="contacto.jsp">Contacto</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>

        <main class="container my-4">
       <%
                Connection con;
                String url = "jdbc:mysql://localhost:3306/veterinaria";
                String driver = "com.mysql.cj.jdbc.Driver";
                String user = "root";
                String password = "";
                Class.forName(driver);
                con = DriverManager.getConnection(url, user, password);
                PreparedStatement ps;
                Statement stmt;

                int id = Integer.parseInt(request.getParameter("id"));
                ResultSet rs = null;

                String nombres = "", especialidad = "", telefono = "",mail="";
             

                ps = con.prepareStatement("SELECT * FROM medico WHERE id=?");
                ps.setInt(1, id);
                rs = ps.executeQuery();

                if (rs.next()) {
                    nombres = rs.getString("nombres");
                    especialidad= rs.getString("especialidad");
                    telefono = rs.getString("telefono");
                    mail = rs.getString("mail");
                    
                }
                if ("POST".equalsIgnoreCase(request.getMethod())) {
                    nombres = request.getParameter("nombres");
                    especialidad = request.getParameter("especialidad");
                    telefono = request.getParameter("telefono");
                    mail = request.getParameter("mail");
                    

                    ps = con.prepareStatement("UPDATE medico SET nombres=?, especialidad=?,telefono=?,mail=? WHERE id=?");
                    ps.setString(1, nombres);
                    ps.setString(2,especialidad);
                    ps.setString(3,telefono);
                    ps.setString(4, mail);
                    ps.setInt(5, id);
                    ps.executeUpdate();
            %>
            <script>
                alert("Regristro modificado satisfactoriamente!!!");
                window.location.href = 'adicionarMedico.jsp';
            </script>
            <%
               
            }
            %>   
            <h2 class="text-center">Editar Medico</h2>
            <div class="row justify-content-center">
                <div class="col-md-6">
        <form action="editarMedico.jsp" method="post">
            <input type="hidden" name="id" value="<%= id%>">
            <div class="mb-3">
                <label for="nombres" class="form-label">Nombre</label>
                <input type="text" class="form-control" id="nombres" name="nombres" value="<%= nombres%>" required>
            </div>
            <div class="mb-3">
                <label for="especialidad" class="form-label">Especialidad</label>
                <input type="text" class="form-control" id="especialidad" name="especialidad" value="<%=especialidad%>" required>
            </div>
            <div class="mb-3">
                <label for="telefono" class="form-label">Teléfono</label>
                <input type="text" class="form-control" id="telefono" name="telefono" value="<%=telefono%>" required>
            </div>
            <div class="mb-3">
                <label for="mail" class="form-label">Email</label>
                <input type="email" class="form-control" id="mail" name="mail" value="<%=mail%>" required>
            </div>
            <button type="submit" name="actualizar" class="btn btn-primary">Actualizar</button>
                </div>
                </div>
        </form>
        
    </main>
            
 <!--===== FOOTER =====-->
        <footer class="bg-dark text-white text-center py-3">
            <p>Clínica Veterinaria Mascott<br>Colombia</p>
            <div class="my-3">
                <a href="https://www.facebook.com/ClinicaVetMascott" target="_blank" class="btn btn-outline-light mx-1">
                    <i class="fab fa-facebook-f"></i>
                </a>
                <a href="https://www.instagram.com/veterinariamascott/?hl=es" target="_blank" class="btn btn-outline-light mx-1">
                    <i class="fab fa-instagram"></i>
                </a>
                <a href="https://twitter.com/veterinariamascott" target="_blank" class="btn btn-outline-light mx-1">
                    <i class="fab fa-twitter"></i>
                </a>
            </div>
            <p>Urgencias 24 horas +57 3114569768</p>
            <p>Calle 15 #9-54 Sogamoso-Boyacá</p>
            <p>ADSO 2024</p>
        </footer>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Font Awesome JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
    </body>
</html>