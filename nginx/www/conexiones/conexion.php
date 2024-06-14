<?php
// Conexion de base de datos del minijuego
$servername = "mysql";
$username = "adminCris";
$password = "adminCris";
$dbname = "pokemondb";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) 
{
    die("Conexión fallida de pokemon: " . $conn->connect_error);
}
?>
