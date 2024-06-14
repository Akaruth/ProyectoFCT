<?php
session_start();
// Codigo que realiza la inserccion de un mensaje respuesta a un reporte en especifico 
include '../conexiones/conexionUsuarios.php';

if (!isset($_SESSION['usuario'])) {
    exit;
}
// Si se recibe el mensaje de respuesta del formulario se inserta con prepare para evitar una inyección de datos
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["mensajeRespuesta"]) && isset($_POST["idReporte"])) {
    $mensaje = $_POST["mensajeRespuesta"];
    $remitente = $_SESSION['usuario'];
    $destinatario = $_POST["destinatario"];
    $idReporte = $_POST["idReporte"];

    $query = "SELECT remitente FROM reportes WHERE idReporte = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("i", $idReporte);
    $stmt->execute();
    $stmt->store_result();
    
    if ($stmt->num_rows > 0) {
        $stmt->bind_result($remitenteReporte);
        $stmt->fetch();
    } else {
        exit;
    }
    // El mensaje se crea con leido en No para que le salte al usuario como que le llego un mensaje
    $stmt = $conn->prepare("INSERT INTO mensajes (idReporte, remitente, destinatario, mensaje, fechaEnvio, leido) VALUES (?, ?, ?, ?, NOW(), 'No')");
    
    if ($stmt === false) {
        echo "Error al preparar la consulta.";
        exit;
    }

    $stmt->bind_param("isss", $idReporte, $remitenteReporte, $destinatario, $mensaje);
    $resultado = $stmt->execute();

    if ($resultado === false) {
        echo "Error al enviar el mensaje. Por favor, inténtalo de nuevo.";
    } 
    else 
    {
        $leido = "Si";
        // Actualizo como que el reporte del usuario fue leido por el admin
        $actualizar_reporte = $conn->prepare("UPDATE reportes SET leido = ? WHERE idReporte = ?");
        if ($actualizar_reporte === false) {
            echo "Error al preparar la consulta de actualización.";
            exit;
        }
        $actualizar_reporte->bind_param("si", $leido, $idReporte);
        $actualizar_reporte->execute();
        
        header("Location: ../mensajeria.php");
    }

    $stmt->close();
    $actualizar_reporte->close();
    $conn->close();
} else {
    exit();
}
?>
