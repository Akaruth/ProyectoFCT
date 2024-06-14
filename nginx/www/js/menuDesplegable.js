//codigo del menu desplegable principal
'use strict';

// variables class del menu para hacerlo hamburguesa
const mainMenu = document.querySelector('.mainMenu');
const cerrarMenu = document.querySelector('.cerrarMenu');
const abrirMenu = document.querySelector('.abrirMenu');
const iconos = document.querySelectorAll('nav .mainMenu li a');

//  si clickamos en  abrir menu se mostrará 
abrirMenu.addEventListener('click',mostrar);

//  si clickamos en  abrir menu se cerrar
cerrarMenu.addEventListener('click',cerrar);

// si se clicka alguno de los apartados 'nav .mainMenu li a' se cierra el menu
iconos.forEach(item => {
    item.addEventListener('click',function()
    {
        cerrar();
    })
})

// funcion para mostrar
function mostrar()
{
    mainMenu.style.display = 'flex';
    mainMenu.style.top = '0';
    mainMenu.style.height='500px';
     
}

// funcion para cerrar
function cerrar()
{
    mainMenu.style.top = '-1500%';
    mainMenu.style.height='auto';

}