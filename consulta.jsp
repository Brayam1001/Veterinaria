<%@ page import="java.util.*, java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar Consulta</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
    <link rel="icon" href="imagenes/logoperfil.png">
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
                                <li><a class="dropdown-item" href="consulta.jsp">Consulta</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="consulta.jsp">Consulta</a></li>
                        <li class="nav-item">
                            <a class="nav-link" href="contacto.jsp">Contacto</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <main class="container my-4">
        <!--===== FORMULARIO DE REGISTRO DE CONSULTA =====-->
        <section id="register-consulta" class="my-5">
            <h2 class="text-center">Registrar Consulta</h2>
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <form action="consulta.jsp" method="post" id="consultaForm">
                        <div class="mb-3">
                            <label for="fecha" class="form-label">Fecha</label>
                            <input type="date" class="form-control" id="fecha" name="fecha" required>
                        </div>
                        <div class="mb-3">
                            <label for="motivo" class="form-label">Motivo</label>
                            <input type="text" class="form-control" id="motivo" name="motivo" placeholder="Motivo de la consulta" required>
                        </div>
                        <div class="mb-3">
                            <label for="tratamiento" class="form-label">Tratamiento</label>
                            <textarea class="form-control" id="tratamiento" name="tratamiento" placeholder="Tratamiento" required></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="propietario_id" class="form-label">Propietario</label>
                            <select class="form-select" id="propietario_id" name="propietario_id" required onchange="loadMascotas()">
                                <option value="">Seleccionar...</option>
                                <%
                                    try {
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/veterinaria", "root", "");
                                        Statement stmt = con.createStatement();
                                        ResultSet rs = stmt.executeQuery("SELECT id, nombres FROM Propietario");

                                        while (rs.next()) {
                                            out.println("<option value='" + rs.getInt("id") + "'>" + rs.getString("nombres") + "</option>");
                                        }
                                        con.close();
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="mascota_id" class="form-label">Mascota</label>
                            <select class="form-select" id="mascota_id" name="mascota_id" required>
                                <option value="">Seleccionar...</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="medico_id" class="form-label">Médico</label>
                            <select class="form-select" id="medico_id" name="medico_id" required>
                                <option value="">Seleccionar...</option>
                                <%
                                    try {
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/veterinaria", "root", "");
                                        Statement stmt = con.createStatement();
                                        ResultSet rs = stmt.executeQuery("SELECT id, nombres FROM Medico");

                                        while (rs.next()) {
                                            out.println("<option value='" + rs.getInt("id") + "'>" + rs.getString("nombres") + "</option>");
                                        }
                                        con.close();
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Registrar</button>
                        <button type="button" class="btn btn-secondary" onclick="limpiarCampos()">Limpiar</button>
                    </form>
                </div>
            </div>
        </section>
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

    <script>
        function loadMascotas() {
            const propietarioId = document.getElementById('propietario_id').value;
            const mascotaSelect = document.getElementById('mascota_id');
            mascotaSelect.innerHTML = '<option value="">Seleccionar...</option>';

            if (propietarioId) {
                fetch('getMascota.jsp?propietario_id=' + propietarioId)
                    .then(response => response.text())
                    .then(data => {
                        mascotaSelect.innerHTML = data;
                    })
                    .catch(error => console.error('Error:', error));
            }
        }

        function limpiarCampos() {
            document.getElementById('consultaForm').reset();
            document.getElementById('mascota_id').innerHTML = '<option value="">Seleccionar...</option>';
        }
    </script>
</body>
</html>

<%@ page import="java.sql.*" %>
<%
    String fecha = request.getParameter("fecha");
    String motivo = request.getParameter("motivo");
    String tratamiento = request.getParameter("tratamiento");

    String propietarioIdStr = request.getParameter("propietario_id");
    String mascotaIdStr = request.getParameter("mascota_id");
    String medicoIdStr = request.getParameter("medico_id");

    if (propietarioIdStr != null && mascotaIdStr != null && medicoIdStr != null) {
        int propietario_id = Integer.parseInt(propietarioIdStr);
        int mascota_id = Integer.parseInt(mascotaIdStr);
        int medico_id = Integer.parseInt(medicoIdStr);

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            String url = "jdbc:mysql://localhost:3306/veterinaria";
            String user = "root";
            String password = "";
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);

            String sql = "INSERT INTO Consulta (fecha, motivo, tratamiento, propietario_id, mascota_id, medico_id) VALUES (?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, fecha);
            ps.setString(2, motivo);
            ps.setString(3, tratamiento);
            ps.setInt(4, propietario_id);
            ps.setInt(5, mascota_id);
            ps.setInt(6, medico_id);
            ps.executeUpdate();

            rs = ps.getGeneratedKeys();
            int consultaId = 0;
            if (rs.next()) {
                consultaId = rs.getInt(1);
            }

            if (consultaId > 0) {
                response.sendRedirect("reporte.jsp?id=" + consultaId);
            } else {
                out.println("<script>alert('Error al registrar la consulta.');</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    } else {
        out.println("<script>alert('Por favor complete todos los campos.');</script>");
    }
%>