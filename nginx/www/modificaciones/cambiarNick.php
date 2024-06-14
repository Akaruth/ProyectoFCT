<?php
session_start();
// Codigo para cambiar el alias del usuario
include '../conexiones/conexionUsuarios.php';

// Si el usuario no está autenticado, redirigirlo a la página de inicio de sesión
if (!isset($_SESSION['usuario'])) 
{
    header("Location: ../login.php");
    exit();
}

$usuario = $_SESSION['usuario'];
$nuevoNick = $_POST['nuevoNick'];

// validamos el nuevo nick de usuario
if (empty($nuevoNick)) 
{
    header("Location: ../perfil.php");
    exit();
} 
else 
{
    // Actualizamos el alias del usuario
    $sql = "UPDATE usuarios SET nickUsuario = ? WHERE usuario = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $nuevoNick, $usuario);

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
    
}

$stmtCheck->close();
$stmt->close();
$conn->close();
header("Location: ../perfil.php");
exit();
?>
