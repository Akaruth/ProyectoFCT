<?php
// Codigo que cuntifica cuantos reportes hay con leido en No y los devuelve ,se usa para mostrar notificacion al admin de mensaje
    include './conexiones/conexionUsuarios.php'; 
    function verificarReportesNoLeidos($conn)
    {
        $query = "SELECT COUNT(*) as reportesnoleidos FROM reportes WHERE leido = 'No'";
        $stmt = $conn->prepare($query);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row['reportesnoleidos'];
    }

    return verificarReportesNoLeidos($conn);
?>
