<?php
session_start();

// Codigo para eliminar un comentario en especifico

// Si el usuario no está autenticado, redirigirlo a la página de inicio de sesión
if (!isset($_SESSION['usuario'])) 
{
    header("Location: ../login.php");
    exit(); 
}

// Verificar si se han pasado los id por url
if (isset($_GET['id_comentario']) && isset($_GET['id_entrada'])) 
{
    $id_comentario = $_GET['id_comentario'];
    $id_entrada = $_GET['id_entrada'];

    include '../conexiones/conexionUsuarios.php';

    // Obtener el nombre de usuario actual
    $nombre_usuario_actual = $_SESSION['usuario'];

    // Si el usuario es administrador
    $esAdmin = false;
    $query = "SELECT * FROM adminT WHERE adminNick = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("s", $nombre_usuario_actual);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows > 0) 
    {
        $esAdmin = true;
    }
    $stmt->close();

    // Consultar la información del comentario para verificar si el usuario actual es el creador del comentario
    $consulta_comentario = "SELECT nombre_usuario FROM comentarios WHERE id_comentarios = ?";
    $stmt = $conn->prepare($consulta_comentario);
    $stmt->bind_param("i", $id_comentario);
    $stmt->execute();
    $stmt->store_result();

    // Verificar si se encontró el comentario
    if ($stmt->num_rows > 0) 
    {
        $stmt->bind_result($nombre_usuario_comentario);
        $stmt->fetch();
        
        // Verificar si el usuario actual es el creador del comentario o un administrador
        if ($nombre_usuario_actual === $nombre_usuario_comentario || $esAdmin) 
        {
            // Consulta para eliminar el comentario
            $eliminar_comentario = "DELETE FROM comentarios WHERE id_comentarios = ?";
            $stmt_eliminar = $conn->prepare($eliminar_comentario);
            $stmt_eliminar->bind_param("i", $id_comentario);

            if ($stmt_eliminar->execute()) 
            {
                header("Location: ../entrada.php?id=" . $id_entrada . '#comentarios');
                exit(); 
            } 
            else 
            {
                exit(); 
            }

            $stmt_eliminar->close();
        } 
        else
        {
            exit(); 
        }
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
