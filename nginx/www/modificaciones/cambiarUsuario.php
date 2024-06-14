<?php
session_start();
// Codigo para cambiar el usuario del usuario
include '../conexiones/conexionUsuarios.php';

if (!isset($_SESSION['usuario'])) {
    header("Location: ../login.php");
    exit();
}

$usuario = $_SESSION['usuario'];
$nuevoUsuario = $_POST['nuevoUsu'];

// Verificar la longitud del nuevo usuario sea mayor a 6
if (strlen($nuevoUsuario) < 6) {
    $error = "El nombre de usuario debe ser de 6 digitos o mas";    
    header("Location: ../perfil.php");
    exit();
} else {
    // Se comprueba que el nuevo nick no exista
    $sqlCheck = "SELECT * FROM usuarios WHERE usuario = ?";
    $stmtCheck = $conn->prepare($sqlCheck);
    $stmtCheck->bind_param("s", $nuevoUsuario);
    $stmtCheck->execute();
    $resultCheck = $stmtCheck->get_result();

    if ($resultCheck->num_rows > 0) {
        $error = "El nuevo nick ya está en uso.";
        header("Location: ../perfil.php");
        exit();

    } else {
        $conn->query("SET FOREIGN_KEY_CHECKS=0");

        // Si no existe se actualiza el usuario
        $sql = "UPDATE usuarios SET usuario = ? WHERE usuario = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ss", $nuevoUsuario, $usuario);

        // Tambien se actualiza el nombre del usuarios en las entradas creadas , los reportes realizados y  los comentarios realizados
        if ($stmt->execute()) 
        {
            $sqlUpdateEntradas = "UPDATE entradas SET nombre_usuario = ? WHERE nombre_usuario = ?";
            $stmtUpdateEntradas = $conn->prepare($sqlUpdateEntradas);
            $stmtUpdateEntradas->bind_param("ss", $nuevoUsuario, $usuario);
            $stmtUpdateEntradas->execute();
            $stmtUpdateEntradas->close();

            $sqlUpdateComentarios = "UPDATE comentarios SET nombre_usuario = ? WHERE nombre_usuario = ?";
            $stmtUpdateComentarios = $conn->prepare($sqlUpdateComentarios);
            $stmtUpdateComentarios->bind_param("ss", $nuevoUsuario, $usuario);
            $stmtUpdateComentarios->execute();
            $stmtUpdateComentarios->close();


            $sqlUpdateReportes = "UPDATE reportes SET remitente = ? WHERE remitente = ?";
            $stmtUpdateReportes = $conn->prepare($sqlUpdateReportes);
            $stmtUpdateReportes->bind_param("ss", $nuevoUsuario, $usuario);
            $stmtUpdateReportes->execute();
            $stmtUpdateReportes->close();

            $_SESSION['usuario'] = $nuevoUsuario;
        } 
        else 
        {
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
