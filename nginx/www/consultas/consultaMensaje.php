<?php

include './conexiones/conexionUsuarios.php'; 

// Funcion que me devuelve un icono segun el estado de leido de un menasje.
function obtenerEstadoRespuestaReporte($idReporte) 
{
    $usuario = isset($_SESSION['usuario']) ? $_SESSION['usuario'] : 'Anonimo';

    global $conn; 
    $esAdmin = false;
    if ($usuario !== 'Anonimo') 
    {
        $query = "SELECT * FROM adminT WHERE adminNick = ?";
        $stmt = $conn->prepare($query);
        $stmt->bind_param("s", $usuario);
        $stmt->execute();
        $result = $stmt->get_result();
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $esAdmin = true;
    
        }
    }
    // Consulta para obtener el estado de respuesta del reporte y su estado de lectura
    $query = "SELECT leido FROM mensajes WHERE idReporte = ? ORDER BY fechaEnvio DESC LIMIT 1";
    $statement = $conn->prepare($query);
    $statement->bind_param("i", $idReporte);
    $statement->execute();
    $statement->store_result();
    if ($esAdmin == false) {
        // Este es el modo vista de la mensajeria usuario

        if ($statement->num_rows > 0) 
        { 
            $statement->bind_result($leido);
            $statement->fetch();

            // Segun el estado de leido muestra uno u otro
            if ($leido == 'Si') {
                return '<i class="bi bi-send-check text-success"></i>'; // Muestra un icono verde
            } else {
                return '<i class="bi bi-send-exclamation text-danger"></i>'; // Muestra un icono rojo
            }
        } else { // Si no hay respuestas
            return '<i class="bi bi-hourglass-bottom text-warning"></i>'; // Muestra un icono del reloj
        }
    }
    else
    {
        // Este es el modo vista de la mensajeria administrador
        if ($statement->num_rows > 0) 
        { 
            $statement->bind_result($leido);
            $statement->fetch();

            // Segun el estado de leido muestra uno u otro
            if ($leido == 'No') 
            {
                return '<i class="bi bi-hourglass-bottom text-warning"></i>'; // Muestra un icono del reloj
            } 
            else 
            {
                return '<i class="bi bi-send-check text-success"></i>'; // Muestra un icono verde
            }
        } 
        else {
            return '<i class="bi bi-send-exclamation text-danger"></i>'; // Muestra un icono rojo
        }
    }

    $statement->close(); 
}

?>