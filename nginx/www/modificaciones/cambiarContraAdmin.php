<?php
//  Codigo para cambiar la contraseña del admin
session_start();
include '../conexiones/conexionUsuarios.php';

// Si el usuario no está autenticado, redirigirlo a la página de inicio de sesión
if (!isset($_SESSION['usuario'])) 
{
    header("Location: ../login.php");
    exit();
}

$usuario = $_SESSION['usuario'];
$contraActual = $_POST['contraActual'];
$nuevaContra = $_POST['nuevaContra'];
$confirmaContra = $_POST['confcontraActual'];

// Se confirma que la nueva contra coincida con la confirmacion
if ($nuevaContra !== $confirmaContra) 
{
    exit();
}
// Se encripta la contraseña nueva
$encriptada = hash('sha256', $nuevaContra);

$sql = "SELECT contrasena FROM adminT WHERE adminNick = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $usuario);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) 
{
    $row = $result->fetch_assoc();
    if (hash('sha256', $contraActual) === $row['contrasena']) 
    {
        // Actualizar la contraseña con el nuevo hash
        $sqlUpdate = "UPDATE adminT SET contrasena = ? WHERE adminNick = ?";
        $stmtUpdate = $conn->prepare($sqlUpdate);
        $stmtUpdate->bind_param("ss", $encriptada, $usuario);
        if ($stmtUpdate->execute()) 
        {
            header("Location: ../perfil.php"); 
            exit();
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
} 
else 
{
    exit();
}

$stmt->close();
$stmtUpdate->close();
$conn->close();
header("Location: ../perfil.php"); 
?>
