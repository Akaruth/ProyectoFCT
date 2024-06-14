<?php
session_start();

include '../conexiones/conexionUsuarios.php'; 
$usuario = isset($_SESSION['usuario']) ? $_SESSION['usuario'] : 'Anonimo';

if ($usuario !== 'Anonimo') 
{
    $query = "SELECT * FROM adminT WHERE adminNick = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("s", $usuario);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $usuarioAdmin = $row['adminNick'];
    }
}
if ($_SERVER['REQUEST_METHOD'] === 'POST') 
{
    $tabla = $_POST['table'];
    $columnas = '*';
    $editarUrl = "";
    $eliminarUrl = "";
    $idColumn = "";  
    
    switch ($tabla) {
        case 'usuarios':
            $columnas = 'usuario as Usuario , nickUsuario as Alias, contrasena as Contrasena';
            $editarUrl = "./adminpanel/editarUsuarios.php";
            $eliminarUrl = "./adminpanel/eliminarUsuarios.php";
            $idColumn = 'Usuario';  
            break;
        case 'entradas':
            $columnas = 'id_entradas as Id , titulo as Titulo, descripcion as Descripcion, nombre_usuario as Usuario';
            $editarUrl = "./adminpanel/editarEntradas.php";
            $eliminarUrl = "./adminpanel/eliminarEntradas.php";
            $idColumn = 'Id'; 
            break;
        case 'comentarios':
            $columnas = 'id_comentarios as Id, opinion as Opinion, nombre_usuario as Usuario';
            $editarUrl = "./adminpanel/editarComentarios.php";
            $eliminarUrl = "./adminpanel/eliminarComentarios.php";
            $idColumn = 'Id'; 
            break;
        case 'reportes':
            $columnas = 'idReporte as Id, remitente as Remitente, tipoIncidencia as Incidencia, mensaje as Mensaje';
            $editarUrl = "";
            $eliminarUrl = "./adminpanel/eliminarReportes.php";
            $idColumn = 'Id';  
            break;
        case 'mensajes':
            $columnas = 'idMensaje as Id, remitente as Remitente, mensaje as Mensaje';
            $editarUrl = "./adminpanel/editarMensajes.php";
            $eliminarUrl = "./adminpanel/eliminarMensajes.php";
            $idColumn = 'Id'; 
            break;
        default:
            exit();
    }

    $sql = "SELECT $columnas FROM $tabla";
    $resultado = $conn->query($sql);

    if ($resultado->num_rows > 0) {
        echo '<div class="tituloseccion"> Sección '. $tabla.'</div>';

        echo '<table class="responsive-table">';
        echo '<tr>';
        while ($filainfo = $resultado->fetch_field()) {
            echo '<th>' . $filainfo->name . '</th>';
        }
        if(!empty($editarUrl))
        {
            echo '<th>Editar</th>';
        }
        echo '<th>Eliminar</th>';
        echo '</tr>';
        while ($row = $resultado->fetch_assoc()) 
        {
            echo '<tr>';
            foreach ($row as $columna => $celda) 
            {

                if ($columna == 'Usuario' && empty($celda)) 
                {
                    echo '<td>' . htmlspecialchars($usuarioAdmin) . '</td>';
                }
                else if (($columna == 'Titulo' || $columna == 'Descripcion' || $columna == 'Contrasena'|| $columna == 'Opinion'||$columna == 'Incidencia'|| $columna == 'Mensaje') && strlen($celda) > 15 ) {
                    echo '<td>' . htmlspecialchars(substr($celda, 0, 10)) . '...</td>';
                } else {
                    echo '<td>' . htmlspecialchars($celda) . '</td>';
                }
            }
            $id = $row[$idColumn]; 
            if(!empty($editarUrl))
            {
                echo '<td><a href="' . $editarUrl . '?id=' . $id . '"><button class="btn btn-warning">Editar</button></a></td>';
            }
            echo '<td><a href="' . $eliminarUrl . '?id=' . $id . '"><button class="btn btn-danger">Eliminar</button></a></td>';
            echo '</tr>';
        }
        echo '</table>';
    } else {
        echo 'No hay registros';
    }
} 
//  Archivo con en el que genero la tabla segun el boton que se haya clickado conjunto sus botones de editar y eliminar,
//  segun que apartado es no se muestra el boton de editar ya que no es necesario
$conn->close();
?>
