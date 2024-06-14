<?php
// Codigo para obtener informacion de los reportes 
// Codigo que comprueba si eres o no administrador y segun el resultado , te muestra el apartado de reporte con un patron de iconos de color
// diferente, al de usuario , para simular la llegada de mensajes , los pendientes y los leidos
include '../conexiones/conexionUsuarios.php';
$usuario = isset($_SESSION['usuario']) ? $_SESSION['usuario'] : 'Anonimo';

$esAdmin = false;
if ($usuario !== 'Anonimo') 
{
    $query = "SELECT * FROM adminT WHERE adminNick = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("s", $usuario);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $esAdmin = true;

    }
}
if (isset($_GET['idReporte'])) {
    $idReporte = $_GET['idReporte'];
    $respuestas = obtenerRespuestasPorReporte($idReporte);
    
    if (!empty($respuestas)): ?>
        <div>
            <?php foreach ($respuestas as $respuesta): ?>
                
                <h2>Respuestas de reportes</h2>

                <p class='estiloRespuestas'>
                    
                    <strong>Admin</strong><br>
                    <strong>Fecha de Envío:</strong> <?php echo htmlspecialchars($respuesta['fechaEnvio']); ?><br>
                    <strong>Tipo de Incidencia:</strong> <?php echo htmlspecialchars($respuesta['tipoIncidencia']); ?><br>
                    <strong>Respuesta:</strong> <?php echo htmlspecialchars($respuesta['mensaje']); ?><br>
                
                    <?php if ($esAdmin == false): ?>

                        <?php if ($respuesta['leido'] !== 'Si'): ?>
                            <span class="d-flex justify-content-end mt-2"><a class="marcar-leido text-decoration-none text-danger" href="./modificaciones/marcarcomoleido.php?idMensaje=<?php echo $respuesta['idMensaje']; ?>"><b class="bg-white p-1 rounded-1">Marcar como leído <i class="bi bi-check-all "></i></b></a></span>
                            </p>
                        <?php else: ?>
                            <span class="d-flex justify-content-end mt-2 "> <b class="bg-white p-1 rounded-1 text-success">Leido <i class="bi bi-check-all text-info"></i></b> </span>
                            </p>
                        <?php endif; ?>
                    <?php else: ?>
                        <?php if ($respuesta['leido'] == 'Si'): ?>
                            <span class="d-flex justify-content-end mt-2"><a class="marcar-leido text-decoration-none text-danger" href="./modificaciones/marcarcomoleido.php?idMensaje=<?php echo $respuesta['idMensaje']; ?>"><b class="bg-white p-1 rounded-1">Marcar como leído <i class="bi bi-check-all "></i></b></a></span>
                            </p>
                        <?php else: ?>
                            <span class="d-flex justify-content-end mt-2 "> <b class="bg-white p-1 rounded-1 text-success">Leido <i class="bi bi-check-all text-info"></i></b> </span>
                            </p>
                        <?php endif; ?>

                    <?php endif; ?>

            <?php endforeach; ?>
        </div>
    <?php else: ?>
        <h4>Aún no hay respuesta <i class="bi bi-emoji-frown"></i> .</h4>
    <?php endif;
}

// Funcion que devuelve la respuesta de un reporte en especifico para mostarlo al usuario, cuando quiera visualizarlo
function obtenerRespuestasPorReporte($idReporte) 
{
    global $conn;
    $query = "SELECT m.idMensaje, m.mensaje, m.fechaEnvio, r.tipoIncidencia , m.leido 
              FROM mensajes m 
              JOIN reportes r ON m.idReporte = r.idReporte 
              WHERE r.idReporte = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("i", $idReporte);
    $stmt->execute();
    $result = $stmt->get_result();

    $respuestas = [];
    while ($row = $result->fetch_assoc()) {
        $respuestas[] = $row;
    }

    $stmt->close();
    return $respuestas;
}
?>
