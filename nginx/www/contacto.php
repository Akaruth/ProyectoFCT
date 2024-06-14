<?php
    session_start();
    // Codigo para validar el formulario por donde manda reportes el usuario registrado y verificacion de si es admin
    include './conexiones/conexionUsuarios.php'; 


    $usuario = isset($_SESSION['usuario']) ? $_SESSION['usuario'] : 'Anonimo';
    $error_incidencia = $error_mensaje = $error_terms = "";

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        if (isset($_POST['incidencia']) && isset($_POST['mensaje'])) 
        {
            $incidencia = $_POST['incidencia'];
            $mensaje = $_POST['mensaje'];

            if (empty($incidencia)) 
            {
                $error_incidencia = "Por favor, seleccione una incidencia.";
            }
            if (empty($mensaje)) 
            {
                $error_mensaje = "Por favor, ingrese un mensaje.";
            }
            if (!isset($_POST['terms'])) 
            {
                $error_terms = "Por favor, acepta los términos y la política de privacidad.";
            }
            
            
        } 
        else 
        {
            $error_general = "Por favor, especifique la incidencia y explíquela brevemente.";
        }
    }

    $esAdmin = false;
    if ($usuario !== 'Anonimo') 
    {
        $query = "SELECT * FROM adminT WHERE adminNick = ?";
        $stmt = $conn->prepare($query);
        $stmt->bind_param("s", $usuario);
        $stmt->execute();
        $result = $stmt->get_result();
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
           
            $esAdmin = true;

        }
    }
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contacto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="./css/menu.css">
    <link rel="stylesheet" href="./css/contacto.css">
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

    <div class=" nav ">
       
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
<div class="espacio"></div>
       
    <div class="envoltorioContacto">
            <div >
                <img src="./imagen/mincinnooperador.png"  class="foto" alt="foto">       
            </div>
            <div class="formu">
                <?php if (!empty($error_general)): ?>
                    <div class="alert alert-danger"><?php echo $error_general; ?></div>
                <?php endif; ?>
                    <form class="row g-3" action="./modificaciones/enviarEmail.php" method="post">
                    <div class="col-md-12">
                        <h3>¿Tienes algún problema, duda, o comentario sobre nuestro blog?</h3>
                        <p> Usa este formulario para enviarnos tus preguntas, reportar errores, o comunicar cualquier inquietud.</p>
                    </div>
                    <div class="col-md-12">
                        <div class="input-group has-validation">
                            <span class="input-group-text" id="inputGroupPrepend"><i class="bi bi-person-fill animar"></i></span>
                            <input type="text" class="form-control" id="validationCustomUsername" name="usuario" value="<?php if ($usuario !== "Anonimo"): ?><?php echo $usuario;?> <?php else: ?>Debes registrarte primero<?php endif; ?>" readonly aria-describedby="inputGroupPrepend" required>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <label for="validationCustom04" class="form-label">Incidencia</label>
                        <select class="form-select" name="incidencia" required>
                            <option selected disabled value="">Ninguna</option>
                            <option>Dudas</option>
                            <option>Bug</option>
                            <option>Ofensas de otros usuarios</option>
                            <option>Acoso</option>
                            <option>Otro</option>
                        </select>
                        <?php if (!empty($error_incidencia)): ?>
                            <div class="alert alert-danger"><?php echo $error_incidencia; ?></div>
                        <?php endif; ?>
                    </div>
                    <div class="col-md-12">
                        <label for="validationCustom05" class="form-label">Mensaje</label>
                        <textarea class="form-control  mb-2"  name="mensaje" rows="4" ></textarea>
                        <?php if (!empty($error_mensaje)): ?>
                            <div class="alert alert-danger"><?php echo $error_mensaje; ?></div>
                        <?php endif; ?>
                    </div>
                    <div class="col-12">
                        <div class="form-check mb-2">
                            <input class="form-check-input" type="checkbox" value="" id="terms" name="terms" required>
                            <label class="form-check-label" for="terms">
                                Acepta los términos y la política de privacidad.
                            </label>
                        </div>
                        <?php if (!empty($error_terms)): ?>
                                <div class="alert alert-danger"><?php echo $error_terms; ?></div>
                        <?php endif; ?>
                    </div>
                    <div class="col-12">
                        <button class="boton" type="submit">Enviar</button>
                    </div>
                </form>
            </div>
        </div>
    
    </div>

    <div class="espacio"></div>


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
    <script src="./js/mostrarTiempoBaza2.js"></script>
    <script src="./js/menuDesplegable.js"></script>
</body>
</html>
