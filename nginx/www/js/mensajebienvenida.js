const mensajes = [
    "¡Bienvenido, Admin! Esperamos que tengas un gran día.",
    "Si, hoy es un nuevo día de moderación.. :D",
    "¡Saludos, Admin! Listo para gestionar todo.",
    "Bienvenido de nuevo, Admin. ¡Es un placer verte!",
    "¡Hola, Admin, venga que pronto es viernes!",
    "¡Sigamos moderando la zona!"
];

// Función para obtener un mensaje aleatorio
function obtenerMensajeAleatorio() {
    const indiceAleatorio = Math.floor(Math.random() * mensajes.length);
    return mensajes[indiceAleatorio];
}

// Insertar el mensaje aleatorio en el contenedor correspondiente
document.getElementById("mensajeRotativo").textContent = obtenerMensajeAleatorio();