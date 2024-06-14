// codigo para desplegar y plegar los apartados del panel admin
document.getElementById('botonDesplegable').addEventListener('click', function() {
    let apartados = document.getElementById('apartados');
    if (apartados.classList.contains('mostrar')) {
        apartados.classList.remove('mostrar');
    } else {
        apartados.classList.add('mostrar');
    }
});