<?php
// Conexion de base de datos de usuario
$servername = "mysql";
$username = "adminCris";
$password = "adminCris";
$dbname = "baseUsuarios";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) 
{
    die("Conexión fallida de usuarios: " . $conn->connect_error);
}
?>
