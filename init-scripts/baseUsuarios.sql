USE baseUsuarios;

DROP TABLE IF EXISTS usuarios;

CREATE TABLE usuarios
(
    usuario varchar(30) NOT NULL,
    nickUsuario VARCHAR(50),
    imagenUsuario BLOB,
    fondoPerfil BLOB,
    pokemonFav VARCHAR(50) DEFAULT 'Ninguno',
    regionFav VARCHAR(50) DEFAULT 'Ninguno',
    contrasena varchar(100) NOT NULL,
    PRIMARY KEY(usuario)
);
DROP TABLE IF EXISTS adminT;

CREATE TABLE adminT
(
    adminNick varchar(30) NOT NULL,
    contrasena varchar(100) NOT NULL,
    imagenAdmin BLOB,
    fondoPerfil BLOB,
    PRIMARY KEY(adminNick)
);
DROP TABLE IF EXISTS entradas;


CREATE TABLE entradas 
(
    id_entradas  INT AUTO_INCREMENT NOT NULL,
    titulo varchar(100) NOT NULL,
    imagenEntrada BLOB, 
    descripcion TEXT NOT NULL,
    nombre_usuario varchar(30),
    nombre_admin varchar(30),
    fechaCreacionEntrada DATETIME NOT NULL,
    valoracionEntrada INT NOT NULL DEFAULT 0,
    PRIMARY KEY(id_entradas),
    FOREIGN KEY (nombre_usuario) REFERENCES usuarios(usuario) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (nombre_admin) REFERENCES adminT(adminNick) ON UPDATE CASCADE ON DELETE CASCADE
);


DROP TABLE IF EXISTS comentarios;

CREATE TABLE comentarios
(
    id_comentarios INT AUTO_INCREMENT NOT NULL,
    opinion TEXT NOT NULL,
    nombre_usuario varchar(30),
    nombre_admin varchar(30),
    id_entradas  INT NOT NULL,
    fechaCreacionComentario DATETIME NOT NULL,
    valoracionComentario INT NOT NULL DEFAULT 0,
    PRIMARY KEY(id_comentarios),
    FOREIGN KEY (nombre_usuario) REFERENCES usuarios(usuario) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_entradas) REFERENCES entradas(id_entradas) ON DELETE CASCADE,
    FOREIGN KEY (nombre_admin) REFERENCES adminT(adminNick) ON UPDATE CASCADE ON DELETE CASCADE

);


DROP TABLE IF EXISTS reportes;

CREATE TABLE reportes
(
    idReporte INT AUTO_INCREMENT NOT NULL,
    remitente varchar(30) NOT NULL,
    tipoIncidencia varchar(100) NOT NULL,
    fechaReporte DATETIME NOT NULL,
    mensaje TEXT NOT NULL,
    leido ENUM ('Si','No') DEFAULT 'No',
    PRIMARY KEY(idReporte),
    FOREIGN KEY (remitente) REFERENCES usuarios(usuario) ON UPDATE CASCADE ON DELETE CASCADE

);

DROP TABLE IF EXISTS mensajes;

CREATE TABLE mensajes
(
    idMensaje INT AUTO_INCREMENT NOT NULL,
    idReporte INT NOT NULL,
    remitente varchar(30) NOT NULL,
    destinatario varchar(30) NOT NULL,
    mensaje TEXT NOT NULL,
    fechaEnvio DATETIME NOT NULL,
    leido ENUM ('Si','No') DEFAULT 'No',
    PRIMARY KEY(idMensaje),
    FOREIGN KEY (idReporte) REFERENCES reportes(idReporte) ON DELETE CASCADE,
    FOREIGN KEY (remitente) REFERENCES usuarios(usuario) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (destinatario) REFERENCES adminT(adminNick) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS valorEntradas;

CREATE TABLE valorEntradas
(
    id_valoracion INT AUTO_INCREMENT NOT NULL,
    id_entrada INT NOT NULL,
    id_usuario VARCHAR(30),
    nombre_admin varchar(30),
    valoracion INT NOT NULL DEFAULT 0,
    PRIMARY KEY(id_valoracion),
    UNIQUE (id_entrada, id_usuario),
    FOREIGN KEY (id_entrada) REFERENCES entradas(id_entradas) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(usuario) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (nombre_admin) REFERENCES adminT(adminNick) ON UPDATE CASCADE ON DELETE CASCADE

);

DROP TABLE IF EXISTS valorComentarios;

CREATE TABLE valorComentarios
(
    id_valoracion INT AUTO_INCREMENT NOT NULL,
    id_comentario INT NOT NULL,
    id_usuario VARCHAR(30),
    nombre_admin varchar(30),
    valoracion INT NOT NULL DEFAULT 0,
    PRIMARY KEY(id_valoracion),
    UNIQUE (id_comentario, id_usuario),
    FOREIGN KEY (id_comentario) REFERENCES comentarios(id_comentarios) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(usuario) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (nombre_admin) REFERENCES adminT(adminNick) ON UPDATE CASCADE ON DELETE CASCADE

);

INSERT INTO `adminT`(`adminNick`, `contrasena`, `imagenAdmin`, `fondoPerfil`) VALUES ('administrador','2404d9344053dbd618343a918696ea273c77ac3234a34fe3b050147219c61ea6','./imagen/iconoDefault.png','./imagen/fondo1.jpg')
