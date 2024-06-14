document.addEventListener("DOMContentLoaded", function() 
{
    // realizamos la solicitud a la API de "el tiempo" que es publica
    fetch('https://www.el-tiempo.net/api/json/v2/provincias/18/municipios/18023')
    .then(response => response.json())
    .then(data => {
        mostrarDatos(data);
    })
    .catch(error => console.error('Error al obtener los datos:', error));
  
});

// codigo para mostrar los datos en la página
function mostrarDatos(data) 
{
    let tiempoBaza = document.getElementById('tiempoBaza');
    let html = "<h2>Tiempo en Baza</h2>";
    html += "<p>Temperatura: " + data.temperatura_actual + "°C</p>";
    html += "<div class='juntosTiempo'> <p>Max: " + data.temperaturas.max + "°C</p><p class='ms-2'> Min: " + data.temperaturas.min + "°C</p> </div>";
    html += "<p>Estado del cielo: " + data.stateSky.description + "</p>";
    
    tiempoBaza.innerHTML = html;
}
