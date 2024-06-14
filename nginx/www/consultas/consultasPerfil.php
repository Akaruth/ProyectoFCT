<?php
// Codigo para obtener funcionalidades en el perfil de cada usuario, como su usuario, nick , foto etc
// Este codigo nos obtiene los atributos de la tabla usuario del usuario activo en la sesion actual , tambien 
// comprueba si eres administrador, ya que si lo eres no devolvera ciertos apartados ya que son innecesarios
include './conexiones/conexionUsuarios.php'; 
if (!isset($_SESSION['usuario'])) {
    header("Location: ./login.php");
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
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $usuarioAdmin = $row['adminNick'];
            $imagenAdmin = $row['imagenAdmin'];
            $fondoPerfil = $row['fondoPerfil'];
            $esAdmin = true;

        }
    }

// Consulta para obtener la foto del usuario, la cantidad de comentarios y la cantidad de entradas
$sql = "SELECT usuario, nickUsuario, imagenUsuario, fondoPerfil, pokemonFav, regionFav FROM usuarios WHERE usuario = '$usuario'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $imagenUsuario = $row['imagenUsuario'];
    $pokeFav = $row['pokemonFav'];
    $regionFav = $row['regionFav'];
    $fondoPerfil = $row['fondoPerfil'];
    $nickUsuario = $row['nickUsuario'];

} 
else
{
    $imagenUsuario = null; 
    $pokeFav = null;
}

// Obtenemos la cantidad de comentarios realizados por el usuario
$sqlComentarios = "SELECT COUNT(*) as totalComentarios FROM comentarios WHERE nombre_usuario = '$usuario'";
$resultComentarios = $conn->query($sqlComentarios);
$rowComentarios = $resultComentarios->fetch_assoc();
$totalComentarios = $rowComentarios['totalComentarios'];

// Obtenemos la cantidad de entradas realizadas por el usuario
$sqlEntradas = "SELECT COUNT(*) as totalEntradas FROM entradas WHERE nombre_usuario = '$usuario'";
$resultEntradas = $conn->query($sqlEntradas);
$rowEntradas = $resultEntradas->fetch_assoc();
$totalEntradas = $rowEntradas['totalEntradas'];
$conn->close();
?>


<!-- Este codigo nos obtiene el nombre de todos los pokemons para que un usuario elija un favorito tambien obtendremos 
    todas las regiones para que el usuario pueda elegir una favorita , esto se oculta para el admin-->
<?php
include './conexiones/conexion.php'; 

// Consulta para obtener los nombres de todos los Pokémon
$sqlPokemon = "SELECT nombrePokemon FROM pokemon";
$resultPokemon = $conn->query($sqlPokemon);

// Consulta para obtener el número de Pokédex del Pokémon favorito del usuario
if (!$esAdmin) 
{
    if ($pokeFav !=='Ninguno') 
    {
        $sqlPokeFav = "SELECT numeroPokedex FROM pokemon WHERE nombrePokemon = '$pokeFav'";
        $resultPokeFav = $conn->query($sqlPokeFav);
        $rowPoke = $resultPokeFav->fetch_assoc();
        $numeroPokedexFav = $rowPoke['numeroPokedex'];
    }
}

// Consulta para obtener los nombres de todas las regiones
$sqlRegiones = "SELECT nombreRegion FROM region";
$resultRegiones = $conn->query($sqlRegiones);

$conn->close();
?>
