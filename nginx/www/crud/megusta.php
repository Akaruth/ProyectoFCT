<?php
session_start();
// Codigo para administrar la valoracion de los comentarios
include '../conexiones/conexionUsuarios.php';

//  Si se da a me gusta y se reciben los siguiente campos
if (isset($_GET['id_comentario']) && isset($_GET['id_entrada']) && isset($_SESSION['usuario'])) {
    $id_comentario = $_GET['id_comentario'];
    $usuario = $_SESSION['usuario'];
    $id_entrada = $_GET['id_entrada'];

    // Se verifica si el usuario es un administrador
    $esAdmin = false;
    $stmtAdmin = $conn->prepare("SELECT adminNick FROM adminT WHERE adminNick = ?");
    $stmtAdmin->bind_param("s", $usuario);
    $stmtAdmin->execute();
    $stmtAdmin->store_result();

    if ($stmtAdmin->num_rows > 0) 
    {
        $esAdmin = true;
    }
    $stmtAdmin->close();

    // Se verifica el usuario u admin ha dado "me gusta" 
    if ($esAdmin) 
    {
        $verificarLike = "SELECT * FROM valorComentarios WHERE id_comentario = ? AND nombre_admin = ?";
    } 
    else 
    {
        $verificarLike = "SELECT * FROM valorComentarios WHERE id_comentario = ? AND id_usuario = ?";
    }
    $stmtLike = $conn->prepare($verificarLike);
    $stmtLike->bind_param("is", $id_comentario, $usuario);
    $stmtLike->execute();
    $resultadoLike = $stmtLike->get_result();

    //  Si no le dio a me gusta antes se suma
    if ($resultadoLike->num_rows == 0) 
    {
        // Insertar nuevo registro de "me gusta" se suma 1 al valor del comentario
        if ($esAdmin) {
            $insertarLike = "INSERT INTO valorComentarios (id_comentario, nombre_admin, valoracion) VALUES (?, ?, 1)";
        } else {
            $insertarLike = "INSERT INTO valorComentarios (id_comentario, id_usuario, valoracion) VALUES (?, ?, 1)";
        }
        $stmtInsertarLike = $conn->prepare($insertarLike);
        $stmtInsertarLike->bind_param("is", $id_comentario, $usuario);
        $stmtInsertarLike->execute();
    } else 
    {
        // Si ya ha dado "me gusta", eliminar el registro anterior osea se le borra la valoracion
        if ($esAdmin) 
        {
            $eliminarLike = "DELETE FROM valorComentarios WHERE id_comentario = ? AND nombre_admin = ?";
        } 
        else 
        {
            $eliminarLike = "DELETE FROM valorComentarios WHERE id_comentario = ? AND id_usuario = ?";
        }
        $stmtEliminarLike = $conn->prepare($eliminarLike);
        $stmtEliminarLike->bind_param("is", $id_comentario, $usuario);
        $stmtEliminarLike->execute();
    }

    header("Location: ../entrada.php?id=$id_entrada#comentarios");
    exit();
} else {
    header("Location: ../login.php");
    exit();
}
?>
