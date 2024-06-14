<?php
// Codigo que cuantifica si hay mensajes no leidos y devuelve la cantidad, se usa para mostrar notificacion al usuario de mensaje
    include './conexiones/conexionUsuarios.php';

    // Si el usuario no está autenticado, redirigirlo a la página de inicio de sesión
    if (!isset($_SESSION['usuario'])) 
    {
        header("Location: ../login.php");
        exit();
    }

    $usuario = $_SESSION['usuario'];
    $noleidos = 0;
    if ($usuario !== 'Anonimo') 
    {
        // Consulta que cuantifica lo anteriormente mencionado
        $sql = "SELECT COUNT(*) AS noleidos FROM mensajes WHERE remitente = '$usuario' AND leido = 'No'";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) 
        {
            $row = $result->fetch_assoc();
            $noleidos = $row['noleidos'];
        }
    }


    return $noleidos;
?>