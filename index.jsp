<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Clínica Veterinaria Mascott</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./styles.css">
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
        <!--===== HOME =====-->
        <section id="home" class="text-center">
            <div class="row">
                <div class="col-md-6 my-auto">
                    <h1>En <span class="text-success">Mascott</span> tendrás la mejor atención para tu mascota</h1>
                    <a href="tel:+573114569768" class="btn btn-primary my-2">Llamar ahora</a>
                    <a href="mailto:clinica@veterinariamascott.com" class="btn btn-secondary my-2">Contáctanos por Email</a>
                    <div class="mt-3">
                        <a href="https://www.facebook.com/ClinicaVetMascott" target="_blank" class="btn btn-outline-dark mx-1">
                            <i class="fab fa-facebook-f"></i> Facebook
                        </a>
                        <a href="https://www.instagram.com/veterinariamascott/?hl=es" target="_blank" class="btn btn-outline-dark mx-1">
                            <i class="fab fa-instagram"></i> Instagram
                        </a>
                        <a href="https://twitter.com/veterinariamascott" target="_blank" class="btn btn-outline-dark mx-1">
                            <i class="fab fa-twitter"></i> Twitter
                        </a>
                    </div>
                </div>
                <div class="col-md-6">
                    <img src="imagenes/banner.png" alt="Banner Mascott" class="img-fluid">
                </div>
            </div>
        </section>

        <!--===== ABOUT =====-->
        <section id="about" class="my-5">
            <h2 class="text-center">Nosotros</h2>
            <div class="row">
                <div class="col-md-6">
                    <img src="imagenes/fullsizelogo2.png" alt="Mascott Logo" class="img-fluid">
                </div>
                <div class="col-md-6 my-auto">
                    <h2>Clínica Veterinaria Mascott</h2>
                    <p>Mascott nace en 1997 en la ciudad de Sogamoso-Boyacá. La clínica ha ido creciendo logrando implementar todos los servicios necesarios para el cuidado de su mascota. Estamos ubicados en la calle 15 # 9-54.</p>
                </div>
            </div>
        </section>

        <!--===== SKILLS =====-->
        <section id="skills" class="my-5">
            <h2 class="text-center">Servicios</h2>
            <div class="row">
                <div class="col-md-6">
                    <h3>Servicios Profesionales</h3>
                    <p>Contamos con todos los servicios profesionales que tu mascota necesita.</p>
                    <ul class="list-group">
                        <li class="list-group-item"><i class="fas fa-check-circle"></i> LABORATORIO CLÍNICO</li>
                        <li class="list-group-item"><i class="fas fa-check-circle"></i> RAYOS X</li>
                        <li class="list-group-item"><i class="fas fa-check-circle"></i> ECOGRAFIA</li>
                        <li class="list-group-item"><i class="fas fa-check-circle"></i> CIRUGIA ESPECIALIZADA</li>
                        <li class="list-group-item"><i class="fas fa-check-circle"></i> HOSPITALIZACIÓN</li>
                        <li class="list-group-item"><i class="fas fa-check-circle"></i> URGENCIAS 24 HORAS</li>
                    </ul>
                </div>
                <div class="col-md-6">
                    <img src="imagenes/work3.png" alt="Servicios" class="img-fluid">
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
    
    <iframe id="chatbotIframe" src="https://tu-dominio-de-botpress.com/s/chat-window" style="border: none; width: 100%; height: 500px;"></iframe>

   <script src="https://cdn.botpress.cloud/webchat/v1/inject.js"></script>
<script src="https://mediafiles.botpress.cloud/e7198446-313d-4b0c-b272-586aa6220fd4/webchat/config.js" defer></script>
    
</body>
</html>
