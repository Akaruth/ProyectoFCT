<?php
session_start();
// Codigo para insertar entradas como usuario 
include '../conexiones/conexionUsuarios.php'; 

if (!isset($_SESSION['usuario'])) 
{
    header("Location: ../login.php");
    exit();
}

$usuario = $_SESSION['usuario'];

$esAdmin = false;
if ($usuario !== 'Anonimo') 
{
    $query = "SELECT * FROM adminT WHERE adminNick = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("s", $usuario);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows > 0) 
    {
        $esAdmin = true;
    }
}

// Si el formulario se envió
if ($_SERVER["REQUEST_METHOD"] == "POST") 
{
    $titulo = $_POST['titulo'];
    $descripcion = $_POST['descripcion'];

    // Se validan los campos primero 
    if (empty($titulo) || empty($descripcion)) 
    {
        $error = "Por favor, completa todos los campos.";
    } 
    else
    {
        // Verificar si se ha subido un archivo de imagen
        if ($_FILES["imagen"]["error"] == UPLOAD_ERR_OK) 
        {
            // limitar a un maximo de 15 mb
            $tamano_maximo = 15 * 1024 * 1024;

            if ($_FILES["imagen"]["size"] > $tamano_maximo) 
            {
                $error = "El tamaño del archivo supera el límite permitido (15 MB).";
            } 
            else 
            {
                //Obtener el nombre de la imagen y crear la ruta.
                $nombre_imagen = $_FILES["imagen"]["name"];
                $ruta_imagen = "../fotosEntradas/" ."e_".$usuario."_". $nombre_imagen;
                // $ruta_imagen_interna = "./fotosEntradas/" ."e_".$usuario."_". $nombre_imagen;

                // Mover la imagen desde la ubicación temporal a la carpeta deseada
                move_uploaded_file($_FILES["imagen"]["tmp_name"], $ruta_imagen);
            }
        } 
        else 
        {
            // Si no se envió ninguna imagen, asignar la imagen por defecto
            $ruta_imagen = "../imagen/akachat.png";
        }

        // Si no falla insertar la nueva entrada en la base de datos con el nombre de la imagen
        if (!isset($error)) 
        {
            $stmt = $conn->prepare("INSERT INTO entradas (titulo, imagenEntrada, descripcion, nombre_usuario, fechaCreacionEntrada) VALUES (?, ?, ?, ?, NOW())");
            $stmt->bind_param("ssss", $titulo, $ruta_imagen, $descripcion, $usuario);

            if ($stmt->execute()) 
            {
                header("Location: ../akachat.php");
                exit();
            } else {
                $error = "Hubo un error al crear la entrada. Por favor, inténtalo de nuevo.";
            }

            $stmt->close();
        }
    }
}

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crear Entrada</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="../css/menu.css">
    <link rel="stylesheet" href="../css/footer.css">
    <link rel="stylesheet" href="../css/crearEntrada.css">
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
                    <li class="mt-2">Usuario: <?php echo $usuario; ?> <button class="botonUsuario"><a href='../conexiones/logout.php' class='no-decoracion-dark'>Cerrar Sesión</a></button></li>
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
                   <li><a href="visualizarRuta.php?idRuta=1" id="hombre">Ruta 1</a></li>
                   <li><a href="visualizarRuta.php?idRuta=2" id="mujer">Ruta 2</a></li>
                   <li><a href="visualizarRuta.php?idRuta=3" id="niños">Ruta 3</a></li>
               </ul> 
           </li>

           <li><a href="../akachat.php">Akachat <i class="bi bi-chat-fill animar"></i></a></li>

           <li><a href="../akadex.php">AkaDex <i class="bi bi-lightning-charge-fill animar"></i></a></li>

           <li><a href="../contacto.php">Contacto <i class="bi bi-envelope-fill animar"></i></a></li>

           <li><a href="../perfil.php">Perfil <i class="bi bi-person-fill animar"></i></a></li>

           <div class="cerrarMenu"><i class="bi bi-x-circle animar "></i></div>
           <span class="iconos">
               <i class="bi bi-facebook"></i>
               <i class="bi bi-instagram"></i>
               <i class="bi bi-twitter"></i>
           </span>
       </ul>
   </div>
</div>

    <div class="crearEntrada">
        <h2>Crear Nueva Entrada</h2>
        
        <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" enctype="multipart/form-data" class='formularioCrearEntrada'>
            <div class="mb-3">
                <label for="titulo" class="form-label">Título</label>
                <input type="text" class="form-control" id="titulo" name="titulo">
            </div>
            <div class="mb-3">
                <label for="imagen" class="form-label">Imagen</label>
                <input type="file" class="form-control" id="imagen" name="imagen">
            </div>
            <div class="mb-3 ">
                <label for="descripcion" class="form-label">Descripción</label>
                <textarea class="form-control descripcionCrearEntrada" id="descripcion" name="descripcion" rows="3" ></textarea>
            </div>
            <?php if (isset($error)): ?>
                <div class="alert alert-danger" role="alert">
                    <?php echo $error; ?>
                </div>
            <?php endif; ?>
            <button type="submit" class="boton">Crear Entrada</button>
        </form>
        
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
            <h5 class="titulofaqs"><a href="../contacto.php">Preguntas frecuentes</a></h5>
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

    <script src="../js/menuDesplegable.js"></script>
</body>
</html>
