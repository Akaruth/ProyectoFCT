<?php
session_start();

// Código del buscador que compara el nombre metido en el buscador para ver si coincide con algún nombre de un Pokémon
// en la tabla pokemon.
$usuario = isset($_SESSION['usuario']) ? $_SESSION['usuario'] : 'Anónimo';

// Verificamos si el nombre del Pokémon ha sido ingresado en el buscador
if (isset($_POST['nombrePokemon']) && !empty($_POST['nombrePokemon'])) 
{
    $nombrePokemon = $_POST['nombrePokemon'];
    
    include '../conexiones/conexion.php';

    $nombrePokemon = $conn->real_escape_string($nombrePokemon);

    // Crear la consulta del buscador
    $sql = "SELECT * FROM pokemon WHERE nombrePokemon LIKE '%$nombrePokemon%'";
    $resultado = $conn->query($sql);

    // Si se encuentran resultados, redirigir a la página de visualización del Pokémon
    if ($resultado->num_rows > 0) {
        $pokemon = $resultado->fetch_assoc();
        header("Location: ../visualizarPokemon.php?idPokemon=" . $pokemon['numeroPokedex']);
        exit();
    }
    else if (isset($_POST['idpokemonactual']))
    {
        $pokemonactual = $_POST['idpokemonactual'];
        header("Location: ../visualizarPokemon.php?idPokemon=" . $pokemonactual);
        exit();
    }
    else
    {
        header("Location: ../akadex.php");
        exit();
    }
} 
else 
{
    if (isset($_POST['idpokemonactual'])) 
    {
        $pokemonactual = $_POST['idpokemonactual'];
        header("Location: ../visualizarPokemon.php?idPokemon=" . $pokemonactual);
        exit();
    }
    else
    {
        header("Location: ../akadex.php");
        exit();
    }
}
?>
