<?php
// Codigo para añadir el reporte del usuario
include '../conexiones/conexionUsuarios.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") 
{
    $remitente = $_POST['usuario'];
    $tipoIncidencia = $_POST['incidencia'];
    $mensaje = $_POST['mensaje'];

    // Comprobamos si el remitente existe en la tabla usuarios
    $stmt = $conn->prepare("SELECT usuario FROM usuarios WHERE usuario = ?");
    if ($stmt) 
    {
        $stmt->bind_param("s", $remitente);
        $stmt->execute();
        $stmt->store_result();

        if ($stmt->num_rows > 0) 
        {
            // Si el remitente existe, insertamos el nuevo reporte
            $stmt->close();

            $stmt = $conn->prepare("INSERT INTO reportes (remitente, tipoIncidencia, mensaje, fechaReporte) VALUES (?, ?, ?, NOW())");
            if ($stmt) 
            {
                $stmt->bind_param("sss", $remitente, $tipoIncidencia, $mensaje);

                if ($stmt->execute()) 
                {
                    header("Location: ../contacto.php");
                    exit();
                } 
                else 
                {
                    header("Location: ../contacto.php");
                    exit();
                }
                $stmt->close();
            } 
            else 
            {
                header("Location: ../contacto.php");
                exit();
            }
        } 
        else 
        {
            
            $stmt->close();
            header("Location: ../contacto.php");
            exit();

        }
    } 
    else 
    {
        header("Location: ../contacto.php");
        exit();
    }
}

$conn->close();
?>