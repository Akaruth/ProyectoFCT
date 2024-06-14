// Codigo que se encarga de mostrar lso registros de la tabla que haya sido elegida por el admin
$(document).ready(function() 
{
    $('#visualizarUsuarios').click(function(e) 
    {
        e.preventDefault();
        mostrar('usuarios');
    });

    $('#visualizarEntradas').click(function(e) 
    {
        e.preventDefault();
        mostrar('entradas');
    });

    $('#visualizarComentarios').click(function(e) 
    {
        e.preventDefault();
        mostrar('comentarios');
    });

    $('#visualizarReportes').click(function(e) 
    {
        e.preventDefault();
        mostrar('reportes');
    });

    $('#visualizarMensajes').click(function(e) 
    {
        e.preventDefault();
        mostrar('mensajes');
    });

    function mostrar(nombretabla) 
    {
        $.ajax({
            url: './adminpanel/listarTodo.php',
            type: 'POST',
            data: { table: nombretabla },
            success: function(response) 
            {
                $('#tablas').html(response);
            },
            error: function(xhr, status, error) 
            {
                console.error('AJAX Error: ', status, error);
            }
        });
    }
});

