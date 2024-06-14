<?php
// Codigo para mostrar los pokemons y su informacion de forma mas visual en pagina web
include './conexiones/conexion.php'; 

function obtenerInformacionPokemon($conn, $idPokemon) {
    $pokemon = null;

    if ($idPokemon !== null && $idPokemon >= 0) {
        //Consulta para obtener toda la informacion de un pokemon, incluyendo si tiene 1 tipo o 2 tipos
        $sql = "SELECT p.*, 
                t1.nombre AS tipo1, 
                t2.nombre AS tipo2
                FROM pokemon p
                LEFT JOIN pokemon_tipo pt1 ON p.numeroPokedex = pt1.numeroPokedex
                LEFT JOIN tipo t1 ON pt1.idTipo = t1.idTipo
                LEFT JOIN pokemon_tipo pt2 ON p.numeroPokedex = pt2.numeroPokedex AND pt1.idTipo != pt2.idTipo
                LEFT JOIN tipo t2 ON pt2.idTipo = t2.idTipo
                WHERE p.numeroPokedex = $idPokemon";
        $resultado = $conn->query($sql);

        if ($resultado->num_rows > 0) {
            $pokemon = $resultado->fetch_assoc();
        }
    }

    return $pokemon;
}
?>
