<?php
session_start();
// Codigo para comprobar que es administrador y mostrar las entradas de la última semana y todas las entradas con un límite
include './consultas/consultasIndex.php'; 

$usuario = isset($_SESSION['usuario']) ? $_SESSION['usuario'] : 'Anonimo';

$resultadosemanal = obtenerEntradasSemana($conn);
$entradasporpagina = 4;
$resultadotodas = obtenerTodasEntradas($conn, $entradasporpagina);

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
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio - AkaSZone</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./css/menu.css">
    <link rel="stylesheet" href="./css/cuerpo.css">
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
    


<div class="centrarflex" > 
    <img src="./imagen/landingfoto.png" class="imagenLanding" alt="foto de entrada">
    <div class="centrado"><a href="rutasInteractivasJuego.php" class="no-decoracion">¡Sumérgete en nuestras aventuras!</a></div>
</div>

<div class="fondoInicio">    
    <div class="cuerpo">
        
        <div class="area1 mx-auto">
            <h2 class='letraRecientes'>Rutas del minijuego</h2>
            <ul class="lista1">
            <!-- Mostrar las 3 primeras rutas de la quinta region de pokemon con su pagina -->
            <?php
                include './conexiones/conexion.php'; 

                $sql = "SELECT idRuta, nombreRuta FROM ruta WHERE idRegion = 5  LIMIT 3";
                $resultado = $conn->query($sql);

                if ($resultado->num_rows > 0) 
                {
                    while ($fila = $resultado->fetch_assoc()) 
                    {
                        $idRuta = $fila["idRuta"];
                        $nombreRuta = $fila["nombreRuta"];
                        echo "<li><a class='enlace' href='visualizarRuta.php?idRuta=$idRuta'>$nombreRuta</a></li>";
                    }
            
                } 
                else 
                {
                    echo "No se encontraron rutas para la Región 5.";
                }
            ?>  
            </ul>
        </div>

        <div class="area2 mx-auto">
            <h2 class='letraRecientes'>Entradas recientes</h2>
            <ul class="lista2">
                <!-- Listar las entradas semanales -->
                <?php
                if ($resultadosemanal->num_rows > 0) {
                    while ($row = $resultadosemanal->fetch_assoc()) 
                    {
                        echo "<li><a class='enlace' href='entrada.php?id=" . $row["id_entradas"] . "'>" . $row["titulo"] . "</a>  " ."</li>";
                    }
                } else {
                    echo "<p>No hay entradas de la última semana.</p>";
                }
                ?>
            </ul>
        </div>


        <div class="area3 mx-auto">
            <h2 class='letraListado'>Listado de entradas</h2>

            <ul class="lista3">
                <?php
                // Listar todas las entradas con un limite de 4 y un ver mas que lleva a akachat
                if ($resultadotodas->num_rows > 0) {
                    while ($row = $resultadotodas->fetch_assoc()) {
                        echo "<li><a class='enlace' href='entrada.php?id=" . $row["id_entradas"] . "'>" . $row["titulo"] . "</a>  " . "</li>";
                    }
                } else {
                    echo "<p>No hay entradas.</p>";
                }
                ?>
            </ul>
            <div class="d-flex justify-content-center ">
                <a href="akachat.php" class="boton">Ver más</a>
            </div>
        </div>
        <div class="nada1"></div>
        <div class="nada2"></div>

    </div>

    <div class="fondoOferta">
        <div class="ofertaRegistro">
            <div class="letraOferta">
                <p class="tamanoOferta">¿Deseas disfrutar de nuestro minijuego y nuestra comunidad? <br>¡No lo dudes y registrate <a class="enlace" href="signin.php"> aqui</a>!</p>
            </div>

            <div>
                <img src="./imagen/oshawottFeliz2.gif" class="imagenOferta" alt="happy">
            </div>
        </div>
    </div>

    <div class="fondoOferta">
        <div class="ofertaPokedex">
            <div class="div1">
                <div class="letraPokedex">
                    <a class="enlace" href="akadex.php"><p class="tamanoPokedex">Conoce ahora nuestra Akadex <br>¡La pokedex a nuestra manera!</p></a>
                </div>

                <div class="centrarImagen">
                    <a class="enlace" href="akadex.php"><img src="./imagen/iniciales.png"  class="imagenPokedex" alt="happy"></a>
                </div>
            </div>

            <div class="div2">
                <div class="letraPokedex">
                    <a  class="enlace" href="rutasInteractivasJuego.php"><p class="tamanoMinijuego">Recorre nuestro minijuego <br>¡ Captura sin limites  !</p></a>
                </div>

                <div class="centrarImagen">
                    <a class="enlace" href="rutasInteractivasJuego.php"><img src="./imagen/minijuego.png" class="imagenMinijuego" alt="happy"></a>
                </div>
            </div>
            
        </div>
    </div>

    <div class="fondoOferta">
        <div class="ofertaRegistro2">
            <div>
                <img src="./imagen/victiniV.gif" class="imagenOferta" alt="happy">
            </div>
            <div class="letraOferta">
                <p class="tamanoContacto">Si tienes alguna duda o problema <br>¡No lo dudes, contactanos <a class="enlace" href="contacto.php"> aqui</a>!</p>
            </div>
            
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
        <h5 class="titulofaqs"><a href="faqs.html">Preguntas frecuentes</a></h5>
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