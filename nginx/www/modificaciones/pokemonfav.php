<?php
// Codigo para actualizar el pokemon favorito del usuario
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
    $pokemonFav = $_POST['pokemonFav'];

    // Actualizamos el pokemon favorito del usuario
    $sqlUpdate = "UPDATE usuarios SET pokemonFav = ? WHERE usuario = ?";
    $stmt = $conn->prepare($sqlUpdate);
    $stmt->bind_param("ss", $pokemonFav, $usuario);

    if ($stmt->execute()) 
    {
        header("Location: ../perfil.php");
        exit();

    } 
    else
    {
        header("Location: ../perfil.php");
        exit(); 
    }

    $stmt->close();
    $conn->close();
}
?>
