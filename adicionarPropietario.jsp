<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Clínica Veterinaria Mascott</title>
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
                                <a class="nav-link active" aria-current="page" href="index.jsp">Clínica</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#about">Nosotros</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    Registro
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="adicionarPropietario.jsp">Propietario</a></li>
                                    <li><a class="dropdown-item" href="adicionarMascota.jsp">Mascotas</a></li>
                                    <li><a class="dropdown-item" href="adicionarMedico.jsp">Médicos</a></li>
                                </ul>
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
                ResultSet rs;
                stmt = con.createStatement();
                rs = stmt.executeQuery("SELECT * FROM propietario");
            %>
            <div class="container">
                <button type="button" class="btn btn-success btn-lg" data-bs-toggle="modal" data-bs-target="#myModal">+ Agregar Propietario</button><br><br>

                <div class="container">
                    <table class="table table-bordered" id="tablaDatos">
                        <thead>
                            <tr>
                                <th class="text-center">ID</th>
                                <th class="text-center">Tipo Documento</th>
                                <th class="text-center">Número Documento</th>
                                <th class="text-center">Nombres</th>
                                <th class="text-center">Género</th>
                                <th class="text-center">Dirección</th>
                                <th class="text-center">Celular</th>
                                <th class="text-center">Email</th>
                                <th class="text-center">Acciones</th>
                            </tr>
                        </thead>
                        <tbody id="tbodys">
                            <% while (rs.next())
                                {%>

                            <tr>
                                <td class="text-center"><%=rs.getInt("id")%></td>
                                <td class="text-center"><%=rs.getString("di")%></td>
                                <td class="text-center"><%=rs.getString("numdocumento")%></td>
                                <td class="text-center"><%=rs.getString("nombres")%></td>
                                <td class="text-center"><%=rs.getString("genero")%></td>
                                <td class="text-center"><%=rs.getString("direccion")%></td>
                                <td class="text-center"><%=rs.getString("celular")%></td>
                                <td class="text-center"><%=rs.getString("mail")%></td>
                                <td class="text-center">
                                    <a href="editarPropietario.jsp?id=<%=rs.getInt("id")%>" class="btn btn-primary"><i class="fas fa-edit"></i></a>
                                    <a href="eliminarPropietario.jsp?id=<%=rs.getInt("id")%>" class="btn btn-danger"><i class="fas fa-trash-alt"></i></a>
                                </td>
                            </tr>
                            <%}%>

                        </tbody>
                    </table>
                </div>

                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document" style="z-index: 9999; width: 450px">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="myModalLabel">Agregar Propietario</h4>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form action="" method="post">
                                    <div class="mb-3">
                                        <label for="di" class="form-label">Tipo de Documento</label>
                                        <select class="form-select" id="di" name="di" required>
                                            <option value="">Seleccionar...</option>
                                            <option value="CC">Cédula de Ciudadanía</option>
                                            <option value="TI">Tarjeta de Identidad</option>
                                            <option value="P">Pasaporte</option>
                                            <option value="CE">Cédula de Extranjería</option>
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label for="numdocumento" class="form-label">Número de Documento</label>
                                        <input type="text" class="form-control" id="numdocumento" name="numdocumento" placeholder="Número de Documento" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="nombres" class="form-label">Nombres</label>
                                        <input type="text" class="form-control" id="nombres" name="nombres" placeholder="Nombres" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="genero" class="form-label">Género</label>
                                        <select class="form-select" id="genero" name="genero" required>
                                            <option value="">Seleccionar...</option>
                                            <option value="Masculino">Masculino</option>
                                            <option value="Femenino">Femenino</option>
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label for="direccion" class="form-label">Dirección</label>
                                        <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Dirección">
                                    </div>
                                    <div class="mb-3">
                                        <label for="celular" class="form-label">Celular</label>
                                        <input type="text" class="form-control" id="celular" name="celular" placeholder="Celular">
                                    </div>
                                    <div class="mb-3">
                                        <label for="mail" class="form-label">Email</label>
                                        <input type="email" class="form-control" id="mail" name="mail" placeholder="Email">
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                        <input type="submit" value="Guardar" class="btn btn-primary"/>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    String di, numdocumento, nombres, genero, direccion, celular, mail;
                    di = request.getParameter("di");
                    numdocumento = request.getParameter("numdocumento");
                    nombres = request.getParameter("nombres");
                    genero = request.getParameter("genero");
                    direccion = request.getParameter("direccion");
                    celular = request.getParameter("celular");
                    mail = request.getParameter("mail");

                    if (di != null && numdocumento != null && nombres != null && genero != null)
                    {
                        ps = con.prepareStatement("INSERT INTO propietario( di, numdocumento, nombres, genero, direccion, celular, mail)VALUES(?,?,?,?,?,?,?)");
                        ps.setString(1, di);
                        ps.setString(2, numdocumento);
                        ps.setString(3, nombres);
                        ps.setString(4, genero);
                        ps.setString(5, direccion);
                        ps.setString(6, celular);
                        ps.setString(7, mail);
                        ps.executeUpdate();
                %>
                <script>
                    alert("Registro agregado satisfactoriamente!!!");
                    window.location.href = 'adicionarPropietario.jsp';
                </script>
                <%
                    }


                %>

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

