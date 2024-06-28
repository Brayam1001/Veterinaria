
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Editar Mascota - Clínica Veterinaria Mascott</title>
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
                                <a class="nav-link active" aria-current="page" href="adicionarMascota.jsp">Mascotas</a>
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

                String nombre = "", especie = "", raza = "";
                int edad = 0, propietario_id = 0;

                ps = con.prepareStatement("SELECT * FROM mascota WHERE id=?");
                ps.setInt(1, id);
                rs = ps.executeQuery();

                if (rs.next()) {
                    nombre = rs.getString("nombre");
                    especie = rs.getString("especie");
                    raza = rs.getString("raza");
                    edad = rs.getInt("edad");
                    propietario_id = rs.getInt("propietario_id");
                }
                if ("POST".equalsIgnoreCase(request.getMethod())) {
                    nombre = request.getParameter("nombre");
                    especie = request.getParameter("especie");
                    raza = request.getParameter("raza");
                    edad = Integer.parseInt(request.getParameter("edad"));
                    propietario_id = Integer.parseInt(request.getParameter("propietario_id"));

                    ps = con.prepareStatement("UPDATE mascota SET nombre=?, especie=?,raza=?,edad=?,propietario_id = ? WHERE id=?");
                    ps.setString(1, nombre);
                    ps.setString(2, especie);
                    ps.setString(3, raza);
                    ps.setInt(4, edad);
                    ps.setInt(5, propietario_id);
                    ps.setInt(6, id);
                    ps.executeUpdate();
            %>
            <script>
                alert("Regristro modificado satisfactoriamente!!!");
                window.location.href = 'adicionarMascota.jsp';
            </script>
            <%
               
            }
             stmt=con.createStatement();
                ResultSet rsOwners = stmt.executeQuery("SELECT id, nombres FROM propietario");

            %>
            <h2 class="text-center">Editar Mascota</h2>
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <form action="#" method="post">
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombre</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre" value="<%= nombre%>" required>
                        </div>
                        <div class="mb-3">
                            <label for="especie" class="form-label">Especie</label>
                            <input type="text" class="form-control" id="especie" name="especie" placeholder="Especie" value="<%= especie%>" required>
                        </div>
                        <div class="mb-3">
                            <label for="raza" class="form-label">Raza</label>
                            <input type="text" class="form-control" id="raza" name="raza" placeholder="Raza" value="<%= raza%>" required>
                        </div>
                        <div class="mb-3">
                            <label for="edad" class="form-label">Edad</label>
                            <input type="number" class="form-control" id="edad" name="edad" placeholder="Edad" value="<%= edad%>" required>
                        </div>
                        <div class="mb-3">
                            <label for="propietario_id" class="form-label">Propietario</label>
                            <select class="form-select" id="propietario_id" name="propietario_id" required>
                                <option value="">Seleccionar...</option>
                                <%while(rsOwners.next()) {%>
                                <option value="<%=rsOwners.getInt("id")%>"<%= rsOwners.getInt("id") == propietario_id ? "selected" : ""%>><%=rsOwners.getString("nombres")%></option>
                                <% } %>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Guardar Cambios</button>
                    </form>
                </div>
            </div>
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