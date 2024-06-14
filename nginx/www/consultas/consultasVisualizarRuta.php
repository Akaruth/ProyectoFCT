<?php
// Codigo que nos devuelve los pokemons por ruta para mostrarlos en una pagina
function obtenerPokemonesPorRuta($conn, $idRuta) 
{
    $sql = "SELECT p.*
            FROM pokemonRuta pr
            INNER JOIN pokemon p ON pr.numeroPokedex = p.numeroPokedex
            WHERE pr.idRuta = $idRuta";
    return $conn->query($sql);
}
?>
