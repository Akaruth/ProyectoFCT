<?php
session_start();
// Codigo para editar una entrada independientemente de si eres un admin o usuario
include '../conexiones/conexionUsuarios.php'; 

// Si el usuario no está autenticado, redirigirlo a la página de inicio de sesión
if (!isset($_SESSION['usuario'])) {
    header("Location: ../login.php");
    exit(); 
}
// Si los datos del formulario se enviaron
if ($_SERVER["REQUEST_METHOD"] == "POST") 
{
    $id_entrada = $_POST['id_entrada'];
    $titulo = $_POST['titulo'];
    $descripcion = $_POST['descripcion'];

    // Comprobar que la nueva imagen no supera los 15 mb
    if ($_FILES["imagenEntrada"]["error"] == UPLOAD_ERR_OK) 
    {
        $tamano_maximo = 15 * 1024 * 1024;
        if ($_FILES["imagenEntrada"]["size"] > $tamano_maximo) {
            $error = "El tamaño del archivo supera el límite permitido (15 MB).";
        } 
        else 
        {
            //Obtener el nombre de la imagen y crear la ruta.
            $nombre_imagen = $_FILES["imagenEntrada"]["name"];
            $ruta_imagen = "../fotosEntradas/" . $nombre_imagen;
            // Mover la imagen desde la ubicación temporal a la carpeta deseada
            move_uploaded_file($_FILES["imagenEntrada"]["tmp_name"], $ruta_imagen);

            // Actualizar la entrada en la base de datos con la nueeva imagen
            $actualizar_entrada = $conn->prepare("UPDATE entradas SET titulo = ?, descripcion = ?, imagenEntrada = ? WHERE id_entradas = ?");
            $actualizar_entrada->bind_param("sssi", $titulo, $descripcion, $nombre_imagen, $id_entrada);
        }
    } 
    else 
    {
        // Si no se sube una nueva imagen, solo actualizar el título y la descripción
        $actualizar_entrada = $conn->prepare("UPDATE entradas SET titulo = ?, descripcion = ? WHERE id_entradas = ?");
        $actualizar_entrada->bind_param("ssi", $titulo, $descripcion, $id_entrada);
    }

    if ($actualizar_entrada->execute()) 
    {
        header("Location: ../akachat.php?id=" . $id_entrada . "#entradas");
        exit();
    } 
    else 
    {
        echo "Error al actualizar la entrada: " . $conn->error;
    }
} 
else 
{
    header("Location: ../akachat.php");
    exit();
}
?>
