<?php
session_start();
// Codigo para comprobar que es administrador , mostrar entradas, paginacion y media de valoracion
include './conexiones/conexionUsuarios.php';
include './consultas/consultasEntrada.php';

$usuario = isset($_SESSION['usuario']) ? $_SESSION['usuario'] : 'Anonimo';

// Si el usuario no está autenticado, redirigirlo a la página de inicio de sesión
if (!isset($_SESSION['usuario'])) 
{
    header("Location: login.php");
    exit(); 
}

if(isset($_GET['id'])) 
{
    $id_entrada = $_GET['id'];

    $resultado_entrada = obtenerInformacionEntrada($conn, $id_entrada);

    if ($resultado_entrada->num_rows > 0) 
    {
        $fila_entrada = $resultado_entrada->fetch_assoc();
        $titulo = $fila_entrada['titulo'];
        $imagenEntrada = $fila_entrada['imagenEntrada'];
        $descripcion = $fila_entrada['descripcion'];
        $valoracion = $fila_entrada['valoracionEntrada'];
    } 
    else 
    {
        
        exit(); 
    }
} 
else 
{
  
    exit(); 
}

// la cantidad max de comentarios por página
$comentariosPorPagina = 4;

// total de comentarios
$totalComentarios = obtenerTotalComentarios($conn, $id_entrada);

// total de páginas
$totalPaginas = ceil($totalComentarios / $comentariosPorPagina);

//  número de página actual
$paginaActual = isset($_GET['pagina']) ? $_GET['pagina'] : 1;

// índice de inicio para la consulta
$indiceInicio = ($paginaActual - 1) * $comentariosPorPagina;

//  la consulta para obtener los comentarios de la página actual
$resultado_comentarios_paginacion = obtenerComentariosPaginados($conn, $id_entrada, $indiceInicio, $comentariosPorPagina);

// la consulta para calcular la media de las valoraciones de los comentarios
$media_valoracion = obtenerMediaValoracion($conn, $id_entrada);

// actualiza la valoración de la entrada
actualizarValoracionEntrada($conn, $id_entrada, $usuario, $media_valoracion);

$esAdmin = false;
if ($usuario !== 'Anonimo') 
{
    $query = "SELECT * FROM adminT WHERE adminNick = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("s", $usuario);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows > 0) {
        $esAdmin = true;

    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Entrada - <?php echo $titulo; ?></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="./css/menu.css">
    <link rel="stylesheet" href="./css/footer.css">
    <link rel="stylesheet" href="./css/entrada.css">
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
            <li><a href="adminpanel.php">AdminPanel <i class="bi bi-person-fill animar"></i></a></li>
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


<div class="buscadorEntrada">
    <form action="./consultas/buscadorEntrada.php" method="POST">
        <input type="hidden" name="identradaactual" value="<?php echo $id_entrada; ?>">
        <input type="text" name="nombreEntrada" placeholder="Buscar.." class="formaBuscador">
        <button type="submit" class="botonBuscador">Buscar</button>
    </form>
</div>

<div class="centrarEntrada">
    <div class="envoltorioEntrada">
        <h1 class="mb-3"><?php echo $titulo; ?></h1>
        <div class='valoracionEntrada'>Valoración promedio: <?php echo round($media_valoracion, 2); ?> <i class='bi bi-star-fill'></i></div> <br>
        <img class="imagenEntrada" src="./fotosEntradas/<?php echo $imagenEntrada; ?>" alt="Imagen de la entrada">
        <div class="descripcionEntrada"><?php echo $descripcion; ?></div>

    </div>
    
</div>

<div class="fondo">

    <div class="espacioFormularioComentarios">
        <div class="envoltorioFormulario text-white" id="comentar">
            <h2 ><?php echo $totalComentarios; ?> Comentarios </h2>
            <div class="bordeInferior"></div>

            <form id="formularioComentario" method="post" action="./crud/crearComentario.php" class="formularioComentarios">
                <input type="hidden" name="id_entrada" value="<?php echo $id_entrada; ?>">
                <textarea name="opinion" id="opinion" class="textFormularioAgregar" rows="4" cols="50" required></textarea><br>
                    <br>
                <div class="formularioAgregarBoton">
                    <input type="submit" class="botonAgregarComentario" value="Agregar comentario">
                </div>
            </form>

        </div>
    </div>
    
    <div class="envoltorioComentarios" id="comentarios">
    <!-- Mostrar los comentarios de la entrada -->
<?php
if ($resultado_comentarios_paginacion->num_rows > 0) {
    while ($fila_comentario = $resultado_comentarios_paginacion->fetch_assoc()) {
        echo "<div class='comentario'>";
        echo "<div class='envoltorioAutor'>";
        echo "<div> <span class='autorComentario'> <img src='" . htmlspecialchars($fila_comentario['imagenUsuario']) . "' alt='Imagen del usuario' class='imagenUsuario'>" . htmlspecialchars($fila_comentario['nombre_usuario']) . "</span></div>";
        echo "</div>";

        echo "<div class='envoltorioContenido'>";
        echo "<div id='opinionUsuario'>" . htmlspecialchars($fila_comentario['opinion']) . "</div>";
        echo "</div>";

        echo "<div class='separado'>";
        echo "<div>" . htmlspecialchars($fila_comentario['fechaCreacionComentario']) . "</div>";
        echo "<div class='envoltorioCrud'>";
        
        //botón de me gusta
        echo "<a class='enlace' href='./crud/megusta.php?id_comentario=" . htmlspecialchars($fila_comentario['id_comentarios']) . "&id_entrada=" . htmlspecialchars($id_entrada) . "' class='likeComentario'><i class='bi bi-hand-thumbs-up'></i> Me gusta (" . htmlspecialchars($fila_comentario['totalMeGusta']) . ")</a>";

        if ($_SESSION['usuario'] === $fila_comentario['nombre_usuario'] || $esAdmin) {
            echo "<a class='editarBtn editar' id='editarBtn" . htmlspecialchars($fila_comentario['id_comentarios']) . "'>Editar <i class='bi bi-pencil'></i></a>";
            echo "<div><a class='eliminar' href='./crud/eliminarComentario.php?id_comentario=" . htmlspecialchars($fila_comentario['id_comentarios']) . "&id_entrada=" . htmlspecialchars($id_entrada) . "'>Eliminar <i class='bi bi-trash'></i></a></div>";
        }
        echo "</div>";
        echo "</div>";
        //Mostrar formulario desplegable para editar el comentario 
        echo "<div class='envoltorioEditar'>";
        echo "<form id='formEditar" . htmlspecialchars($fila_comentario['id_comentarios']) . "' method='post' action='./crud/editarComentario.php' class='formulario visually-hidden'>";
        echo "<input type='hidden' name='id_comentario' value='" . htmlspecialchars($fila_comentario['id_comentarios']) . "'>";
        echo "<input type='hidden' name='id_entrada' value='" . htmlspecialchars($id_entrada) . "'>";
        echo "<input type='hidden' name='valoracionComentario' value='" . htmlspecialchars($fila_comentario['totalMeGusta']) . "'>";
        echo "<textarea name='opinion' class='textFormulario' rows='4' cols='50'>" . htmlspecialchars($fila_comentario['opinion']) . "</textarea><br>";
        echo "<div class='envoltorioBotonEditar'>";
        echo "<input type='submit' class='botonEditar' value='Guardar'>";
        echo "</div>";
        echo "</form>";
        echo "</div>";
        echo "</div>";
    }
}
?>
</div>

    <!-- Paginacion -->
    <div class="paginacion">
        <ul class="pagination justify-content-center">
            <?php if ($totalPaginas > 1): ?>
                <?php if ($paginaActual > 1): ?>
                    <li class="page-item">
                        <a class="page-link" href="entrada.php?id=<?php echo $id_entrada; ?>&pagina=<?php echo $paginaActual - 1; ?>" aria-label="Anterior">
                            <span aria-hidden="true"><i class="bi bi-caret-left-fill"></i></span>
                        </a>
                    </li>
                <?php endif; ?>

                <?php for ($i = 1; $i <= $totalPaginas; $i++): ?>
                    <li class="page-item <?php echo ($i == $paginaActual) ? 'active' : ''; ?>">
                        <a class="page-link" href="entrada.php?id=<?php echo $id_entrada; ?>&pagina=<?php echo $i; ?>"><?php echo $i; ?></a>
                    </li>
                <?php endfor; ?>

                <?php if ($paginaActual < $totalPaginas): ?>
                    <li class="page-item">
                        <a class="page-link" href="entrada.php?id=<?php echo $id_entrada; ?>&pagina=<?php echo $paginaActual + 1; ?>" aria-label="Siguiente">
                            <span aria-hidden="true"><i class="bi bi-gear"></i></span>
                        </a>
                    </li>
                <?php endif; ?>
            <?php endif; ?>
        </ul>
    </div>
</div>

<!-- Formulario para puntuar la entrada -->
<div class="valoraEntradaAqui ">
    <div class="fondoValoracion">
        <h3>Valora esta entrada aquí</h3>
        <form id="formularioValorar" method="post" action="./crud/valorarEntrada.php" class="valorarEntrada">
            <input type="hidden" name="id_entrada" value="<?php echo $id_entrada; ?>">
            <label for="valoracion"><i class='bi bi-star-fill estrellita'></i> Estrellas: </label>
            <select name="valoracion" id="valoracion" class="nuevaValoracion p-1 rounded">
                <option value="1">1 </option>
                <option value="2">2 </option>
                <option value="3">3 </option>
                <option value="4">4 </option>
                <option value="5">5 </option>
            </select><br>
            <div class="formularioAgregarBoton">
                <input type="submit" class="boton" value="Puntuar">
            </div>
        </form>
    </div>
    
</div>

    <div class="espaciado"></div>
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
    <script src="./js/editarComentario.js"></script>
    <script src="./js/menuDesplegable.js"></script>
</body>
</html>
