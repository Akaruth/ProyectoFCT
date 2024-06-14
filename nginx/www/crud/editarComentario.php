<?php
session_start();
// Codigo para editar un comentario independientemente de si eres usuario o admin
include '../conexiones/conexionUsuarios.php'; 
// Si el usuario no está autenticado, redirigirlo a la página de inicio de sesión
if (!isset($_SESSION['usuario'])) 
{
    header("Location: ../login.php");
    exit(); 
}
// Si los datos del formulario se enviaron
if ($_SERVER["REQUEST_METHOD"] == "POST") 
{
    $id_comentario = $_POST['id_comentario'];
    $id_entrada = $_POST['id_entrada'];
    $opinion = $_POST['opinion'];
    $valoracion = $_POST['valoracionComentario'];

    // Actualizar el comentario en la base de datos
    $actualizar_comentario = "UPDATE comentarios SET opinion = '$opinion', valoracionComentario = '$valoracion' WHERE id_comentarios = $id_comentario AND id_entradas = $id_entrada";
    
    if ($conn->query($actualizar_comentario) === TRUE) 
    {
        header("Location: ../entrada.php?id=" . $id_entrada.  '#comentarios');
        exit();
    }
} 
else 
{
    header("Location: ../entrada.php"); 
    exit();
}
?>
