<?php
session_start();
// Codigo para eliminar una entrada en especifico 
include '../conexiones/conexionUsuarios.php'; 

// Si el usuario no está autenticado, redirigirlo a la página de inicio de sesión
if (!isset($_SESSION['usuario'])) {
    header("Location: ../login.php");
    exit(); 
}

// Obtener el nombre de usuario del usuario actual
$usuario_actual = $_SESSION['usuario'];

// Verificar si el usuario es administrador
$esAdmin = false;
$query = "SELECT * FROM adminT WHERE adminNick = ?";
$stmt = $conn->prepare($query);
$stmt->bind_param("s", $usuario_actual);
$stmt->execute();
$result = $stmt->get_result();
if ($result->num_rows > 0) 
{
    $esAdmin = true;
}
$stmt->close();

//Si se recibió la id de la entrada a eliminar
if (isset($_GET['id_entrada'])) 
{
    $id_entrada = $_GET['id_entrada'];
    
    // Consulta para verificar si el usuario actual es el propietario de la entrada
    $consulta_entrada = "SELECT nombre_usuario FROM entradas WHERE id_entradas = ?";
    $stmt = $conn->prepare($consulta_entrada);
    $stmt->bind_param("i", $id_entrada);
    $stmt->execute();
    $resultado_entrada = $stmt->get_result();
    
    if ($resultado_entrada->num_rows == 1) 
    {
        // Obtener el nombre de usuario del propietario de la entrada
        $fila_entrada = $resultado_entrada->fetch_assoc();
        $nombre_usuario_entrada = $fila_entrada['nombre_usuario'];
        
        // Verificar si el usuario actual es el propietario de la entrada o administrador
        if ($usuario_actual === $nombre_usuario_entrada || $esAdmin) 
        {
            // Eliminamos la entrada
            $consulta_eliminar = "DELETE FROM entradas WHERE id_entradas = ?";
            $stmt = $conn->prepare($consulta_eliminar);
            $stmt->bind_param("i", $id_entrada);
            if ($stmt->execute()) 
            {
                header("Location: ../akachat.php");
                exit(); 
            } 
            else 
            {
                exit(); 
            }
        } 
        else
        {
            header("Location: ../akachat.php");
            exit(); 
        }
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
?>
