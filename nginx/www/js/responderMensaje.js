// Codigo para generar el formulario de respuesta del admin de x reporte
$(document).ready(function() {
    $('.responder').on('click', function() {
        let idReporte = $(this).closest('.estiloReportes').data('id');

        $.ajax({
            url: './modificaciones/generarFormulario.php',
            type: 'GET',
            data: { idReporte: idReporte },
            success: function(response) {
                $('.generarRespuestas').html(response);
            },
            error: function() {
                console.error('Error al cargar el formulario de respuesta.');
            }
        });
    });
});
