<?php
session_start();
// Codigo para que el administrador pueda cambiar su usuario (adminNick)
include '../conexiones/conexionUsuarios.php';

// Si el usuario no está autenticado, redirigirlo a la página de inicio de sesión
if (!isset($_SESSION['usuario']))
{
    header("Location: ../login.php");
    exit();
}

$usuario = $_SESSION['usuario'];
$nuevoUsuario = $_POST['nuevoUsu'];

// Verificar la longitud del nuevo usuario sea mayor a 6
if (strlen($nuevoUsuario) < 6) 
{
    $error = "El nombre de usuario debe ser de 6 digitos o mas";    
    header("Location: ../perfil.php");
    exit();
}
else 
{
    // Se comprueba que el nuevo nick no exista
    $sqlCheck = "SELECT * FROM adminT WHERE adminNick = ?";
    $stmtCheck = $conn->prepare($sqlCheck);
    $stmtCheck->bind_param("s", $nuevoUsuario);
    $stmtCheck->execute();
    $resultCheck = $stmtCheck->get_result();

    if ($resultCheck->num_rows > 0) {
        $error = "El nuevo nick ya está en uso.";
        header("Location: ../perfil.php");
        exit();

    } 
    else 
    {
        $conn->query("SET FOREIGN_KEY_CHECKS=0");
        
        // Si no existe se actualiza el nick
        $sql = "UPDATE adminT SET adminNick = ? WHERE adminNick = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ss", $nuevoUsuario, $usuario);

        // Tambien se actualiza el nombre del admin en las entradas creadas y los comentarios realizados
        if ($stmt->execute()) 
        {
            $sqlUpdateEntradas = "UPDATE entradas SET nombre_admin = ? WHERE nombre_admin = ?";
            $stmtUpdateEntradas = $conn->prepare($sqlUpdateEntradas);
            $stmtUpdateEntradas->bind_param("ss", $nuevoUsuario, $usuario);
            $stmtUpdateEntradas->execute();
            $stmtUpdateEntradas->close();

            $sqlUpdateComentarios = "UPDATE comentarios SET nombre_admin = ? WHERE nombre_admin = ?";
            $stmtUpdateComentarios = $conn->prepare($sqlUpdateComentarios);
            $stmtUpdateComentarios->bind_param("ss", $nuevoUsuario, $usuario);
            $stmtUpdateComentarios->execute();
            $stmtUpdateComentarios->close();

            $_SESSION['usuario'] = $nuevoUsuario;
        } 
        else 
        {
            header("Location: ../perfil.php");
            exit();        
        }

        $conn->query("SET FOREIGN_KEY_CHECKS=1");
    }

    $stmtCheck->close();
    $stmt->close();
    $conn->close();

    header("Location: ../perfil.php"); 
    exit();
}
?>
