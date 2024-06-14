<?php
session_start();
// Codigo para crear un comentario independientemente de si eres un usuario o un administrador 

// Si no estas registrado te lleva al inicio
if (!isset($_SESSION['usuario']) || $_SERVER["REQUEST_METHOD"] != "POST") 
{
    header("Location: ../index.php");
    exit();
}

include '../conexiones/conexionUsuarios.php';

// Obtener los datos del formulario e intentamos 
$opinion = nl2br($_POST['opinion']); 
$id_entrada = $_POST['id_entrada'];
$nombre_usuario = $_SESSION['usuario'];

// Determinar si el usuario es un administrador o un usuario , segun el resultado se insertara de una manera u otra
$esAdmin = false;
$stmt_admin = $conn->prepare("SELECT adminNick FROM adminT WHERE adminNick = ?");
$stmt_admin->bind_param("s", $nombre_usuario);
$stmt_admin->execute();
$stmt_admin->store_result();

if ($stmt_admin->num_rows > 0) 
{
    $esAdmin = true;
}
$stmt_admin->close();

if ($esAdmin) 
{    
    // Inserccion como admin
    $consulta = "INSERT INTO comentarios (opinion, fechaCreacionComentario, id_entradas, nombre_admin) VALUES (?, NOW(), ?, ?)";
} 
else 
{
    $verificar_usuario = "SELECT usuario FROM usuarios WHERE usuario = ?";
    $stmt_verificar = $conn->prepare($verificar_usuario);
    $stmt_verificar->bind_param("s", $nombre_usuario);
    $stmt_verificar->execute();
    $stmt_verificar->store_result();

    if ($stmt_verificar->num_rows == 0) 
    {
        header("Location: ../entrada.php?id=$id_entrada");
        exit(); 
    }
    $stmt_verificar->close();
    // Inserccion como usuario
    $consulta = "INSERT INTO comentarios (opinion, fechaCreacionComentario, id_entradas, nombre_usuario) VALUES (?, NOW(), ?, ?)";
}

$stmt = $conn->prepare($consulta);

if ($esAdmin) 
{
    $stmt->bind_param("sis", $opinion, $id_entrada, $nombre_usuario);
} 
else 
{
    $stmt->bind_param("sis", $opinion, $id_entrada, $nombre_usuario);
}

if ($stmt->execute()) 
{
    header("Location: ../entrada.php?id=$id_entrada#comentar");
    exit(); 
} 
else 
{
    exit(); 

}

$stmt->close();
$conn->close();
?>
