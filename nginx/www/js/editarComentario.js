//  codigo para desplegar comentarios y entradas editables
"use strict";

document.addEventListener('DOMContentLoaded', function() 
{
    let editarBtns = document.querySelectorAll('.editarBtn');
    editarBtns.forEach(function(btn) 
    {
        btn.addEventListener('click', function() 
        {
            let id = btn.id.replace('editarBtn', '');
            let form = document.getElementById("formEditar" + id);
            if (form.classList.contains('visually-hidden')) 
            {
                form.classList.remove('visually-hidden');
            } 
            else 
            {
                form.classList.add('visually-hidden');
            }
        });
    });
});
