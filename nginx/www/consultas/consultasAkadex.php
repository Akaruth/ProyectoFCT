<?php
// Codigo para mostrar todos los pokemon de la tabla pokemons e ir fintrandolos segun las elecciones del usuario / anonimo
include './conexiones/conexion.php'; 

function obtenerPokemon($conn, $tipoFiltro, $ordenFiltro, $offset, $limit) 
{
    $pokemon = [];
    // Obtenemos todos los Pokémon
    $sql = "SELECT p.* FROM pokemon p";
    // Si se usa el filtro de tipo, se filtra con la siguiente consulta
    if ($tipoFiltro) 
    {
        $sql .= " JOIN pokemon_tipo pt ON p.numeroPokedex = pt.numeroPokedex";
        $sql .= " JOIN tipo t ON pt.idTipo = t.idTipo";
        $sql .= " WHERE t.nombre = '$tipoFiltro'";
    }
    // Si se usa el filtro de orden, se filtra con la siguiente consulta
    if ($ordenFiltro) 
    {
        $sql .= " ORDER BY p.nombrePokemon ";
        if ($ordenFiltro == "desc") 
        {
            $sql .= "DESC";
        }
    }
    // Agregamos limit y offset para llevar a cabo la paginacion de los pokemons
    $sql .= " LIMIT $limit OFFSET $offset";
    $resultado = mysqli_query($conn, $sql);

    if (mysqli_num_rows($resultado) > 0) 
    {
        // Almacenamos el resultado en un array para mostrarlos luego
        while ($fila = mysqli_fetch_assoc($resultado)) 
        {
            $pokemon[] = $fila;
        }
    }
    return $pokemon;
}
// Se usa para obtener el total de Pokemons (y para calcular el número de páginas)
function obtenerTotalPokemon($conn, $tipoFiltro) 
{
    $sql = "SELECT COUNT(*) as total FROM pokemon p";

    if ($tipoFiltro) {
        $sql .= " JOIN pokemon_tipo pt ON p.numeroPokedex = pt.numeroPokedex";
        $sql .= " JOIN tipo t ON pt.idTipo = t.idTipo";
        $sql .= " WHERE t.nombre = '$tipoFiltro'";
    }

    $resultado = mysqli_query($conn, $sql);
    $fila = mysqli_fetch_assoc($resultado);

    return $fila['total'];
}
?>
