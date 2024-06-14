"use strict"

const FILAS = 16;
const COLUMNAS = 16;
let posicionX = 8;
let posicionY = 7;
let mapaActual = 1;

//Puntos del mapa donde se debe cambiar de mapa
let cambioMapaPos1 = {x: 12, y: 0}; 
let cambioMapaPos2 = {x: 13, y: 0}; 
let cambioMapaPos3 = {x: 0, y: 5};
let cambioMapaPos4 = {x: 12, y: 0};
let cambioMapaPos5 = {x: 0, y: 7};  
let cambioMapaPos6 = {x: 7, y: 0};
let cambioMapaPos7 = {x: 0, y: 4};
let cambioMapaPos8 = {x: 0, y: 13};
let cambioMapaPos9 = {x: 0, y: 12};

let volverMapa1 = {x: 13, y: 15}; 
let volverMapa2 = {x: 10, y: 15}; 
let volverMapa3 = {x: 5, y: 11}; 
let volverMapa4 = {x: 8, y: 15}; 
let volverMapa5 = {x: 15, y: 7}; 
let volverMapa6 = {x: 10, y: 15}; 
let volverMapa7 = {x: 15, y: 4}; 
let volverMapa8 = {x: 15, y: 12}; 
let volverMapa9 = {x: 15, y: 12}; 

// Generemos nuestro mapa 

let tablero = document.getElementById('tablero');
for (let i = 0; i < FILAS; i++) 
{
    let fila = document.createElement('tr');
    for (let j = 0; j < COLUMNAS; j++) 
    {
        let celda = document.createElement('td');
        fila.appendChild(celda);
    }
    tablero.appendChild(fila);
}



function colocarFlecha(x, y, imagenSrc, mapaAsociado) 
{
    if (mapaAsociado === mapaActual) {
        let celda = document.getElementById('tablero').rows[y].cells[x];
        let imagen = document.createElement('img');
        imagen.src = imagenSrc;
        imagen.classList.add('flecha'); 
        celda.appendChild(imagen);
    }
}

// Llamadas para colocar fotos en las posiciones deseadas solo si corresponden al mapa actual
colocarFlecha(cambioMapaPos1.x, cambioMapaPos1.y, './imagen/ida.png', 1);

function borrarFlechas() 
{
    let tablero = document.getElementById('tablero');
    let flechas = tablero.querySelectorAll('.flecha');
    flechas.forEach(flecha => flecha.remove());
}

function limpiarCeldas() {
    let celdas = document.querySelectorAll('[data-pokemon-id]');
    celdas.forEach(celda => {
        celda.removeAttribute('data-pokemon-id');
        celda.innerHTML = '';
    });
}

// Colocar personaje
let personaje = document.createElement('img');
personaje.id = 'personaje';
personaje.src = './imagen/quienes.png';

document.getElementById('tablero').addEventListener('click', function()  
{
    const modal = document.getElementById('modalPersonaje');
    modal.style.display = 'block'; 
  
    const personaje1Btn = document.getElementById('personaje1-btn');
    const personaje2Btn = document.getElementById('personaje2-btn');
  
    // Elegir personaje al clickar 
    personaje1Btn.addEventListener('click', function() 
    {
      document.getElementById('personaje').src = './imagen/personaje1.png';
      modal.style.display = 'none'; 
    });
  
    personaje2Btn.addEventListener('click', function() 
    {
      
      document.getElementById('personaje').src = './imagen/personaje2.png';
      modal.style.display = 'none'; 
    });
  });
  
asignarPokemonAleatorio();
actualizarPosicion();

// cambiar la posición del personaje
async function actualizarPosicion() 
{
    let celdaActual = document.getElementById('tablero').rows[posicionY].cells[posicionX];

    let personajeActual = celdaActual.querySelector('#personaje');

    if (personajeActual) 
    {
        celdaActual.removeChild(personajeActual); 
    }

    document.getElementById('tablero').rows[posicionY].cells[posicionX].appendChild(personaje);

   
    //cambiar de mapa
   // y verificar si la posición actual coincide con una posición de cambio de mapa y cambiar el mapa correspondiente
switch (mapaActual) 
{
    case 1:
        if (posicionX === cambioMapaPos1.x && posicionY === cambioMapaPos1.y) 
        {
            cambiarMapa(2);
        }
        break;
    case 2:
        if (posicionX === cambioMapaPos2.x && posicionY === cambioMapaPos2.y) 
        {
            cambiarMapa(3);
        }
        break;
    case 3:
        if (posicionX === cambioMapaPos3.x && posicionY === cambioMapaPos3.y) 
        {
            cambiarMapa(4);
        }
        break;
    case 4:
        if (posicionX === cambioMapaPos4.x && posicionY === cambioMapaPos4.y) 
        {
            cambiarMapa(5);
        }
        break;
    case 5:
        if (posicionX === cambioMapaPos5.x && posicionY === cambioMapaPos5.y) 
        {
            cambiarMapa(6);
        }
        break;
    case 6:
        if (posicionX === cambioMapaPos6.x && posicionY === cambioMapaPos6.y) 
        {
            cambiarMapa(7);
        }
        break;
    case 7:
        if (posicionX === cambioMapaPos7.x && posicionY === cambioMapaPos7.y) 
        {
            cambiarMapa(8);
        }
        break;
    case 8:
        if (posicionX === cambioMapaPos8.x && posicionY === cambioMapaPos8.y) 
        {
            cambiarMapa(9);
        }
        break;
    case 9:
        if (posicionX === cambioMapaPos9.x && posicionY === cambioMapaPos9.y) 
            {
            cambiarMapa(10);
        }
        break;
}

    
    
    
switch (mapaActual) 
{
    case 2:
        if (posicionX === volverMapa1.x && posicionY === volverMapa1.y) 
        {
            volverAnterior(1);
        }
        break;
    case 3:
        if (posicionX === volverMapa2.x && posicionY === volverMapa2.y) 
        {
            volverAnterior(2);
        }
        break;
    case 4:
        if (posicionX === volverMapa3.x && posicionY === volverMapa3.y) 
        {
            volverAnterior(3);
        }
        break;
    case 5:
        if (posicionX === volverMapa4.x && posicionY === volverMapa4.y) 
        {
            volverAnterior(4);
        }
        break;
    case 6:
        if (posicionX === volverMapa5.x && posicionY === volverMapa5.y) 
        {
            volverAnterior(5);
        }
        break;
    case 7:
        if (posicionX === volverMapa6.x && posicionY === volverMapa6.y) 
        {
            volverAnterior(6);
        }
        break;
    case 8:
        if (posicionX === volverMapa7.x && posicionY === volverMapa7.y) 
        {
            volverAnterior(7);
        }
        break;
    case 9:
        if (posicionX === volverMapa8.x && posicionY === volverMapa8.y) 
        {
            volverAnterior(8);
        }
        break;
    case 10:
        if (posicionX === volverMapa9.x && posicionY === volverMapa9.y) 
        {
            volverAnterior(9);
        }
        break;
}


   
}

// funcion para cambiar al mapa anterior, asignando los pokemons de cada mapa
function volverAnterior(mapa) 
{
    limpiarCeldas();
    borrarFlechas();

    if ( mapa === 1)
    {
        tablero.style.backgroundImage = "url('./imagen/ciudadinicio.png')";
        tablero.style.backgroundSize = "cover";
        tablero.style.backgroundPosition = "center";
        mapaActual = 1;
        posicionX = 12;
        posicionY = 1;
        colocarFlecha(cambioMapaPos1.x, cambioMapaPos1.y, '/imagen/ida.png', 1);

        asignarPokemonAleatorio();
        actualizarPosicion();

    }
    else if (mapa === 2) 
    {
        tablero.style.backgroundImage = "url('./imagen/ruta1.jpg')";
        tablero.style.backgroundSize = "cover";
        tablero.style.backgroundPosition = "center";
        mapaActual = 2;
        posicionX = 13;
        posicionY = 1;
        colocarFlecha(cambioMapaPos2.x, cambioMapaPos2.y, '/imagen/ida.png', 2);
        colocarFlecha(volverMapa1.x, volverMapa1.y, '/imagen/vuelta.png', 2);
        asignarPokemonAleatorio();

        actualizarPosicion();
    } 
    else if (mapa === 3) 
    {
        tablero.style.backgroundImage = "url('/imagen/ciudad1.png')";
        tablero.style.backgroundSize = "cover";
        tablero.style.backgroundPosition = "center";
        mapaActual = 3;
        posicionX = 1;
        posicionY = 5;
        colocarFlecha(cambioMapaPos3.x, cambioMapaPos3.y, '/imagen/ida.png', 3);
        colocarFlecha(volverMapa2.x, volverMapa2.y, '/imagen/vuelta.png', 3);
        asignarPokemonAleatorio();

        actualizarPosicion();
    }
    else if (mapa === 4) 
    {
        tablero.style.backgroundImage = "url('/imagen/ruta2.png')";
        tablero.style.backgroundSize = "cover";
        tablero.style.backgroundPosition = "center";
        mapaActual = 4;
        posicionX = 12;
        posicionY = 1;
        colocarFlecha(cambioMapaPos4.x, cambioMapaPos4.y, '/imagen/ida.png', 4);
        colocarFlecha(volverMapa3.x, volverMapa3.y, '/imagen/vuelta.png', 4);
        asignarPokemonAleatorio();
        actualizarPosicion();
    } 
    else if (mapa === 5) 
    {
        tablero.style.backgroundImage = "url('./imagen/ciudad2-1.jpg')";
        tablero.style.backgroundSize = "cover";
        tablero.style.backgroundPosition = "center";
        mapaActual = 5;
        posicionX = 1;
        posicionY = 7;
        colocarFlecha(cambioMapaPos5.x, cambioMapaPos5.y, './imagen/ida.png', 5);
        colocarFlecha(volverMapa4.x, volverMapa4.y, './imagen/vuelta.png', 5);
        asignarPokemonAleatorio();

        actualizarPosicion();
    }
    else if (mapa === 6) 
    {
        
        tablero.style.backgroundImage = "url('./imagen/ciudad2-2.jpg')";
        tablero.style.backgroundSize = "cover";
        tablero.style.backgroundPosition = "center";
        mapaActual = 6;
        posicionX = 7;
        posicionY = 1;
        colocarFlecha(cambioMapaPos6.x, cambioMapaPos6.y, './imagen/ida.png', 6);
        colocarFlecha(volverMapa5.x, volverMapa5.y, './imagen/vuelta.png', 6);
        asignarPokemonAleatorio();

        actualizarPosicion();
    }
    else if (mapa === 7) 
    {
        tablero.style.backgroundImage = "url('./imagen/ruta3-1.jpg')";
        tablero.style.backgroundSize = "cover";
        tablero.style.backgroundPosition = "center";
        mapaActual = 7;
        posicionX = 1;
        posicionY = 4;
        colocarFlecha(cambioMapaPos7.x, cambioMapaPos7.y, './imagen/ida.png', 7);
        colocarFlecha(volverMapa6.x, volverMapa6.y, './imagen/vuelta.png', 7);
        asignarPokemonAleatorio();

        actualizarPosicion();
    }
    else if (mapa === 8) 
    {
        tablero.style.backgroundImage = "url('./imagen/ruta3-2.jpg')";
        tablero.style.backgroundSize = "cover";
        tablero.style.backgroundPosition = "center";
        mapaActual = 8;
        posicionX = 1;
        posicionY = 13;
        colocarFlecha(cambioMapaPos8.x, cambioMapaPos8.y, './imagen/ida.png', 8);
        colocarFlecha(volverMapa7.x, volverMapa7.y, './imagen/vuelta.png', 8);
        asignarPokemonAleatorio();
        
        actualizarPosicion();
    }
    else if (mapa === 9) 
    {
        tablero.style.backgroundImage = "url('./imagen/ciudad3-1.jpg')";
        tablero.style.backgroundSize = "cover";
        tablero.style.backgroundPosition = "center";
        mapaActual = 9;
        posicionX = 1;
        posicionY = 12;
        colocarFlecha(cambioMapaPos9.x, cambioMapaPos9.y, './imagen/ida.png', 9);
        colocarFlecha(volverMapa8.x, volverMapa8.y, './imagen/vuelta.png', 9);
        asignarPokemonAleatorio();

        actualizarPosicion();
    }
    else if (mapa === 10) 
    {
        tablero.style.backgroundImage = "url('./imagen/ciudad3-2.jpg')";
        tablero.style.backgroundSize = "cover";
        tablero.style.backgroundPosition = "center";
        mapaActual = 10;
        posicionX = 14;
        posicionY = 12;
        colocarFlecha(volverMapa9.x, volverMapa9.y, './imagen/vuelta.png', 10);
        asignarPokemonAleatorio();

        actualizarPosicion();
    }
    
}


// cambiar el fondo del tablero y registrar el cambio de mapa y asignando los pokemons
function cambiarMapa(mapa) 
{
    limpiarCeldas();
    
    borrarFlechas();

    if ( mapa === 1)
    {
        tablero.style.backgroundImage = "url('./imagen/ciudadinicio.png')";
        tablero.style.backgroundSize = "cover";
        tablero.style.backgroundPosition = "center";
        mapaActual = 1;
        posicionX = 12;
        posicionY = 1;
        colocarFlecha(cambioMapaPos1.x, cambioMapaPos1.y, './imagen/ida.png', 1);

        asignarPokemonAleatorio();
        actualizarPosicion();

    }
    else if (mapa === 2) 
    {
        tablero.style.backgroundImage = "url('./imagen/ruta1.jpg')";
        tablero.style.backgroundSize = "cover";
        tablero.style.backgroundPosition = "center";
        mapaActual = 2;
        posicionX = 13;
        posicionY = 14;
        colocarFlecha(cambioMapaPos2.x, cambioMapaPos2.y, './imagen/ida.png', 2);
        colocarFlecha(volverMapa1.x, volverMapa1.y, './imagen/vuelta.png', 2);


        asignarPokemonAleatorio();


        actualizarPosicion();
    } 
    else if (mapa === 3) 
    {
        tablero.style.backgroundImage = "url('./imagen/ciudad1.png')";
        tablero.style.backgroundSize = "cover";
        tablero.style.backgroundPosition = "center";
        mapaActual = 3;
        posicionX = 10;
        posicionY = 14;
        colocarFlecha(cambioMapaPos3.x, cambioMapaPos3.y, './imagen/ida.png', 3);
        colocarFlecha(volverMapa2.x, volverMapa2.y, './imagen/vuelta.png', 3);
        asignarPokemonAleatorio();

        
        actualizarPosicion();
    }
    else if (mapa === 4) 
    {
        tablero.style.backgroundImage = "url('./imagen/ruta2.png')";
        tablero.style.backgroundSize = "cover";
        tablero.style.backgroundPosition = "center";
        mapaActual = 4;
        posicionX = 4;
        posicionY = 11;
        colocarFlecha(cambioMapaPos4.x, cambioMapaPos4.y, './imagen/ida.png', 4);
        colocarFlecha(volverMapa3.x, volverMapa3.y, './imagen/vuelta.png', 4);

        asignarPokemonAleatorio();


        actualizarPosicion();
    } 
    else if (mapa === 5) 
    {
        tablero.style.backgroundImage = "url('./imagen/ciudad2-1.jpg')";
        tablero.style.backgroundSize = "cover";
        tablero.style.backgroundPosition = "center";
        mapaActual = 5;
        posicionX = 8;
        posicionY = 14;
        colocarFlecha(cambioMapaPos5.x, cambioMapaPos5.y, './imagen/ida.png', 5);
        colocarFlecha(volverMapa4.x, volverMapa4.y, './imagen/vuelta.png', 5);
        asignarPokemonAleatorio();


        actualizarPosicion();
    }
    else if (mapa === 6) 
    {
        tablero.style.backgroundImage = "url('./imagen/ciudad2-2.jpg')";
        tablero.style.backgroundSize = "cover";
        tablero.style.backgroundPosition = "center";
        mapaActual = 6;
        posicionX = 14;
        posicionY = 7;
        colocarFlecha(cambioMapaPos6.x, cambioMapaPos6.y, './imagen/ida.png', 6);
        colocarFlecha(volverMapa5.x, volverMapa5.y, './imagen/vuelta.png', 6);

        asignarPokemonAleatorio();


        actualizarPosicion();
    }
    else if (mapa === 7) 
    {
        tablero.style.backgroundImage = "url('./imagen/ruta3-1.jpg')";
        tablero.style.backgroundSize = "cover";
        tablero.style.backgroundPosition = "center";
        mapaActual = 7;
        posicionX = 10;
        posicionY = 14;
        colocarFlecha(cambioMapaPos7.x, cambioMapaPos7.y, './imagen/ida.png', 7);
        colocarFlecha(volverMapa6.x, volverMapa6.y, './imagen/vuelta.png', 7);

        asignarPokemonAleatorio();


        actualizarPosicion();
    }
    else if (mapa === 8) 
    {
        tablero.style.backgroundImage = "url('./imagen/ruta3-2.jpg')";
        tablero.style.backgroundSize = "cover";
        tablero.style.backgroundPosition = "center";
        mapaActual = 8;
        posicionX = 14;
        posicionY = 4;
        colocarFlecha(cambioMapaPos8.x, cambioMapaPos8.y, './imagen/ida.png', 8);
        colocarFlecha(volverMapa7.x, volverMapa7.y, './imagen/vuelta.png', 8);

        asignarPokemonAleatorio();

        actualizarPosicion();
    }
    else if (mapa === 9) 
    {
        tablero.style.backgroundImage = "url('./imagen/ciudad3-1.jpg')";
        tablero.style.backgroundSize = "cover";
        tablero.style.backgroundPosition = "center";
        mapaActual = 9;
        posicionX = 14;
        posicionY = 12;
        colocarFlecha(cambioMapaPos9.x, cambioMapaPos9.y, './imagen/ida.png', 9);
        colocarFlecha(volverMapa8.x, volverMapa8.y, './imagen/vuelta.png', 9);
        asignarPokemonAleatorio();


        actualizarPosicion();
    }
    else if (mapa === 10) 
    {
        tablero.style.backgroundImage = "url('./imagen/ciudad3-2.jpg')";
        tablero.style.backgroundSize = "cover";
        tablero.style.backgroundPosition = "center";
        mapaActual = 10;
        posicionX = 14;
        posicionY = 12;

        colocarFlecha(volverMapa9.x, volverMapa9.y, './imagen/vuelta.png', 10);
        asignarPokemonAleatorio();

        actualizarPosicion();

    }
    
}

// peticion de ajax para obtener los pokemons del maapa actual
function obtenerPokemonPorRuta(mapaActual) 
{
    return $.ajax({
        type: 'POST',
        url: './consultaJuego/pokemonRuta.php',
        data: { mapaActual: mapaActual }, 
        dataType: 'json'
    });
}

// asignar Pokémon aleatorios al mapa actual
async function asignarPokemonAleatorio() 
{
    let tabla = document.getElementById('tablero');
    
        try 
        {
            const pokemonPrimeraRuta = await obtenerPokemonPorRuta(mapaActual);
            let numPokemon = pokemonPrimeraRuta.length;
            for (let i = 0; i < numPokemon; i++) 
            {
                let posX = Math.floor(Math.random() * COLUMNAS);
                let posY = Math.floor(Math.random() * FILAS);
                let pokemonID = pokemonPrimeraRuta[i];
                // asgina la id del pokemon en la celda aleatoria
                tabla.rows[posY].cells[posX].setAttribute('data-pokemon-id', pokemonID);

                // añade la miniatura del pokemon
                let imgPokemon = document.createElement('img');
                imgPokemon.src = `./imagen/${pokemonID}.png`; 
                imgPokemon.width = 40;
                imgPokemon.height = 40;

                tabla.rows[posY].cells[posX].appendChild(imgPokemon);
            }
        } 
        catch (error) 
        {
            console.error('Error al asignar Pokémon aleatorio:', error);
        }
    
}

function pokemonInfo(pokemonID) 
{
    return $.ajax({
        type: 'POST',
        url: './consultaJuego/pokemonInfo.php',
        data: { pokemonID: pokemonID },
        dataType: 'json'
    });
}

let pokemonCapturados = [];


function mostrarVentanaModal(pokemonID) 
{
    pokemonInfo(pokemonID)
        .then(pokemonInfo => 
            {

                const modalContent = `

                <div  class="envoltorioModal">
                <div class="letraMediana">${pokemonInfo.nombrePokemon}</div>
                <img class="imagenModal" src="./imagen/${pokemonInfo.numeroPokedex}-grande.png" alt="${pokemonInfo.nombrePokemon}">

                    <div class="fondoTextoModal">
                        <div class=""> <span  class="negrita">Tipo: </span> ${pokemonInfo.tipo}</div>
                        <div class=" negrita" >Descripción:</div> 
                        <div class="">${pokemonInfo.descripcion}</div>
                            <div class="juntos ">
                                <div class=""><span  class="negrita">Altura: </span>  ${pokemonInfo.altura}  m</div>
                                <div class=""><span  class="negrita">Peso:  </span> ${pokemonInfo.peso} kg</div>
                            </div>
                            <div class="envoltorioBotonCapturar">
                                <button class="no-decoration capturar-btn"><img class="imagenCapturar" src="./imagen/pokeball.png" alt="${pokemonInfo.nombrePokemon}"></button>
                            </div>
                    </div>
                </div>    
            `;

            const modal = document.getElementById('miModal');

            const modalContentElement = document.getElementById('modal-content');

            modalContentElement.innerHTML = modalContent;

            modal.style.display = 'block';
            
            document.body.style.overflow = 'hidden';

            window.addEventListener('click', function(event) 
            {
                if (event.target == modal) 
                {
                    modal.style.display = 'none';
                    document.body.style.overflow = 'auto';
                }
            });

            const modalMensaje = document.getElementById('modalMensaje');

            const capturarBtn = document.querySelector('.capturar-btn');
            capturarBtn.addEventListener('click', function () 
            {
                const probabilidadCaptura = Math.random();


                const modalContentMensaje = document.getElementById('modal-content-mensaje');

                if (probabilidadCaptura <= 0.5) 
                {
                    pokemonCapturados.push(pokemonInfo);

                    const celdaActual = document.getElementById('tablero').rows[posicionY].cells[posicionX];
                    celdaActual.removeAttribute('data-pokemon-id');
                    celdaActual.innerHTML = '';
                    const mensaje = '¡Pokémon capturado!';
                    actualizarPosicion();
                    modalContentMensaje.innerHTML = mensaje;
                    modalMensaje.style.display = 'block';
                    setTimeout(function() {
                        modalMensaje.style.display = 'none';
                    }, 1000);

                } 
                else 
                {
                    const mensaje = '¡El Pokémon escapó!';
                    modalContentMensaje.innerHTML = mensaje;
                    modalMensaje.style.display = 'block';
                    setTimeout(function() {
                        modalMensaje.style.display = 'none';
                    }, 1000);
                }
                modal.style.display = 'none';
                
            });
        });
}


function cerrarModal() {
    const modal = document.getElementById('miModal');
    modal.style.display = 'none';
    document.body.style.overflow = 'auto'; 
}

function mostrarModalPokemonCapturados() {
    const modalPokemonCapturados = document.getElementById('modalPokemonCapturados');
    const modalContentPokemonCapturados = document.getElementById('modal-content-pokemon-capturados');
    modalContentPokemonCapturados.innerHTML = ''; 

    const cantidadCapturados = pokemonCapturados.length;

    if (cantidadCapturados === 0) 
    {
        const titulo = document.createElement('h3');
        titulo.textContent = `Pokemon capturados`;
        modalContentPokemonCapturados.appendChild(titulo);

        
        const mensaje = document.createElement('p');
        mensaje.textContent = 'Aún no has capturado a ninguno';
        modalContentPokemonCapturados.appendChild(mensaje);
    } 
    else
    {

        const titulo = document.createElement('h3');
        titulo.textContent = `Pokemon capturados`;
        modalContentPokemonCapturados.appendChild(titulo);

        const mensajeCantidad = document.createElement('div');
        mensajeCantidad.textContent = `Has capturado: ${cantidadCapturados}`;
        mensajeCantidad.style.width= "100%";
        modalContentPokemonCapturados.appendChild(mensajeCantidad);

        // mostrar la lista de Pokémon capturados
        pokemonCapturados.forEach(pokemon => {
            const pokemonCapturadoDiv = document.createElement('div');
            pokemonCapturadoDiv.innerHTML = `
                <div  class="envoltorioModalCapturados">
                    <div class="letra">${pokemon.nombrePokemon}</div>
                    <img class="capturadosModal" src="./imagen/${pokemon.numeroPokedex}.png" alt="${pokemon.nombrePokemon}">
                </div>
            `;
            modalContentPokemonCapturados.appendChild(pokemonCapturadoDiv);
        });
    }

    if (modalPokemonCapturados.style.display === 'block') 
    {
        modalPokemonCapturados.style.display = 'none';
        document.body.style.overflow = 'auto';

    } 
    else 
    {
        modalPokemonCapturados.style.display = 'block';
        document.body.style.overflow = 'hidden';

    }
}

// evento para mostrar o cerrar el modal de Pokémon capturados cuando se presiona la tecla "X"
document.addEventListener('keydown', function (event) 
{
    const modal = document.getElementById('modalPokemonCapturados');

    if (modal.style.display === 'block') {
        modal.style.display = 'none';
        document.body.style.overflow = 'auto';

    } 
    else if(event.key === 'x') {
        mostrarModalPokemonCapturados();
    }
});

// evento para cerrar el modal de Pokémon capturados cuando se hace clic fuera de él (cambio hecho revisar)
const modalPokemonCapturados = document.getElementById('modalPokemonCapturados');
window.addEventListener('click', function (event) {
    if (event.target == modalPokemonCapturados || event.key === 'x') 
    {
        modalPokemonCapturados.style.display = 'none';
    }
});



//Movimiento del personaje
document.addEventListener('keydown', function(event) 
{
    const modal = document.getElementById('miModal');

    if (modal.style.display === 'block') {
        modal.style.display = 'none';
        cerrarModal();
    } 
    else 
    {
        event.preventDefault();
        const teclaPresionada = event.key.toLowerCase(); 

        switch(teclaPresionada) 
        {
            case 'arrowleft': // Izquierda
            case 'a':
                if (posicionX > 0) 
                {
                    posicionX--;
                    actualizarPosicion();
                    compruebaCelda();
                }
                break;
            case 'arrowup': // Arriba
            case 'w':
                if (posicionY > 0) 
                {
                    posicionY--;
                    actualizarPosicion();
                    compruebaCelda();
                }
                break;
            case 'arrowright': // Derecha
            case 'd':
                if (posicionX < COLUMNAS - 1) 
                {
                    posicionX++;
                    actualizarPosicion();
                    compruebaCelda();
                }
                break;
            case 'arrowdown': // Abajo
            case 's':
                if (posicionY < FILAS - 1) 
                {
                    posicionY++;
                    actualizarPosicion();
                    compruebaCelda();
                }
                break;
        }
    }

    
});


// comprueba si hay un pokemon en una celda
function compruebaCelda() 
{
    let celdaActual = document.getElementById('tablero').rows[posicionY].cells[posicionX];
    let pokemonID = celdaActual.getAttribute('data-pokemon-id');
    if (pokemonID) 
    {
        mostrarVentanaModal(pokemonID);
    }
}