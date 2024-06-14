<?php
// Codigo para la eliminacion de un reporte en especifico
include '../conexiones/conexionUsuarios.php';

if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['id'])) {
    $id = $_GET['id'];
    $sql = "DELETE FROM reportes WHERE idReporte = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param('i', $id);
    $stmt->execute();
    header('Location: ../adminpanel.php');
}
?>
