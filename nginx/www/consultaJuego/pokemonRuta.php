<?php
// Codigo para generar los pokemons de una ruta en especifico que aparezca en el mapa
if (isset($_POST['mapaActual'])) 
{
    $mapaActual = $_POST['mapaActual'];
    $rutas = array(
        1 => 11,
        2 => 1,
        3 => 12,  
        5 => 13,
        6 => 13,
        4 => 2, 
        7 => 3,
        8 => 3,
        9 => 14,
        10 => 14
    );

    $idRuta = $rutas[$mapaActual]; 

    include '../conexiones/conexion.php';
    $sql_pokemon_ruta = "SELECT pr.numeroPokedex
                            FROM pokemonRuta pr
                            WHERE pr.idRuta = $idRuta";

    $resultado_pokemon_ruta = $conn->query($sql_pokemon_ruta);

    if ($resultado_pokemon_ruta->num_rows > 0) 
    {
        $pokemon_ruta = array();

        while ($fila = $resultado_pokemon_ruta->fetch_assoc()) 
        {
            $pokemon_ruta[] = $fila['numeroPokedex'];
        }
        echo json_encode($pokemon_ruta);
    } 
    else 
    {
        echo json_encode(array());
    }
    
    $conn->close();
}
?>
