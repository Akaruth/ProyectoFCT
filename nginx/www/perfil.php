<?php
session_start();

// Codigo para comprobar que es administrador para mostrar x cosas con posibilidad de cambiar la contraseña ,nickadmin , icono foto,
//  si es usuario muestra el perfil de otra forma , con posibilidad de cambiar la contraseña , alias, usuario , icono foto 
//  y fondo de perfil con los modales
include './conexiones/conexionUsuarios.php'; 
include './consultas/consultasPerfil.php'; 
$noleidos = include './modificaciones/mensajeleido.php'; 

$usuario = isset($_SESSION['usuario']) ? $_SESSION['usuario'] : 'Anonimo';

if (!isset($_SESSION['usuario'])) 
{
    header("Location: login.php");
    exit();
}
// Fondo default (si es admin)
$fondoPredeterminado = './imagen/fondo1.jpg';
$fondoPerfil = !empty($fondoPerfil) ? $fondoPerfil : $fondoPredeterminado;

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
        $usuarioAdmin = $row['adminNick'];
        $imagenAdmin = $row['imagenAdmin'];
        $fondoPerfil = $row['fondoPerfil'];
        $esAdmin = true;
        $reportesNoLeidos = include './modificaciones/reportesrecibidos.php';

    }
}
?>


<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <link rel="stylesheet" href="./css/menu.css">
    <link rel="stylesheet" href="./css/perfil.css">
    <link rel="stylesheet" href="./css/footer.css">
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
<div class="espacio">
           
</div>
<div class="envoltorio py-4">
    <div class="centrarDiv1">
        <div class="mensajeriaPerfil">
            <a class="" href="mensajeria.php"><button class="textoResaltado efecto">Mensajería
            <?php if ($esAdmin == false): ?>
                <?php if ($noleidos > 0): ?>
                    <i class="bi bi-envelope-exclamation text-danger"></i>
                <?php else: ?>
                    <i class="bi bi-envelope-check text-success"></i>
                <?php endif; ?>
            <?php else: ?>
                <?php if ($reportesNoLeidos > 0): ?>
                    <i class="bi bi-envelope-exclamation text-danger"></i>
                <?php else: ?>
                    <i class="bi bi-envelope-check text-success"></i>
                <?php endif; ?>

            <?php endif; ?>
    
            </button></a>
        </div>
        <div class="entradasPerfil">
            <a class="" href="akachat.php"><button class="textoResaltado efecto">Ir a Entradas <i class="bi bi-chat-fill text-info"></i></button></a>
        </div>
    </div>
    <div class="gridPerfil">

        <div class="imagenFondo">
            <img src="<?php echo $fondoPerfil ?>" class="fondoPerfil " alt="foto">
        </div>
        <div class="perfil">
            <div class="nickFoto">
                <div class="area1">
                    <?php if ($esAdmin): ?>
                        <img class="iconoPerfil" src="<?php echo $imagenAdmin; ?>" alt="Imagen de perfil">

                    <?php else: ?>

                    <img class="iconoPerfil" src="<?php echo $imagenUsuario; ?>" alt="Imagen de perfil">
                    <?php endif; ?>     

                    <div class="centrarFoto my-2">
                        <button class="boton" data-bs-toggle="modal" data-bs-target="#cambiarFotoModal"><i class="bi bi-camera"></i></button>
                    </div>
                </div>

                <div class="modal fade" id="cambiarFotoModal" tabindex="-1" aria-labelledby="cambiarFotoModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content  porencima">
                            <div class="modal-header">
                                <h5 class="modal-title" id="cambiarFotoModalLabel">Cambiar Imagen de Perfil</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form action="<?php if ($esAdmin): ?> ./modificaciones/subirImagenAdmin.php<?php else: ?>./modificaciones/subirImagenUsu.php<?php endif; ?>" method="post" enctype="multipart/form-data">
                                    <div class="mb-3">
                                        <label for="imagenPerfil" class="form-label">Elige una nueva imagen de perfil:</label>
                                        <input type="file" class="form-control" name="imagenPerfil" id="imagenPerfil" accept="image/*" required>
                                    </div>
                                    <button type="submit" class="boton">Subir</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="area2">

                <?php if ($esAdmin): ?>
                    <p class="nick">
                        <?php echo $usuarioAdmin; ?>
                    </p>
                <?php else: ?>
                    <p class="nick">
                        <?php echo $usuario; ?>  <br> (<?php echo $nickUsuario;?>)
                    </p>
                <?php endif; ?>     
                
                </div>

                <div class="area5">
                    <div class="dropdown">
                        <button class="boton dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="bi bi-gear"></i>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <?php if ($esAdmin == false): ?>
                                <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#cambiarNickModal">Cambiar alias</a>
                            <?php endif; ?>

                            <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#cambiarUsuModal">Cambiar usuario</a>
                            <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#cambiarContraModal">Cambiar contraseña</a>
                            <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#cambiarFondoModal">Cambiar fondo del perfil</a>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="cambiarContraModal" tabindex="-1" role="dialog" aria-labelledby="cambiarContraModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content porencima">
                            <div class="modal-header">
                                <h5 class="modal-title" id="cambiarContraModalLabel">Cambiar Contraseña</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form action="<?php if ($esAdmin): ?> ./modificaciones/cambiarContraAdmin.php<?php else: ?>./modificaciones/cambiarContra.php<?php endif; ?>" method="post" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label for="currentPassword">Contraseña Actual</label>
                                        <input type="password" class="form-control" id="contraActual" name="contraActual" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="newPassword">Nueva Contraseña</label>
                                        <input type="password" class="form-control" id="nuevaContra" name="nuevaContra" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="confirmPassword">Confirmar Nueva Contraseña</label>
                                        <input type="password" class="form-control" id="confcontraActual" name="confcontraActual" required>
                                    </div>
                                    <button type="submit" class="boton mt-2">Cambiar Contraseña</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="cambiarFondoModal" tabindex="-1" aria-labelledby="cambiarFondoModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content porencima">
                            <div class="modal-header">
                                <h5 class="modal-title" id="cambiarFondoModalLabel">Cambiar Fondo de Perfil</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                            </div>
                            <div class="modal-body">
                                <form action="<?php if ($esAdmin): ?> ./modificaciones/cambiarFondoAdmin.php<?php else: ?>./modificaciones/cambiarFondoPerfil.php<?php endif; ?>" method="post" enctype="multipart/form-data">
                                    <div class="mb-3">
                                        <label for="fondoPerfil" class="form-label">Selecciona una nueva imagen para el fondo de perfil:</label>
                                        <input type="file" class="form-control" name="fondoPerfil" id="fondoPerfil" accept="image/*" required>
                                    </div>
                                    <button type="submit" class="boton">Subir</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="cambiarUsuModal" tabindex="-1" role="dialog" aria-labelledby="cambiarUsuModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content porencima">
                            <div class="modal-header">
                                <h5 class="modal-title" id="cambiarUsuModalLabel">Cambiar Usuario</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form action="<?php if ($esAdmin): ?> ./modificaciones/cambiarAdmin.php<?php else: ?>./modificaciones/cambiarUsuario.php<?php endif; ?>" method="post" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label for="nuevoUsu">Nuevo Usuario</label>
                                        <input type="text" class="form-control" id="nuevoUsu" name="nuevoUsu" required>
                                    </div>
                                    <button type="submit" class="boton mt-2">Cambiar Usuario</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="cambiarNickModal" tabindex="-1" role="dialog" aria-labelledby="cambiarNickModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content porencima">
                            <div class="modal-header">
                                <h5 class="modal-title" id="cambiarNickModalLabel">Cambiar Alias</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form action="./modificaciones/cambiarNick.php" method="post">
                                    <div class="form-group">
                                        <label for="nuevoNick">Nuevo Alias</label>
                                        <input type="text" class="form-control" id="nuevoNick" name="nuevoNick" required>
                                    </div>
                                    <button type="submit" class="boton mt-2">Cambiar Alias</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
            <?php if ($esAdmin == false): ?>

                <div class="cuerpoPerfil mt-2">
                    <div class="area3">
                        <div class="juntos">
                            <?php if ($esAdmin == false): ?>
                                
                                <div class="pokeFav">
                                    Mi pokemon favorito es: <?php echo $pokeFav; ?>
                                    <?php if ($pokeFav !== "Ninguno"): ?>
                                    <img class="iconoPokemon" src="./imagen/<?php echo $numeroPokedexFav; ?>-grande.png" alt="foto">
                                    <?php endif; ?>
                                </div>

                                <div class="">
                                    <button class="boton" data-bs-toggle="modal" data-bs-target="#cambiarPokeFavModal">Elige tu Pokémon favorito</button>
                                </div>
                            <?php endif; ?>

                            <div class="modal fade" id="cambiarPokeFavModal" tabindex="-1" aria-labelledby="cambiarPokeFavModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="cambiarPokeFavModalLabel">Elige tu Pokémon favorito</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <form method="post" class="formuPoke" action="./modificaciones/pokemonfav.php">
                                                <!-- Listar todos los pokemons posibles a elegir -->
                                                <div class="mb-3">
                                                    <label for="pokemonFav" class="form-label">Elige tu Pokémon favorito:</label>
                                                    <select name="pokemonFav" id="pokemonFav" class="form-select">
                                                        <?php while($rowPokemon = $resultPokemon->fetch_assoc()): ?>
                                                            <option value="<?php echo $rowPokemon['nombrePokemon']; ?>" <?php echo ($rowPokemon['nombrePokemon'] === $pokeFav) ? 'selected' : ''; ?>>
                                                                <?php echo $rowPokemon['nombrePokemon']; ?>
                                                            </option>
                                                        <?php endwhile; ?>
                                                    </select>
                                                </div>
                                                <button type="submit" class="boton">Guardar</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>  
                    </div>


                    <div class="area3">
                        <div class="juntos">
                        <?php if ($esAdmin == false): ?>

                            <div class="regionFav">
                                Mi region favorita es: <?php echo $regionFav; ?>
                            </div>
                            <div class="">
                                <button class="boton" data-bs-toggle="modal" data-bs-target="#cambiarRegionFavModal">Elige tu region favorita</button>
                            </div>
                        <?php endif; ?>

                            <div class="modal fade" id="cambiarRegionFavModal" tabindex="-1" aria-labelledby="cambiarRegionFavModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="cambiarRegionFavModalLabel">Elige tu región favorita</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <form method="post" class="formuRegion" action="./modificaciones/regionfav.php">
                                                <div class="mb-3">  
                                                    <!-- Listar las regiones posibles a elegir -->
                                                    <label for="regionFav" class="form-label">Elige tu región favorita:</label>
                                                    <select name="regionFav" id="regionFav" class="form-select">
                                                        <?php while($rowRegion = $resultRegiones->fetch_assoc()): ?>
                                                            <option value="<?php echo $rowRegion['nombreRegion']; ?>">
                                                                <?php echo $rowRegion['nombreRegion']; ?>
                                                            </option>
                                                        <?php endwhile; ?>
                                                    </select>
                                                </div>
                                                <button type="submit" class="boton">Guardar</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>  
                    </div>
                    
                    <div class="area4">
                    <?php if ($esAdmin == false): ?>

                        <div class="juntos">
                            <p class="cantComentarios">Cantidad de comentarios realizados: <?php echo $totalComentarios; ?></p>
                            <p class="cantEntradas">Cantidad de entradas realizadas: <?php echo $totalEntradas; ?></p>
                        </div>
                        <?php endif; ?>

                    </div>
                    
                </div>
            <?php endif; ?>

        </div>

    
    </div>

    <div class="centrarDiv2">
        <div class="minijuegoPerfil">
           <a href="rutasInteractivasJuego.php"><button class="textoResaltado efecto">Ir a Minijuego <i class="bi bi-joystick text-success"></i></button></a> 
        </div>
        <div class="akadexPerfil">
            <a href="akadex.php"><button class="textoResaltado efecto">Ir a AkaDex <i class="bi bi-lightning-charge-fill text-warning"></i></button></a>
        </div>
        
    </div>

</div>
<div class="espacio">
           
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
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="./js/menuDesplegable.js"></script>
    <!-- <script src="./js/elegirPokemonFav.js"></script>
    <script src="./js/desplegarFormulario.js"></script> -->
    <script src="./js/mostrarTiempoBaza2.js"></script>

</body>
</html>
