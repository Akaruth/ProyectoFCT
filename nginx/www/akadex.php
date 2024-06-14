<?php 
session_start();
// Codigo para comprobar que es administrador y codigo para mostrar los pokemons, con filtros, orden , paginacion
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
        $usuarioAdmin = $row['adminNick'];
        $imagenAdmin = $row['imagenAdmin'];
        $fondoPerfil = $row['fondoPerfil'];
        $esAdmin = true;

    }
}
?>
<?php
include './consultas/consultasAkadex.php';

// Variables para los filtros
$tipoFiltro = isset($_GET['tipo']) ? $_GET['tipo'] : null;
$ordenFiltro = isset($_GET['orden']) ? $_GET['orden'] : null;

// Variables de paginacion
$pagina = isset($_GET['pagina']) ? (int)$_GET['pagina'] : 1;
$limite = 40; //limite por página
$offset = ($pagina - 1) * $limite;

// Obtener el total de pokemon para la paginacion
$totalPokemon = obtenerTotalPokemon($conn, $tipoFiltro);
$totalPaginas = ceil($totalPokemon / $limite);

// Obtener la lista de pokemon según los filtros y paginacion
$pokemon = obtenerPokemon($conn, $tipoFiltro, $ordenFiltro, $offset, $limite);

?>


    <!DOCTYPE html>
    <html lang="es">
    <head>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Akadex</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="./css/menu.css">
        <link rel="stylesheet" href="./css/footer.css">
        <link rel="stylesheet" href="./css/akadex.css">
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

<div class="centrarFondo"><img src="./imagen/fondoAkadex.png"  class="fotoDex" alt="fondoAkaDex"></div>
    

<div class="espacio" id="akadex"></div>


<div class="colorFondo" >

    <div class="espaciado" >
        <div class="buscadorPokemon">
            <form action="./consultas/buscador.php" method="POST">
                <input type="text" name="nombrePokemon" placeholder="Buscar.." class="formaBuscador">
                <button type="submit" class="botonBuscador">Buscar</button>
            </form>
        </div>
        <button class="boton" type="button" data-bs-toggle="offcanvas" data-bs-target="#filtrosOffcanvas" aria-controls="filtrosOffcanvas">
            Abrir filtros
        </button>

        <!-- Formulario en offcanvas que lista todos los tipos posibles a filtrar -->
        <div class="offcanvas offcanvas-start" tabindex="-1" id="filtrosOffcanvas" aria-labelledby="filtrosOffcanvasLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="filtrosOffcanvasLabel">Filtros</h5>
                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body fondo">
                <form method="GET">
                    <div class="mb-3">
                        <label for="tipo" class="form-label">Filtrar por tipo:</label>
                        <select name="tipo" id="tipo" class="form-select">
                            <option value="">Todos</option>
                            <?php
                           
                            $sql_tipos = "SELECT * FROM tipo";
                            $resultado_tipos = mysqli_query($conn, $sql_tipos);

                            while ($fila_tipo = mysqli_fetch_assoc($resultado_tipos)) {
                                echo "<option value='" . $fila_tipo['nombre'] . "'>" . $fila_tipo['nombre'] . "</option>";
                            }
                            ?>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="orden" class="form-label">Ordenar por nombre:</label>
                        <select name="orden" id="orden" class="form-select">
                            <option value="asc">Ascendente</option>
                            <option value="desc">Descendente</option>
                        </select>
                    </div>
                    <button type="submit" class="boton">Filtrar</button>
                </form>
            </div>
    </div>


    <div class="akadexContenido" >
        <div class="grid-container">
            <?php
            // Mostrar los pokemons 
            foreach ($pokemon as $p) 
            {
                echo "<div class='grid-item'>";
                echo "<a class='enlace' href='visualizarPokemon.php?idPokemon=" . $p['numeroPokedex'] . "'>";
                echo "<img class='iconoPokemon' src='./imagen/" . $p['numeroPokedex'] . "-grande.png' alt='" . $p['numeroPokedex'] . "'>";
                echo "<span class='pokemon-name'>" . $p['nombrePokemon'] . "</span>";
                echo "</a>";
                echo "</div>";
            }
            ?>
        </div>
    </div>

    <!-- Paginacion de los pokemons cada 40 -->
    <nav>
        <ul class="pagination justify-content-center mt-3">
            <?php if ($totalPaginas > 1): ?>

                <?php if ($pagina > 1): ?>
                    <li class="page-item">
                        <a class="page-link" href="?pagina=<?php echo $pagina - 1; ?>&tipo=<?php echo $tipoFiltro; ?>&orden=<?php echo $ordenFiltro; ?>#akadex" aria-label="Previous">
                            <span aria-hidden="true"><i class="bi bi-caret-left-fill"></i></span>
                        </a>
                    </li>
                <?php endif; ?>
                <?php for ($i = 1; $i <= $totalPaginas; $i++): ?>
                    <li class="page-item <?php if ($i == $pagina) echo 'active'; ?>">
                        <a class="page-link" href="?pagina=<?php echo $i; ?>&tipo=<?php echo $tipoFiltro; ?>&orden=<?php echo $ordenFiltro; ?>#akadex"><?php echo $i; ?></a>
                    </li>
                <?php endfor; ?>
                <?php if ($pagina < $totalPaginas): ?>
                    <li class="page-item">
                        <a class="page-link" href="?pagina=<?php echo $pagina + 1; ?>&tipo=<?php echo $tipoFiltro; ?>&orden=<?php echo $ordenFiltro; ?>#akadex" aria-label="Next">
                            <span aria-hidden="true"><i class="bi bi-caret-right-fill"></i></span>
                        </a>
                    </li>
                <?php endif; ?>
            <?php endif; ?>
        </ul>
    </nav>

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

            <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
            <script src="./js/mostrarTiempoBaza2.js"></script>
            <script src="./js/menuDesplegable.js"></script>
    </body>
</html>
   