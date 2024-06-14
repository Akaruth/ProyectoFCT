<?php
// Codigo para obtener las entradas y la paginacion de las consultas de las entradas de usuarios y administradores
include './conexiones/conexionUsuarios.php'; 

$usuario = isset($_SESSION['usuario']) ? $_SESSION['usuario'] : 'Anonimo';

// Comprobar si el usuario está autenticado
$usuario_autenticado = $usuario !== 'Anonimo';

// Comprobar si el usuario está en la base de datos
$usuario_en_base_datos = false;
if ($usuario_autenticado) {
    $consulta_usuario = "SELECT usuario FROM usuarios WHERE usuario = '$usuario'";
    $resultado_usuario = $conn->query($consulta_usuario);
    if ($resultado_usuario->num_rows > 0) {
        $usuario_en_base_datos = true;
    }
}

// Paginación
$entradas_por_pagina = 4;
$pagina_actual = isset($_GET['pagina']) ? (int)$_GET['pagina'] : 1;
$offset = ($pagina_actual - 1) * $entradas_por_pagina;

// Consulta para obtener el número total de entradas
$consulta_total_entradas = "SELECT COUNT(*) as total FROM entradas";
$resultado_total = $conn->query($consulta_total_entradas);
$total_entradas = $resultado_total->fetch_assoc()['total'];
$total_paginas = ceil($total_entradas / $entradas_por_pagina);

// Consulta para obtener las entradas de la página actual (tanto de usuarios como administradores)
$consulta_entradas = "
    SELECT e.id_entradas, e.titulo, e.descripcion, e.fechaCreacionEntrada, 
        COALESCE(u.usuario, a.adminNick) AS nombre_creador,
        COALESCE(u.usuario, 'admin') AS tipo_creador,
        COUNT(c.id_comentarios) AS cantidad_comentarios
    FROM entradas e
    LEFT JOIN usuarios u ON e.nombre_usuario = u.usuario
    LEFT JOIN adminT a ON e.nombre_admin = a.adminNick
    LEFT JOIN comentarios c ON e.id_entradas = c.id_entradas
    GROUP BY e.id_entradas
    ORDER BY e.fechaCreacionEntrada DESC
    LIMIT $entradas_por_pagina OFFSET $offset";


$resultado_entradas = $conn->query($consulta_entradas);

?>
