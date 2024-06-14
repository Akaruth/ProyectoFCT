<?php
// Codigo para la eliminacion de un usuario en especifico
include '../conexiones/conexionUsuarios.php';

if ($_SERVER['REQUEST_METHOD'] === 'GET'&& isset($_GET['id'])) 
{
    $usuario = $_GET['id'];

    $sql = "DELETE FROM usuarios WHERE usuario = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param('s', $usuario);

    if ($stmt->execute()) {
        header('Location: ../adminpanel.php');
    } else {
        header('Location: ../adminpanel.php');
    }

    $conn->close();
}
?>
