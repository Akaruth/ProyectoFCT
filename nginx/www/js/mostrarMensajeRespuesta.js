// codigo para mostrar los mensaje respuesta del admin
$(document).ready(function() {
    $('.ver').on('click', function() {
        let idReporte = $(this).closest('.estiloReportes').data('id');
        
        $.ajax({
            url: './consultas/consultasMensajeria2.php',
            type: 'GET',
            data: { idReporte: idReporte },
            success: function(response) {
                $('.generarRespuestas').html(response);
            }
        });
    });
});
