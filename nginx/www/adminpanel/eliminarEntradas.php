<?php
// Codigo para la eliminacion directa de una entrada en especifico
include '../conexiones/conexionUsuarios.php';

if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['id'])) {
    $id_entradas = $_GET['id'];

    $stmt = $conn->prepare("DELETE FROM entradas WHERE id_entradas = ?");
    if ($stmt) {
        $stmt->bind_param("i", $id_entradas);

        if ($stmt->execute()) {
            header('Location: ../adminpanel.php');
        } else {
            header('Location: ../adminpanel.php');
        }

        $stmt->close();
    }

    $conn->close();
}
?>

