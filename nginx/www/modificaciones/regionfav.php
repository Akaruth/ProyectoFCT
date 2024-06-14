<?php
// Codigo para actualizar la region favorita del usuario
session_start();
include '../conexiones/conexionUsuarios.php'; 

// Si el usuario no está autenticado, redirigirlo a la página de inicio de sesión
if (!isset($_SESSION['usuario'])) {
    header("Location: ../login.php");
    exit();
}

if ($_SERVER["REQUEST_METHOD"] == "POST") 
{
    $usuario = $_SESSION['usuario'];
    $regionFav = $_POST['regionFav'];

    // Actualizar la región favorita del usuario
    $sqlUpdate = "UPDATE usuarios SET regionFav = ? WHERE usuario = ?";
    $stmt = $conn->prepare($sqlUpdate);
    $stmt->bind_param("ss", $regionFav, $usuario);

    if ($stmt->execute()) {
        header("Location: ../perfil.php");
        exit();
    } 
    else 
    {
        exit();
    }

    $stmt->close();
    $conn->close();
}
?>
