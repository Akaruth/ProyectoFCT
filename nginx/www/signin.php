<?php
session_start();
// Codigo para comprobar que es administrador para mostrar x cosas ,si es usuario formulario de registro que comprueba si cumple los requisitos
//  y hacer la isnerccion de registro del nuevo usuario , redirigiendolo a login para que inicie-->
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

$error_alias = $error_usuario = $error_contrasenia = $error_general = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") 
{
    if(isset($_POST['alias']) && isset($_POST['usuario']) && isset($_POST['contrasenia'])) 
    {
        $alias = $_POST['alias'];
        $usuario = $_POST['usuario'];
        $contrasenia = $_POST['contrasenia'];

        $longitud_alias_minima = 3;
        $longitud_alias_max = 12;
        $longitud_usuario_minima = 6;
        $longitud_usuario_max = 12;

        $longitud_contrasenia_minima = 6;

        if(strlen($alias) < $longitud_alias_minima || strlen($alias) > $longitud_alias_max) 
        {
            $error_alias = "El alias debe tener de $longitud_alias_minima caracteres a $longitud_alias_max caracteres.";
            $usuario ='Anonimo';

        } 
        elseif(strlen($usuario) < $longitud_usuario_minima || strlen($usuario) > $longitud_usuario_max ) 
        {
            $error_usuario = "El nombre de usuario debe tener de $longitud_usuario_minima caracteres a $longitud_usuario_max caracteres.";
            $usuario ='Anonimo';

        } 
        elseif(strlen($contrasenia) < $longitud_contrasenia_minima) 
        {
            $error_contrasenia = "La contraseña debe tener al menos $longitud_contrasenia_minima caracteres.";
            $usuario ='Anonimo';

        } 
        else 
        {
            include './conexiones/conexionUsuarios.php';

            $consulta_usuario = $conn->prepare("SELECT usuario FROM usuarios WHERE usuario = ?");
            $consulta_usuario->bind_param("s", $usuario);
            $consulta_usuario->execute();
            $resultado = $consulta_usuario->get_result();
            
            if ($resultado->num_rows > 0) 
            {
                $error_usuario = "El nombre de usuario ya está en uso. Por favor, elija otro.";
                $usuario ='Anonimo';
            } 
            else 
            {
                $imagen = './imagen/iconoDefault.png';
                $contrasenia_hash = hash('sha256', $contrasenia); 
                $insertar = $conn->prepare("INSERT INTO usuarios (usuario, nickUsuario, imagenUsuario, contrasena) VALUES (?, ?, ?, ?)");
                $insertar->bind_param("ssss", $usuario, $alias, $imagen, $contrasenia_hash);
                
                if($insertar->execute()) 
                {
                    header('Location: login.php');
                    exit(); 
                } 
                else 
                {
                    $usuario ='Anonimo';
                    $error_general = "Error al registrar.";
                }
            }
        }
    } 
    else 
    {
        $error_general = "Ingrese tanto el usuario como la contraseña.";
        $usuario ='Anonimo';
    }
}

?>
    <!DOCTYPE html>
    <html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registro</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="./css/menu.css">
        <link rel="stylesheet" href="./css/signin.css">
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
    <div class="fondo1">
        <div class='centrar'>
            <p class="titulo1">¡Sabiamos que te querrías registrar <i class="bi bi-emoji-smile"></i>! </p>
            <div class='card shadow py-3 tamanoFormulario1'>
                <form name="formuInicio" id="formuInicio"  method="post" class=' form-floating mx-3' action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
                    <h1 class="text-center  my-2">Regístrate</h1>

                    <div class="form-floating my-3" data-bs-toggle="tooltip" data-bs-placement="bottom" title="El alias debe ser mayor a 3 caracteres">
                        <input type="text" class="form-control" id="alias" name="alias" placeholder="" required>
                        <label for="alias"><i class="bi bi-person-vcard"></i> Alias</label>
                        <?php if (!empty($error_alias)): ?>

                        <div class="alert alert-danger mt-2"><?php echo $error_alias; ?></div>
                        <?php endif; ?>

                    </div>

                    <div class="form-floating my-3" data-bs-toggle="tooltip" data-bs-placement="bottom" title="El usuario debe ser mayor a 5 digitos" >
                        <input type="text" class="form-control" id="usuario" name="usuario" placeholder="" required>
                        <label for="usuario"><i class="bi bi-person-fill"></i> Usuario  </label>
                        <?php if (!empty($error_usuario)): ?>

                        <div class="alert alert-danger  mt-2"><?php echo $error_usuario; ?></div>
                        <?php endif; ?>

                    </div>

                    <div class="form-floating my-3" data-bs-toggle="tooltip" data-bs-placement="bottom"  title="La contraseña debe ser mayor a 5 digitos" >
                        <input type="password" class="form-control" id="contrasenia" name="contrasenia" placeholder="" required>
                        <label for="contrasenia"><i class="bi bi-lock-fill"></i> Contraseña </label>
                        <?php if (!empty($error_contrasenia)): ?>

                        <div class="alert alert-danger  mt-2"><?php echo $error_contrasenia; ?></div>
                        <?php endif; ?>

                    </div>
                    <button name="submit" class="boton  text-center w-100 mb-3 ">Continuar</button>

                    <div class='text-center'>
                        <a href="login.php" class='enlace mb-3 text-decoration-none'>¿Ya estás registrado? ¡Inicia Sesión!</a>
                    </div>

                </form>
                <?php if (!empty($error_general)): ?>

                <div class="alert alert-danger  mt-2"><?php echo isset($error_general) ? $error_general : ''; ?></div>
                <?php endif; ?>

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
    
        <script src="./js/menuDesplegable.js"></script>
        <script src="./js/mostrarTiempoBaza2.js"></script>

    </body>
    </html>