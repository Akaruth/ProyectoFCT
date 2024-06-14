<?php
session_start();
// Codigo para actualizar la valoracion de la entrada
include '../conexiones/conexionUsuarios.php';
include '../consultas/consultasEntrada.php';

$usuario = isset($_SESSION['usuario']) ? $_SESSION['usuario'] : 'Anonimo';

// Si el usuario no está autenticado, redirigirlo a la página de inicio de sesión
if (!isset($_SESSION['usuario'])) 
{
    header("Location: ../login.php");
    exit(); 
}

// Si se ha pasado pasa un id y una valoración
if(isset($_POST['id_entrada']) && isset($_POST['valoracion'])) 
{
    $id_entrada = $_POST['id_entrada'];
    $valoracion = $_POST['valoracion'];

    // Actualizar la valoración de la entrada
    actualizarValoracionEntrada($conn, $id_entrada, $usuario, $valoracion);

    header("Location: ../entrada.php?id=$id_entrada");
    exit(); 
}
else 
{
    exit(); 
}
?>
