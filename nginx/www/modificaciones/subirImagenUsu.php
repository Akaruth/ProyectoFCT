<?php
session_start();
// Codigo para actualizar la foto de perfil del usuario
include '../conexiones/conexionUsuarios.php';

// Si el usuario no está autenticado, redirigirlo a la página de inicio de sesión
if (!isset($_SESSION['usuario'])) 
{
    header("Location: ../login.php");
    exit();
}

$usuario = $_SESSION['usuario'];
// Directorio de subida a carpeta
$directorioSubida = '../fotosPerfil/';
// Directorio de subida en base de datos
$directorioInterno = './fotosPerfil/';

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_FILES['imagenPerfil'])) {
    $imagen = $_FILES['imagenPerfil'];

    if ($imagen["error"] == UPLOAD_ERR_OK) {
        // Verificamos la extensión del archivo
        $extensionesPermitidas = array("png", "jpg", "jpeg", "gif");
        $nombreImagen = basename($imagen["name"]);
        $extension = strtolower(pathinfo($nombreImagen, PATHINFO_EXTENSION));

        if (!in_array($extension, $extensionesPermitidas)) 
        {
            $error = "Solo se permiten archivos con extensiones .png, .jpg, .jpeg o .gif.";
            echo $error;
        } 
        else 
        {
            // Verificamos el tamaño del archivo en maximo 15mb
            $tamano_maximo = 15 * 1024 * 1024; 
            if ($imagen["size"] > $tamano_maximo) 
            {
                $error = "El tamaño del archivo supera el límite permitido (15 MB).";
                echo $error; 
            } 
            else 
            {
                // Ruta donde se guardará la imagen
                $rutaImagen = $directorioSubida ."p_". $usuario . "_" . $nombreImagen;
                // Mover la imagen desde la ubicación temporal a la carpeta deseada
                if (move_uploaded_file($imagen["tmp_name"], $rutaImagen)) 
                {
                    $rutaImagen = $directorioInterno ."p_". $usuario . "_". $nombreImagen;
                    
                    // Actualizar la ruta de la imagen en la base de datos
                    $sql = "UPDATE usuarios SET imagenUsuario='$rutaImagen' WHERE usuario='$usuario'";
                    if ($conn->query($sql) === TRUE) 
                    {
                        header("Location: ../perfil.php");
                        exit();
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
