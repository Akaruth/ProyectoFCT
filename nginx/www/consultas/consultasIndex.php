<?php
//  Codigo para la pagina principal
include './conexiones/conexionUsuarios.php'; 
// Obtener las entradas realizadas en una semana
function obtenerEntradasSemana($conn) 
{
    $consulta_semana = "SELECT * FROM entradas WHERE fechaCreacionEntrada >= DATE_SUB(NOW(), INTERVAL 1 WEEK) ORDER BY fechaCreacionEntrada DESC";
    return $conn->query($consulta_semana);
}

// Obtener un listado de todas las entradas con un limite variable (4 en este caso)
function obtenerTodasEntradas($conn, $limite) 
{
    $consulta_todas = "SELECT * FROM entradas ORDER BY fechaCreacionEntrada DESC LIMIT $limite";
    return $conn->query($consulta_todas);
}
?>
