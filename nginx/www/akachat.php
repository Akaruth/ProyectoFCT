<?php
session_start();
// Codigo para comprobar que es administrador, segun esto se mostraran u se usaran unos archivos u otros
include './consultas/consultasAkachat.php'; 

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
    <title>Akachat</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="./css/menu.css">
    <link rel="stylesheet" href="./css/footer.css">
    <link rel="stylesheet" href="./css/akachat.css">
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

   <div class="fotoEntradas">
        <img class="fotoEchaUnViztazo" src="./imagen/fondoEntrada.png" alt="fotoEntradas">
   </div>

   <!-- Hacer una edicion de entradas desplegable con uso de js -->
   <div class="envoltorioContenido" id="entradas">
        <div class="contenido">
            <?php if ($usuario_en_base_datos || $esAdmin): ?>
                <div class="envoltorioBotonEntrada">
                    <a href="<?php if ($esAdmin == false): ?>./crud/crearEntradas.php<?php else: ?>./crud/crearEntradasAdmin.php<?php endif; ?>" class="botonCrearEntrada">Crear Entrada</a>
                </div>
            <?php endif; ?>
            <?php
            if ($resultado_entradas->num_rows > 0) {
                while ($fila_entrada = $resultado_entradas->fetch_assoc()) {
                    echo "<div class='entradaColor'>";
                    echo "<div class='separado'>";
                    echo "<div><p class='tituloEntradaS'><a class='enlace' href='entrada.php?id=" . $fila_entrada['id_entradas'] . "'>" . $fila_entrada['titulo'] . "</a></p> </div>";
                    echo "<div class='fechaEntradaS'>" . $fila_entrada['fechaCreacionEntrada'] . "</div>";
                    echo "</div>";

                    $descripcion = $fila_entrada['descripcion'];
                    if (strlen($descripcion) > 100) {
                        $descripcion = substr($descripcion, 0, 150) . "...";
                    }
                    echo "<p class='separacionTextoEntrada'>" . $descripcion . "</p>";
                    echo "<div class='separado'>";

                    echo "<p>" . $fila_entrada['nombre_creador'] . "</p>";
                    echo "<p><i class='bi bi-chat'></i> " . $fila_entrada['cantidad_comentarios'] . "</p>";
                    echo "</div>";

                    echo "<div class='envoltorioCrud'>";

                    if ($usuario === $fila_entrada['nombre_creador'] || $esAdmin) 
                    {
                        echo "<a class='editarBtn editar' id='editarBtn" . $fila_entrada['id_entradas'] . "'>Editar <i class='bi bi-pencil'></i></a>";
                        echo "<div><a class='eliminar' href='./crud/eliminarEntrada.php?id_entrada=" . $fila_entrada['id_entradas'] . "'>Eliminar <i class='bi bi-trash'></i></a></div>";
                    }
                    echo "</div>";
                    echo "</div>";

                    echo "<div class='envoltorioEditar'>";
                    echo "<form id='formEditar" . $fila_entrada['id_entradas'] . "' method='post' action='./crud/editarEntrada.php' class='formulario visually-hidden' enctype='multipart/form-data'>";
                    echo "<input type='hidden' name='id_entrada' value='" . $fila_entrada['id_entradas'] . "'>";
                    echo "<input type='text' name='titulo' class='tituloEntrada' value='" . $fila_entrada['titulo'] . "'><br>";
                    echo "<textarea name='descripcion' class='textFormulario' rows='4' cols='50'>" . $fila_entrada['descripcion'] . "</textarea><br>";
                    echo "<input type='file' name='imagenEntrada' accept='image/*'><br>";
                    echo "<div class='envoltorioBotonEditar'>";
                    echo "<input type='submit' class='botonEditar' value='Guardar'>";
                    echo "</div>";
                    echo "</form>";
                    echo "</div>";
                }
            } else {
            }
            ?>
        </div>

        <!-- Hacer una paginacion de las entradas -->
        <nav>
            <ul class="pagination justify-content-center mt-3">
            <?php if ($total_paginas > 1): ?>
                <?php if ($pagina_actual > 1): ?>
                    <li class="page-item">
                        <a class="page-link" href="?pagina=<?php echo $pagina_actual - 1; ?>" aria-label="Previous">
                            <span aria-hidden="true"><i class="bi bi-caret-left-fill"></i></span>
                        </a>
                    </li>
                <?php endif; ?>
                <?php for ($i = 1; $i <= $total_paginas; $i++): ?>
                    <li class="page-item <?php if ($i == $pagina_actual) echo 'active'; ?>">
                        <a class="page-link" href="?pagina=<?php echo $i; ?>"><?php echo $i; ?></a>
                    </li>
                <?php endfor; ?>
                <?php if ($pagina_actual < $total_paginas): ?>
                    <li class="page-item">
                        <a class="page-link" href="?pagina=<?php echo $pagina_actual + 1; ?>" aria-label="Next">
                            <span aria-hidden="true"><i class="bi bi-caret-right-fill"></i></span>
                        </a>
                    </li>
                <?php endif; ?>
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
    <script src="./js/editarComentario.js"></script>
    <script src="./js/menuDesplegable.js"></script>
    <script src="./js/mostrarTiempoBaza2.js"></script>

</body>
</html>
