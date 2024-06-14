<?php
session_start();
// Codigo del buscador que comapra el nombre metido en el buscador para ver si coincide con algun nombre de una entrada
//  existente en la tabla entradas

$usuario = isset($_SESSION['usuario']) ? $_SESSION['usuario'] : 'Anonimo';

$nombreEntrada = isset($_POST['nombreEntrada']) ? $_POST['nombreEntrada'] : '';

if (!empty($nombreEntrada)) 
{
    include '../conexiones/conexionUsuarios.php'; 

    $sql = "SELECT * FROM entradas WHERE titulo LIKE '%$nombreEntrada%'";
    $resultado = $conn->query($sql);

    if ($resultado->num_rows > 0) {
        $entradas = $resultado->fetch_assoc();
        header("Location: ../entrada.php?id=" . $entradas['id_entradas']);
        exit();
    } 
    else
    {
        $identradaactual = $_POST['identradaactual'];
        header("Location: ../entrada.php?id=" . $identradaactual);
        exit();
    }
} 
else 
{
    if (isset($_POST['identradaactual'])) 
    {
        $identradaactual = $_POST['identradaactual'];
        header("Location: ../entrada.php?id=" . $identradaactual);
        exit();
    }}
?>
