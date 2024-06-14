<?php
session_start();
// Codigo para marcar como leido es decir actualizar el atributo leido del mensaje del admin
if (!isset($_SESSION['usuario'])) 
{
    // Si el usuario no está autenticado, redirigirlo a la página de inicio de sesión
    header("Location: ../login.php");
    exit(); 
}

// Verificamos si se ha pasado un idd de mensaje por la url
if (isset($_GET['idMensaje'])) {
    $idMensaje = $_GET['idMensaje'];

    include '../conexiones/conexionUsuarios.php';

    // Se actualiza el leido del mensaje a 'Si'
    $sql = "UPDATE mensajes SET leido = 'Si' WHERE idMensaje = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $idMensaje);

    if ($stmt->execute()) 
    {
        header("Location: ../mensajeria.php");
        exit();
    } 
    else 
    {
        exit();
    }
    
    $stmt->close();
    $conn->close();
} 
else
{
    exit();
}
?>
