<?php
// Codigo para la eliminacion de un mensaje en especifico
include '../conexiones/conexionUsuarios.php';

if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['id'])) {
    $id = $_GET['id'];
    $sql = "DELETE FROM mensajes WHERE idMensaje = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param('i', $id);
    $stmt->execute();
    header('Location: ../adminpanel.php');
}
?>
