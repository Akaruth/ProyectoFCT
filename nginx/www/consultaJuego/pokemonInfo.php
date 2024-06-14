<?php
// Codigo para obtener toda la inforamcion de un pokemon en especifico, usado en el minijuego 
if (isset($_POST['pokemonID'])) 
{
    $pokemonID = $_POST['pokemonID'];

    include '../conexiones/conexion.php';

    $sql = "SELECT p.*, t.nombre AS tipo FROM pokemon p 
            INNER JOIN pokemon_tipo pt ON p.numeroPokedex = pt.numeroPokedex 
            INNER JOIN tipo t ON pt.idTipo = t.idTipo
            WHERE p.numeroPokedex = $pokemonID";

    $result = $conn->query($sql);

    if ($result->num_rows > 0) 
    {
        $pokemonInfo = $result->fetch_assoc();

        echo json_encode($pokemonInfo);
    }
    $conn->close();
}
?>
