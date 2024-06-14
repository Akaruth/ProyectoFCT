<?php
session_start();
// Codigo para comprobar que es administrador para mostrar x cosas como responder reportes ,si es usuario le muestra solo
//   sus reportes y las respuestas del admin
include './consultas/consultasMensajeria.php';
include './consultas/consultaMensaje.php';

if (!isset($_SESSION['usuario'])) {
    echo "Debes iniciar sesión para ver tus reportes.";
    exit;
}

$usuario = $_SESSION['usuario'];
$esAdmin = false;

if ($usuario !== 'Anonimo') {
    $query = "SELECT * FROM adminT WHERE adminNick = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("s", $usuario);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $usuarioAdmin = $row['adminNick'];
        $esAdmin = true;
    }
}

// varaibles de paginación
$comentariosPorPagina = 3; // reportes por página
$totalComentarios = $esAdmin ? obtenerTotalReportes() : obtenerTotalReportesUsuario($usuario);
$totalPaginas = ceil($totalComentarios / $comentariosPorPagina);
$paginaActual = isset($_GET['pagina']) ? intval($_GET['pagina']) : 1;
$indiceInicio = ($paginaActual - 1) * $comentariosPorPagina;
// Si es admin se le muestran todos los reportes ni importar el usuario
$reportes = $esAdmin ? obtenerReportesTodosUsuarios($indiceInicio, $comentariosPorPagina) : obtenerReportesDelUsuario($usuario, $indiceInicio, $comentariosPorPagina);
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mensajeria</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="./css/menu.css">
    <link rel="stylesheet" href="./css/mensajeria.css">
    <link rel="stylesheet" href="./css/footer.css">
    <link rel="preconnect" href="https://fonts.googleapis.com/" >
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Ojuju&display=swap" rel="stylesheet">
</head>
<body>
<div class="sticky-top">
    <div class="encabezado ">
            <a href="index.php">
                <img src="./imagen/logo1.png" alt="Logo" class="logoP" >
            </a>     
            
            <div class="box">
                <?php if ($usuario !== 'Anonimo'): ?>
                    <li class="mt-2">Usuario: <?php echo $usuario; ?> <button class="botonUsuario"><a href='./conexiones/logout.php' class='no-decoracion-dark'>Cerrar Sesión</a></button></li>
                <?php else: ?>
                    <li class="mt-2"><button class="botonUsuario"><a href='login.php' class='no-decoracion-dark'>Iniciar Sesión</a></button> <button class="botonUsuario no-decoracion-dark"><a href='signin.php' class='no-decoracion-dark'>Registrarse</a></button></li>
                <?php endif; ?>
            </div>
    </div>

    <div class="nav">
       
       <div class="abrirMenu"><i class="bi bi-list animar"></i></div>
       <ul class="mainMenu">
         
           <li><a href="index.php">Inicio <i class="bi bi-house-fill  animar"></i></a></li>
           <li class="categoria"><a href="rutasInteractivasJuego.php" id="">Minijuego <i class="bi bi-joystick animar"></i></a>
               <ul class="submenu">
                   <li><a href="visualizarRuta.php?idRuta=1" id="hombre">Ruta 1</a></li>
                   <li><a href="visualizarRuta.php?idRuta=2" id="mujer">Ruta 2</a></li>
                   <li><a href="visualizarRuta.php?idRuta=3" id="niños">Ruta 3</a></li>
               </ul> 
           </li>

           <li><a href="akachat.php">Akachat <i class="bi bi-chat-fill animar"></i></a></li>

           <li><a href="akadex.php">AkaDex <i class="bi bi-lightning-charge-fill animar"></i></a></li>

           <li><a href="contacto.php">Contacto <i class="bi bi-envelope-fill animar"></i></a></li>

           <li><a href="perfil.php">Perfil <i class="bi bi-person-fill animar"></i></a></li>

           <?php if ($esAdmin): ?>
            <li><a href="adminpanel.php">AdminPanel <i class="bi bi-gear"></i></a></li>
           <?php endif; ?>

           <div class="cerrarMenu"><i class="bi bi-x-circle animar "></i></div>
           <span class="iconos">
               <i class="bi bi-facebook"></i>
               <i class="bi bi-instagram"></i>
               <i class="bi bi-twitter"></i>
           </span>
       </ul>
   </div>
</div>

<div class="fotoMensajeria"></div>

<div class="titulos">


</div>

<div class="fondo">
<div class="envoltorioMensajeria">
    <!-- reportes del usuario  -->
    <?php if (!$esAdmin): ?>
        <div class="reportesRealizados">
            <?php if (!empty($reportes)): ?>
                <h2>Tus reportes</h2>
                <div>
                    <?php foreach ($reportes as $reporte): ?>
                        <p class="estiloReportes" data-id="<?php echo htmlspecialchars($reporte['idReporte']); ?>">
                            <strong>Reporte id:</strong> <?php echo htmlspecialchars($reporte['idReporte']); ?><br>
                            <strong>Remitente:</strong> <?php echo htmlspecialchars($reporte['remitente']); ?><br>
                            <strong>Fecha de Reporte:</strong> <?php echo htmlspecialchars($reporte['fechaReporte']); ?><br>
                            <strong>Tipo de Incidencia:</strong> <?php echo htmlspecialchars($reporte['tipoIncidencia']); ?><br>
                            <strong>Mensaje:</strong> <?php echo htmlspecialchars($reporte['mensaje']); ?><br>
                            <button class="boton ver">Ver <?php echo obtenerEstadoRespuestaReporte($reporte['idReporte']); ?></button>
                        </p>
                    <?php endforeach; ?>
                </div>
            <?php else: ?>
                <h4>No tienes reportes realizados.</h4>
            <?php endif; ?>
        </div>
    <?php endif; ?>
    <!-- reportes de todos los usuarios para el admin -->
    <?php if ($esAdmin): ?>
        <div class="reportesRealizados">
            <?php if (!empty($reportes)): ?>
                <h2>Reportes recibidos</h2>
                <div>
                    <?php foreach ($reportes as $reporteUsu): ?>
                        <div class="reporte">
                            <p class="estiloReportes" data-id="<?php echo htmlspecialchars($reporteUsu['idReporte']); ?>">
                                <strong>Reporte id:</strong> <?php echo htmlspecialchars($reporteUsu['idReporte']); ?><br>
                                <strong>Remitente:</strong> <?php echo htmlspecialchars($reporteUsu['remitente']); ?><br>
                                <strong>Fecha de Reporte:</strong> <?php echo htmlspecialchars($reporteUsu['fechaReporte']); ?><br>
                                <strong>Tipo de Incidencia:</strong> <?php echo htmlspecialchars($reporteUsu['tipoIncidencia']); ?><br>
                                <strong>Mensaje:</strong> <?php echo htmlspecialchars($reporteUsu['mensaje']); ?><br>
                                <button class="boton responder">Responder <?php echo obtenerEstadoRespuestaReporte($reporteUsu['idReporte']); ?></button>
                            </p>
                        </div>
                    <?php endforeach; ?>
                </div>
            <?php else: ?>
                <h4>No hay reportes recibidos.</h4>
            <?php endif; ?>
        </div>
    <?php endif; ?>
    <!-- Formulario de respuesta del admin -->
    <div class="generarRespuestas">
        <form id="formulario-respuesta" class="formulario visually-hidden" action="./consultas/responderMensaje.php" method="POST">
            <input type="hidden" name="idReporte" value="<?php echo htmlspecialchars($reporteUsu['idReporte']); ?>">
            <input type="hidden" name="destinatario" value="<?php echo $usuarioAdmin ?? ''; ?>">
            <h4>Tu respuesta :</h4>
            <div class="form-group">
                <textarea class="form-control" id="mensajeRespuesta" name="mensajeRespuesta" rows="4" placeholder="Escribir.."></textarea>
            </div>
            <button type="submit" class="boton mt-2">Enviar Respuesta</button>
        </form>
    </div>
</div>

<!-- Paginacion de los reportes -->
<nav>
    <ul class="pagination justify-content-center">
    <?php if ($totalPaginas > 1): ?>

        <li class="page-item <?php if ($paginaActual <= 1) echo 'disabled'; ?>">
            <a class="page-link" href="?pagina=<?php echo $paginaActual - 1; ?>" aria-label="Previous">
                <span aria-hidden="true"><i class="bi bi-caret-left-fill"></i></span>
            </a>
        </li>
        <?php for ($i = 1; $i <= $totalPaginas; $i++): ?>
            <li class="page-item <?php if ($paginaActual == $i) echo 'active'; ?>"><a class="page-link" href="?pagina=<?php echo $i; ?>"><?php echo $i; ?></a></li>
        <?php endfor; ?>
        <li class="page-item <?php if ($paginaActual >= $totalPaginas) echo 'disabled'; ?>">
            <a class="page-link" href="?pagina=<?php echo $paginaActual + 1; ?>" aria-label="Next">
                <span aria-hidden="true"><i class="bi bi-caret-right-fill"></i></span>
            </a>
        </li>
    <?php endif; ?>

    </ul>
</nav>
</div>
   <div id="footer">
        <div class="logoFooter">
            <div class="fondoTiempo">
                <div class="tiempoBaza" id="tiempoBaza">

                </div>
                    
            </div>
        </div>
        <div class="contacto">

            <div>
                <p class="resaltado">Gmail profesional: <br> clatapa907@g.educaand.es</p> 
                <p class="resaltado">Teléfono profesional: <br> XXX-XXX-XXX</p>
            </div>
        
        </div>
        <div class="faqs">
            <h5 class="titulofaqs"><a href="">Preguntas frecuentes</a></h5>
            <ul class="tamano">
                <li>¿Cuando hareis mas rutas?</li>
                <li>¿Como pensais mantener la pagina a flote?</li>
                <li>¿Implementareis algun juego online?</li>
            </ul>
        </div>
        <div class="autor">
            <h5 class="resaltadoAu">Autora de la página</h5>
            <img src="./imagen/logo1.png" alt="Logo" class="fotoAutor" >

        </div>
        <div class="copi">Copyright: AkaSZone (Dueña de AkaChat)</div>
    </div>
   
    <script src="./js/menuDesplegable.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="./js/marcarleido.js"></script>
    <script src="./js/responderMensaje.js"></script>
    <script src="./js/mostrarMensajeRespuesta.js"></script>
    <script src="./js/mostrarTiempoBaza2.js"></script>

</body>
</html>

