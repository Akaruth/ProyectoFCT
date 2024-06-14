<?php
session_start();
// Codigo para comprobar que es administrador para mostrar x cosas ,aqui se genera el minijuego creado con js donde se llama y se posiciona
include './consultaJuego/pokemonInfo.php';
include './consultaJuego/pokemonRuta.php';

$usuario = isset($_SESSION['usuario']) ? $_SESSION['usuario'] : 'Anonimo';

if (!isset($_SESSION['usuario'])) 
{
    header("Location: login.php");
    exit();
}

include './conexiones/conexionUsuarios.php'; 

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
<title>Minijuego de pokemon</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="./css/menu.css">
    <link rel="stylesheet" href="./css/cuerpo.css">
    <link rel="stylesheet" href="./css/footer.css">
    <link rel="stylesheet" href="./css/juego.css">
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
  

   <div id="mensaje-captura"></div>
<div  class="fondoNegro">
    <div class="juntosJuego">
        <div class="envoltorio">
            <img  class="imagenJuego" src="./imagen/fondoo.png" alt="Foto">
            <table id="tablero" class="tablero"></table>
        </div>
        <div>
        <img class="imgJuego" src="./imagen/legenda.png" alt="Foto">

        </div>
    </div>
</div>
 
   
<div class="envoltorioModal">

    <div id="miModal" class="modalMio">

    
    <div class="modal-content-juego">
        <div id="modal-content">

        </div>
    </div>

    </div>
</div>

<div id="modalPokemonCapturados" class="modal-capturados">
    <div class="modal-content-captura" id="modal-content-pokemon-capturados">

    </div>
</div>

<div id="modalPersonaje" class="modalPerso">
  <div class="modal-content-perso">
    <h2>Selecciona tu personaje</h2>
    <button id="personaje1-btn" class=" boton"> <h3>Personaje 1</h3>  <img class="eligePersonaje" src="./imagen/personaje1.png" alt="personaje"></button>
    <button id="personaje2-btn" class=" boton"> <h3>Personaje 2</h3>  <img class="eligePersonaje" src="./imagen/personaje2.png" alt="personaje"></button>
  </div>
</div>



<div id="modalMensaje" class="modalMensaje">
  <div class="modal-content-mensaje" id="modal-content-mensaje">
    <div id="mensaje-captura"></div>
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
   

<script src="./js/juego.js"></script>
<script src="./js/menuDesplegable.js"></script>
<script src="./js/mostrarTiempoBaza2.js"></script>

</body>
</html>
