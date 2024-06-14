<?php
// Codigo para obtener informacion de los reportes 
include './conexiones/conexionUsuarios.php';
// Funcion que nos devuelve todos los reportes que ha realizado un usuario con un limite  y offset para hacer paginacion
function obtenerReportesDelUsuario($usuario, $offset, $limit) 
{
    global $conn;
    $query = "SELECT idReporte, remitente, tipoIncidencia, fechaReporte, mensaje FROM reportes WHERE remitente = ? LIMIT ?, ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("sii", $usuario, $offset, $limit);
    $stmt->execute();
    $result = $stmt->get_result();

    $reportes = [];
    while ($row = $result->fetch_assoc()) {
        $reportes[] = $row;
    }

    $stmt->close();
    return $reportes;
}
// Funcion que nos devuelve todos los reportes que han realizado todos los usuarios con un limite  y offset para hacer paginacion
function obtenerReportesTodosUsuarios($offset, $limit) 
{
    global $conn;
    $query = "SELECT idReporte, remitente, tipoIncidencia, fechaReporte, mensaje FROM reportes LIMIT ?, ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("ii", $offset, $limit);
    $stmt->execute();
    $result = $stmt->get_result();

    $reportes = [];
    while ($row = $result->fetch_assoc()) {
        $reportes[] = $row;
    }

    $stmt->close();
    return $reportes;
}
// Funcion para obtener la cantidad de reportes de un usuario
function obtenerTotalReportesUsuario($usuario) 
{
    global $conn;
    $query = "SELECT COUNT(*) as total FROM reportes WHERE remitente = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("s", $usuario);
    $stmt->execute();
    $result = $stmt->get_result();
    $row = $result->fetch_assoc();
    return $row['total'];
}
// Funcion para cuantificar la cantidad de reportes existentes sin tener en cuenta el usuario
function obtenerTotalReportes() 
{
    global $conn;
    $query = "SELECT COUNT(*) as total FROM reportes";
    $stmt = $conn->prepare($query);
    $stmt->execute();
    $result = $stmt->get_result();
    $row = $result->fetch_assoc();
    return $row['total'];
}
?>
