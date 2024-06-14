<?php
// Codigo que devuelve informacion de las entradas 

// Funcion que devuelve los atributos especificados en la consulta de una entrada en especifico
function obtenerInformacionEntrada($conn, $id_entrada) 
{
    $consulta_entrada = "SELECT imagenEntrada, titulo, descripcion, valoracionEntrada FROM entradas WHERE id_entradas = ?";
    $stmt = $conn->prepare($consulta_entrada);
    $stmt->bind_param("i", $id_entrada);
    $stmt->execute();
    $resultado_entrada = $stmt->get_result();
    
    return $resultado_entrada;
}
// Funcion que devuelve el total de comentarios en una entrada en especifico para realizar la paginacion de los mismos
function obtenerTotalComentarios($conn, $id_entrada) 
{
    $consulta_total_comentarios = "SELECT COUNT(*) AS total FROM comentarios WHERE id_entradas = $id_entrada";
    $resultado_total_comentarios = $conn->query($consulta_total_comentarios);
    $totalComentarios = $resultado_total_comentarios->fetch_assoc()['total'];
    return $totalComentarios;
}

// Funcion para obtener el total de los comentarios teniendo en cuenta los posibles comentarios que un administrador puede hacer
// en una entrada y hacer la paginacion de los mismos.
function obtenerComentariosPaginados($conn, $id_entrada, $indiceInicio, $comentariosPorPagina) 
{
    $consulta_comentarios_paginacion = "SELECT c.id_comentarios, c.opinion, IFNULL(u.imagenUsuario, a.imagenAdmin) AS imagenUsuario, 
                                        IFNULL(c.nombre_usuario, c.nombre_admin) AS nombre_usuario, c.fechaCreacionComentario, c.valoracionComentario, 
                                        (SELECT COUNT(*) FROM valorComentarios WHERE id_comentario = c.id_comentarios AND valoracion = 1) AS totalMeGusta,
                                        (SELECT valoracion FROM valorComentarios WHERE id_comentario = c.id_comentarios AND id_usuario = ?) AS valoracion_usuario
                                        FROM comentarios c
                                        LEFT JOIN usuarios u ON c.nombre_usuario = u.usuario
                                        LEFT JOIN adminT a ON c.nombre_admin = a.adminNick
                                        WHERE c.id_entradas = ?
                                        ORDER BY c.fechaCreacionComentario DESC
                                        LIMIT ?, ?";
    $stmt = $conn->prepare($consulta_comentarios_paginacion);
    $id_usuario = isset($_SESSION['usuario']) ? $_SESSION['usuario'] : null;
    $stmt->bind_param("siii", $id_usuario, $id_entrada, $indiceInicio, $comentariosPorPagina);
    $stmt->execute();
    $resultado_comentarios_paginacion = $stmt->get_result();
    
    return $resultado_comentarios_paginacion;
}

// Funcion para obtener la media de valoracion de una entrada y mostrarla
function obtenerMediaValoracion($conn, $id_entrada) 
{
    $consulta_media_valoracion = "SELECT AVG(valoracion) AS media_valoracion FROM valorEntradas WHERE id_entrada = $id_entrada";
    $resultado_media_valoracion = $conn->query($consulta_media_valoracion);
    $media_valoracion = $resultado_media_valoracion->fetch_assoc()['media_valoracion'];

    return $media_valoracion;
}

function actualizarValoracionEntrada($conn, $id_entrada, $id_usuario, $valoracion)
{
    //Si la valoración es nula se actualiza a 0 ya que aun no ha sido valorada
    if ($valoracion === null) {
        $valoracion = 0; 
    }

    // Si el usuario es un administrador no se le permitira la valoracion
    $consulta_admin = "SELECT * FROM adminT WHERE adminNick = ?";
    $stmt = $conn->prepare($consulta_admin);
    $stmt->bind_param("s", $id_usuario);
    $stmt->execute();
    $resultado_admin = $stmt->get_result();
    if ($resultado_admin->num_rows > 0) 
    {
        $stmt->close();
        return;
    }

    $stmt->close();

    //Sin embargo, si el usuario ya ha valorado esta entrada
    $consulta_existente = "SELECT id_valoracion FROM valorEntradas WHERE id_entrada = ? AND id_usuario = ?";
    $stmt = $conn->prepare($consulta_existente);
    $stmt->bind_param("is", $id_entrada, $id_usuario);
    $stmt->execute();
    $resultado = $stmt->get_result();

    if ($resultado->num_rows > 0) {
        // Si existe, actualizar la valoración
        $actualizar_valoracion = "UPDATE valorEntradas SET valoracion = ? WHERE id_entrada = ? AND id_usuario = ?";
        $stmt = $conn->prepare($actualizar_valoracion);
        $stmt->bind_param("iis", $valoracion, $id_entrada, $id_usuario);
    } 
    else 
    {
        // Si no existe, insertar una nueva valoración
        $insertar_valoracion = "INSERT INTO valorEntradas (id_entrada, id_usuario, valoracion) VALUES (?, ?, ?)";
        $stmt = $conn->prepare($insertar_valoracion);
        $stmt->bind_param("isi", $id_entrada, $id_usuario, $valoracion);
    }

    $stmt->execute();
    $stmt->close();
}
