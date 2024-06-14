<?php
session_start();
// Pagina para editar los usuarios desde el apartado de administrador
// Consulta de los atributos de los usuarios como el usuario (nombre) y contraseña y actualización como los nuevos cambios

include '../conexiones/conexionUsuarios.php';
$usuario = isset($_SESSION['usuario']) ? $_SESSION['usuario'] : 'Anonimo';



$usuarioAdmin = '';
$esAdmin = false;
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
if ($esAdmin == false) 
{
    header("Location: login.php");
    exit();
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $usuarioActual = $_POST['usuarioActual'];
    $nuevoUsuario = $_POST['usuario'];
    $contrasena = $_POST['contrasena'];

    // Encriptar la contraseña utilizando SHA-256
    $contrasenaEncriptada = hash('sha256', $contrasena);

    $sql = "UPDATE usuarios SET 
                usuario = ?,
                contrasena = ?
            WHERE usuario = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sss", $nuevoUsuario, $contrasenaEncriptada, $usuarioActual);
    
    if ($stmt->execute() === TRUE) {
        header('Location: ../adminpanel.php');
    } else {
        echo "Error updating record: " . $stmt->error;
    }

    $conn->close();
} else {
    $usuario = $_GET['id'];
    $sql = "SELECT * FROM usuarios WHERE usuario = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $usuario);
    $stmt->execute();
    $result = $stmt->get_result();
    $row = $result->fetch_assoc();
    ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Akachat</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="../css/menu.css">
    <link rel="stylesheet" href="../css/footer.css">
    <link rel="stylesheet" href="../css/editarPanel.css">
    <link rel="preconnect" href="https://fonts.googleapis.com/" >
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Ojuju&display=swap" rel="stylesheet">
</head>
<body>
<div class="sticky-top">
    <div class="encabezado ">
            <a href="../index.php">
                <img src="../imagen/logo1.png" alt="Logo" class="logoP" >
            </a>     
            
            <div class="box">
                <?php if ($usuario !== 'Anonimo'): ?>
                    <li class="mt-2">Usuario: <?php echo $usuarioAdmin; ?> <button class="botonUsuario"><a href='../conexiones/logout.php' class='no-decoracion-dark'>Cerrar Sesión</a></button></li>
                <?php else: ?>
                    <li class="mt-2"><button class="botonUsuario"><a href='../login.php' class='no-decoracion-dark'>Iniciar Sesión</a></button> <button class="botonUsuario no-decoracion-dark"><a href='../signin.php' class='no-decoracion-dark'>Registrarse</a></button></li>
                <?php endif; ?>
            </div>
    </div>

    <div class=" nav ">
       
       <div class="abrirMenu"><i class="bi bi-list animar"></i></div>
       <ul class="mainMenu">
         
           <li><a href="../index.php">Inicio <i class="bi bi-house-fill  animar"></i></a></li>
           <li class="categoria"><a href="../rutasInteractivasJuego.php" id="">Minijuego <i class="bi bi-joystick animar"></i></a>
               <ul class="submenu">
                   <li><a href="../visualizarRuta.php?idRuta=1" id="hombre">Ruta 1</a></li>
                   <li><a href="../visualizarRuta.php?idRuta=2" id="mujer">Ruta 2</a></li>
                   <li><a href="../visualizarRuta.php?idRuta=3" id="niños">Ruta 3</a></li>
               </ul> 
           </li>

           <li><a href="../akachat.php">Akachat <i class="bi bi-chat-fill animar"></i></a></li>

           <li><a href="../akadex.php">AkaDex <i class="bi bi-lightning-charge-fill animar"></i></a></li>

           <li><a href="../contacto.php">Contacto <i class="bi bi-envelope-fill animar"></i></a></li>

           <li><a href="../perfil.php">Perfil <i class="bi bi-person-fill animar"></i></a></li>

           <?php if ($esAdmin): ?>
                <li><a href="../adminpanel.php">AdminPanel <i class="bi bi-person-fill animar"></i></a></li>
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

    <div class="centrar ">
        <div class="titulo">Editar Usuario</div>
        <form method="POST" action="" class="formulario">
            <input type="hidden" name="usuarioActual" value="<?php echo $row['usuario']; ?>">
            
            <div class="mb-3">
                <label for="usuario" class="form-label">Usuario:</label>
                <input type="text" class="form-control" name="usuario" value="<?php echo $row['usuario']; ?>" >
            </div>
            
            <div class="mb-3">
                <label for="contrasena" class="form-label">Contraseña:</label>
                <input type="password" class="form-control" name="contrasena" >
            </div>
            
            <input type="submit" value="Actualizar" class="boton">
        </form>
    </div>
    

    <div id="footer">
        <div class="logoFooter">
            <a href="../index.php">
                <img src="../imagen/logo1.png" alt="Logo" class="logo" >
            </a>
        </div>
        <div class="contacto">

            <div>
                <p class="resaltado">Gmail profesional: <br> clatapa907@g.educaand.es</p> 
                <p class="resaltado">Teléfono profesional: <br> XXX-XXX-XXX</p>
            </div>
           

        </div>
        <div class="faqs">
            <h5 class="titulofaqs"><a href="../">Preguntas frecuentes</a></h5>
            <ul class="tamano">
                <li>¿Cuando hareis mas rutas?</li>
                <li>¿Como pensais mantener la pagina a flote?</li>
                <li>¿Implementareis algun juego online?</li>
            </ul>
        </div>
        <div class="autor">
            <h5 class="resaltadoAu">Autora de la página</h5>
            <img src="../imagen/logo1.png" alt="Logo" class="fotoAutor" >

        </div>
        <div class="copi">Copyright: AkaSZone (Dueña de AkaChat)</div>
    </div>


    <?php
}
?>
