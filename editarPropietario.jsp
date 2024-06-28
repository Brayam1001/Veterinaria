<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE <html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Propietario - Clínica Veterinaria Mascott</title>
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
                            <a class="nav-link active" aria-current="page" href="adicionarPropietario.jsp">Propietarios</a>
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
                int id = Integer.parseInt(request.getParameter("id"));
                ResultSet rs = null;
                
                String di ="", numdocumento ="", nombres ="", genero ="", direccion ="", celular ="", mail ="";
                
                ps = con.prepareStatement("SELECT * FROM propietario WHERE id = ?");
                ps.setInt(1, id);
                rs = ps.executeQuery();
                
                if (rs.next()) {
                        di = rs.getString("di");
                        numdocumento = rs.getString("numdocumento");
                        nombres = rs.getString("nombres");
                        genero = rs.getString("genero");
                        direccion = rs.getString("direccion");
                        celular = rs.getString("celular");
                        mail = rs.getString("mail");
                    }
if ("POST".equalsIgnoreCase(request.getMethod())) {
                    di = request.getParameter("di");
                    numdocumento = request.getParameter("numdocumento");
                    nombres = request.getParameter("nombres");
                    genero = request.getParameter("genero");
                    direccion = request.getParameter("direccion");
                    celular = request.getParameter("celular");
                    mail = request.getParameter("mail");

                    ps = con.prepareStatement("UPDATE propietario SET di=?, numdocumento=?, nombres=?, genero=?, direccion=?, celular=?, mail=?  WHERE id=?");
                    ps.setString(1, di);
                    ps.setString(2, numdocumento);
                    ps.setString(3, nombres);
                    ps.setString(4, genero);
                    ps.setString(5, direccion);
                    ps.setString(6, celular);
                    ps.setString(7, mail);
                    ps.setInt(8, id);
                    ps.executeUpdate();
            %>
            <script>
                alert("Registro modificado satisfactoriamente");
                window.location.href = 'adicionarPropietario.jsp';

            </script>
            <%
                }
            %>
        <h2 class="text-center">Editar Propietario</h2>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <form action="editarPropietario.jsp?id=<%= id%>" method="post">
                    <div class="mb-3">
                        <label for="di" class="form-label">Tipo de Documento</label>
                        <select class="form-select" id="di" name="di" required>
                            <option value="">Seleccionar...</option>
                            <option value="CC" <%= "CC".equals(di) ? "selected" : ""%>> Cédula de Ciudadanía</option>
                            <option value="TI" <%= "TI".equals(di) ? "selected" : ""%>>Tarjeta de Identidad</option>
                            <option value="P" <%= "P".equals(di) ? "selected" : ""%>>Pasaporte</option>
                            <option value="CE" <%= "CE".equals(di) ? "selected" : ""%>>Cédula de Extranjería</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="numdocumento" class="form-label">Número de Documento</label>
                        <input type="text" class="form-control" id="numdocumento" name="numdocumento" placeholder="Número de Documento" value="<%= numdocumento%>" required>
                    </div>
                    <div class="mb-3">
                        <label for="nombres" class="form-label">Nombres</label>
                        <input type="text" class="form-control" id="nombres" name="nombres" placeholder="Nombres" value="<%= nombres%>" required>
                    </div>
                    <div class="mb-3">
                        <label for="genero" class="form-label">Género</label>
                        <select class="form-select" id="genero" name="genero" required>
                            <option value="">Seleccionar...</option>
                            <option value="Masculino" <%= "Masculino".equals(genero) ? "selected" : ""%>>Masculino</option>
                            <option value="Femenino" <%= "Femenino".equals(genero) ? "selected" : ""%>>Femenino</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="direccion" class="form-label">Dirección</label>
                        <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Dirección" value="<%= direccion%>">
                    </div>
                    <div class="mb-3">
                        <label for="celular" class="form-label">Celular</label>
                        <input type="text" class="form-control" id="celular" name="celular" placeholder="Celular" value="<%= celular%>">
                    </div>
                    <div class="mb-3">
                        <label for="mail" class="form-label">Email</label>
                        <input type="email" class="form-control" id="mail" name="mail" placeholder="Email" value="<%= mail%>">
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