<?php
session_start();
// Codigo para comprobar que es administrador, si es administrador se le redirige a panel de contro 
//   y comprobar que la contraseña se la correcta e inicie sesion , si es usuario lo mismo pero lo redirige a index.php
include './conexiones/conexionUsuarios.php';

$usuario = isset($_SESSION['usuario']) ? $_SESSION['usuario'] : 'Anonimo';
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
$error_general = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") 
{

    $usuarioLogeando = $_POST['usuario'];
    $contrasenia = $_POST['contrasenia'];

    $contrasenia_hash_ingresada = hash('sha256', $contrasenia);

    // Consultamos la tabla de usuarios y adminT
    $stmt1 = $conn->prepare("SELECT contrasena FROM usuarios WHERE usuario = ?");
    $stmt1->bind_param("s", $usuarioLogeando);
    $stmt1->execute();
    $resultado_usuario = $stmt1->get_result();

    $stmt2 = $conn->prepare("SELECT contrasena FROM adminT WHERE adminNick = ?");
    $stmt2->bind_param("s", $usuarioLogeando);
    $stmt2->execute();
    $resultado_admin = $stmt2->get_result();

    
    $contrasenia_hash_db = '';
    $contrasenia_hash_db_admin = '';

    if ($resultado_usuario->num_rows > 0) 
    {
        $fila_usuario = $resultado_usuario->fetch_assoc();
        $contrasenia_hash_db = $fila_usuario['contrasena'];
    }

    if ($resultado_admin->num_rows > 0) 
    {
        $fila_admin = $resultado_admin->fetch_assoc();
        $contrasenia_hash_db_admin = $fila_admin['contrasena'];
    }

    // Verificamos si las contraseñas coinciden y redirigimos
    if ($contrasenia_hash_db === $contrasenia_hash_ingresada) 
    {
        $_SESSION['usuario'] = $usuarioLogeando;
        header("Location: index.php");
        exit();
    } 
    elseif ($contrasenia_hash_db_admin === $contrasenia_hash_ingresada) 
    {
        $_SESSION['usuario'] = $usuarioLogeando;
        header("Location: adminpanel.php");
        exit();
    } 
    else 
    {
        $error_general = "Usuario o contraseña incorrectos.";
    }

    $conn->close();
}
?>



<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicia Sesión</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="./css/menu.css">
    <link rel="stylesheet" href="./css/login.css">
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
<div class="fondo2">
    <div class='centrar'>
            <p class="titulo2">Bienvenid@ de nuevo <i class="bi bi-emoji-wink"></i></p>
            <div class='card shadow py-3 tamanoFormulario2'>
                <form name="formuInicio" id="formuInicio"  method="post" class=' form-floating mx-3' action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
                    <h1 class="text-center  my-2">Inicia Sesión</h1>
                    <div class="form-floating my-3" >
                        <input type="text" class="form-control" id="usuario" name="usuario" placeholder="" required>
                        <label for="usuario"><i class="bi bi-person-fill"></i> Usuario  </label>
                    </div>

                    <div class="form-floating my-3">
                        <input type="password" class="form-control" id="contrasenia" name="contrasenia" placeholder="" required>
                        <label for="contrasenia"><i class="bi bi-lock-fill"></i> Contraseña </label>
                    </div>
                    <?php if (!empty($error_general)): ?>

                    <div class="alert alert-danger mb-2"><?php echo $error_general; ?></div>
                    <?php endif; ?>

                    <button name="submit" class="boton  text-center w-100 mb-3 ">Continuar</button>

                    <div class='text-center'>
                        <a href="signin.php" class='enlace text-decoration-none'>¿No estás registrado? ¡Regístrate aquí!</a>
                    </div>
                </form>
            </div>
        </div>
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
    <script src="./js/mostrarTiempoBaza2.js"></script>

    <script src="./js/menuDesplegable.js"></script>
</body>
</html>
