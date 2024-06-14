<?php
session_start();
// Codigo que genera el formulario de mensaje respuesta de un administrador para un reporte en especifico
include '../conexiones/conexionUsuarios.php';

// Si el usuario no está autenticado, redirigirlo a la página de inicio de sesión
if (!isset($_SESSION['usuario'])) 
{
    header("Location: ../login.php");
    exit();
}

$usuarioAdmin = $_SESSION['usuario'];
$idReporte = $_GET['idReporte'];
?>
<!-- Cuando se envia la respuesta se llama al archivo que manejara la insercion del mensaje -->
<form id="formulario-respuesta-<?php echo htmlspecialchars($idReporte); ?>" class="formulario" action="./consultas/responderMensaje.php" method="POST">
    <input type="hidden" name="idReporte" value="<?php echo htmlspecialchars($idReporte); ?>">
    <input type="hidden" name="destinatario" value="<?php echo htmlspecialchars($usuarioAdmin); ?>">
    <h4>Reporte  <?php echo htmlspecialchars($idReporte); ?>:</h4>
    <div class="form-group">
        <textarea class="form-control" id="mensajeRespuesta" name="mensajeRespuesta" rows="4" placeholder="Escribir.."></textarea>
    </div>
    <button type="submit" class="boton mt-2">Enviar Respuesta</button>
</form>
