<?php
session_start();
// Codigo para cambiar el fondo del perfil de usuario 
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    include '../conexiones/conexionUsuarios.php';

    if (isset($_FILES["fondoPerfil"]) && $_FILES["fondoPerfil"]["error"] == 0) {
        // Ruta de insercion en la carpeta deseada
        $ruta = "../fondosPerfiles/";
        // Ruta de inserccion en la base de datos
        $rutaInterno = "./fondosPerfiles/";

        $usuario = $_SESSION['usuario'];

        $imagen = basename($_FILES["fondoPerfil"]["name"]);
        
        // Agregar el nombre de usuario al nombre del archivo para evitar que se machaque a futuro
        $rutaImagen = $ruta ."f_". $usuario . "_" . $imagen;
        
        $tipoimagen = strtolower(pathinfo($rutaImagen, PATHINFO_EXTENSION));
        if ($tipoimagen != "jpg" && $tipoimagen != "png" && $tipoimagen != "jpeg" && $tipoimagen != "gif") 
        {
            exit;
        }
        if ($_FILES["fondoPerfil"]["size"] > 15000000) 
        {
            exit;
        }
        // Mover la imagen al sitio correspondiente
        if (move_uploaded_file($_FILES["fondoPerfil"]["tmp_name"], $rutaImagen)) 
        {
            // Actualizar la imagen del fondo
            $rutaInterna = $rutaInterno  ."f_". $usuario . "_" . $imagen;
            $sql = "UPDATE usuarios SET fondoPerfil = '$rutaInterna' WHERE usuario = '$usuario'";
            
            if ($conn->query($sql) === TRUE) 
            {
                header("Location: ../perfil.php");
                exit();

            }
        } 
        else 
        {
            header("Location: ../perfil.php");
            exit();
        }
    } 
    else 
    {
        header("Location: ../perfil.php");
        exit();
    }
} 
$conn->close();
header("Location: ../perfil.php"); 
exit();
?>
