-- DROP DATABASE IF EXISTS pokemondb;
-- CREATE DATABASE IF NOT EXISTS pokemondb;

use pokemondb;

/*Borrado de tablas*/

drop table if exists pokemon_tipo;
drop table if exists tipo;
drop table if exists pokemon;
drop table if exists pokemonRuta;


Create table if not exists pokemon  
(
	numeroPokedex int primary key AUTO_INCREMENT,
    nombrePokemon varchar(15) not null,
    peso real not null,
    altura real not null,
    descripcion TEXT not null,
    etimologia TEXT not null,
    biologia TEXT not null,
    evoluciones TEXT not null,
    fotoEvo BLOB
);


Create table if not exists tipo 
(
	idTipo int primary key AUTO_INCREMENT, 
    nombre varchar(10) not null
);
 
Create table if not exists pokemon_tipo  
(
	numeroPokedex int not null,
    idTipo int not null,
    primary key(numeroPokedex, idTipo),
    foreign key (numeroPokedex) references pokemon(numeroPokedex),
    foreign key (idTipo) references tipo(idTipo)
);

Create table if not exists  region 
(
    idRegion INT PRIMARY KEY AUTO_INCREMENT,
    nombreRegion VARCHAR(50) NOT NULL
);

Create table if not exists ruta  
(
	idRuta int primary key AUTO_INCREMENT,
    nombreRuta VARCHAR(50) NOT NULL,
    idRegion INT NOT NULL,
    FOREIGN KEY (idRegion) REFERENCES region(idRegion)
);



Create table if not exists pokemonRuta  
(
    idRuta INT NOT NULL,
    numeroPokedex INT NOT NULL,
    FOREIGN KEY (idRuta) REFERENCES ruta(idRuta),
    FOREIGN KEY (numeroPokedex) REFERENCES pokemon(numeroPokedex),
    PRIMARY KEY (idRuta, numeroPokedex)
);



insert into tipo values (1, 'Acero');
insert into tipo values (2, 'Agua');
insert into tipo values (3, 'Bicho');
insert into tipo values (4, 'Dragón');
insert into tipo values (5, 'Eléctrico');
insert into tipo values (6, 'Fantasma');
insert into tipo values (7, 'Fuego');
insert into tipo values (8, 'Hielo');
insert into tipo values (9, 'Lucha');
insert into tipo values (10, 'Normal');
insert into tipo values (11, 'Planta');
insert into tipo values (12, 'Psíquico');
insert into tipo values (13, 'Roca');
insert into tipo values (14, 'Siniestro');
insert into tipo values (15, 'Tierra');
insert into tipo values (16, 'Veneno');
insert into tipo values (17, 'Volador');



insert into pokemon values (1, 'Snivy', 8.1,0.6,"Cuando genera energía exponiendo la hoja de la cola a la luz solar, su agilidad aumenta y sus movimientos se vuelven más precisos."
,"Su nombre proviene de las palabras inglesas snake (serpiente) y ivy (hiedra).

Su nombre japonés posiblemente derive de ツタ tsuta, un tipo de hiedra japonesa, y 蛇 ja, serpiente.

Su nombre francés, Vipélierre, viene de las palabras vipère (víbora) y lierre (hiedra)."
,"Snivy está basado en una serpiente, aunque por su aspecto y pérdida de las extremidades conforme evoluciona se puede deducir que está basado en algún tipo de escíncido o serpientes Uromacer Oxyrhynchus. Su cuerpo es predominantemente de color verde. Sobre sus brazos cuenta con dos estructuras curvadas de un color amarillo más vivo que el de la franja que recorre su cuerpo.
Su cola, en forma de hoja, es la encargada de realizar la fotosíntesis. Si se queda sin energía, ésta se dobla hacia abajo. Se dice que cuando son salvajes, también tienen la capacidad de adaptarse mejor al medio que les rodea, siendo esto naturalmente en bosques o selvas muy densas, aunque cuando es entrenado, se transforma en pedante y altanero. Se dice que si cree que su entrenador no es digno de él, lo abandonará. 

Los Snivy son muy elegantes, y fuertes, por eso no aguantan perder de ninguna manera. Cuando le baña el sol, sus movimientos se vuelven mucho más veloces. Puede resultar ser un Pokémon muy orgulloso, pero cuando se le entrena bien será un Pokémon muy fiel."
,"Snivy evoluciona a Servine en el nivel 17. Servine evoluciona a Serperior en el nivel 36. Serperior no evoluciona."
,"");
insert into pokemon values (2, 'Servine', 16, 0.8,"Se mantiene agachado para abrirse camino entre la hierba mientras corre y, luego, fustiga sin piedad al objetivo con sus látigos de lianas."
,"Su nombre en proviene de las palabras inglesas serpent (serpiente) y vine (liana o cepa).

Su nombre japonés proviene de 蛇 ja (serpiente) y nobi (desarrollo)."
,"De manera similar a su preevolución, Snivy, Servine es predominantemente verde con el pecho de color crema. Posee una estructura similar a un collar de color amarillo, que comienza en el torso y sigue por detrás de sus hombros. Tres hojas palmeadas le crecen alrededor de la espalda y la cola. Servine tiene cuatro cortas extremidades y una pequeña cresta que sobresale de la parte de atrás de su cabeza.

Es un Pokémon que nunca se da por vencido. Si alguien le golpeara, le atacaría sin dudar. Se mueven por la tierra tan rápido que parece que estuviera deslizándose. Confunden a sus enemigos con rápidos movimientos, para luego debilitarlos con su látigo cepa. Cuando su cuerpo está sucio, no puede realizar la fotosíntesis con sus hojas, así que cuida mucho su higiene personal."
,"Servine evoluciona a Serperior en el nivel 36. Serperior no evoluciona."
,"");
insert into pokemon values (3, 'Serperior', 63, 3.3,"Amplifica decenas de veces en el interior de su largo cuerpo la energía que genera a partir de la luz solar."
,"Su nombre occidental procede de las palabras inglesas serpent (serpiente) y superior (superior) o una variante de emperor (emperador).

Su nombre japonés proviene de 蛇 ja (serpiente) y la palabra inglesa lord (señor)."
,"Serperior está basado en una pitón. En una entrevista, Ken Sugimori mencionó que tanto Serperior como sus preevoluciones están basados en la realeza francesa, mencionando como inspiración el anime La Rosa de Versalles. El ornamento verde de su cuello hace referencia a la Flor de lis.

Es un Pokémon principalmente de color verde pálido. Posee una cola con pequeños arbustos parecidos a una hiedra. Detrás de su cabeza surgen una especie de hojas que se asemejan a unas orejas y en el lomo tiene franjas de color amarillo que se dividen en dos al final. Tiene ojos rojos que se aprecian por debajo de una especie de máscara verde claro que cubre su cara blanca. También tiene un tipo de cuello victoriano. Sus diminutas manos las suele entrelazar tras las espalda, lo que significa que este Pokémon sí tiene extremidades, contrario a la creencia popular, aunque es más hábil usando las lianas que esconde en su cuello.

Los Serperior son Pokémon considerados como nobles y leales. Suelen pertenecer a las personas ricas y adineradas. Los machos desarrollan el instinto paternal al evolucionar; suelen formar numerosas familias con otros Serperior e incluso con los Servine. Son los líderes de las tribus de los Pokémon de tipo planta. Son serenos y defienden a su familia y amigos de manera muy impresionante hasta el punto de dar su vida por ellos, por lo que se le considera un Pokémon leal y muy valiente. Solo lucha con todo su potencial ante grandes adversarios. Las hembras disfrutan su vida tranquilamente y cuidan a las crías hasta que evolucionan a Servine, aunque les cuesta separarse de ellos. Las hembras son muy femeninas y elegantes. Son el Pokémon favorito de los cazadores Pokémon por su alto precio al venderlos. Al ser muy elegantes y poderosos los Serperior son perfectos tanto para combates como para Concursos Pokémon."
,"Serperior no evoluciona."
,"");
insert into pokemon values (4, 'Tepig', 9.9, 0.5,"Maneja a su rival moviéndose con una agilidad sorprendente para su apariencia. Lanza ráfagas de bolas de fuego por ambas fosas nasales."
,"Su nombre occidental proviene de tepid, que significa tibio o caluroso y pig, que en inglés significa cerdo.

Su nombre francés, Gruikui, puede provenir de las palabras grognement (gruñido, el sonido que emiten los cerdos) y cuit (cocido).

Su nombre japonés deriva de ぽかぽか pokapoka, lo cual significa 'calor corporal', combinado con 豚 buta, cerdo; o ブー bū, 'oink', onomatopeya asignada al ruido de un cerdo."
,"La esfera roja de su cola absorbe los rayos solares convirtiéndolos en pura energía que pasa al centro de su cuerpo, fortaleciendo de ese modo sus ataques de tipo fuego, Dependiendo de qué ataques use, la esfera de su cola empieza a brillar con una gran intensidad. Al evolucionar esta esfera roja desaparece de su cola, pasando a estar en el centro de su cuerpo donde antes se acumulaba toda la energía absorbida, así se van fortaleciendo aún mucho más sus ataques ya sean de tipo fuego o lucha.
Tepig es un pequeño Pokémon parecido a un cerdo. Aspira a ser un gran luchador como los Emboar. Son raros de ver en la región Teselia, pero los tutores de esta región se las apañan para atraparlos y después entregarlos a jóvenes entrenadores. Es ágil al evitar los ataques del enemigo, utiliza ataques de tipo fuego que puede lanzar a través de los orificios de su nariz, ataques como por ejemplo ascuas.

Asa bayas con sus llamas y se las come bien tostadas. Cuando se resfría, las llamas que expulsa de su nariz se convierten en humo negro, fácil de confundir con humo de hogueras descontroladas, por lo que los Pokémon Ranger deben de estar atentos de la salud de este Pokémon, para no tener que ponerse alerta por un Tepig resfriado."
,"Tepig evoluciona a Pignite, al nivel 17. Pignite evoluciona a Emboar al nivel 36."
,"");
insert into pokemon values (5, 'Pignite', 55.5, 1,"En cuanto entra en combate, su temperatura corporal se dispara hasta el punto de convertirse en una bola de fuego candente."
,"Su nombre occidental proviene de Pig (cerdo) y de ignite (ignición o encender).

Su nombre japonés proviene de 豚 buta (cerdo) o ブー bū (oink, sonido onomatopéyico del cerdo) y chao podría venir de chaos (caos, desorden en inglés)."
,"Cuando Tepig consigue llegar a dominar las técnicas de lucha básica, puede evolucionar a Pignite. Los Pignite nunca abandonarán un combate debido a que les encanta luchar y son muy fuertes, pueden llegar a sacrificarse por el entrenador o por los pequeños Tepig que pueda encontrar en su camino intentando protegerles por tener ganas de pelear y por que son pequeños y aun no tienen la suficiente fuerza como para pelear ellos solos.

Cuando va a lanzar un ataque de fuego, su peluda cola pasa de ser negra a roja; si se concentra demasiado en cargar sus llamas, su cola arderá. Cuando la llama en su cuerpo se pone a arder, la velocidad y el daño de sus movimientos aumenta. Cuando se enoja también su fuego se calienta. Pignite utiliza los alimentos como combustible para que el fuego comience a arder dentro de su vientre, si se encuentra en problemas sopla el humo desde su interior."
,"Pignite evoluciona al nivel 17. Pignite evoluciona a Emboar al nivel 36. "
,"");
insert into pokemon values (6, 'Emboar', 150, 1.6,"Las llamas que le arden en el interior del pecho emanan con ímpetu hacia el exterior a través de la barbilla y le confieren una barba flamígera."
,"Su nombre proviene de las palabras inglesas ember (ascuas) y de boar (cerdo salvaje o jabalí).

Su nombre japonés, Enbuoh, procede de 炎 en (llama), 豚 buta (cerdo) o ブー bū (onomatopeya del cerdo en japonés), 武 bu (artes marciales) y 王 ō (rey)."
,"Está basado en un cerdo salvaje o jabalí. Posee una especie de barba en llamas. Los símbolos de su faja se parecen al símbolo de infinito. Sus piernas tienen detalles negros con dorado dándoles un parecido curioso a las botas de un luchador.
Este Pokémon se preocupa mucho y es muy fiel a sus compañeros. El hecho de que su barba prenda en llamas es indicio de que tiene ganas de luchar, la cual usa para calentar sus puños, y así poder golpear a sus oponentes con puñetazos ardientes. La existencia de su barba flamígera, es gracias a las llamas que emana con ímpetu desde el interior de su pecho hacía el exterior. Su punto más fuerte es la lucha cuerpo a cuerpo. A pesar de lo que aparenta puede llegar a ser bastante rápido, aunque no suele necesitarlo al ser suficiente su fuerza bruta al enfrentarse a sus oponentes. Domina numerosos movimientos. Parece divertirse más cuanto más acorralado se encuentre, en esa situación, las llamas de su cuerpo se avivarán más, volviéndose más rápido y poderoso."
,"Emboar no evoluciona."
,"");
insert into pokemon values (7, 'Oshawott', 5.9, 0.5,"Blande la cuchilleira del vientre a modo de daga. Tras bloquear con ella los movimientos del rival, contraataca asestando ágiles cuchilladas."
,"Su nombre proviene de las palabras en inglés ocean (océano), shell (concha) y otter (nutria).

Su nombre en japonés, Mijumaru, procede de 水 mizu (agua) y 丸 maru (redondo).

Su nombre francés, Moustillon, procede de moussaillon (grumete) y mustélidé (mustélido)."
,"Oshawott es un pequeño Pokémon parecido a una nutria marina bípeda. Oshawott tiene una cabeza grande, blanca y esférica, con orejas pequeñas en forma cónica de color azul oscuro. Los ojos de Oshawott son grandes, oscuros y de forma ovoide. Su nariz es de color marrón de forma ovalada. Oshawott también posee manchas a los lados de su cara, haciendo referencia a las barbas cortas que poseen las nutrias jóvenes. También posee un extraño 'collar' alrededor de su cuello, que recuerda a pequeñas burbujas. El torso de Oshawott es de color azul claro y posee una especie de adhesivo que mantiene su concha de color amarillo pálido pegada en el centro. Hecha de queratina, esta concha se puede quitar y es utilizada con la versatilidad de una espada (con la que ataca y se protege), incluso se la ha visto utilizada de manera parecida a un shuriken. Sus pequeños brazos redondeados son de color blanco, y sus pies, que, a diferencia de sus brazos, son de color azul oscuro, el mismo que sus orejas y su cola. Oshawott también posee una cola planchada y larga, que le permite nadar a mayor velocidad. Suele nadar de espaldas, usando solo los pies y la cola.
Oshawott vive en lagunas, ríos o estanques. Los encontrarás sin dudar donde haya mucho alimento cerca de una masa de agua, ya que son de naturaleza glotona. Los encontrarás en manadas con Dewott y Samurott.

Lucha con la concha de su vientre, heredada de su madre, usándola para bloquear ataques y luego contraatacar. Aunque según el manga es tan débil como una uña, y regenera al romperse. Está inspirado en una nutria marina por dicha concha que posee en el vientre (debido a sus hábitos alimenticios). Oshawott puede quitársela para atacar al enemigo."
,"Oshawott evoluciona a Dewott al nivel 17. Dewott evoluciona en Samurott al nivel 36. Samurott no evoluciona."
,"");
insert into pokemon values (8, 'Dewott', 24.5, 0.8,"Se dice que sus movimientos al manejar las dos cuchilleiras, fluidos cual corriente de agua, se tomaron como modelo para el arte de la espada."
,"Su nombre proviene de las palabras inglesas dew (rocío) y otter (nutria).

El nombre japonés Futachimaru probablemente proviene de futatsu (dos, que puede referirse a sus dos conchas que usa como armas o a que es la segunda etapa de la línea evolutiva de Oshawott), tachi (espada) y maru (una manera común de nombre en la época de los samuráis)."
,"Dewott es un Pokémon muy veloz. No es muy común verlo, debido a que se oculta y le gusta entrenar en solitario, aunque en algunos casos vive en manadas junto con sus evoluciones. En el mundo Pokémon, se relatan cuentos de como los samuráis se basaron en ellos para crear las técnicas de Bushido y el Kenjutsu.
Dewott blande con destreza sus dos conchas como si fueran espadas y utiliza técnicas Nitoryu para combatir, se entrena con disciplina con tal de aprender nuevas técnicas para su estilo de pelea Nitoryu.
Si un Dewott está pescando en el río deberías huir de él, ya que podría pensar que le quitarás su comida y te atacará; debido a que suele ser un Pokémon de carácter rudo.

Es un Pokémon bastante territorial y orgulloso, y defenderá junto a los Samurott su territorio con su vida si es necesario. Sin embargo, es muy honorable y aceptará la derrota sin problemas. Tiene una personalidad perfeccionista, por lo cual pasa casi toda su vida en entrenamiento y perfeccionando sus técnicas Nitoryu.
Es un Pokémon servicial con su familia, cuando un miembro pequeño de la familia pide comida, él va a pescar algunos peces y los corta con sus conchas como dos cuchillos.

Las hembras Dewott desarrollan su instinto maternal en esta fase, por lo que se preocupan más del cuidado y mantenimiento de la familia. Las conchas de las hembras tienen más brillo que las de los machos."
,"Dewott evoluciona a Samurott al nivel 36. Samurott no evoluciona."
,"");
insert into pokemon values (9, 'Samurott', 94.6, 1.5,"Un maestro en el arte del desenvaine. Zanja sus combates con un tajo de los grandes sables que guarda en la coraza de las patas delanteras."
,"Su nombre proviene de las palabras samurai y otter (nutria en inglés).

Su nombre en japonés, Daikenki, proviene de 大 dai (largo), 剣 ken' (espada) y 剣鬼 kenki (una frase japonesa usada para referirse a los maestros con la espada que significa literalmente 'demonio espadachín')."
,"Samurott está basado en una nutria, aunque parece tener características de león marino con un colmillo de narval en su cabeza, con rasgos de samurái tales como el bigote y la pequeña armadura que cubre parte de su cuerpo. Su cuerno es un arma muy importante, permitiéndole utilizar movimientos fulminantes como Megacuerno. Suele liderar manadas de Oshawott y Dewott. Puede hacer caer a sus rivales con un golpe de su cuerno. Hace callar a los enemigos con una mirada ya que es muy intimidante. Es muy territorial, cuando se encuentra con otra manada de su especie tenderá a luchar. En una manada, suele haber 1 o 2 hembras de Samurott.
Al igual que sus preevoluciones, puede desprender su armadura de su cuerpo, erguirse sobre sus dos patas traseras y usarla como una espada. A diferencia de sus preevoluciones, que usan 'conchas marinas' para atacar, las 'conchas' de Samurott tienen forma de espada. Además tienen la opción de sacar una o dos espadas, tal como se muestra en el anime. Pocos son los Pokémon salvajes que se atreven a combatir cuerpo a cuerpo con un Samurott en estado salvaje.

Los Samurott machos desarrollan su instinto paternal en esta fase, si ve a algún Oshawott ser atacado por otro Pokémon, tanto como si es hembra o macho, enfurecerá y atacará bruscamente. Las hembras tienden a acompañarse, ya que se necesitan unas a otras. La armadura de las hembras está mejor cuidada y brilla más que la del macho."
,"Samurott no evoluciona."
,"");
insert into pokemon values (10, 'Patrat', 11.6, 0.5,"Almacena víveres en unas bolsas en sus mofletes y vigila durante días. Hace señales con la cola a sus compañeros."
,"Su nombre proviene de las palabras inglesas patrol (patrulla) y rat (rata).

Su nombre japonés, Minezumi, procede de 見 mi (observar) y de 鼠 nezumi (ratón)."
,"Patrat está basado en un perrillo de las praderas. Patrat tiene su barriga y parte de su cara de color marrón. Su cola es larga y recta con una punta blanca abierta. Tiene un diente grande y en punta que sobresale de su boca. Patrat tiene una cara plana, y sus mejillas son redondas, sus orejas son pequeñas y puntiagudas. Su cabeza tiene una banda de negro que cubre los ojos, la cual le da aspecto de antifaz. Sus ojos tienen el iris de color rojo con un anillo amarillo. Sus patas son pequeñas y negras con tres dedos en cada pie.

Este Pokémon vigila durante varios días por turnos para proteger sus madrigueras. Junto con una de sus habilidades (vista lince) y la postura que mantiene en las imágenes hacen pensar que es un Pokémon que está siempre alerta y atento a todo lo que pasa a su alrededor. Si un guardia no se presenta se ponen nerviosos. En sus mejillas guarda el alimento que recolecta. Suelen usar su cola para comunicarse con los otros Patrat."
,"Patrat evoluciona a Watchog al nivel 20. Watchog no evoluciona."
,"");
insert into pokemon values (11, 'Watchog', 27,1.1,"Los componentes luminiscentes de su interior hacen que sus ojos y su cuerpo brillen, y así intimida a sus rivales."
,"Su nombre procede de las palabras inglesas watch (observar) y groundhog (marmota).

Su nombre en japonés, ミルホッグ Miruhog, procede de 見る miru (ver, observar) y de la palabra inglesa groundhog (marmota)."
,"Watchog está basado en un suricato. Al igual que Patrat, parece estar alerta por todo lo que lo rodea, pero a diferencia de este Watchog es más alto y su cola es mucho más larga. Tiene las mejillas grandes y un diente único que sale de su boca. De pelaje color rojizo, patrón del pecho y hocico color beige. Su cola es larga y rígida con un mechón blanco en la punta. Cuando tiene la cola altiva y con el mechón erizado, se debe a que esta vigilando o esta pendiente de algo. Watchog parece estar también basado en un chaleco reflectante de seguridad, ya que las franjas amarillas de su cuerpo que brillan en la oscuridad y reflejan la luz.

En sus viajes recolecta bayas y sus semillas las guardan en las bolsas de las mejillas. Estas son usadas para atacar a sus enemigos en caso de emergencia. El patrón en su cuerpo brilla e intimida a sus enemigos. La vista de Watchog es excelente; pueden ver a una gran distancia e incluso son capaces de ver en la oscuridad. Suelen ser muy territoriales con otras especies; alejan a los demás Pokémon con sus ojos perturbadores."
,"Watchog no evoluciona."
,"");
insert into pokemon values (12, 'Lillipup', 4.1,0.4,"Es valiente pero cauto. Usa el suave pelaje que le recubre el rostro para obtener información sobre su entorno."
,"Su nombre procede de una combinación de las palabras inglesas li'l, abreviación de little, (pequeño), Lilliput, país de Los Viajes de Gulliver donde la gente es pequeña y de pup (cachorro).

Su nombre en japonés (Yorterrie) proviene de la unión de las palabras Yorkshire Terrier, la raza de perros en la que esta basado

Su nombre francés, Ponchiot, viene de las palabras poncho y chiot (cachorro)."
,"Lillipup está basado en un pequeño cachorrito de perro la raza Yorkshire Terrier. Es de un color tostado y tiene ojos grandes y una nariz roja, con su cara cubierta por una gran cantidad de pelo color crema. Sus grandes orejas tienen extensiones en la punta inferior. Tiene 3 dedos en cada pata. Su cola es puntiaguda y con forma similar a sus orejas.

Este Pokémon suele estar acompañado de sus evoluciones. Son muy amigables con sus entrenadores. Los niños pequeños suelen tenerlos como mascotas. Está basado en un Yorkshire terrier. Es un Pokémon inteligente que hace frente con valentía incluso a rivales fuertes, aunque tiende a evitar luchas en gran desventaja. Se enfrenta con valentía a enemigos muy poderosos. Los mechones que cubren su cara actúan como radar para detectar lo que hay a su alrededor."
,"Lillipup evoluciona a Herdier al nivel 16. Herdier evoluciona a Stoutland al nivel 32. Stoutland no evoluciona."
,"");
insert into pokemon values (13, 'Herdier', 14.7,0.9,"Es muy inteligente y cariñoso. Existen ciertas teorías que lo consideran el primer Pokémon que se convirtió en compañero de los humanos."
,"Su nombre procede de las palabras inglesas herding [dog] (perro pastor) y la raza de perros terrier.

Su nombre alemán, Terribark, deriva de terrier y del inglés bark (ladrido).

Su nombre francés, Ponchien, viene de las palabras poncho y chien (perro)."
,"Herdier tiene la forma de un perro de raza Yorkshire Terrier: un pelaje oscuro en el lomo, bigotes muy tupidos y gruesas cejas. Sus patas son cortas. El pelaje negro que tiene en su cuerpo con forma de capa es muy resistente y reduce el daño que recibe.

Estos Pokémon son muy amigables y leales. No solo ayuda a su entrenadores, sino que también se preocupa por otros Pokémon. Protegen a sus crías con sus vidas. Esta especie ha ayudado desde antaño a entrenadores que crían Pokémon. Su olfato es muy sensible y en combate sabe de antemano cuando su oponente se mueve. Siempre observa a su enemigo detenidamente, lo que le permite concentrarse mejor."
,"Herdier evoluciona a Stoutland al nivel 32. Stoutland no evoluciona."
,"");
insert into pokemon values (14, 'Stoutland', 61,1.2,"Parece ser que le gusta vivir con personas. En tan solo tres días ya le coge cariño a cualquiera que lo haya atrapado en estado salvaje."
,"Su nombre procede de las palabras inglesas stout (fornido, robusto), la raza de perros Newfoundland (Terranova) y Scotland (Escocia), lugar de origen de los Yorkshire Terrier, y gran cantidad de Terriers.

Su nombre francés, Mastouffe, viene de Mastiff (mastín) y touff (mechón)."
,"Stoutland está basado en la raza de perros Yorkshire Terrier, aunque su nombre se refiere más a la raza Terranova. La única característica que comparte con esta raza de perro es su frondoso pelaje. Su bigote es grande, voluminoso, de coloración amarillenta y blanca. Ahora el pelaje le cubre todo el torso y patas en contraste con Lillipup y Herdier, protegiéndole del frío y de los ataques de los oponentes. En sus patas tiene tres dedos con afiladas garras.

Su especialidad son las misiones de rescate en montañas azotadas por ventiscas, aunque también es frecuente su uso en el mar por su gran capacidad de rastreo. Es un Pokémon muy leal e inteligente. Protege a su entrenador a la mínima señal de peligro. Su pelaje demuestra el cuidado que recibe de su entrenador y lo usa para dar calor a aquellos que lo necesiten."
,"Stoutland no evoluciona."
,"");
insert into pokemon values (15, 'Purrloin', 10.1,0.4,"Sustrae las pertenencias de las personas solo para verlas pasar apuros. Es un rival encarnizado de Nickit."
,"Su nombre procede de las palabras inglesas purr (ronronear) y purloin (hurtar).

Su nombre japonés viene de las palabras japonesas choromakasu (hurtar) y de neko (gato).

Su nombre francés, Chacripan, viene de las palabras francesas chat (gato) y sacripan (matón)."
,"Estos Pokémon suelen asustar a las personas que salen en las noches. Se decía que pertenecían a las brujas en los tiempos antiguos. Son muy populares como mascotas en la región Teselia. Se dice que cuando se les atraviesa a los entrenadores, algo muy curioso siempre pasa. Su cola tiene forma de hoz. Roba las pertenencias de la gente para divertirse. Incluso la gente a las que ha robado le perdonan rápidamente por sus travesuras adorables. Además, se dice que si te cruzas con uno tendrás mala suerte."
,"Purrloin evoluciona a Liepard en el nivel 20. Liepard no evoluciona."
,"");
insert into pokemon values (16, 'Liepard', 37.5,1.1,"Bajo su hermoso pelaje y cautivador estilo, que puede llevar fácilmente a engaño, se oculta un carácter imprevisible y agresivo."
,"Su nombre proviene de las palabras Lie, que significa mentira o engaño, y Leopard, que significa Leopardo, el animal en el que se encuentra basado. Literalmente significa Leopardo mentiroso.

El nombre japonés proviene del término español leopardo. Y de reaper (segadora) por la forma de su cola.

Su nombre francés, leopardus, es simplemente la palabra leopardo en latín."
,"Liepard parece estar basado en un guepardo, pero por su romanización se confirma que está basado en un leopardo. Su cola termina en forma de guadaña. Es un Pokémon muy escurridizo. Su magnífico pelaje y estilo cautivan a muchos entrenadores.
Liepard al ser la evolución de una mascota suele ser tranquilo y no muy agresivo, pero cuando los Purrloin evolucionan en estado salvaje tienden a convertirse en grandes cazadores y Pokémon fríos y muy siniestros.

Sus garras le son de gran ayuda para atacar a sus enemigos y los Pokémon de los entrenadores que intenten capturarlo. Aunque esa no es su única utilidad, también le sirven para cazar, hurtar comida u objetos y hasta los machos las usan para impresionar a las hembras. Por su parte, si Liepard pertenece a un entrenador, éste se las cuidará, y si no planea combatir por un tiempo, se las cortará para cuidar las patas del Pokémon.
Tiene un pelaje muy elegante y cautivador, razón por la que es uno de los Pokémon favoritos de los entrenadores adinerados de la región de Teselia."
,"Liepard no evoluciona."
,"");
insert into pokemon values (17, 'Pansage', 10.5,0.6,"Comparte las hojas de su cabeza con Pokémon agotados. Posee la facultad de aliviar el cansancio."
,"Su nombre puede provenir de pan (el género de los chimpancés) y sage, término inglés que puede traducirse tanto por 'sabio' (en referencia a los 'Tres Monos Sabios') como por 'salvia' (un tipo de planta medicinal)"
,"Tiene el aspecto de un mono, su cuerpo es de color verde y amarillo y su cola tiene forma de una hoja. Además, su cabeza tiene forma de brócoli con unas extrañas y diminutas semillas amarillas.
Este Pokémon vive en las copas de los árboles y cerca de los lagos, ya que necesita mucha agua, caza Pokémon pequeños y otros acuáticos. Combaten con los Snivy y sus evoluciones, pues comparten territorio.

Es un Pokémon que vive en bosques profundos. Cuando alguien se come las hojas que crecen en su cabeza, el agotamiento desaparece como por arte de magia. También suele vivir con Pansear y Panpour, ya que por naturaleza se puede decir que los miembros del Trío de monos son diferentes razas de una misma especie.
En las tribus del Trío de monos todos se ayudan entre si para tener un perfecto equilibrio, ya que cada especie del Trío de monos no usa todos sus sentidos.

Pansage sale con las manos un poco alzadas como si hiciera gestos porque el 'trío de monos' es una leyenda japonesa que representa 'no oigo', 'no veo' y 'no hablo'. Pansage es el mono que representa 'no hablo'."
,"Pansage evoluciona a Simisage con una piedra hoja. Simisage no evoluciona."
,"");
insert into pokemon values (18, 'Simisage', 30.5,1.1,"Comparte las hojas de su cabeza con Pokémon agotados. Posee la facultad de aliviar el cansancio."
,"Simisage proviene de las palabras simian, haciendo referencia a 'simio', y sage, palabra traducible tanto por 'sabio' como por 'salvia' (una planta curativa)."
,"Lucha violentamente balanceando su cola. La hoja en su cabeza es extremadamente amarga. Su cola es larga y al final tiene dos hojas. Posee mucho pelaje en comparación con Simisear y Simipour. Le encanta la lucha salvaje y libre y al contrario de Simipour las prefiere serias y extremas. Es el más arrogante y fiero de sus parientes. Normalmente ejerce de líder en el grupo."
,"Simisage no evoluciona."
,"");
insert into pokemon values (19, 'Pansear', 11,0.6,"Pokémon muy inteligente que tiene la costumbre de tostar las bayas antes de comérselas. Ayuda mucho a los humanos."
,"Su nombre puede provenir de pan (el género de los chimpancés) y sear (quemadura) o de ear (oreja)."
,"Forma parte del trío de monos, junto con Pansage y Panpour. Estos Pokémon viven en manadas de 30 a 50 individuos. Pansear vive en cuevas de los volcanes, aunque se han avistado en bosques densos junto a los Pansage y Panpour. En las tribus del Trío de monos todos se ayudan entre si para un perfecto equilibrio, ya que cada especie no usa muy a menudo uno de sus sentidos. En sus dos hábitats es muy difícil de ver en estado salvaje, ya que son muy rápidos y se esconden con facilidad. Se alimenta de bayas, en su mayoría las más secas, y también de pequeños animales, como aves y peces. En un estudio, una manada cocinaba con su fuego lo que cazaban. Es un Pokémon con mucha energía, cosa que se demuestra tanto en estado salvaje como cuando es capturado. El tupé de su cabeza puede alcanzar los 600 grados al enfadarse. Tuesta bayas en este para comérselas.

Pansear sale con la mano cerca de la oreja porque el 'trío de monos' es una leyenda japonesa que representa 'no oigo', 'no veo' y 'no hablo'. Pansage es el mono que representa 'no hablo'."
,"Pansear evoluciona a Simisear exponiéndolo a una Piedra Fuego. Simisear no evoluciona."
,"");
insert into pokemon values (20, 'Simisear', 28,1,"Achicharra a sus enemigos desprendiendo llamas por la cola y la cabeza, fruto de su desmesurado calor interno."
,"Su nombre proviene de las palabras inglesas simian (simio), y sear (chamuscar)."
,"Simisear es la forma evolucionada de Pansear y, al igual que este, su cabeza tiene forma de llamas y sus orejas son grandes y ovaladas. El pelaje de sus hombros es blanco dándole aspecto de hombreras. Su cola es larga y gruesa, a diferencia de las colas de Simisage y Simipour, que son delgadas. En el trío de monos representa al 'no oigo' de los monos sabios.

La comida dulce es su favorita. Convierte estos alimentos en energía, que alimenta el fuego que hay en su interior. No le gusta luchar, prefiere comer y descansar, y si es molestado mientras descansa se pondrá muy furioso. Es el más perezoso de sus parientes. Mete bayas en su cola y aumenta la temperatura corporal, por lo cual, hace que las bayas se tuesten y sean dulces. Cuando se emociona, echa chispas por la cola y por la cabeza, y calienta su cuerpo.

Los Simisear suelen vivir donde haya ejemplares de Pansear como en bosques y montañas, o en lugares con cierta temperatura cálida como cuevas o desiertos. Aunque es posible la presencia de Simisear en lugares fríos como los que habitan en la Cueva Hielonírica."
,"Simisear no evoluciona."
,"");
insert into pokemon values (21, 'Panpour', 13.5,0.6,"El agua acumulada en su mata de pelo es rica en nutrientes. Usa su cola para regar plantas con esa misma agua."
,"Su nombre puede provenir de pan (el género de los chimpancés) y pour (llover a cántaros, en referencia a su Tipo agua)."
,"Forma parte del 'trío de monos', junto con Pansage y Pansear. Panpour a diferencia de Pansear y Pansage, es muy tranquilo y relajado, vive en bosques, lagos e incluso playas, este Pokémon en los bosques y lagos come bayas mientras que en las playas entra al mar a cazar mariscos. El agua que almacena en la borla de su cabeza está llena de nutrientes. Si se riega en una planta, crecerá muy grande.
Este Pokémon también vive con otros de su misma especie, y con los otros miembros del Trío de monos, como Pansage y Pansear (incluyendo sus evoluciones), también es muy social y le gusta mucho jugar. No es común que Panpour use su sentido de la visión, ya que se podría decir que se guía por sus instintos.

En las tribus del Trío de monos todos se ayudan entre si para un perfecto equilibrio, ya que cada especie del Trío de monos no usa muy a menudo uno de sus sentidos. Cuando usa Escaldar su borla de la cabeza se vuelve de color rojo vivo hasta que lo lanza.

Su punto débil son los entornos secos. Almacena agua en sus mechones y con ella moja todo moviendo la cola. Panpour sale con los ojos cerrados porque el trío de monos es una leyenda japonesa que representa 'no oigo', 'no veo' y 'no hablo'. Panpour es el mono que representa 'no veo'."
,"Panpour evoluciona a Simipour con una piedra agua. Simipour no evoluciona."
,"");
insert into pokemon values (22, 'Simipour', 29,1,"Cuando lanza agua a alta presión con su cola, puede incluso resquebrajar una pared de cemento."
,"Su nombre proviene de la combinación de las palabras Simi, la cual hace referencia a simio, y Pour que significa llover a cántaros."
,"Parece estar basado en un mono. Este Pokémon almacena agua en la borla de su cabeza. Si el agua almacenada escasea, absorbe agua con su cola para reponerla. Le encanta disfrutar y reír mientras lucha, es el más alegre e inteligente de sus parientes. Por su carácter simpático, fácil y agradable, no posee rival natural. Para comer, parte un coco, y utiliza una parte como cuenco, después corta las bayas y las mete en el cuenco, lo rellena con agua ardiendo y lo remueve. Luego lo comparte entre toda la familia.
Simipour encarna en el Trío de monos el no ver, por eso parece siempre estar con los ojos cerrados."
,"Simipour no evoluciona."
,"");
insert into pokemon values (23, 'Munna', 23.3,0.6,"Aparece en plena noche junto a la almohada de la gente. Cuando devora los sueños, los motivos de su cuerpo emiten una luz tenue."
,"Su nombre procede de la combinación de 夢 mu (sueño), la palabra en inglés moon (luna en inglés) y la palabra en latín luna."
,"Tiene la apariencia de un pequeño tapir de color rosa con un diseño de flores en la parte trasera. Si te encuentras con un Munna se come tu sueño, te olvidarás de su contenido. Siempre está levitando.
Al alimentarse de un sueño feliz expulsa humo rosa por un orificio. Este humo recibe el nombre de humo onírico. Normalmente sale de noche a ir por sueños de cabezas en cabezas de Pokémon y entrenadores que acampan de noche en el bosque."
,"Munna evoluciona a Musharna exponiéndolo a una Piedra lunar. Musharna no evoluciona."
,"");
insert into pokemon values (24, 'Musharna', 60.5,1.1,"Cuando el humo que desprende es de un color negruzco, conviene no acercarse, ya que puede hacer realidad las pesadillas."
,"Su nombre proviene de la mezcla de las palabras ムシャムシャ mushamusha (mascar o masticar), debido al hecho que este Pokémon devora los sueños de los demás, y la palabra Luna.

Su nombre alemán, 'Somnivora' literalmente significa 'comedora de sueños' debido a que come sueños y se atribuye a la Luna, que es una entidad femenina."
,"En cuanto a su aspecto, Musharna está basado en un tapir, tiene el rostro de color rosa y su cuerpo es lila. Subsiste en una posición fetal y siempre con los ojos cerrados.

El humo que emana de su cabeza es conocido con el nombre de humo onírico. Aunque parece caminar en cuatro patas solo camina en dos. Es tan fiel a su entrenador que si éste le cuida con cariño le protegerá hasta de los malos sueños."
,"Musharna no evoluciona."
,"");
insert into pokemon values (25, 'Pidove', 2.1,0.3,"Aparece en lugares habitados por humanos. Conviene tener cuidado al darles de comer, ya que esto podría atraer a cientos de ejemplares."
,"Su nombre occidental proviene de las palabras inglesas 'pigeon' (pichón) y 'dove' (paloma).

El nombre de su especie, こばと, viene de 'こ' que significa niño, y 'はと', paloma, por lo que se trata de una cría de paloma o pichón.

Su nombre francés, Poichigeon, viene de las palabras pois chiche (garbanzos) y pigéon (pichón), haciendo referencia a que es un pichón pequeño, una cria."
,"Está basado en una paloma. Tiene un diseño de un corazón en la cara encima de su pico y en su abdomen, tal vez represente su habilidad, sacapecho (en japones Pecho de paloma). Se encuentran en bandadas para así no ser atrapados por entrenadores; esta estrategia resulta muy eficaz. Es un Pokémon fiel con su entrenador, y muy cariñoso con él. Se dice que cuando un Pidove es lastimado, otros Pidove los auxilian, y llegarán lo más rápido que puedan. Sus bandadas suelen estar comandadas por su última evolución, Unfezant, los cuales suelen ser estrictos.
Su llanto es muy fuerte y no les gustan las cosas brillantes. Suele confundirse con la órdenes complicadas.

Habita en bosques y en ciudades, donde le gusta reunirse con otros Pidove en parques y plazas."
,"Pidove evoluciona a Tranquill en el nivel 21. Tranquill evoluciona a Unfezant en el nivel 32. Unfezant no evoluciona."
,"");
insert into pokemon values (26, 'Tranquill', 15,0.6,"Posee una velocidad de vuelo nada desdeñable. Por más que se aleje, siempre recuerda el camino de regreso a su nido o hasta su Entrenador."
,"Su nombre proviene de la palabra Tranquilidad o Tranquilo debido a su personalidad, y del inglés quill que significa pluma, también contiene quail, codorniz.
Su nombre japonés viene de hato, paloma, y tōbō, escape."
,"Tranquill es un Pokémon muy territorial, parecido a los Pidgeotto y Staravia en ese aspecto. Está basado en una mezcla de paloma torcaz y codorniz (como indica su nombre). Su forma de ser cambia dramáticamente al evolucionar y a su siguiente evolución cambia aún más, aunque es un Pokémon que se encuentra en bandadas con los de su misma especie siempre tiene un territorio en especial que cuidará con su vida y nadie le podrá arrebatar. Se alimenta de pokemon bicho y planta. Su comida favorita son los Sewaddle."
,"Tranquill evoluciona a Unfezant en el nivel 32. Unfezant no evoluciona."
,"");
insert into pokemon values (27, 'Unfezant', 29,1.2,"Hacen gala de una soberbia destreza al volar. La hembra posee una mayor resistencia, mientras que el macho la supera en velocidad."
,"Su nombre proviene de las palabras inglesas unfazed (impávido) y de pheasant (faisán)."
,"Unfezant está inspirado en un faisán, un ave cuya diferencia de género del mundo real se basa en un gran colorido y llamativo plumaje en los machos y un color apagado y más sobrio en las hembras. Los machos están basados en el Tragopán de temminck macho. Las hembras están basadas en el Faisán Dorado hembra; ambas especies originarias de Asia.
Este Pokémon es muy protector con los de su especie. Los machos suelen viajar en solitario mientras que la hembras viajan en bandadas. Suelen viajar por toda la región de Teselia buscando a Pidove y Tranquill que estén perdidos y los devuelven con sus respectivas bandadas.
Desde el punto de vista biológico, Unfezant es un Pokémon con una fisiología muy bien desarrollada, lo que le permite volar y cazar insectos eficazmente.

Los Unfezant son criaturas pacíficas, aunque también son buenos luchadores. Tienen gran elegancia al volar y su plumaje les hace ver muy bien. Las hembras, a diferencia de los machos, son más refinadas aunque por ser su plumaje más opaco no son muy bien vistas en ciertas ocasiones.
Según la Pokédex, las Unfezant hembras vuelan mejor que los machos. Además, las hembras poseen mejores habilidades defensivas aéreas y los Unfezant machos mejores habilidades ofensivas aéreas."
,"Unfezant no evoluciona."
,"");
insert into pokemon values (28, 'Blitzle', 29.8,0.8,"El latido de su corazón genera electricidad, cuyo voltaje aumenta cuando se sobresalta y se acelera su ritmo cardíaco."
,"Su nombre en japonés proviene de la contracción de la palabra japonesa シマウマ shimauma (cebra).

En inglés, su nombre es una mezcla de las palabras blitz (rayo, relámpago en alemán) y little, pequeño, literalmente significa pequeño relámpago.

Su nombre francés, Zébibron, viene de las palabras zèbre (cebra) y bibéron (refiriéndose a su etapa de bebé).

Su nombre alemán, Elezeba, viene de elektrizität (electricidad) y zebra."
,"Vive en manadas junto con Zebstrika, por los desiertos de Teselia; su enemigo por excelencia es Krookodile. Cuando están enfadados las crines se le erizan y se le cargan de electricidad, le gusta correr en las tormentas para cargarse. Utilizan el brillo de sus crines para comunicarse entre ellos, ya que si la cresta está chispeante significa que no hay peligro pero si se torna de un azul eléctrico y pegando calambrazos significa que hay un depredador en la zona, y por tanto peligro para la manada."
,"Blitzle evoluciona en Zebstrika en el nivel 27. Zebstrika no evoluciona."
,"");
insert into pokemon values (29, 'Zebstrika', 79.5,1.6,"Posee un temperamento salvaje y agresivo. Cuando se solivianta, su crin desprende un fulgor dorado y lanza rayos."
,"Su nombre viene de las palabras inglesas zebra (cebra) y thunderstrike que significa fulminar o de strike que significa golpe .

Su nombre japonés viene de zebra (cebra) y de rai (rayo en japonés)."
,"Cuando carga electricidad, las partes de color blanco de Zebstrika parpadean de color amarillo a causa de la electricidad acumulada en su interior. Dicen que corre a la velocidad del rayo y que al trotar hace tanto ruido como si fuesen violentos truenos."
,"Zebstrika no evoluciona."
,"");
insert into pokemon values (30, 'Roggenrola', 18,0.4,"Su cuerpo es casi tan duro como el acero, pero al parecer puede reblandecerse levemente si permanece sumergido en agua mucho tiempo."
,"Parece que su nombre proviene de una deformación de Rock&Roll, nombre de un tipo de música cuya traducción literal sería 'roca y rodar', muy afín a la forma de Roggenrola."
,"Su cuerpo ha sido comprimido por la tierra hasta obtener una consistencia más dura que el hierro. Una fisura en el interior de la tierra ha sido descubierta después de un gran terremoto hace ya un siglo, donde se dice que surgieron. Tiene un núcleo de energía dentro de su cuerpo que es lo que lo mantiene vivo.
El hexágono amarillo que aparece en su cuerpo no es su ojo como muchos creen, sino su oído por el que percibe cualquier sonido, hasta aquellos inaudibles para los humanos. Tiende a dirigirse hacia el origen de ruido que capta.

Cuando evoluciona cambia el color de las piedras de su cuerpo. Tiene gran parecido con Beldum."
,"Roggenrola evoluciona a Boldore en el nivel 25. Boldore evoluciona a Gigalith intercambiándolo con otro entrenador."
,"");
insert into pokemon values (31, 'Boldore', 102,0.9,"Cuando sus cristales anaranjados comienzan a brillar, conviene tener cuidado, pues es señal de que está a punto de liberar energía."
,"Boldore proviene de las palabras inglesas boulder (canto rodado) y ore (mena)."
,"El cuerpo de Boldore está formado por una roca de color azul oscuro. Posee tres cristales naranjas que le sirven de colmillos; y tres patas, cada una con un cristal del mismo color que le sirve para estabilizarse. Tiene cuatro cristales naranjas incrustados en su cabeza, en medio de la cual surge un borde alargado y rocoso que divide en dos hemisferios su cabeza y el hexágono amarillo que le funciona como órgano auditivo.

Cuando está rebosando de poder, Boldore emana un intenso resplandor anaranjado de sus cristales. Esto sucede gracias la energía que corre por su cuerpo y lo mantiene vivo. Está siempre en la búsqueda de aguas subterráneas en las cuevas donde habita, algo que es extraño porque los Pokémon de tipo roca suelen odiar el agua.

Toda la energía que no puede mantener en su cuerpo escapa condensándose en los cristales naranjas que lo caracterizan. Uno de estos cristales posee la energía necesaria para suministrar combustible hasta 100 camiones. Si se encuentra sano deja entrever su núcleo vital. Tiene la extraordinaria capacidad de cambiar con velocidad la dirección a la que se dirige sin necesidad de girarse."
,"Boldore evoluciona a Gigalith intercambiándolo con otro entrenador."
,"");
insert into pokemon values (32, 'Gigalith', 260,1.7,"Su robustez le permite colaborar con humanos y Copperajah en labores de construcción y minería."
,"Su nombre proviene de las palabras griegas gigas (gigante) y lithos (piedra).

Su nombre en japonés, Gigaiath, procede de la palabra griega gigas (gigante), Gaia (diosa griega de la Tierra) y de la palabra inglesa Earth (tierra)."
,"Gigalith vive en la profundidad de las minas o más raramente en la cima de las montañas. Absorbe la energía solar a través de los cristales rojos de su cuerpo, la magnifica internamente y la libera por su boca, cual puede abatir una montaña. No suele salir mucho de las galerías subterráneas, ya que allí dentro tiene su principal alimento, los minerales. Es un Pokémon grande y lento, pero tiene un gran ataque cuerpo a cuerpo. A veces se la ha visto combatir con Crustle por el territorio.

En esta evolución sus órganos auditivos, los pentágonos amarillos de su cabeza, rodean un par de ojos rojos que en sus preevoluciones no aparecía. Gigalith habita junto con sus preevoluciones Boldore y Roggenrola en el interior de minas y en menor cantidad en la cúspide de montañas."
,"Gigalith no evoluciona."
,"");
insert into pokemon values (33, 'Woobat', 2.1,0.4,"Si al alzar la vista en una cueva se ven marcas con forma de corazón en las paredes, es señal de que Woobat la ha convertido en su guarida."
,"Su nombre puede provenir de '¡Woo!' (expresión de júbilo) o de 'Woo' (cortejar en inglés), haciendo referencia a su nariz de corazón y 'Bat' (murciélago en inglés), o de 'Wombat' (especie australiana de marsupiales a la que se asemeja) y 'Bat'.

Su nombre en japonés puede venir de 'korokoro' (redondeado en japonés) y/o 'koumori' (murciélago). También podría venir de 'kokoro' (corazón)

Su nombre francés Chovsourir proviene de chauve-souris (murciélago) y sourir (sonrisa).

Su especie en japonés, こうもり, significa murciélago."
,"A su cuerpo redondo y peludo (tanto que no pueden verse sus ojos) le salen dos alas negras que le dan un toque tenebroso, pero aparenta ser de carácter feliz, ya que evoluciona con amistad con su entrenador, además de que tiene una marca en forma de corazón en su nariz. Esto último sugiere que tanto Woobat como su evolución, Swoobat, estén los dos basados en un cardioderma cor, también llamado murciélago de nariz de corazón. También puede estar basado en un murciélago blanco hondureño por su cuerpo claro y redondo y las alas negras que posee esta especie."
,"Woobat evoluciona a Swoobat por amistad con su entrenador. Swoobat no evoluciona."
,"");
insert into pokemon values (34, 'Swoobat', 10.5,0.9,"Tras emitir sus potentísimas ondas, queda tan exhausto que es incapaz de volar durante un tiempo."
,"Su nombre puede venir de Swoop (abalanzarse en inglés) o Swoon (embelesar) y Bat (murciélago).

Su nombre japonés proviene de las palabras japonesas 'Kokoro' (corazón) y 'Koumori' (murciélago)."
,"Swoobat tiene una forma similar a la de su pre-evolución, Woobat, tanto en su par de alas, aunque un poco más grandes, como su nariz, la cual tiene fosas nasales en forma de corazón, que sugiere que ambos estén basados en un murciélago de nariz de corazón. Sin embargo, Swoobat es de un tono mucho más azul oscuro, un par de ojos visibles, orejas y dos piernas. También tiene una cola con una extraña forma similar a un corazón. Es un Pokémon depredador, pero se conforma con presas pequeñas, y suelen llevar manadas de Woobat a los que mantiene unidos por los ultrasonidos que genera.

A pesar de ser un murciélago, ha desarrollado ojos que le permiten vivir en el exterior de cavernas, lo cual hace que su hábitat sea muy extenso. En contra de lo que su aspecto desaliñado pueda inspirar, es un Pokémon tremendamente cariñoso, prueba de ello es que evoluciona cuando siente mucho amor por su entrenador, y aunque no es del todo agradable a la vista, su apariencia tiene un toque muy dulce e inocente, lo que hace que sea un gran Pokémon de compañía para niños pequeños."
,"Swoobat no evoluciona."
,"");
insert into pokemon values (35, 'Drilbur', 8.5,0.3,"Es capaz de cavar bajo tierra a más de 50 km/h. Casi podría seguirle el ritmo a un coche que circule por la superficie."
,"Su nombre proviene de las palabras drill (taladro en inglés) y bury (enterrar en inglés) o burrow (madriguera en inglés).

Su nombre japonés proviene de la palabra 土竜 mogura (topo en japonés) y ryū (dragón en japonés, proviene de la pronunciación literal del último kanji de su nombre '竜')."
,"Su forma se asemeja a la de un pequeño topo y en sus brazos dispone de unas enormes garras afiladas. Por ello, guarda un gran parecido con Excadrill. Su cuerpo es de color negro con franjas azules.
Usa sus garras en conjunto para hacerlas girar y crear hoyos en la tierra y así refugiarse de algún peligro inminente o comúnmente de tormentas de arena. Avanza bajo tierra a más de 50 km/h. Podría librar carreras excepcionales con un coche que avance por la superficie."
,"Drilbur evoluciona a Excadrill en el nivel 31. Excadrill no evoluciona."
,"");
insert into pokemon values (36, 'Excadrill', 40.4,0.7,"Sus garras y su cabeza se han vuelto de acero. Puede combinarlas para formar un taladro capaz de perforar incluso una gruesa plancha metálica."
,"Su nombre proviene de las palabras excavate (excavar) y drill (taladro)."
,"Tiene la apariencia de un gran topo mayor. En su cabeza tiene un enorme cuerno o cresta algo inclinada hacia delante que usa para juntarlo con sus garras y convertirse en su forma taladro, con el cual cava túneles. También posee unas enormes garras muy peligrosas para cualquier enemigo. Las franjas azules de Drilbur se convierten en rojas al evolucionar. Al aguantar alta presión bajo tierra, sus garras y parte de su cuerpo adquieren una dureza mayor y por lo tanto cambian, y se dice que se vuelve de acero puro, tal como sucede con el cuerpo de Onix cuando evoluciona a Steelix.

Excadrill es un Pokémon muy agresivo en su estado salvaje y además muy fuerte, igual que su preevolución Drilbur con el que guarda gran parecido. Una vez capturado o entrenado desde pequeño, este Pokémon puede llegar a respetarte mucho y hacerse respetar él mismo. Se impresionan al ver que algún rival sea más fuerte que ellos ya que su grandísimo ego le ciega de los peligros y eso les hace pensar que son los más fuertes. Su taladro ha evolucionado y es capaz de atravesar hasta láminas de hierro, además es muy útil para construir túneles. Es muy ágil y puede aprender gran variedad de ataques

En estado salvaje cavan largos y estrechos túneles en montañas o en sitios algo aislados de los humanos, donde construyen ellos mismos su propia ciudad/laberinto subterráneo."
,"Excadrill no evoluciona."
,"");
insert into pokemon values (37, 'Audino', 31,1.1,"Su sentido del oído es extraordinario. Puede percibir el sonido de una piedrecita rodando a 2 km de distancia."
,"Su nombre proviene de una combinación de la palabra inglesa audio (audio) y de una deformación de la expresión inglesa I dunno (no lo sé).

Su nombre en japonés, Tabunne, procede de 耳たぶ mimitabu (lóbulo de la oreja) y de 音 ne (sonido)."
,"Audino tiene la apariencia de un cobaya o conejo con características de hada. Se dedican a ayudar a quien lo necesite, por eso Audino es utilizado en centros Pokémon. Su cuerpo es principalmente de color crema con áreas rosadas. Sus orejas son caídas y tienen un rizo que aparentemente es de pelaje. Tiene una cola blanca y esponjosa que se asemeja a la de un conejo. Tiene piernas cortas con pies redondos y dos dedos, y brazos que terminan en manos pequeñas con tres dedos. Tiene unos brillantes y dulces ojos azules sin pupilas, y siempre parece estar sonriendo dulcemente.

Es muy sensible. Con ayuda de sus orejas, si toca con ellas a alguien puede conocer su estado de ánimo y de salud por los latidos del corazón. Con sus orejas también puede examinar el ambiente, capta cualquier sonido como si fuera un radar y predecir cuándo va a eclosionar un huevo Pokémon."
,"Audino no tiene evolución ni evoluciona de ningún Pokémon."
,"");
insert into pokemon values (38, 'Timburr', 12.5,0.6,"Siempre lleva una viga de madera y ayuda en las construcciones. Se busca vigas más grandes conforme crece."
,"Su nombre es una modificación de la palabra 'timber', que significa 'viga de madera' en inglés, haciendo referencia al objeto que lleva a cuestas. También puede ser de burly ('fornido'), haciendo referencia a su habilidad principal, la fuerza.

Su nombre japonés (Dokkoraa) puede ser derivado de Δοκάρι Dokári (viga de madera). Puede ser también una combinación entre どっこい dokkoi (expresión usada por marineros cuando empujan o levantan algo al mismo ritmo) y こら kora (¡Oye, tu!)."
,"Es un Pokémon generalmente brusco. Es más bien buscado por entrenadores que en su vida diaria utilizan la fuerza, como los luchadores, karatekas, constructores, etc. Además de que su poder es brusco, es un pokémon digno de fiar. Es fiel a su entrenador y si algo le pasa no dudará en defenderlo. Su hábitat natural son las montañas y algunos bosques con muchos recursos que se puedan romper. Lucha bamboleando vigas de madera, las cuales rara vez sueltan, a excepción del uso de algunos ataques. Cuando las transporta sin dificultad es señal de que va a evolucionar. Siempre lleva vigas de madera. Normalmente ayuda en obras de construcción o con karatekas en los dojos. Su poderosa fuerza física mantiene los enemigos a raya, ya que son muy competitivos. Las franjas rosadas de su cuerpo son de tejido muscular y pueden crecer durante el combate. Es un Pokémon muy parecido a Machop, ya que ayuda a los trabajadores."
,"Timburr evoluciona a Gurdurr en el nivel 25. Gurdurr evoluciona en Conkeldurr al ser intercambiado. Conkeldurr no evoluciona."
,"");
insert into pokemon values (39, 'Gurdurr', 40,1.2,"Ejercita el cuerpo cargando vigas de acero. Presume de lo grandes que son sus músculos comparándolos con los de sus congéneres."
,"Su nombre es la modificación de la palabra 'girder', palabra inglesa que significa viga metálica, que hace referencia al listón que lleva a cuestas."
,"Su cuerpo musculoso hace que no tenga miedo, ni siquiera a toda una banda de luchadores profesionales. Les encanta presumir sus poderosos músculos a sus amigos.
Fortalece sus músculos con una gran viga de acero, incluso son capaces de blandirlas para tumbar edificios."
,"Gurdurr evoluciona en Conkeldurr al ser intercambiado. Conkeldurr no evoluciona."
,"");
insert into pokemon values (40, 'Conkeldurr', 87,1.4,"Se cree que Conkeldurr enseñó a los humanos la técnica para elaborar hormigón hace más de 2000 años."
,"Su nombre puede tener relación a la palabra concrete que en inglés significa hormigón, uno de los productos del cemento, haciendo referencia a las columnas de cemento que lleva a cuestas. Además puede estar combinado con la palabra 'elder' (vejez) que significa mayor ya que es la última evolución y tiene una apariencia a la de un anciano. También su apariencia puede recordarnos a la figura de Sansón con las dos columnas. Sumado a esto se le agrega el sufijo -Urr que llevan sus preevoluciones. También de conk, que en argot inglés significa nariz grande, en referencia a su nariz.

Su nombre en japonés proviene de las palabras inglesas 'rock' (roca) haciendo referencia a los pilares que tiene en las manos y 'pushing' (empujando) tal vez haciendo referencia a que es de tipo lucha."
,"Es un Pokémon herbívoro que habita en las praderas y se alimenta de las bayas de los árboles, es un Pokémon muy territorial por lo que siempre se le ve marcando su terreno, debido a esto los enfrentamientos entre los machos de esta especie son escasos, aun así cuando suceden son brutales. Aun con su poca velocidad, este Pokémon posee una gran fuerza física y dos grandes columnas de cemento que usa como arma, estos Pokémon son tercos y poco inteligentes siendo así bestias difíciles de entrenar para un entrenador novato. Se cree que enseñó a los humanos a hacer cemento. Utiliza sus columnas como bastones."
,"Conkeldurr no evoluciona."
,"");
insert into pokemon values (41, 'Tympole', 4.5,0.5,"El agudo canto de los Tympole bajo el agua crea hermosas ondas que se extienden por la superficie."
,"Su nombre en inglés deriva de la combinación de las palabras en inglés 'tympani' ('timbal') y 'Tadpole' ('renacuajo').

Su nombre japonés puede provenir de las palabras japonesa オタマ ('renacuajo') y マロ, que se puede interpretar como cualquier forma redonda."
,"Tympole está basado en un renacuajo: su cabeza es redonda, tiene ojos ovalados y sus cejas tienen forma de renacuajo. Sus oídos parecen tapones, su cola es muy parecida a la de Poliwag y le gusta vivir en aguas lodosas. Cuando se encuentran al aire libre cantan y saltan como en coreografía, tal vez porque saben movimientos como canon, eco voz y vozarrón."
,"Tympole evoluciona a Palpitoad en el nivel 25. Palpitoad evoluciona a Seismitoad en el nivel 36. Seismitoad no evoluciona."
,"");
insert into pokemon values (42, 'Palpitoad', 17,0.8,"Las ondas sonoras que emite pueden provocar dolor de cabeza. Con ellas debilita a sus presas para luego atraparlas con su lengua viscosa."
,"Su nombre en inglés proviene de las palabras palpitation (palpitación, pulsación en inglés) y de toad (sapo en inglés).

Su nombre japonés ガマガル (Gamagaru) procede de una deformación de la palabra japonesa 蝦蟇, una especie de sapo.

Su nombre francés Batracné viene de las palabras batracien (batracio) y acné."
,"Está basado en un renacuajo en plena metamorfosis. Las protuberancias de su cabeza pueden vibrar y producir terremotos y olas. Tienen lenguas largas y viscosas para atrapar a sus presas. Puede vivir tanto en el agua como en la tierra. Comparte las mismas características de metamorfosis que Poliwag y sus evoluciones, igual que comparte sus mismos ataques y características como la de su tipo.

Estos Pokémon suelen cazar su alimento, en especial pequeños Pokémon que viven en el agua como Basculin, Tynamo, entre otros. Al salir a tierra suelen cazar Pokémon como Venipede. Rara vez se les ve alimentarse de plantas, lo que automáticamente los convierte en criaturas omnívoras.

Por su combinación de tipos (agua/tierra) son muy resistentes contra los Pokémon de tipo eléctrico, pero doblemente vulnerables a los Pokémon de tipo planta. Aunque los Pokémon de tipo fuego no tienen oportunidad, por lo que para ellos seria una pesadilla encontrarse con un Palpitoad. Esta resistencias y debilidades le ayudan mucho a este Pokémon en estado salvaje pero al estar en entrenamiento se ablandan y se hacen menos eficientes."
,"Palpitoad evoluciona a Seismitoad en el nivel 36. Seismitoad no evoluciona."
,"");
insert into pokemon values (43, 'Seismitoad', 62,1.5,"Cuando hace vibrar los bultos de su cuerpo, provoca sacudidas que parecen terremotos. Está emparentado con los Croagunk."
,"Su nombre proviene de seism (seísmo en inglés) y toad (sapo en inglés). Su nombre en japonés proviene de la palabra japonesa gama que significa literalmente 'sapo' y 'gero' que es la onomatopeya japonesa del croar de un sapo o una rana.

Su nombre francés Crapustule viene de las palabras crapaud (sapo) y pustule (Pústula)"
,"Está basado en un sapo. Se asemeja bastante a los sapos marinos (bufonidos) pero presenta el cuerpo cubierto de 'bultos' grandes y redondos por donde segrega el veneno como los sapos del género bombina bombina (sapos de vientre de fuego). Además, al igual que estos sapos, se comunica croando mediante vibraciones del cuerpo y presenta un aspecto rechoncho. La forma variocolor de este Pokémon presenta el color de dichos sapos.

Es la forma evolucionada de Palpitoad y su familia evolutiva representa la metamorfosis de los anuros. Cuando sus bultos vibran sus ataques se doblan e incluso puede partir una piedra. Los nervios de los bultos lanzan un líquido venenoso que paraliza. A este Pokémon le encanta vivir en aguas con lodo, pantanos, drenajes y algunos lagos, aunque sus patas cortas y su gordura le impiden ser un buen nadador. Se alimenta de insectos y algunos peces."
,"Seismitoad no evoluciona."
,"");
insert into pokemon values (44, 'Throh', 55.5,1.3,"Su técnica de lanzamiento es formidable. El sudor que exhala durante el combate impregna su cinturón, cuyo color se vuelve más intenso."
,"El nombre de Throh proviene de la palabra inglesa throw (arrojar, tirar)."
,"Throh está basado en un judoka. Los Throh suelen ir en manadas de cinco y normalmente suelen pelearse en una lucha que suele durar varios minutos. Los Throh sienten por naturaleza pasión de enfrentarse a enemigos más grandes que ellos y derribarlos con sus habilidades de judo, aunque sus enemigos más comunes son los Sawk. Al encontrarse no dejarán de pelear hasta que uno se proclame vencedor. Throh potencia su fuerza al apretar el cinturón que porta. Un Throh silvestre utiliza lianas para hacer su cinturón."
,"Throh no tiene Evolución, ni evoluciona de ningún Pokémon."
,"");
insert into pokemon values (45, 'Sawk', 51,1.4,"Viven obsesionados con hacerse más fuertes. Si se los encuentra entrenando en la montaña, lo más recomendable es alejarse en silencio."
,"Su nombre puede venir de saw (sierra, por su tipo lucha) y hawk (halcón, ya que visto desde su perfil izquierdo parece un halcón y además su grito es parecido al de este animal).

Otra explicación de su nombre es que podría hacer referencia a la similitud fonética de la palabra inglesa sock que significa golpear con los puños."
,"Sawk es un Pokémon bípedo humanoide con un cuerpo azul, flaco y piel rocosa. Su cabeza es más larga que ancha, con un ornamento negro en su cara con forma de Z hacia los costados que forma su nariz y ceja izquierda. Sus manos y pies ambos tienen tres dedos.

Sawk viste con un Karategi (lo que quiere decir que está basado en un karateca) azul claro con un cuello en v de color negro, que se extiende abajo hasta su cinturón negro. Sawk ata este cinturón negro para aumentar su poder. El Karategi tiene patrón de diamantes intrincados en sus mangas y un parche cuadrado negro en la curva de las rodillas. Sawk es encontrado aislado en las montañas, donde entrena para aumentar su fuerza. Se enfada mucho si se interrumpe su entrenamiento. Si se va de expedición a las montañas, se podrán escuchar los golpes de este Pokémon, ya que aquí se desarrolla. Este Pokémon es una especie exclusivamente masculina, sin contraparte femenina.
S
on rivales de los Throh, si se llegan a encontrar no dudarán en luchar por varios minutos. Los Sawk les llevan la ventaja de ser más rápidos que los Throh. Sin embargo, sus ataques tipo lucha no son los más fuertes de la generación.

El poder destructivo de su fuerza crece cuando se pone el cinturón y deja escapar un grito de guerra. Si Sawk percibe que su entrenador está dispuesto a luchar con determinación hasta el final, éste no dudará en darlo todo por él."
,"Sawk no tiene evolución, ni evoluciona de ningún Pokémon."
,"");
insert into pokemon values (46, 'Sewaddle', 2.5,0.3,"Usa como patrón la ropa que le teje Leavanny para aprender a elaborar él mismo atavíos con las hojas de los árboles que recorta."
,"Su nombre proviene de las palabras sew (coser) y swaddle (envolver). Ademas del sonido de su genero Serotinella (orugas que usan hojas).

Su nombre en japonés 「クルミル」 hace referencia al 「包み」 (kurumi), que es la manta en la que se envuelve a los bebés."
,"Sewaddle es una especie de gusano de seda que cuenta con una hoja que recubre todo su cuerpo, esta hoja es la que le ayuda a usar muchos de sus ataques, uno de los mas notables es hoja afilada, este Pokémon junta su cabeza con la de su entrenador para demostrar su confianza, pero solo lo hace con la gente que para el se lo merezca, si para el la persona no es de confianza le pegará un buen cabezazo. También se ha demostrado que su hoja es medicinal, como el Sewaddle de Ash."
,"Sewaddle evoluciona a Swadloon en el nivel 20. Swadloon evoluciona a Leavanny por amistad con su entrenador, subiendo un nivel. Leavanny no evoluciona."
,"");
insert into pokemon values (47, 'Swadloon', 7.3,0.5,"Vive tranquilo junto a las raíces de los árboles. Prefiere alimentarse de las hojas caídas y ya reblandecidas antes que de hojas frescas."
,"Su nombre proviene de las palabras inglesas swaddle (envolver) y cocoon (crisálida).

Su nombre japonés, Kurumayu, procede de 包む kurumu (envolver), y 茧 mayu (crisálida)."
,"Parece ser un capullo pero envuelto en hojas, curiosamente asemeja estar acurrucado por el frío con una manta, tal vez se cubre por el clima, ya que al cambiar de estación siente frío. O quizá se cubre para camuflarse de los depredadores.

Swadloon habita en bosques de vegetación abundante. Con las hojas caídas puede realizar una gran variedad de funciones, desde transformarlas en nutrientes, hasta usarlas para envolverse en ellas para protegerse del frío. De todas formas suele preferir lugares lóbregos y húmedos. Sewaddle se pasa todo el día comiendo hojas para acumular energía para poder evolucionar."
,"Swadloon evoluciona a Leavanny por amistad con su entrenador, subiendo un nivel. Leavanny no evoluciona."
,"");
insert into pokemon values (48, 'Leavanny', 20.5,1.2,"De carácter afable y marcado instinto protector. Las hojas de sus brazos son tan afiladas que pueden rebanar un gran árbol con un solo corte."
,"Su nombre puede estar basado en el apócope de 'leaves' ('hojas' en inglés) y la palabra inglesa 'nanny', que significa niñera, ya que estos Pokémon se encargan de los pequeños Sewaddle e incluso fabrican las hojas de las cabezas que estos usan.

Su nombre japonés, Hahakomori, puede provenir de los términos japoneses 母 (Haha, 'madre') y 小森 (Komori, 'niñera'). También puede venir de 母 (Haha, 'madre'), 小 (Ko, 'niño') y 森 (Mori, 'bosque')."
,"Leavanny parece estar basado en un insecto hoja, pero también se asemeja a una mantis religiosa; además, su apariencia es similar a la del maíz, reflejando más su tipo planta. Este Pokémon usa sus hojas y disparo demora para hacer las hojas que usan los Sewaddle en su cabeza. Durante la noche duerme en nidos que construye con grandes hojas.

Este Pokémon es conocido por cuidar de Pokémon y humanos con mucho frío o se encuentran en necesidad de ayuda. Hacen ropa con hojas de seda y con su propio adhesivo con sus manos, que se parecen a agujas de coser. Cuando ven a un Pokémon pequeño, hacen ropa para que se abriguen. También calientan los huevos fermentando las hojas caídas y hacen mantas de hojas para envolver a los Sewaddle. Confeccionan ropa para que cuando Sewaddle eclosione, este la pueda utilizar. A pesar de sus predisposiciones maternales, Leaveanny también puede ser de género masculino."
,"Leavanny no evoluciona."
,"");
insert into pokemon values (49, 'Venipede', 5.3,0.4,"Aunque se trata de una especie emparentada con los Sizzlipede, si se encuentran ejemplares de ambas, entablarán una lucha encarnizada."
,"Hace referencia a 'Venom' que quiere decir Veneno en inglés, y la palabra 'Centipede' que significa Ciempiés , una clase de artrópodo con muchos pares de patas, el cual es el animal en el que está basado."
,"Por su cuerpo corre un veneno muy letal que hasta sus enemigos mortales, las aves gigantes, temen. Este Pokémon tiene una naturaleza brutalmente agresiva. Explora su entorno y halla a sus presas mediante la detección de vibraciones en el aire con las antenas en su cabeza y cola."
,"Venipede evoluciona a Whirlipede en el nivel 22. Whirlipede evoluciona a Scolipede en el nivel 30. Scolipede no evoluciona."
,"");
insert into pokemon values (50, 'Whirlipede', 58.5,1.2,"Gira a gran velocidad y carga contra sus rivales. Puede alcanzar los 100 km/h."
,"Su nombre proviene de las palabras Whirl que significa 'remolino' o hace referencia a algo que gira y pede, sufijo que refiere a la palabra inglesa 'Centipede' que significa Ciempiés."
,"Es un Pokémon agresivo similar a un Oniscidea. Está protegido por su caparazón/exoesqueleto duro y segmentado, que posee dos cuernos frontales y dos traseros lo que le permite girar a grandes velocidades como una rueda y enfrentarse a sus enemigos aunque normalmente esto no sucede, ya que sólo se mueven cuando son atacados. Su táctica es similar a la de Donphan."
,"Whirlipede evoluciona a Scolipede en el nivel 30. Scolipede no evoluciona."
,"");
insert into pokemon values (51, 'Scolipede', 200.5,2.5,"Usa las garras que le sobresalen del cuello para atrapar a su presa, golpearla contra el suelo y rematarla inoculando un potente veneno."
,"Su nombre proviene de la palabra inglesa 'Scolopendra' que significa Escolopendra, que es un artrópodo venenoso con cuernos en ambos extremos de su cuerpo, además el sufijo '-Pede' refiere a la palabra inglesa 'Centipede', que significa Ciempiés en inglés, al igual que lo llevan sus preevoluciones.

Su nombre japonés Pendora podría hacer referencia al artrópodo recién mencionado, aunque también podría venir del nombre de la diosa y primera mujer Pandora ya que ésta abrió la caja que contenía las desgracias y este Pokémon suele causar caos."
,"Al igual que sus anteriores evoluciones, Scolipede está inspirado en una escolopendra; lo que parecían antenas en Whirlipede se transformaron en la parte delantera y trasera de Scolipede. Aunque también guarda un cierto parecido con Drapion ya que ninguno muestra piedad con nadie, aunque también es probable que este basado en una arthropleura que era un milpiés prehistórico gigante de 2 metros.

También podría estar basado en el Aka Allghoi Khorhoi, un monstruoso ciempiés gigante del desierto de Mongolia, que es capaz de rociar ácido a sus víctimas. Ambos poseen el mismo color y son bichos gigantes.

Persigue a sus enemigos con movimientos rápidos y ataca con los cuernos de su cabeza. No muestra piedad hasta que da el golpe final. Las garras de su cabeza (que parecen antenas) contienen un veneno mortal y muy dañino. Tiene un carácter muy agresivo, y no le gusta que invadan su territorio.

Este Pokémon es caracterizado por su impiedad y actitud feroz, aunque no siempre es así, ya que cuando le pertenece a un entrenador, el cual lo haya tenido desde que era un Venipede, este será el más fuerte y codiciado de su equipo. Esto no sucede en estado salvaje, ya que toparse con uno no sería nada bueno.

Estas criaturas son verdaderos monstruos y en algunas culturas primitivas fueron considerados criaturas celestiales y se les adoraba. Mientras que en otras culturas fueron catalogados como demonios malignos, siendo Pokémon incomprendidos porque es su naturaleza ser agresivos, lo que provocó una gran disminución de estos Pokémon ya que se les aniquilaba."
,"Scolipede no evoluciona."
,"");
insert into pokemon values (52, 'Cottonee', 0.6,0.3,"Los edredones y almohadas rellenos del algodón que suelta Cottonee son un producto de alta calidad por su ligereza y transpirabilidad."
,"Su nombre proviene de las palabras en inglés cotton (algodón) y 'wee' (pequeño). También puede ser una deformación de cottony (algodonoso)."
,"Cottonee esta basado en una planta de algodón. Sus ojos anaranjados tienen forma ovalada y a sus costados tiene dos hojas, que simulan un par de alas. En la parte de atrás destaca un cáliz estrellado de color verde, parecido al de la planta del que está basado.
Suele vivir en los campos de algodón y sacan su energía de los rayos solares. Al igual que Hoppip, Skiploom y Jumpluff, Cottonee se deja llevar por las corrientes de aire ascendentes debido a su también escaso peso. Esto se dificulta cuando llueve, ya que si se moja se torna más pesado y por ende le imposibilita su desplazamiento; para no sufrir estas dificultades se guarecen en los árboles hasta que escampe o se sequen.

Tiene como mecanismo de defensa expulsar cantidades de algodón de su cuerpo, usando esto como señuelo y poder escapar. La mayor parte del tiempo los Cottonee se mantienen en pareja, por eso encontrar un Cottonee solo es muy difícil, y más en época de apareamiento cuando se aglomeran en grupos tan copiosos que parecen nubes a la deriva. Un espectáculo maravilloso apreciado por muchas personas."
,"Cottonee evoluciona a Whimsicott exponiéndolo a una Piedra solar. Whimsicott no evoluciona."
,"");
insert into pokemon values (53, 'Whimsicott', 6.6,0.7,"Es capaz de atravesar las más mínimas fisuras cual soplo de viento. A su paso, deja pelusillas blancas."
,"Su nombre procede de las palabras en inglés whimsical (caprichoso) y cotton (algodón).

Su nombre en japonés, Elfuun procede de la palabra inglesa elf (elfo) y de 風 fū (viento)."
,"Al igual que Cottonee, Whimsicott esta basado en la planta del algodón. Tiene una gran bola de algodón que simula ser su pelo y un par de rizos verdes a los costados de su cabeza, parecidos a zarcillos. Al beber agua esta bola crece hasta 3 metros de altura.

Son extremadamente juguetones, con la gente y Pokémon por igual, su algodón le permite planear cuando cae desde muy alto, haciendo un efecto de paracaídas. Whimsicott es capaz de manipular la forma de su cuerpo para atravesar hendiduras y grietas muy pequeñas. A causa de tener tanto algodón es natural que estos lo esparzan al andar. Es inmanente su carácter de bromista, le gusta cambiar las cosas de lugar y provocar confusión. Hace su aparición mediante torbellinos que los transportan."
,"Whimsicott no evoluciona."
,"");
insert into pokemon values (54, 'Petilil',  6.6,0.5,"Las hojas de su cabeza vuelven a crecer rápidamente aunque se caigan. A pesar de ser amargas, restablecen la vitalidad."
,"Su nombre combina las palabras petit (pequeño en francés) y lily (lirio en inglés)."
,"A Petilil le agradan los suelos ricos en nutrientes. Vive y crece en los cultivos que se plantan en esta clase de terrenos. Es una dichosa señal que en los campos habiten Petilil, ya que esto quiere que su producción será excelente.

Por ello se dice que si se ven estos Pokémon en una huerta, es signo de buena cosecha. Algunos suelen utilizar las amargas hojas que coronan su cabeza para recuperar las energías perdidas. Petilil no posee una contraparte masculina, es netamente femenino."
,"Petilil evoluciona a Lilligant dándole una piedra solar. Lilligant no evoluciona."
,"");
insert into pokemon values (55, 'Lilligant', 16.3, 1.1,"El aroma que despide la flor de su tocado tiene efectos tranquilizantes, pero este Pokémon requiere muchos cuidados."
,"Su nombre proviene de las palabras en inglés lily (lirio) y elegant (elegante).

Su nombre japonés, Dredear, procede de las palabras en inglés dress (vestido) y dear (cariño)."
,"Tiene una gran flor de color rojizo sobre la cabeza con unos estambres similares a una corona. Tiene unas hojas en la cabeza simulando unos cabellos y otra muy grande que le tapa todo el cuerpo por la espalda, a modo de melena. Tiene otras hojas en el cuello, otras dos formando sus brazos y otras más grandes que le nacen en la cintura y forman una falda.
Lilligant está basado en un ornamento floral. La flor de su cabeza está inspirada en una azucena y sus hojas recuerdan al naranjo.

El aroma de las flores en su cabeza tiene un efecto relajante, pero si alguien las recorta al instante se marchitan. Tiene apariencia de reina, y debido a su belleza y elegancia es un Pokémon muy buscado tanto para combatir como para los concursos.
Es de naturaleza dócil y por lo general se lleva muy bien con otros Pokémon. Suelen ser excelentes compañeras y muy fieles con sus entrenadores, a los que protegerán sin dudarlo contra cualquier enemigo."
,"Lilligant no evoluciona."
,"");
insert into pokemon values (56, 'Basculin', 18,1,"Un Pokémon agresivo y feroz cuya fortaleza y capacidad de adaptación le permiten multiplicar su número rápidamente."
,"Su nombre proviene de las palabras inglesas bass (róbalo o lubina) y masculin (masculino).

Su nombre japonés, Bassrao, procede de la palabra inglesa bass (róbalo o lubina) y de 丈夫 masurao (guerrero)."
,"Basculin está basado en una mezcla de una lubina y una piraña con aletas muy afiladas. Tiene dos formas distintas alternativas, una es roja con pinchos en las aletas y la otra es azul con las aletas un poco mas afiladas que lo normal. Se diferencian en el color de sus ojos (el mismo que el de la línea que tienen en su cuerpo), la forma de estos y en las aletas. Muestra un gran parecido con la Baya Rautan. Ambas formas están basadas en el tamaño de las bocas de dos tipos de lubinas, la forma raya azul está basada en lubinas de boca pequeña, y la forma raya roja en lubinas de boca grande."
,"Basculin de forma raya roja y forma raya azul no tiene evolución ni evoluciona de ningún Pokémon."
,"");
insert into pokemon values (57, 'Sandile', 15.2,0.7,"Se desplaza sumergido bajo la arena, como si nadase. Así se esconde de sus enemigos y evita que descienda su temperatura corporal."
,"El nombre de Sandile viene de sand (arena en inglés) y crocodile (cocodrilo en inglés)."
,"Está basado en un cocodrilo del nilo. Este Pokémon se alimenta de Pidove o Rufflet. Es muy territorial y se encuentra en desiertos de Teselia donde es difícil de ver. Su capacidad de regenerar sus dientes es asombrosa. El color de su piel le ayuda a camuflarse en la arena. Su presa favorita es Blitzle, ya que se ha avistado a un gran grupo de Sandile y de sus evoluciones atacando a Blitzle y a su evolución. Se caracterizan por sus ojos en forma de gafas de sol, lo cual hace una plena referencia a que donde habita hace un calor extremo. Se esconde en la arena para que su cuerpo no se enfríe. Se mueve por las madrigueras de la arena con sólo sus ojos y la nariz por encima de la superficie. Una membrana negra protege a sus ojos. Se suelen poner en territorios hasta que evolucionan y se trasladan a zonas más amplias. Son muy buenos trabajando en equipo."
,"Sandile evoluciona a Krokorok en el nivel 29. Krokorok evoluciona a Krookodile en el nivel 40. Krookodile no evoluciona."
,"");
insert into pokemon values (58, 'Krokorok', 33.4,1,"Gracias a la membrana que recubre sus ojos, pueden ver incluso de noche. Viven en pequeñas manadas."
,"Su nombre parece ser una modificación de la palabra inglesa 'Crocodile' que significa Cocodrilo, solo que se cambian las C por K y la palabra rock (roca en inglés)."
,"Krokorok parece estar basado en un cocodrilo, aunque aparenta más un gavial,tambien podría estar basado en un Caiman de anteojos por su mascarilla . Se parece mucho a Sandile pero está de pie y es un poco más grande.
Este Pokémon nunca se separa de su manada, compuesta de varios Sandile. Las membranas que tiene en sus ojos lo protegen en las tormentas de arena de los desiertos, y dado que la membrana especial alrededor de su globo ocular percibe el calor del cuerpo, puede ver su entorno, incluso en la oscuridad. Suele cazar a Blitzle cuando corre por la arena. Aunque en esta etapa joven su presa por excelencia es Servine, ya que todos los Pokémon de aspecto de reptil son muy territoriales y si alguien con aspecto de reptil pasa, lucharán día y noche hasta que alguien caiga derrotado, o devorado.

Krokorok vive en el desierto, y raramente en montañas. Este Pokémon se esconde en la arena por lo que no es fácil verle, esta técnica la usa también para cazar. Vive en manadas."
,"Krokorok evoluciona a Krookodile en el nivel 40. Krookodile no evoluciona."
,"");
insert into pokemon values (59, 'Krookodile', 96.3,1.5,"En cuanto le hinca el diente a su presa con sus potentes mandíbulas, retuerce el cuerpo con violencia hasta despedazarla."
,"Su nombre viene de crocodile (cocodrilo en inglés) y crook (ladrón o estafador en inglés).

Su nombre en japonés es una combinación de las palabras waru (malvado) y gavial.

Su nombre en francés proviene de las palabras crocodile y horrible.

Su nombre en alemán podría provenir de las palabras rabiat (sin escrúpulos) y alligator (aligátor)."
,"Krookodile está basado en un gavial. Es un gran cazador de vista excelente, pero de todos modos recibe la ayuda de sus preevoluciones para poder cazar a sus presas, las cuales habitan en las arenas movedizas del desierto. Nunca deja que su presa se escape. Su mandíbula tiene suficiente fuerza como para morder casi lo que sea, incluso podría destrozar la carrocería de un coche. Sus ojos pueden magnificar las cosas que están lejos, al igual que un par de prismáticos. Puede ser muy protector con los Krokorok y los Sandile.

Ahora en su etapa adulta, este Pokémon ya puede cazar presas mayores. No soporta el agua y evita encontrarse con Pokémon fuertes de dicho tipo. Se dice que si realmente respeta a su entrenador se enfrentara a cualquier peligro sin dudar. Se entierra en la arena dejando solo sus ojos expuestos hasta que su presa pase cerca de él, para atraparla con su enorme boca. Al igual que sus preevoluciones, no importa que la arena le toque los ojos porque los protege una membrana. Posee una especie de máscara en sus ojos, similar a un antifaz que le da un aspecto siniestro."
,"Krookodile no evoluciona."
,"");
insert into pokemon values (60, 'Darumaka', 37.5,0.6,"Como sus excrementos están muy calientes, la gente de antaño se los metía en los bolsillos para calentarse."
,"Su nombre proviene de ダルマ Daruma, un muñeco tradicional japonés que representan al fundador y patriarca del Zen; También podría estar formado por la palabra 'Dharu', palabra sánscrita que significa: ley natural, conducta adecuada o virtud. 'Ka' posiblemente provenga del término japonés 火 que significa fuego o estar hecho de fuego."
,"Su cuerpo es pequeño y redondo, con tonos rojos y amarillos. Está basado en un muñeco Daruma, un tipo de juguete japonés que representa a un personaje importante en Japón, al igual que Darmanitan.
Cuando un Darumaka se duerme, esconde sus brazos y sus patas, por lo que se dice que cuando está dormido no habrá nada que lo despierte; pero cuando está despierto es un Pokémon muy activo."
,"Darumaka evoluciona a Darmanitan al nivel 35. Darmanitan no tiene evolución."
,"");
insert into pokemon values (61, 'Darmanitan', 92.9,1.3,"Cuando resulta gravemente herido, se endurece como una piedra y medita para agudizar la mente."
,"Su nombre en inglés es una combinación de daruma y orangután.

Su nombre en francés proviene de daruma y macho.

Su nombre en japonés está formado por las palabras ヒヒ hihi (babuino o papión) y ダルマ daruma."
,"Está basado en un babuino con rasgos de un muñeco daruma japonés, pero parece estar más basado en un orangután debido a su color de pelo y su forma. Vive en lugares áridos, como desiertos, sabanas o montañas de poca altura, aunque también puede vivir en bosques poco profundos en los que llueva poco. Es un Pokémon misterioso. Cuando está debilitado cambia su forma a modo daruma, cuando está en modo daruma sus ataques especiales aumentan y sus ataques físicos disminuyen, sus poderes psíquicos también aumentan, y cuando está en modo normal, Darmanitan es bastante energético y activo."
,"Darmanitan no tiene evolución."
,"");
insert into pokemon values (62, 'Maractus', 28,1,"Emite un sonido parecido a unas maracas. Se mueve con un ritmo marchoso para sorprender a los Pokémon pájaro, que huyen espantados."
,"Su nombre proviene de una combinación entre la palabras maraca, y cactus tanto en español como en inglés."
,"Maractus está basado en un nopal, con una sola pierna, dos brazos con pinchos amarillos en los extremos y unas extremidades en la cabeza, que se asemejan a unas coletas, o bien unos cuernos, con flores rosadas en las puntas, algo notable en Maractus, las cuales le dan un aspecto algo femenino. Tiene cierta similitud con Cacnea y Cacturne, pues están basados en plantas cactáceas. Cuando se mueve en forma rítmica emite el sonido de unas maracas. También aleja a los Pokémon ave que traten de alimentarse de este, tambaleandose fuertemente, haciendo el sonido similar a las maracas."
,"Maractus no tiene evolución ni evoluciona de ningún Pokémon."
,"");
insert into pokemon values (63, 'Dwebble', 14.5,0.3,"Cuando halla una piedra de su agrado, la horada y establece su morada. Es enemigo natural de los Roggenrola y los Rolycoly."
,"Su nombre proviene de las palabras inglesas dwell (habitar) y pebble (piedrecita)."
,"Este Pokémon busca una piedra y usando sus garras y un líquido que sale de su boca, la moldea hasta formarla en el caparazón que será su hogar. Esta piedra sirve para protegerle y también para atacar. Al parecer algunos Dwebble atacan a otros para robarle sus piedra-caparazones y ponerlas sobre los suyos, pegándolas con su saliva, de esta forma demuestran que son más fuertes. Su debilidad es que, si pierden su caparazón no pueden usar protección, dejándolo vulnerable."
,"Dwebble evoluciona a Crustle en el nivel 34. Crustle no evoluciona."
,"");
insert into pokemon values (64, 'Crustle', 200,1.4,"Este Pokémon posee un fuerte instinto territorial y prefiere los entornos áridos. Los días de lluvia permanece en el interior de su roca."
,"Su nombre proviene de las palabras inglesas crust (corteza terrestre), castle (castillo) y posiblemente de crustacean (crustáceo).

Su nombre en japonés proviene de iwa (roca en japonés) y palace (palacio en inglés)."
,"Crustle parece estar basado en un cangrejo ermitaño con una concha en forma de placa terrestre. Este Pokémon se entierra de modo que solo se le vea el caparazón, así puede comer los cultivos de las huertas. Cuando está en una cueva se esconde bajo tierra para absorber los minerales de la tierra y sobrevivir hasta salir de allí. Se disputan el territorio peleando con otros machos, el que le rompa la concha primero gana."
,"Crustle no evoluciona."
,"");
insert into pokemon values (65, 'Scraggy', 11.8, 0.6,"Se sube la piel arrugada hasta el cuello para protegerse. Parece que los ejemplares con la piel más larga son los más respetados."
,"Su nombre puede derivar de la palabra scrappy (pendenciero) o scruffy (andrajoso, desaliñado) y la combinación de la palabra baggy que significa holgado o suelto, como la piel que siempre tiene que sujetar. Ademas, el sonido de su nombre se asemeja a scary (tenebroso o espantoso) por su tipo siniestro o simplemente, su nombre proviene de la palabra scraggy, flaco o áspero."
,"Aunque no es un animal definido, Scraggy parece estar basado en alguna especie de gecónido desértico terrestre (posiblemente un eublepharis).

Al igual que dichos lagartos, los Scraggy mudan la piel conforme crecen, pero a diferencia de los demás reptiles, retienen la piel suelta de su anterior muda como si de un abrigo se tratase. Es por esto que cuando el Pokémon evoluciona en Scrafty, este mantiene la piel vieja de su anterior muda (es decir de cuando era un Scraggy). La muda lo protege del calor, la arena y los depredadores.

Vive generalmente en el desierto, escondido en madrigueras subterráneas que hacen ellos mismos. Por la noche sale al exterior para buscar alimento, una parte la esconde en su madriguera para los días en los que hay tormentas de arena.

Es muy agresivo, problemático y caótico, embiste a todo Pokémon o persona que se le acerque con su movimiento golpe cabeza, usando esta como arma, debido a que suele tener las manos ocupadas en sujetarse la piel. Le gusta iniciar peleas pero le cuesta trabajo aceptar la derrota, busca estar sólo y cuando alguien se acerca le da la espalda, pero aun así no tiene problema en obedecer a su entrenador."
,"Scraggy evoluciona a Scrafty al nivel 39. Scrafty no evoluciona."
,"");
insert into pokemon values (66, 'Scrafty', 30, 1.1,"Ataca en grupo con virulencia a todo aquel que se interne en su territorio. Lanza ácido por la boca."
,"Su nombre puede provenir del inglés scrappy (pendenciero), scruffy (andrajoso, desaliñado), scary (escalofriante) o scarf (bufanda) por la bufanda que tiene hecha de su piel, y la combinación con la palabra crafty (pícaro o astuto en inglés) o kraft / kräftig (fuerza/fuerte en alemán)."
,"Físicamente Se asemeja a una lagartija por tener sus ojos separados, una cresta y una larga cola, al mismo tiempo que también asemeja a un maliante por su capucha y cresta que guarda parecido con un corte de cabello punk . Se agarra a lo que puede ser la muda de su preevolución Scraggy. Al igual que Scraggy, la piel le sirve de protección y es el motivo por el que no se desprenda de ella. Este Pokémon ataca en grupo a sus presas y rivales lanzando ácido por la boca, el líder de este grupo suele ser el Scrafty con la cresta más larga."
,"Scrafty no evoluciona."
,"");
insert into pokemon values (67, 'Sigilyph', 14,1.4,"Vuela gracias a sus poderes psíquicos. Dicen que había sido la deidad protectora de una antigua ciudad, si bien otros creen que era su mensajero."
,"Su nombre en inglés, mezcla las palabras Sigil que es una especie de símbolo mágico y la palabra inglesa hieroglyph que significa jeroglífico, la escritura de algunas culturas antiguas como la de Nazca, Perú que está hecha en base de símbolos.

Su nombre japonés tiene parecido a シンボル (símbolo) lo que puede explicar la forma de este Pokémon."
,"Se dice que hace mucho tiempo una ciudad antigua cayó y este Pokémon fue encomendado para proteger esta ciudad expulsando a los invasores con sus poderes psíquicos."
,"Sigilyph no tiene evolución ni evoluciona de ningún Pokémon."
,"");
insert into pokemon values (68, 'Yamask', 1.5,0.5,"Merodea todas las noches entre ruinas. Se dice que la máscara que lleva replica su antiguo rostro humano."
,"Su nombre está compuesto por 'Yama' el dios de la muerte de las mitologías hinduistas y budistas, además de la palabra 'Mask', máscara en Inglés.

Su nombre japonés está compuesto por 'Desu', Death en inglés y muerte en español, y 'Masu', Mask en inglés y máscara en español."
,"En su estómago posee una máscara que pasará a ser la frente de su evolución, Cofagrigus. La máscara que lleva Yamask representa su cara de cuando era humano. De vez en cuando la observa entre sollozos. Su máscara es muy importante para él, si un Yamask pierde su máscara, este hará lo que sea para recuperarla, incluso embrujar todo lo que se le interponga. Es común encontrarlo en ruinas y sepulturas ya que Yamask y su evolución solían acompañar a reyes y faraones. A veces su máscara es confundida con réplicas por lo cual también es común encontrarlo en museos tratando de recuperarla."
,"Yamask evoluciona a Cofagrigus en el nivel 34. Cofagrigus no evoluciona."
,"");
insert into pokemon values (69, 'Cofagrigus', 76.5,1.7,"Su cuerpo es de rutilante oro. Se dice que ya no recuerda nada de su pasado como humano."
,"Su nombre proviene de la combinación de las palabras coffin (ataúd en inglés), sarcofagus (sarcófago en inglés) y egregious (atroz en inglés).

Su nombre en francés 'Tutankafer', proviene de Tutankamon, un faraón del antiguo Egipto, y de la palabra féretro en español.

Su nombre en japonés viene de desu, sufijo que se utiliza para decir death (muerte en inglés) y kaan que viene de 'Sekkan', que en japonés significa 'sarcófago'."
,"Cofagrigus es un sarcófago de color azul y amarillo con los ojos rojos, un rostro amenazante, con cuatro manos que parecen ser sombras. Tiene unos blancos colmillos agudos que le hacen crear una sonrisa burlona, y tiene patrones llamativos. También parece que estuviese bañado en oro.
Ya desde antiguas leyendas, se cuenta que Cofagrigus podía comer seres humanos y convertir sus cuerpos sin vida en momias. Para ello imita un ataúd elegante para atraer a los incautos ladrones de tumbas para luego sancionarlos. También tiene la habilidad de formar dos pares de brazos que puede esconder como forma de defensa. Su verdadero rostro está cubierto por unas piezas que se deslizan hacia afuera cuando Cofagrigus se despierta. Tiene cuatro brazos de los cuales puede utilizar dos para detener a su rival y atacarlo con los otros dos brazos.

Cofagrigus y su pre-evolución eran los compañeros de reyes y faraones por lo que no es de extrañar encontrarlos en pirámides o en ruinas.
El ataúd de Cofagrigus es su armadura, y está hecho con una buena cerámica resistente al calor."
,"Cofagrigus no evoluciona."
,"");
insert into pokemon values (70, 'Tirtouga', 16.5,0.7,"Vivía en los mares de hace millones de años. Sale a tierra para buscar presas, aunque solo se pueda desplazar reptando."
,"Su nombre puede provenir de la palabra 'tortuga' o bien de la palabra italiana homóloga tartaruga. Su nombre japonés puede venir de proto ('primero') ya que es un Pokémon fósil, y 'tortuga'.

Su nombre francés, Carapagos, proviene de la unión de las palabras carapasse ('caparazón') y Galapagos, lo cual hace referencia al género extinto en la cual Tirtouga está basado, Protostega."
,"Parece estar inspirado en un tipo de tortugas marinas ya extintas, de las que solo se preservan los fósiles, la tortuga Archelon. Este Pokémon extinto se alimentaba de algas del fondo del mar. Es un Pokémon fósil cariñoso y pacífico."
,"Tirtouga evoluciona a Carracosta al nivel 37. Carracosta no evoluciona."
,"");
insert into pokemon values (71, 'Carracosta', 81,1.2,"Devora incluso los huesos y caparazones de sus presas, por lo que el suyo propio se vuelve duro y grueso."
,"Su nombre parece estar basado en la palabra 'carapace' que quiere decir 'caparazón' en inglés y la palabra 'Costa' que es donde este Pokémon habitaba. Probablemente esté basado en una puppigerus crassicostata, una especie de tortuga prehistórica ya extinta o el género archelon, también extinto."
,"Vivían en los mares. Lideraban grupos de hasta 20 Tirtouga. Se conoce, por los fósiles, que tenían un gran caparazón. Eran lentos, pero peligrosos, y aparte su mordisco era letal. Se alimentaban de algas y mariscos como Krabby o Lileep. Donde vivían había un clima cálido pero húmedo, lo que hacia que los animales marinos y acuáticos prosperaran favorablemente en los ecosistemas más antiguos del mundo Pokémon."
,"Carracosta no evoluciona."
,"");
insert into pokemon values (72, 'Archen', 9.6,0.5,"Fue regenerado a partir de un fósil. Tal y como apuntaban las investigaciones, no puede volar, pero los saltos son su punto fuerte."
,"Su nombre proviene de archaeopteryx, un tipo de aves primitivas que vivieron aproximadamente hace 170 y 150 millones de años."
,"Archen tiene la apariencia de un archaeopteryx, un ave primitiva, o un microraptor, un dinosaurio emplumado que vivió a principios del cretácico (hace entre 135 y 125 millones de años).

Los Archen vivían en bosques o montañas rocosas junto a los Archeops. Saltaban de rama en rama para poder desplazarse rápidamente. A diferencia de Archeops, Archen era incapaz de volar, por eso cuando lograba poder volar evolucionaba. Se dice que es el Pokémon pájaro primigenio, por lo que todos los Pokémon de tipo volador que existen hoy en día descienden de Archen.

Su plumaje es principalmente amarillo con tonos marrón, lo que les ayudaba a camuflarse en las selvas y en las montañas donde habitaba, esto les servía para esconderse de sus enemigos y depredadores, y también para cazar a sus presas.

Su comportamiento es el de un Pokémon dócil y juguetón, no prestaba mucha atención a su alrededor y a la hora de cazar atacaba rápidamente para alimentarse lo antes posible."
,"Archen evoluciona a Archeops en el nivel 37. Archeops no evoluciona."
,"");
insert into pokemon values (73, 'Archeops', 32,1.4,"Coge carrerilla durante aproximadamente 4 km a una velocidad de 40 km/h para poder levantar el vuelo."
,"Su nombre deriva de la palabra archaeopteryx, la primera especie de ave conocida que vivió aproximadamente hace 155 y 150 millones de años en las selvas prehistóricas."
,"Archeops está basado en un archaeopteryx, un género de aves primitivas que vivieron en el Jurásico superior aunque también podría representar a quetzalcóatl, una divinidad prehispánica que se la representaba como una serpiente emplumada voladora.
Archeops era un Pokémon muy temido, corría largas distancias fácilmente. Era tan rápido que se le considera como uno de los Pokémon más rápidos que han existido. Le gustaba correr rápidamente para salir volando con sus compañeros. Era mejor corriendo que volando, aunque eso no era un impedimento para volar. Vivían en bosques o en montañas rocosas donde esperaban a una presa para cazar. Sus bandadas eran grandes conformadas también por Archen.

Corrían por los bosques en grupo, y a la hora de volar no perdían la oportunidad de alimentarse de los Pokémon desprevenidos que estaban en su camino. Era audaz y muy fiero en sus batallas, hasta que llegó la extinción."
,"Archeops no evoluciona."
,"");
insert into pokemon values (74, 'Trubbish', 31,0.6,"Le gustan los lugares insalubres. Puede llegar a establecerse en las casas de aquellas personas que no hagan la limpieza con regularidad."
,"Su nombre occidental viene de trash y rubbish dos maneras de decir basura en inglés.

Su nombre en japonés podría provenir de 破れた (Yabureta) que significa roto en japonés y クロノ (kurono) que significa crono de la mitología griega en japonés."
,"Trubbish tiene la apariencia de una bolsa de basura a la que se le sale la basura por los lados, que hace de brazos similares a tentáculos. Le gustan mucho los lugares sucios y contaminados, un ejemplo de ello es que, generalmente, este Pokémon vive en rutas cerca a ciudades, como la Ciudad Mayólica, como si estuvieran muy contaminadas. Se dice que aparece en los suburbios de las grandes ciudades, donde se amontona la basura. Algún trabajador de limpieza distraído puede confundirlo, lo que molesta mucho a Trubbish. Sin embargo es un Pokémon muy amigable y curioso con su entrenador. Las hembras no tienen un toque fuerte de olor pero los machos sí. Se cree que cuando se deja la basura mucho tiempo abandonada nace este Pokémon; raramente por mutaciones que sufre la basura por dentro de la bolsa. También se cree que nacen cuando se exponen a los rayos de la luna o por rayos gamma, pero dichas teorías aún no han sido comprobadas."
,"Trubbish evoluciona a Garbodor en el nivel 36. Garbodor no evoluciona."
,"");
insert into pokemon values (75, 'Garbodor', 107.3,1.9,"Su cuerpo transforma la inmundicia que engulle en un veneno cuya composición cambia según la basura ingerida."
,"Su nombre proviene de garbage (basura en inglés) y odor (olor en inglés).

Su nombre en francés, Miasmax, proviene de miasma, que según la teoría con el mismo nombre, es el olor que emana de los cuerpos enfermos."
,"Es una bolsa de basura rota. Tras la evolución, este Pokémon aumenta la cantidad de residuos que lo componen, desquebrajando su piel en forma de bolsa, y finalmente, rompiéndola, expulsando residuos al exterior. Su viscosidad y hedor es más fuerte que el de un Muk por sus residuos de basura. Extrañamente, las hembras no desprenden tanto olor y tienen un toque menos desagradable, puesto que los machos, desde que nacen, huelen un poco más fuerte, pero si desde que era un Trubbish, le enseñas a controlar sus olores, su olor no es como el de uno salvaje, es menos desagradable. Pero el olor de los salvajes es muy fuerte lo que provoca un problema en las ciudades, porque a veces se meten en edificios buscando comida."
,"Garbodor no evoluciona."
,"");
insert into pokemon values (76, 'Zorua', 12.5,0.7,"Se transforma en otros para crear desconcierto. A menudo, adopta la forma de un niño parco en palabras."
,"Su nombre es una mutación de la palabra española Zorro.

Su nombre en japonés, わるぎつね está formada por las palabras わる (malvado) y ぎつね (zorro)."
,"Suele vivir cerca de su evolución Zoroark, éste es muy protector cuando se trata de Zorua; por ello básicamente se suele ocupar de él en sus primeros meses de vida, y cuando Zorua haya alcanzado el nivel suficiente como para impresionarlo, será entonces cuando Zoroark decida desaparecer para poder comprobar si Zorua se puede ocupar de sí mismo. Cuando eso ocurra, Zoroark utilizará su habilidad para atraer entrenadores hacia Zorua para que sea capturado, bien entrenado y criado.

El pequeño Zorua se asemeja a una cría de zorro, como es de tipo siniestro esto se debe resaltar en su apariencia. Es de color negro grisáceo, tiene algunos toques bordó y un simpático copito en la parte superior de su cabeza, asemejado al peinado de Chili/Zeo. Tiene un collarín de pelo en el cuello, un poco más oscuro que el resto de su cuerpo, el cual será su pelaje permanente cuando evolucione a Zoroark. Sus ojos son azul claro y cuando va usar su habilidad se vuelven celestes y brillan, cosa que se acentúa cuando evoluciona."
,"Zorua evoluciona a Zoroark en el nivel 30. Zoroark no evoluciona."
,"");
insert into pokemon values (77, 'Zoroark', 81.1,1.6,"Se dice que Zoroark atrapa en un mundo de ilusiones a quien lo intenta capturar y que, de esta manera, lo castiga."
,"Su nombre, Zoroark, posiblemente sea una combinación de la palabra en español zorro y la palabra en inglés dark (oscuro). Algo parecido ocurriría entonces con Zorua.

Su especie en japonés, ばけぎつね, está formada por las palabras ばけ (ilusión, aparición, espectro) y ぎつね (zorro)."
,"Zoroark se encuentra entre los Pokémon más raros del mundo. No sólo por sus habilidades únicas e increíbles que los destacan del resto sino también por la dificultad que conlleva encontrarlos y atraparlos.
Zoroark está basado en los kitsunes, unos zorros mágicos que tenían entre tantas habilidades la capacidad de hablar el lenguaje humano y transformarse en ellos, tal y como lo hace Zoroark gracias a su habilidad ilusión. Por dicha habilidad, Zoroark es conocido como el maestro/rey de las ilusiones. Puede utilizar esta habilidad no sólo para transformarse en cualquier criatura, sino también para inducir a cualquier Pokémon o humano en una ilusión tan real que, a menos que él quisiera, nunca se darían cuenta de que están presenciando una ilusión. Esta habilidad puede ser utilizada tanto para el ataque como para la defensa. Por dicha habilidad es que los Zoroark son tan difíciles de atrapar, ya que para evitar ser descubiertos adoptan en su estado salvaje la forma de otros Pokémon, lo que los hace de los Pokémon más evasivos de todos. Algo similar pasa con Mew.

En cuanto a su faceta de padre/madre es de los Pokémon más protectores, tanto como los Kangaskhan. No dudará en embrujar a sus enemigos para proteger a su camada, y si fuera necesario daría su vida para protegerlos. Los Zoroark también son así de protectores con sus entrenadores, por lo que se los consideran como uno de los Pokémon más fieles.

Otra cosa a destacar sobre su carácter es que dejaron atrás su naturaleza juguetona y traviesa que tenían cuando eran Zorua. Ahora son más calmados y serenos, demostrando así su madurez al evolucionar.

A pesar de estar inspirado en un kitsune, el color gris oscuro de Zoroark (y algunos otros rasgos, como la falta de cola) lo asemejan bastante a un licántropo (hombre lobo)."
,"Zoroark no evoluciona."
,"");
insert into pokemon values (78, 'Minccino', 5.8,0.4,"Tras usar la cola para limpiar su madriguera o su propio cuerpo, se pasa un día entero lavándosela con agua de manantial."
,"Su nombre en inglés viene de mink ('visón', en referencia a su piel) y chino (un tipo de tela de algodón).

El nombre japonés proviene de チンチラ (Chillarmy), que significa, literalmente, chinchilla, mamífero roedor en el que está basado; y 'charmy', encantador en inglés."
,"Estos Pokémon son extremadamente limpios. Si ven que algo está sucio inmediatamente se acercan a limpiarlo con su cola hasta que quede brillante. Les encanta limpiar todos los objetos que encuentran sucios y después los guardan para quedarse con ellos. Son muy populares por su astucia y dulzura y su ágil cuerpo le permite trepar y correr muy rápido por los bosques, donde esperan a que aparezcan transeúntes para robarles sus pertenencias, limpiarlas y quedárselas."
,"Minccino evoluciona a Cinccino con una piedra día. Cinccino no evoluciona."
,"");
insert into pokemon values (79, 'Cinccino', 7.5,0.5,"Su pelaje blanco está recubierto por un aceite especial que hace resbalar los ataques enemigos."
,"Su nombre proviene de Chinchilla y de 'chino' (un tipo de tela de algodón)."
,"Cinccino es un Pokémon peludo con la apariencia de una chinchilla. Tiene unas orejas grandes a los dos lados de la cabeza, con la parte interior rosa y parcialmente cubierta de pelo. Sus ojos son grandes y de color marrón. Tiene una nariz pequeña y redondeada. Sus extremidades son pequeñas y redondeadas. Su cola es larga, suave, esponjosa y de color blanco.
Al igual que con Wigglytuff, su pelaje es muy apreciado. Su piel blanca es como de lujo. Está cubierta de un aceite especial que repele los ataques de los enemigos, especialmente los eléctricos. Su piel es muy suave, y repele la electricidad, el polvo, el barro y cualquier otro componente que lo pueda ensuciar. Nunca atrae el polvo o electricidad estática y su grasitud lo vuelve impermeable y resbaloso: se dice que posee 'una de las pieles más suaves del mundo Pokémon.' En la parte de atrás tiene dos largas cabelleras blancas que recorren desde sus orejas y se cruzan en su espalda lo que le da forma de corazón. Su cola se vuelve más larga y la usa alrededor del cuello de forma extravagante.

Comparte un leve parecido con Lopunny, ya que tienen algo parecido a un abrigo en su cuerpo, y también ambos tienen más apariencia de hembra que de macho."
,"Cinccino no evoluciona."
,"");
insert into pokemon values (80, 'Gothita', 5.8,0.4,"Un Pokémon que encarna la inocencia absoluta. Al fijar la mirada en algo invisible, permanece en silencio sin siquiera pestañear."
,"Su nombre proviene de la combinación de las palabras inglesas gothic (gótico/a) y lolita (lolita)."
,"Gothita está basada un la moda japonesa Gothic Lolita. Usando las antenas que hay en su cuerpo en forma de lazos, amplifica sus poderes psíquicos y los potencia. Naturalmente su pasatiempo es mirar al cielo fijamente, contemplando su hermosa belleza. Observa fijamente cualquier cosa, tanto que, en más de una ocasión, no se da cuenta de que un enemigo lo ataca."
,"Gothita evoluciona en Gothorita en el nivel 32. Gothorita evoluciona a Gothitelle en el nivel 41. Gothitelle no evoluciona."
,"");
insert into pokemon values (81, 'Gothorita', 18,0.7,"Adormece a los niños mediante hipnosis y se los lleva consigo. Conviene tener cuidado en las noches estrelladas."
,"Su nombre proviene de Gothic (Gótica en inglés) y la palabra en español Señorita.

Su nombre en japonés proviene de ゴシック (Goshikku) que significa Gótica y 見る (Miru) que significa Ver. También podría provenir de ゴシックを見る (Goshikku miru) que significa Amiga gótica."
,"Gothorita es capaz de controlar los sentimientos de la gente para que sean felices y manipular las mentes de los Pokémon. La luz de las estrellas potencia su poder. De noche, marca su posición haciendo levitar piedras blancas con su poder mental. Es extremadamente bondadoso llegando a dar la vida por sus amigos. Al Igual que Gothita tiene lazos para amplificar sus poderes psíquicos y potenciarlos. Gothorita puede amplificar los poderes con las manos de su habilidad Cacheo."
,"Gothorita evoluciona a Gothitelle en el nivel 41. Gothitelle no evoluciona."
,"");
insert into pokemon values (82, 'Gothitelle', 44,1.5,"Libera su poder psíquico e induce al rival a soñar con el fin del universo, un espectáculo al parecer tan bello como efímero."
,"Su nombre proviene de las palabras 'gothic' ('gótico' en inglés) y 'mademoiselle' ('mujer' en francés), que significaría 'mujer gótica' por su aspecto y forma. También puede provenir de 'gothic' y 'fortune teller' (adivina).

Su nombre en francés, Sidérella podría provenir de 'Sideral', en referencia a su especie y 'Cinderella' ('Cenicienta') en referencia a tener aspecto femenino, a pesar de poder ser macho también."
,"Se dice que, basado en la posición de las estrellas, puede ver el futuro y adivinar lo que le queda de vida a su entrenador. Con sus poderosísimos poderes mentales marca sus territorios con piedras lunares que le dan su poder en las batallas. Se cree que Gothitelle y sus etapas evolutivas representan el paso de niña, adolescente y mujer ya que Gothita está inspirado en una niña gótica, mientras que Gothorita está inspirado en una adolescente gótica y finalmente Gothitelle representa a una mujer gótica."
,"Gothitelle no evoluciona."
,"");
insert into pokemon values (83, 'Solosis', 1,0.3,"Puede vivir en cualquier ambiente gracias al líquido especial que recubre su cuerpo."
,"Su nombre proviene de las palabras solo (unidad) y mitosis, proceso de división celular."
,"Solosis parece estar basado en una célula. Su rostro (en el centro, de un tono verde más claro) parece ser el núcleo de una célula eucariota, y el resto, una membrana color verde traslúcido que le rodea; aparentemente para protegerle. Posee un rizo amarillo banana en la parte superior de la cabeza, dos pequeños ojos ovalados color negro y una boca con forma de rombo.
Es un Pokémon muy alegre, normalmente siempre va contento. Tiene una relación bastante extraña con los Gothita: Se pelea con ellos, pero al acabar la pelea se van tan contentos de paseo. Son muy amables, no se oponen casi nunca a que los capturen.

Puede vivir en cualquier ambiente gracias al líquido especial que recubre su cuerpo."
,"Solosis evoluciona a Duosion en el nivel 32. Duosion evoluciona a Reuniclus en el nivel 41. Reuniclus no evoluciona."
,"");
insert into pokemon values (84, 'Duosion', 8,0.6,"Dado que su cerebro está dividido en dos, a veces tiene conflictos a la hora de decidir qué hacer."
,"Su nombre en inglés proviene de 'Duo' y 'División', haciendo referencia al proceso de división celular, o bien porque su cerebro está dividido en dos. También puede provenir de 'Duo' y 'Fusión', porque en su siguiente fase las células se reunirán para formar a Reuniclus.

Su nombre japonés, en cambio, parece provenir de dabu (doble o doblar) en referencia a su cerebro dividido en dos o bien porque tiene el doble del tamaño de su preevolución y ren (pura)."
,"Duosion, al igual que Solosis, parece estar basado en una célula. Su cerebro está dividido en dos partes separadas, por lo cual elegir qué hacer les resulta muy trabajoso, pero si los dos cerebros piensan lo mismo, su poder aumenta considerablemente."
,"Duosion evoluciona a Reuniclus en el nivel 41. Reuniclus no evoluciona."
,"");
insert into pokemon values (85, 'Reuniclus', 20.1,1,"Hacen gala de su poder psíquico para controlar sus brazos compuestos de un líquido especial y hacer añicos las rocas."
,"Su nombre occidental puede provenir de reunite (reunir) y homonculus (homónculo), o de reunion (reunión en inglés) y de cluster (agrupar en inglés).

Su nombre en japonés puede provenir de la combinación de las palabras 乱 ran (desorden, caos) y ホムンクルス homonkurusu, homúnculo, siendo que dentro de la sustancia verde que le rodea se encuentra un pequeño cuerpo de forma humanoide."
,"Es un Pokémon que posee una capa semitransparente verdosa y un pequeño cuerpo de color blanco en su interior. Parece estar basado en una célula, o a algo similar a los organismos simples como las bacterias, aunque sus brazos están divididos en partes hasta llegar a la mano.

Según la Pokédex, si dos o más Reuniclus se dan la mano, sus poderes psíquicos aumentan, probablemente debido a la conexión de sus dos potentes cerebros. La posesión de su habilidad funda se debe a la capa verdosa que tiene, que le protege implacablemente de efectos meteorológicos."
,"Reuniclus no evoluciona."
,"");
insert into pokemon values (86, 'Ducklett', 5.5,0.5,"Aún no se le da muy bien volar. Observa con atención la danza de sus progenitores Swanna para aprender a mover las alas."
,"Su nombre proviene de la palabra inglesa duckling (cría de pato) y el sufijo -ette (pequeño).

Su nombre japonés, Koaruhie, procede de 子 ko (niño) y de 家鴨 ahiru (pato)."
,"Ducklett está basado en una cría de cisne y en el cuento El patito feo, ya que en su primera etapa es un patito, pero al evolucionar sufre un cambio a cisne y se vuelve hermoso.
Ducklett tiene un plumaje azul claro y en la parte de abajo de su cuerpo, este plumaje se vuelve un suave plumón azul oscuro con forma de flotador, además de tener un mechón de plumas sobre su cabeza.

Ducklet nada por el agua a mayor velocidad de la que puede volar. Es incluso capaz de sumergirse, cosa que hace frecuentemente para buscar musgo acuático, su comida favorita. Cuando se ve atacado, las plumas que lo recubren despiden ráfagas de agua que lo ayudan a escapar."
,"Ducklett evoluciona a Swanna en el nivel 35. Swanna no evoluciona."
,"");
insert into pokemon values (87, 'Swanna', 24.2,1.3,"Danzan en perfecta sincronía con el líder de la bandada, situado en el centro, para reforzar su vínculo grupal."
,"Su nombre proviene de las palabras inglesas swan (cisne) y ballerina (bailarina).

Su nombre francés, Lakmécygne, procede de las óperas Lackmé y Lac des Cygnes (El lago de los cisnes)."
,"Swanna está basado en un cisne y su línea evolutiva en el cuento 'El patito feo'. Presenta un par de grandes alas blancas y patas negras parecidas a las de uno de estos animales. Además tiene dos zonas de plumas azules que cubren la mayoría de su pecho con forma similar a un bikini. Swanna tiene un peinado muy peculiar y elegante, basado en las diademas que se colocan las bailarinas de ballet. También en la cola presenta algunas plumas azules.

Swanna posee una grácil elegancia, con la que baila incluso mientras vuela, desde primeras horas de la mañana. Forman formaciones en las que el líder de la bandada se sitúa en el centro. A pesar de esto, no es solo belleza, ya que Swanna puede batir con fuerza sus alas y volar durante miles de kilómetros seguidos. Además la potencia de su pico es brutal, el cual usa para picotear repetidamente al enemigo."
,"Swanna no evoluciona."
,"");
insert into pokemon values (88, 'Vanillite', 5.7,0.4,"No puede vivir en lugares muy cálidos. Provoca nevadas exhalando un vaho gélido y luego se acurruca en la nieve acumulada para dormir."
,"Su nombre proviene de las palabras inglesas vanilla (vainilla) y little (pequeño).

Su nombre en japonés probablemente procede del inglés vanilla (vainilla) y del francés petit (pequeño)."
,"Le gustan los lugares fríos como el refrigerador (congelador), por lo que es fácil encontrarlo en el norte de Teselia, la mayoría de las personas lo confunden con un helado por eso algunos le pegan lengüetazos. El aliento de Vanillite está a menos de -50º. Al exhalar crea cristales de hielo, provocando que nieve."
,"Vanillite evoluciona a Vanillish en el nivel 35. Vanillish evoluciona a Vanilluxe en el nivel 47. Vanilluxe no evoluciona."
,"");
insert into pokemon values (89, 'Vanillish', 41,1.1,"Bebe agua pura para agrandar su cuerpo de hielo. Apenas se ven ejemplares durante los días soleados."
,"El nombre de Vanillish está basado en la mezcla de las palabras vanilla, que significa vainilla y la palabra delish, un término usado para denotar algo 'delicioso'."
,"Vanillish puede vivir en lugares como montañas heladas o glaciares. Al igual que su evolución y su preevolución necesita estar a temperaturas de 30° bajo cero."
,"Vanillish evoluciona a Vanilluxe en el nivel 47. Vanilluxe no evoluciona."
,"");
insert into pokemon values (90, 'Vanilluxe', 57.5,1.3,"Cuando su rabia alcanza el punto máximo, genera una ventisca que congela tanto a amigos como a enemigos."
,"Su nombre proviene de las palabras inglesas vanilla (vainilla) y deluxe ('de lujo', debido a que representa un cono de helado doble)."
,"Vanilluxe vive en lugares fríos a temperaturas de 30 grados bajo cero. Es común encontrarlo en lo más alto de las montañas del sur de Teselia. En temporadas mas cálidas, siempre en verano y algunas primaveras, se esconden en el frío interior de las cavernas heladas, lo que hace creer que es un Pokémon que hiberna, pero en estaciones cálidas.
La razón de que este Pokémon sea un elemento con vida propia (al igual que otros como Cryogonal, compuestos prácticamente por agua y hielo respectivamente) sigue siendo un misterio y está siendo investigado.

Su alimentación es mínima, y la realiza a través de partículas sólidas que recibe al beber agua , lo cual hace muy a menudo, recuerda a la forma de alimentación de las grandes ballenas, pero a una escala menor.
No es un Pokémon depredador, y está compuesto en gran medida por hielo y nieve, por lo que tampoco es una presa común de depredadores, estas dos características lo convierten en un Pokémon sumamente pacífico.

La figura del helado con un cono de galleta nació gracias a la cadena evolutiva de éste Pokémon, que dio la idea a los precursores del helado, teniendo algunos helados incluso el aspecto de éstos Pokémon (como el Porcehelado de Ciudad Porcelana) como guiño o referencia a quien sirvió de inspiración para diseñarlos."
,"Vanilluxe no evoluciona."
,"");
insert into pokemon values (91, 'Deerling', 19.5,0.6,"Su fragancia, que cambia con las estaciones, adquiere un agradable matiz dulce al comienzo de la primavera."
,"Su nombre viene de las palabras deer (ciervo), spring (primavera), y de ling (brezo, que es un determinado grupo de plantas). -ling es un sufijo que se coloca al final de los nombres para dar un sentido diminutivo o para referirse a la cría de un animal. También se parece a la palabra darling, traducido como querido o cariño al español.

Su nombre japonés es una combinación de 四季 shiki, (cuatro estaciones), y 鹿 shika, (ciervo)."
,"Es conocido como el Pokémon estacional. Tiene el aspecto de cervatillo o de una cría de ciervo de cola blanca, que lleva una especie de flor amarilla en su cabeza. Si lo amenazan se ocultará raudamente en la espesura, pero si posee suficiente coraje atacará con su poderosa patada salto. El color y el aroma de su pelaje cambian según la estación que impere, aunque un repentino cambio de temperatura o humedad puede causarle esa misma modificación. Este Pokémon anuncia siempre el comienzo de una estación y el término de otra.
Habita en algunos remotos bosques de Teselia, junto con su evolución Sawsbuck, ya que es bastante tímido con la gente.

Deerling tendrá diferente apariencia según la estación del año: en primavera su color será rosa, en verano verde, en otoño naranja y en invierno marrón."
,"Deerling evoluciona al nivel 34 a Sawsbuck. Sawsbuck no evoluciona."
,"");
insert into pokemon values (92, 'Sawsbuck', 92.5,1.9,"Los ejemplares con la cornamenta más florida presentan un desarrollo ligeramente más lento debido a los nutrientes que consumen las flores."
,"Su nombre proviene de las iniciales de las estaciones en inglés, S de summer (verano), A de autumn (Otoño), W de winter (invierno) y S de spring (primavera), lo cual forma las siglas SAWS; y buck que es la palabra inglesa para designar a un ciervo macho.

Su nombre en japonés es una combinación de ブッシュ busshu (arbusto), 四季 shiki (cuatro estaciones) y 鹿 shika (ciervo)."
,"Está basado en un ciervo. Según la estación del año, su pelaje y sus astas cambian, como las ramas de los árboles. En primavera tiene pelaje de color marrón claro y flores rosadas le crecen de las astas, en verano su cola se eriza, en contrariedad con los demás cambios estacionales en que se halla hacia abajo, tiene el pelaje marrón y en la parte de la nuca le sale una suerte de mechón de la misma tonalidad, además de que en las astas le crecen unos copiosos arbustos verdes, en otoño sigue teniendo el mismo pelaje marrón, pero la fronda toma un color rojizo, y en invierno vuelve al pelaje marrón claro, sus astas se vuelven blancas y le crece abundante pelaje blanco alrededor del cuello y en la parte inferior de las patas.
Sawsbuck vive en manadas en el oeste de Teselia, lideradas por aquel con los cuernos más majestuosos. Tienden a cambiar de morada según la estación.
Se trata de Pokémon pacíficos y muy inteligentes, por eso viven alejados de los humanos. Los científicos aun están investigando la razón de su cambio estacional."
,"Sawsbuck no evoluciona."
,"");
insert into pokemon values (93, 'Emolga', 5,0.4,"Planea por el aire, casi como si danzara, mientras desprende electricidad. Resulta adorable, pero puede causar bastantes problemas."
,"Su nombre proviene de la ardilla voladora japonesa, conocida como momonga en Japón. La letra E de la palabra inglesa electric (eléctrico), tipo al que pertenece este Pokémon."
,"Es muy similar a Pikachu, Pichu, Pachirisu, Dedenne, Minun y Plusle. Emolga puede almacenar mucha electricidad en sus mejillas como los Pokémon antes mencionados. Cuando se siente amenazado, se libera de esta energía eléctrica para defenderse de otros Pokémon."
,"Emolga no tiene evolución ni evoluciona de ningún Pokémon."
,"");
insert into pokemon values (94, 'Karrablast', 5.9,0.5,"Su misterioso cuerpo reacciona a la energía eléctrica. Si se encuentra en presencia de un Shelmet, evoluciona."
,"Su nombre viene de scarab (escarabajo en inglés) y blast (explosión, debido a su carácter).

Su nombre francés, Carabing, viene de las palabras Carabe (escarabajo) y la onomatopeya bing, refiriéndose a un salto de pulga."
,"Karrablast está basado en un Coleóptero. También se asemeja bastante a una tijereta, solo que con los cercos en la cabeza. Karrablast es un Pokémon misterioso que evoluciona cuando es estimulado eléctricamente junto a un Shelmet. Se cree que para que este Pokémon evolucione en Escavalier debe recibir la armadura de Shelmet permitiendo que este último también logre su evolución. Ambas evoluciones ocurren al mismo tiempo, aunque se desconoce el por qué de esta misteriosa forma de evolucionar. Habitan en las zonas de Hierba alta, cerca de riachuelos, en lugares que de sol."
,"Karrablast evoluciona a Escavalier sólo si es intercambiado por Shelmet. Escavalier no evoluciona."
,"");
insert into pokemon values (95, 'Escavalier', 33,1,"Le roba el caparazón a un Shelmet y lo usa como armadura. Este Pokémon es extremadamente popular en la región de Galar."
,"Su nombre proviene de la palabra escargot (caracol en francés), o de la espada Excalibur y de cavalier (caballero en inglés).

Su nombre es la combinación de 紳士 shinshi (caballero) y バグ bagu (bicho).

Su nombre francés, Lançargot, es la combinación de las palabras lance (lanza) y escargot (Caracol). También puede provenir de la palabra chevaller (soldado) en francés o de Lancelot 'Lancelot du Lac' en francés, el caballero en quien más confiaba el rey Arturo."
,"Levita alrededor a alta velocidad y clava su lanza afilada en los enemigos. Encara con bravura, incluso en los enfrentamientos desfavorables. Se dice que se montan sobre los Zebstrika para simular a los caballeros de verdad. Su lentitud no le impide manejar habilidosamente sus lanzas, que se ensartan en el cuerpo del contrario con gran facilidad; puede golpear con sus extremidades 15 veces por segundo. Este Pokémon se queda con la armadura de Shelmet. Cuando Karrablast evoluciona disminuye su velocidad pero aumenta su defensa y defensa especial."
,"Escavalier no evoluciona."
,"");
insert into pokemon values (96, 'Foongus', 1,0.2,"Ciertas teorías, cuya veracidad no ha podido constatarse, afirman que quien desarrolló las Poké Balls admiraba con fervor a este Pokémon."
,"Su nombre proviene de la combinación de las palabras inglesas fool (engañar, timar) y fungus (hongo). El nombre de su línea evolutiva proviene de la expresión en inglés a fungus among us usada para menospreciar algo distinto del resto.

Su nombre japonés procede de 玉 tama (esfera) y 茸 take (champiñón)."
,"Foongus está basado tanto en una Amanita muscaria como en una Poké Ball. Se desconocen las razones por las que se parece a una Poké Ball, pero gracias a ello, atrae a sus presas y les lanza rápidamente esporas de veneno. Estas esporas también pueden ser usadas para repeler a sus enemigos.
En los videojuegos se puede camuflar como una Poké Ball. Cuando el jugador la intenta recoger, entra en combate, de modo semejante a los Electrode de las estaciones eléctricas abandonadas.

A menudo acaba en manos de entrenadores que imaginaron que era una Poké Ball o cualquier otro objeto perdido. En este caso intentará defenderse liberando una niebla de esporas venenosas. Normalmente vive en zonas húmedas y sombrías."
,"Foongus evoluciona a Amoonguss en el nivel 39. Amoonguss no evoluciona."
,"");
insert into pokemon values (97, 'Amoonguss', 10.5,0.6,"Las esporas tóxicas que libera son peligrosas, ya que allí donde caen acaban creciendo unas setas parecidas a los sombreros de los Amoonguss."
,"Su nombre proviene de la combinación de Amanita muscaria y de las palabras inglesas fungus (hongo) y humongous (gigantesco). El nombre de su línea evolutiva proviene de la expresión inglesa a fungus among us usada para menospreciar algo distinto del resto.

Su nombre japonés procede de もろに moroni (completamente) y de ばれる bareru (secreto revelado)."
,"Al igual que su preevolución Foongus, Amoonguss está basado tanto en una Amanita muscaria como en una Poké Ball. Sin embargo, ahora también tiene brazos terminados en unos apéndices redondeados con el patrón de una Poké Ball, al igual que su sombrero."
,"Amoonguss no evoluciona."
,"");
insert into pokemon values (98, 'Frillish', 33,1.2,"Atenaza a las presas con sus tentáculos en forma de velo y las sumerge a 8000 m de profundidad."
,"Su nombre puede que venga de las palabras en inglés 'frill', que significa volante (de tela, por la forma de sus extremidades) y jellyfish que significa medusa.

Su nombre en japonés puede provenir de プリンス Purinsu príncipe en japonés y 水路 Suiro corriente de agua.

También puede provenir de lo dicho anteriormente además de ill, que en inglés significa enfermo, esto presentándose tanto en su nombre japonés como inglés."
,"Frillish es un Pokémon algo tímido y no tiene un aspecto tan aterrador como la mayoría de los Pokémon fantasmas pero al momento de luchar no dudará en usar sus poderes de tipo fantasma o su habilidad cuerpo maldito, que lo protege de los ataque físicos ya que los anula, este Pokémon es muy inteligente ya que confunde a su rival y luego los ataca sin piedad.
A la hora de cazar libera una especie de veneno que paraliza a su rival y luego se sumerge hasta el fondo del mar con el cuerpo de sus enemigos todavía atado a sus finos brazos en forma de velo.

Frillish parece estar basado en una medusa o en un escurridizo espíritu marino. También podría estar basado en un príncipe o en una princesa, según el género del Pokémon. Se caracteriza por vivir en aguas muy profundas y oscuras."
,"Frillish evoluciona a Jellicent en el nivel 40. Jellicent no evoluciona."
,"");
insert into pokemon values (99, 'Jellicent', 135,2.2,"Su cuerpo está compuesto en su mayor parte de agua salada. Crea su guarida con navíos hundidos."
,"Podría ser la unión de Jelli (Jellyfish) (Medusa en Inglés) y Ancient ('Antiguo' en inglés). O de jellyfish y Magnificent (magnífico) o translucent (translucido) por ser una medusa, también podría ser por entity (entidad), por ser tipo fantasma o incluso de luminicent. Incluso, también podría provenir de cent (Cenicienta). De igual manera, es probable que pueda provenir de cent (centella, centelleante...) por estar basado en una medusa, ya que las medusas son centelleantes."
,"Jellicent parece estar basado en una medusa, concretamente en la carabela portuguesa, por sus tentáculos y color; pero en realidad basándose en sus tipos podríamos decir que es una especie de fantasma acuático. Como los espíritus de los barcos hundidos. Se dice que es muy pacífico, y que no le gusta espantar a los buzos que visitan los barcos hundidos. Si un barco perdido se hunde en el hábitat de Jellicent, la fuerza vital de la tripulación es absorbida completamente.

Cuando Frillish evoluciona su cabeza absorbe tanta agua que crece hasta ocho veces su tamaño, sus rasgos se denotan y sus habilidades aumentan. Rondan pacíficamente las aguas del océano, buscando una pareja de su misma especie. Avanzan absorbiendo agua de mar y expulsándola violentamente como si fuera un cohete, cuando esto sucede su cabeza disminuye y luego aumenta de tamaño. Son capaces de flotar en el agua y salir a la superficie."
,"Jellicent no evoluciona."
,"");
insert into pokemon values (100, 'Alomomola', 31.6,1.2,"Abraza gentilmente con sus aletas a Pokémon que están lastimados y cura sus heridas con su membrana especial."
,"Su nombre es un palíndromo formado a partir de Mola mola, nombre científico del pez luna.

Su nombre en japonés, Mamanbou, procede de la palabra mama (mamá) y de 翻車魚 manbō (pez luna)."
,"Alomomola está basado en un pez luna. Su cuerpo tiene la forma de un corazón rosa con detalles fucsias. Posee unas grandes aletas en la parte superior e inferior, las cuales usa como alas cuando salta en el mar.

Alomomola vive flotando a la deriva en mar abierto. Posee una membrana mucosa especial que cubre su cuerpo y que tiene el efecto de curar las heridas. Abraza gentilmente con sus aletas a Pokémon que están lastimados y cura sus heridas con ayuda de esta membrana.. Si se encuentra con un Pokémon herido de gravedad, lo abraza y lo lleva a la costa."
,"Alomomola no tiene evolución ni evoluciona de ningún Pokémon."
,"");
insert into pokemon values (101, 'Joltik', 0.6,0.1,"Los que viven en las ciudades han aprendido a absorber electricidad de los enchufes de las casas particulares."
,"Su nombre proviene de las palabras jolt (sacudida eléctrica en inglés) y tick (garrapata en inglés).

Su nombre japonés proviene de las palabras タランチュラ taranchura (tarántula) y de バグ bagu (bicho)."
,"Joltik está basado en un ácaro, probablemente esté basado en una garrapata (un tipo de ácaro) ya que no generan su propia electricidad y tienen que drenársela a otros Pokémon, por lo que se consideran parásitos. Poseen una bolsa interna donde guardar la electricidad robada, para poder usarla en su propio beneficio. Es un Pokémon muy pequeño comparado con otros (de hecho es el más pequeño junto a Flabébé) lo que encaja con su imagen de ácaro. El nombre de su especie (lapa) tiene que ver con el modo de aferrarse a sus huéspedes. Al evolucionar pasa a ser una tarántula, que como es un arácnido está relativamente emparentada con los ácaros. También absorben la electricidad de los enchufes de las casas, provocando cortes de electricidad. Suelen esconderse en aparatos electrónicos, donde se alimentan de energía hasta no dejar nada sin comer."
,"Joltik evoluciona a Galvantula, en el nivel 36. Galvantula no evoluciona."
,"");
insert into pokemon values (102, 'Galvantula', 14.4,0.8,"Pone trampas con hilos electrificados. De este modo, electrocuta a sus presas y las inmoviliza para poder devorarlas lentamente."
,"Su nombre es una combinación de galvanómetro, una herramienta que permite detectar y medir corriente eléctrica, y tarántula.

Su nombre en japonés es una combinación de 電気 denki (electricidad) y タランチュラ taranchura (tarántula)."
,"Galvantula está basado en una haplopelma lividum, una tarántula de color azul cobalto. Habita en bosques densos y profundos, donde teje grandes telas donde crían a Joltik y atrapan a sus presas, ya que pueden cazar a cualquier Pokémon y conservarlo. Cuando le ataca un enemigo, escupe un montón de hilo eléctrico para crear una barrera eléctrica que le permite huir a su guarida."
,"Galvantula no evoluciona."
,"");
insert into pokemon values (103, 'Ferroseed', 18.8,0.6,"Se defiende lanzando púas, pero para poder apuntar con precisión a su objetivo necesita ingentes sesiones de práctica."
,"Su nombre en inglés proviene del latín ferrum (hierro) y seed, (semilla en inglés)."
,"Tiene aspecto de una bola metálica con ojos amarillos contorneados por un borde verdoso. Está cubierto de espinas verdes, al parecer puede estar basado en un durián o una guanábana. Ambos son 'plantas' esféricas que tienen muchas espinas alrededor de sus cuerpos que utilizan para la protección. Cuando se siente amenazado arrojará cuantiosas púas y al encontrarse fuera de peligro huirá rodando. Se alimenta adhiriéndose a las paredes y techos de las cuevas con sus espinas y por las cuales absorbe los minerales.

Sus presas son fáciles de capturar por sus pinchos puntiagudos, es muy peligroso acercarse a uno salvaje. No se suele encontrar en estado salvaje, ya que es un Pokémon valorado y su especie es muy rara. Se dice que obtuvo su armadura metálica gracias a una savia especial, que creó para poder defenderse de los Pokémon de tipo volador."
,"Ferroseed evoluciona a Ferrothorn en el nivel 40. Ferrothorn no evoluciona."
,"");
insert into pokemon values (104, 'Ferrothorn', 110,1,"Raya el lecho rocoso con las púas para luego absorber nutrientes con el extremo de los tentáculos."
,"Su nombre proviene de la palabra latina ferrum (hierro) y la palabra inglesa thorn (espina).

Su nombre japonés, Nutrey, procede de la palabra inglesa nut (nuez), de la palabra española 'rey' y de 鈴 rei (campana)."
,"El aspecto de este Pokémon se asemeja al de un fruto con espinas. Su cuerpo está formado por una cabeza principal donde tiene los ojos y la boca, y varios tallos verdes a modo de tentáculos acabados en una especie de ventosas con pinchos, con las que se adhiere al techo rocoso de las cuevas en las cuales habita; aunque, cuando es necesario, usa estos tentáculos para poder desplazarse a través de las paredes de las cuevas donde reside. Además de dichas extremidades, presenta todo el cuerpo protegido por pequeñas púas.

Por lo general, viven en cuevas. Se adhiere a los techos de las cuevas y ataca a su presa por sorpresa con disparos de sus espinas."
,"Ferrothorn no evoluciona."
,"");
insert into pokemon values (105, 'Klink', 21,0.3,"Los dos cuerpos que lo componen están más unidos que unos gemelos. Si intentaran acoplarse a otros, no lograrían encajar."
,"Su nombre probablemente proviene del sonido que hacen los engranajes al encajar 'Klink', y de link que es unión o conexión. Además puede que sea una alteración de la palabra Ying (del ying yang). Su nombre japonés proviene de la palabra inglesa 'gear' que significa engranaje por la forma de sus cabezas. O de la palabra japonesa ギア Gia engranaje. El nombre de su especie en japonés (はぐるま) significa, literalmente, rueda dentada o engranaje. En los videojuegos Blanco y Negro se hace referencia a que su grito es igual al sonido que hacen las llaves al caer al suelo."
,"Su aspecto es el de dos engranajes que giran constantemente. Los dos cuerpos sólo pueden combinarse entre sí. Si tratan de unirse a otros cuerpos, los engranajes no coincidirán y se separarán. Suelen habitar en zonas cargadas de electricidad. Son pokémon gregarios, y habitualmente se encuentran rodeados de otros Klink y sus evoluciones Klang y Klinklang."
,"Klink evoluciona a Klang en el nivel 38, Klang evoluciona a Klinklang en el nivel 49. Klinklang no tiene evolución."
,"");
insert into pokemon values (106, 'Klang', 51,0.6,"Cuando se pone en serio, la parte externa de la rueda dentada grande se acopla a la pequeña y aumenta su velocidad de rotación."
,"Su nombre viene de Klang (onomatopeya de choque metálico). Además puede que sea una alteración de la palabra Yang (del yin yang). Su nombre podría provenir del nombre en japonés ギア Gia engranaje."
,"Mantiene la misma forma que su preevolución, Klink, pero uno de sus individuos pierde los ojos y se une otro más grande. Este Pokémon puede transmitir cómo se sienten sus amigos mediante un cambio en el sentido de su rotación. Si se le enfada lo suficiente, la rotación se hace más veloz. Suele habitar en fábricas de maquinaria pesada y en zonas de fuerte magnetismo. La rueda pequeña se desprende de la mayor a toda velocidad para atacar; si es dañada durante el proceso, este perjuicio también se manifestará en la rueda principal, pues la salud de una depende de la otra."
,"Klang evoluciona a Klinklang en el nivel 49. Klinklang no tiene evolución."
,"");
insert into pokemon values (107, 'Klinklang', 81,0.6,"Emite fuertes descargas eléctricas por la punta de las púas. Acumula una gran cantidad de energía en su núcleo rojo."
,"Su nombre es la mezcla de Klink (su primera evolución), y de Klang (la segunda), que unidos forman el ruido que hacen las máquinas al moverse.
Su nombre japonés podría provenir del nombre en japonés ギア Gia engranaje."
,"Al evolucionar Klang, a su cuerpo se unen un tercer individuo, un engranaje con núcleo rojo que provoca un movimiento constante en el cuerpo de Klinklang, y además hace girar un aro metálico con pinchos. El núcleo rojo funciona como tanque de energía, que se libera a través de los pinchos del aro metálico. Convive junto a sus preevoluciones en lugares llenos de máquinas y en zonas magnéticas, de donde extrae la fuerza que acumula en el núcleo rojo."
,"Klinklang no tiene evolución."
,"");
insert into pokemon values (108, 'Tynamo', 0.3,0.2,"La electricidad de uno solo es insignificante, pero, si multitud de Tynamo se conectan, consiguen la potencia de un rayo."
,"Su nombre viene de la palabra tiny (pequeño en inglés) y dynamo (dínamo en inglés). También podría provenir del nombre científico del atún: Thunnus thynnus"
,"Está basado en lo más posible en un Anfioxo, o en cualquier tipo de pez con cuerpo similar al de una anguila. El poder eléctrico de un solo Tynamo es escaso, pero cuando se reúnen en grupos, ese poder se vuelve tan poderoso como los truenos, usan su levitación para alejarse de depredadores como Boldore, Klink, Ferrothorn y también Drilbur. Debido a los ataques repentinos de dichos depredadores, suelen haber muy pocos ejemplares separados de grupos, haciéndolo un Pokémon bastante escaso y difícil de encontrar. Viven en cuevas oscuras y tranquilas, con muy pocos Pokémon."
,"Tynamo evoluciona a Eelektrik en el nivel 39. Eelektrik evoluciona a Eelektross exponiéndolo a una piedratrueno. Eelektross no evoluciona."
,"");
insert into pokemon values (109, 'Eelektrik', 22,1.2,"Las motas redondas componen su aparato electrificador. Enrolla a su rival y deja que la corriente fluya por ellas."
,"Su nombre proviene de las palabras inglesas eel (anguila) y electric (eléctrico), sustituyendo la 'C' por una 'K'"
,"Eelektrik parece estar basado en una Hyperoartia. Está basado en una fusión entre un pez abisal y una anguila. Las marcas circulares en su cuerpo son órganos que generan electricidad. Tras rodear a su rival, apoya las marcas sobre él y libera electricidad con la cual lo aturde. También usa su electricidad como mecanismo de defensa. Siempre cuida de sus crías Tynamo protegiéndolos para que su especie prospere."
,"Eelektrik evoluciona a Eelektross exponiéndolo a una piedratrueno. Eelektross no evoluciona."
,"");
insert into pokemon values (110, 'Eelektross', 85.5,2.1,"Sale del mar con la fuerza de sus brazos y ataca a sus presas en la costa. Luego se las lleva de vuelta al mar."
,"Su nombre proviene de las palabras en inglés eel (anguila), electric (eléctrico) y boss (jefe), tal vez por liderar a sus preevoluciones, que conservan las formas tradicionales de las anguilas. Aunque también puede provenir de cross (cruz), debido a su forma corporal."
,"Eelektross parece estar basado en una Hyperoartia (Lamprea). Tiene similitud a un pez abisal o a una anguila. Cuando sube a tierra firme utiliza las aletas que tiene debajo del cuerpo para desplazarse, aunque gracias a su habilidad genera electricidad estática para levitar y escapar de los enemigos en tierra firme, mientras que cuando está sumergido en el agua no la utiliza. En cambio si utiliza mucho las aletas superiores para coger impulso puede salir del agua con el poder de sus brazos y atacar a las presas en la costa y en un instante los estará arrastrando al océano."
,"Eelektross no evoluciona."
,"");
insert into pokemon values (111, 'Elgyem', 9,0.5,"Cuando se halla junto a un televisor, la pantalla muestra imágenes de extraños paisajes. Se cree que corresponden a su lugar de origen."
,"Su nombre proviene de la pronunciación en inglés de las siglas LGM, las cuales quieren decir Little Green Man, es decir hombrecillo verde, común denominación de extraterrestres.

Su nombre en francés, Lewsor, proviene de una contracción invertida de Roswell."
,"Elgyem es un Pokémon con aspecto de alienígena del tipo gris con una especie de armadura. Tiene la capacidad de flotar o levitar en el aire y tiene una especie de dibujo pintado en su cabeza. Se cree que este Pokémon pudo provenir del espacio.
Controla un increíble poder psíquico. Constriñe el cerebro de su rival con su poder psíquico, provocándole un terrible dolor de cabeza. Apareció de la nada en un lejano desierto hace 50 años. Hasta entonces nadie lo había visto. Normalmente vive en montañas de Teselia/Unova y rara vez aparece ante los humanos.

Las luces de colores de sus manos sirven como medio de comunicación. Este lenguaje está bajo estudio aun sin grandes avances."
,"Elgyem evoluciona a Beheeyem en el nivel 42. Beheeyem no evoluciona."
,"");
insert into pokemon values (112, 'Beheeyem', 34.5,1,"Por algún extraño motivo, siempre que se avista un Beheeyem en una granja desaparece un Dubwool."
,"Beheeyem es una corrupción de la pronunciación de las siglas inglesas BEM, bug-eyed monster (monstruo con ojos de bicho), un término utilizado antiguamente para referirse a los extraterrestres.

Su nombre japonés, Ohbem, procede de la palabra inglesa orb (orbe), de 大 Ō (grande) y BEM."
,"Beheeyem está basado en los 'grises', uno de los tipos más populares de alienígenas. A juzgar por la entrada de Beheeyem en la Pokédex, él y su pre-evolución también pueden estar basados en el Área 51, conspiraciones alienígenas o el incidente de Roswell. Los puntos de colores en sus manos se asemeja a las caras de colores de los invasores de la película 'La Guerra de los Mundos' de 1953; los extraterrestres en la película tenían puntos verdes, azules y rojas al igual que la coloración variocolor de Beheeyem, aunque los de la película tenían tres ojos, o un único ojo dividido en tres iris.

Se sabe muy poco acerca de este Pokémon, pero sí se sabe que su poder psiquíco es muy poderoso. De hecho, es capaz de controlar el cerebro del rival y de manipular sus recuerdos. Usa sus tres dedos de colores para comunicarse, realizando patrones de colores con los mismos, los que también le sirven para hipnotizar a sus oponentes."
,"Beheeyem no evoluciona."
,"");
insert into pokemon values (113, 'Litwick', 3.1,0.3,"Su llama suele estar apagada, pero puede prenderla absorbiendo la energía vital tanto de humanos como de Pokémon."
,"Su nombre occidental es la combinación de las palabras en inglés lit (encendido) y wick (mecha). O de lit (de little) y wicked (malvado) por su tipo fantasma.

Su nombre en japonés proviene de una alteración de la palabra 灯火 (Tomoshibi) que significa 'luz que se emite de una lámpara o una vela', y 火 (Hi) que significa fuego, descartando de la primera palabra la última sílaba, y sustituyendo ésta por 'Hi' incluyéndola al principio del nombre, formando 'Hitomoshi', dando referencia a que se trata a una luz de fuego emitida por una vela.

Su nombre francés, Funécire proviene de funéraire (Funeral en francés) y cire (Cera en francés)."
,"Su llama en la cabeza quema o derrite lo que él pueda considerar una amenaza. Su entrenador deberá tener cuidado cuando está molesto, pero en general es un Pokémon agradable y de confiar. Eso sí, hay que tener cuidado con los salvajes ya que pueden maldecirte o herirte físicamente con su llama. Guían a las personas y Pokémon hacia lugares oscuros con su llama para absorber su energía vital. La luz de Litwick brilla más clara cuando ha absorbido la energía vital de un humano o de un Pokémon. Litwick suele encontrarse en mansiones antiguas aunque a veces salen a los bosques por la noche en busca de algún viajero accidentado para absorberle su energía vital."
,"Litwick evoluciona a Lampent en el nivel 41. Lampent evoluciona a Chandelure exponiéndolo a una piedra noche. Chandelure no evoluciona."
,"");
insert into pokemon values (114, 'Lampent', 13,0.6,"Aparece en los instantes previos al fallecimiento de alguien y absorbe el alma en cuanto esta se separa del cuerpo."
,"Su nombre proviene de las palabras inglesas lamp (lámpara) y lambent (algo que brilla con luz tenue).

Su nombre en japonés, Lampler, proviene de la palabra inglesa lamp (lámpara).

Su nombre en francés, Mélancolux, proviene del francés mélancolie (melancolía) y del latín lux (luz)."
,"Lampent está basado tanto en un farolilo como un quinqué de color negro con una llama morada en su interior. Cuenta también con ojos amarillos y unos brazos alargados que eran las espirales decorativas de dicha lámpara. Se le teme como un Pokémon de mal agüero. Flota de manera inestable por la ciudad, buscando las almas de los fallecidos.

Cuando Litwick evoluciona a Lampent, su cuerpo puede soportar mejor el calor que libera su llama, pudiendo controlar la cantidad de energía que libera al atacar. Al alimentarse mediante la absorción de almas, su llama se ilumina de forma más intensa. Espera a que la gente fallezca para ello, así que suele deambular por los hospitales acechando a aquellos que están en las últimas."
,"Lampent evoluciona a Chandelure exponiéndolo a una piedra noche. Chandelure no evoluciona."
,"");
insert into pokemon values (115, 'Chandelure', 34.3,1,"Las almas que han ardido bajo sus inquietantes llamas no tienen adónde ir y vagan sin rumbo por este mundo eternamente."
,"Su nombre proviene de las palabras inglesas chandelier (candelabro) y lure que significa señuelo.

Su nombre japonés, Chandela, se deriva también de chandelier.

Su nombre alemán, Skelabra, proviene de Skelett Y candelabra, ambas palabras significan Esqueleto y candelabro en alemán.

Su nombre en francés, Lugulabre, se compone de lúgubre (significa que algo es oscuro, sombrío o asociado a la muerte) y candélabre (candelabro en francés)."
,"Esta inspirado en un candelabro o tambien llamado Lampara de araña.
Su llama arde cuando absorbe un alma. Balancea las llamas en sus brazos para hipnotizar a sus víctimas. Confunde a las personas cuando entran en una casa abandonada y les absorbe y quema el alma, y las lleva al inframundo, dejando solo su cuerpo inerte. Aunque es aterrador, es un Pokémon leal y obediente a su entrenador, solo si este lo respeta. Le gustan los sitios solitarios y con poca luz para arder su llama con más fuerza.

Chandelure está basado en un candelabro. Principalmente tiene una bola de cristal con rayas redondeadas como cabeza, en donde tiene los ojos amarillos y encima de él tiene unos picos negros de los cuales sale una llama morada. Del cono que tiene situado en la base de la cabeza le salen dos brazos que se enrollan y cada uno termina en picos de los cuales salen dos llamas también moradas."
,"Chandelure no evoluciona."
,"");
insert into pokemon values (116, 'Axew', 18,0.6,"Viven en madrigueras que horadan en la tierra. En tiempos remotos, la gente usaba sus colmillos a modo de cuchillos de cocina."
,"Su nombre en inglés proviene de las palabras inglesas axe (hacha) y de chew (masticar).

Su nombre japonés, Kibago, procede de 牙 kiba (colmillo) y de 顎 ago (mandíbula).

Su nombre francés, Coupenotte, procede de las palabras francesas couper (cortar) y quenotte (diente de leche)."
,"Axew tiene la apariencia de un pequeño dinosaurio. Habita en cuevas, montañas, grutas y zonas de difícil acceso. Aplasta bayas con sus colmillos para comérselas. Sus grandes colmillos aún son frágiles y suelen partirse, pero estos se regeneran continuamente. Los nuevos que le crecen son cada vez más duros y resistentes, de manera que siempre están fuertes y afilados como cuchillas."
,"Axew evoluciona a Fraxure al nivel 38. Fraxure evoluciona a Haxorus al nivel 48. Haxorus no evoluciona."
,"");
insert into pokemon values (117, 'Fraxure', 36,1,"Al parecer, procura usar los colmillos únicamente en caso de extrema necesidad, ya que no le vuelven a crecer si se rompen."
,"Su nombre proviene de fracture (fractura) y de axe (hacha), debido a la forma de sus mandíbulas.

Su nombre en japonés es la fusión de ono, que significa hacha, y ondo, de prehistórico.

Su nombre francés, Incisache, deriva de las palabras incision (insición) o incisive (incisivo) y hache (hacha)."
,"Cuando sus colmillos son rotos no son reemplazados por otros nuevos, debe afilarlos diligentemente con las rocas del río después de luchar. A esta familia evolutiva le encanta entrenar junto a Gible y a sus evoluciones ya que ambos son Pokémon parecidos y muy fuertes. Atacan a Mareep y Flaaffy usando sus colmillos a modo de machete."
,"Fraxure evoluciona a Haxorus al nivel 48. Haxorus no evoluciona."
,"");
insert into pokemon values (118, 'Haxorus', 105.5,1.8,"Anida en cuevas y en minas abandonadas. Es dócil, pero conviene tener cuidado, ya que monta en cólera si le tocan los colmillos."
,"Su nombre viene de Axe, hacha en inglés, debido a la forma de sus mandíbulas, y saurus que significa lagarto en griego (término usado en los nombres de los dinosaurios).

Su nombre japonés proviene de ono que significa hacha en dicho idioma, el cual se repite dos veces (onono) probablemente señalando a sus dos colmillos que parecen dos hachas, y kusu que significa draco/dinosaurio."
,"Es parecido a un dinosaurio terópodo con una armadura, igual que Tyranitar por lo feroces que pueden llegar a ser. Haxorus posee dos colmillos que parecen dos hojas de hacha y son utilizados por este Pokémon para defenderse o bien para dar muerte a sus victimas, girando su cuello con gran rapidez para acuchillar a su presa y causar heridas mortales. Ataca a los rebaños de Mareep y Flaaffy, por lo que suele tener brutales peleas con los Ampharos, que protegen a sus preevoluciones. Son amables pero sumamente territoriales, no perdonan al que ose invadir su territorio, y las hembras son de las madres más agresivas, igual que Kangaskhan o Zoroark. Protegen a los Axew a costa de su propia vida y si su cría sufre el más mínimo rasguño atacará con toda su furia al agresor usando Enfado, después de acabar con el peligro, se tranquiliza talando árboles con sus colmillos. Su guillotina puede ser mortal. Y si se le cría y entrena con cariño y gran aprecio, hará lo que sea para proteger a su entrenador. Los Haxorus son Pokémon muy longevos ya que son dragones y sus preevoluciones tardan mucho en evolucionar, por lo que pueden llegar a vivir muchas décadas.

Su cuerpo no puede ser dañado por casi ningún ataque ni arma ya que está compuesto por distintos minerales, incluso está la teoría de que sus armaduras poseen algunos minerales desconocidos. Mayoritariamente está casi todo compuesto de metales, que le han creado así una especie de armadura en la piel, que utiliza para defenderse o lucirse en los combates, por esto último se suelen mostrar muy ansiosos por desafiar a sus enemigos, entre ellos su enemigo de toda la vida: Hydreigon. Aunque ahora es mas difícil que se encuentren, debido a que los Rangers han distribuido sus territorios para que no causen destrozos como en el pasado. Ya que es una especie autóctona no tiene relación con otros Pokémon tales como Tyranitar, Dragonite, Salamence, Garchomp, Aggron o Charizard en estado salvaje."
,"Haxorus no evoluciona."
,"");
insert into pokemon values (119, 'Cubchoo', 8.5,0.5,"Abundan en las costas de las regiones más frías. Si no le cuelga un moco, es probable que esté enfermo."
,"Su nombre en inglés proviene de cub (cachorro en inglés) o de cube (cubo, a lo mejor de hielo) y achoo (onomatopeya del estornudo).

Su nombre japonés podría provenir de kuma (oso) y kushun (onomatopeya japonesa del estornudo)."
,"Cuando está en mal estado de salud, su mucosa se vuelve líquida, y el poder de sus ataques de hielo disminuye como resultado, como consecuencia puede alterar sus ataques y hacerlos de tipo agua.
Vive en las regiones polares, los lugares nevados y frecuentemente en los bosques de las montañas, siempre acompañado de Beartic y otros Cubchoo."
,"Cubchoo evoluciona a Beartic al nivel 37. Beartic no evoluciona."
,"");
insert into pokemon values (120, 'Beartic', 260,2.6,"Un fiero Pokémon carnívoro. Cuando atrapa a una presa, exhala un vaho gélido con el fin de congelarla y conservarla."
,"Su nombre proviene de las palabras inglesas bear (oso) y arctic (ártico).

Su nombre japonés, Tunbear, procede de 氷柱 tsurara (carámbano) y de la palabra inglesa bear (oso)."
,"Beartic está basado en un oso polar grande. Beatic tiene una especie de 'barba' de hielo. Tiene unas garras muy grandes que le sirven para muchos de sus ataques y tiene un pelaje muy espeso. Los Beartic no hibernan, están adaptados para aguantar frío ártico, por lo que no tiene la necesidad de dormirse.
Cubchoo al evolucionar hace que su moco se convierta en afilados carámbanos que salen de su nariz y le cubren todo el hocico. Estos carámbanos le sirven para defender su territorio y desgarrar la carne de sus presas. Son feroces luchadores y atacarán a cualquiera que intente cazar o robar a sus crías. Beartic es un gran nadador, razón por la que nada alrededor del mar del norte cazando a sus presas.

Su estilo de combate es feroz, lo que lo convierte en un gran cazador. Normalmente solo aparece en invierno en los lugares no árticos como la región Teselia, aunque el resto de las estaciones habita en el ártico del Mundo Pokémon.
Utiliza su aliento congelado para crear fragmentos de hielo (chuzos) o para congelar a su rival. Cuando va a nevar, crean refugios y se preparan para pasar la temporada. Es común encontrar las pisadas de este Pokémon en los paisajes nevados. Cuando quiere ir muy rápido o muy lejos corre a cuatro patas, también cuando quiere transportar a sus crías o entrenador."
,"Beartic no evoluciona."
,"");
insert into pokemon values (121, 'Cryogonal', 148,1.1,"Aparece en las estaciones frías. Se dice que es la reencarnación de las personas y los Pokémon que han desaparecido en las montañas nevadas."
,"Su nombre proviene de Cryo (κρύο) que en griego significa frío y de gonon (γωνον) que significa ángulos, un sufijo común en varias formas geométricas, haciendo referencia a la forma hexagonal de su cuerpo."
,"Se dice que nace dentro de una nube de nieve. Atrapa a su presa con las cadenas que se forman de sus cristales de hielo, lo cual es muy efectivo ya que además de atraparlo lo congela.
Cuando la temperatura de su cuerpo aumenta, se vuelve vapor y desaparece. Cuando su temperatura baja, vuelve a su cuerpo de hielo."
,"Cryogonal no tiene evolución, ni evoluciona de ningún Pokémon."
,"");
insert into pokemon values (122, 'Shelmet', 7.7,0.4,"Cierra a cal y canto la visera de su caparazón al ser atacado. Solo los Karrablast pueden abrirla."
,"Su nombre proviene de las palabras inglesas de shell (concha) y helmet (casco).

Su nombre francés, Escargaume, procede de las palabras francesas escargot (caracol) y heaume (casco, yelmo)."
,"Este Pokémon evoluciona al entrar en contacto con un Karrablast, esta razón es desconocida, se han hecho investigaciones pero no ha habido resultados. Tienen poca defensa pero han desarrollado una armadura que lo protege de ataques. Cuando es atacado por un enemigo, cierra la tapa de su concha para defenderse y lanza un veneno pegajoso por las rendijas de la misma."
,"Shelmet evoluciona a Accelgor al ser intercambiado por Karrablast. Accelgor no evoluciona."
,"");
insert into pokemon values (123, 'Accelgor', 25.3,0.8,"Lucha escupiendo veneno y moviéndose a una velocidad de vértigo. Ha protagonizado películas y cómics de gran éxito."
,"Su nombre proviene de la palabra inglesa accelerate (acelerar) y de la palabra francesa escargot (caracol).

Su nombre japonés, Agilder, procede de las palabras inglesas agile (ágil) y rider (piloto).

Su nombre francés, Limaspeed, procede de la palabra francesa limace (babosa) y de la inglesa speed (velocidad)."
,"Accelgor está basado en la combinación de un ninja, un piloto de carreras y un gusano de tubo gigante.
Si su cuerpo se secara, se debilitaría, pero posee varias capas de finas membranas que rodea su cuerpo para protegerle de la deshidratación. Aún así, su capa protectora no le sirve como protección, aunque se siente ligero una vez liberado de su caparazón. Lucha y se mueve como un ninja."
,"Accelgor no evoluciona."
,"");
insert into pokemon values (124, 'Stunfisk', 11,0.7,"Ni un pisotón de un luchador de sumo lo aplastaría gracias a su piel sólida. Sonríe al soltar descargas eléctricas."
,"Su nombre en inglés viene de stun (aturdir, por su poder eléctrico), fish (pez) y tunfisk (atún en noruego)."
,"Stunfisk parece estar basado en un lenguado chueco o en una raya torpedo o tembladera, ya que es capaz de producir electricidad y su forma física es igual que este animal. Con su resistente piel, a él no le importa ni siquiera que un luchador de sumo se ponga encima de él. Cuando libera electricidad, su cara adopta una sonrisa."
,"Stunfisk no tiene evolución ni evoluciona de ningún Pokémon."
,"");
insert into pokemon values (125, 'Mienfoo', 20,0.9,"Abruma a sus enemigos encadenando ataques veloces y los hace trizas con sus afiladas garras."
,"Su nombre proviene de las palabras inglesas ermine (armiño) y de una deformación de kung fu.

Su nombre japonés procede de las palabras オコジョ okojo (armiño) y de kung fu.

Su nombre francés, Kungfouine, procede de la unión de las palabras kung fu y la palabra francesa fouine (armiño)."
,"Mienfoo está basado en un armiño y un luchador de kung-fu (un arte marcial que trata del dominio de la mente sobre el cuerpo).

Para evolucionar, necesita llegar a la perfección en sus artes marciales, lo que requiere muchos años de duro entrenamiento para fortalecerse. Una vez conseguida la madurez está preparado para evolucionar a Mienshao. La estrategia de ataque de Mienfoo consiste en atacar muchas veces seguidas para agobiar al rival. La velocidad de sus ataques depende de su concentración y en casos muy especiales depende de la unión con su entrenador.

Es un Pokémon muy leal a su entrenador, dispuesto a dar todo en los combates para no deshonrar a el entrenador. Este Pokémon es un auténtico guerrero que no abandona jamás."
,"Mienfoo evoluciona a Mienshao en el nivel 50. Mienshao no evoluciona."
,"");
insert into pokemon values (126, 'Mienshao', 35,1.4,"Si emite extraños aullidos, hay que extremar la precaución: empezará a repartir un sinfín de patadas y puñetazos a una velocidad pasmosa."
,"Su nombre en japonés puede ser una combinación de オコジョ/okojo ('armiño') y el taekwondo o koondo (una forma de origen japonés a base de artes marciales fundada en Corea del Sur).

Su nombre en inglés proviene de las palabras japonesas 'mien' ('aspecto'), o de 'ermine' ('armiño' en inglés) y 'shao', que es la primera parte de 'Shaolin', monasterio chino conocido por sus monjes que practican artes marciales."
,"Está basado en un kamaitachi con características de un luchador de kung-fu. Tiene unos largos bigotes, indicadores de que ha pasado gran parte de su vida entrenando. Sus brazos largos hacen recordar a las extremidades superiores de una mantis, animal que representa un tipo de kung-fu, arte con el que se asocia él y su preevolución, Mienfoo. De hecho, lucha empleando el estilo kung-fu de la Mantis del Norte - de ahí sus látigos de las patas y sus ataques veloces con estos."
,"Mienfoo evoluciona a Mienshao en el nivel 50. Mienshao no evoluciona."
,"");
insert into pokemon values (127, 'Druddigon', 139,1.6,"Habita en túneles. Pierde la movilidad si baja su temperatura corporal, por lo que aprovecha la menor oportunidad para tomar el sol."
,"Su nombre en japonés proviene de crimson (carmesí) y 顔 gan (cara) o 岩 gan (roca).

Su nombre, Druddigon, proviene de la mezcla de las palabras dragón (criatura en la que está basado) y ruddy (un color cuya tonalidad es cercana al rojo, al rosa y al carmesí)."
,"Este Pokémon está inspirado en un diablillo espinoso australiano. Es un Pokémon solitario y no suele salir de sus cuevas, a no ser que sea para cazar o en época de apareamiento, aunque esta última es menos frecuente debido a su rareza y a los pocos especímenes que quedan. Es muy buscado por los entrenadores de tipo dragón. Solo los domadragones expertos y los maestros Pokémon podrán capturarlo.
Este Pokémon suele ser muy buscado por los cazadores, debido a que por su extrema rareza se vende a muy alto precio. No les gusta nada encontrarse a otro de su misma especie, por su carácter agresivo y su gran forma de ser. Son muy difíciles de domesticar, ya se trate de una cría o de un adulto, pero si se cría con respeto, con el paso del tiempo te será fácil manejarlo y probablemente será uno de tus Pokémon más fieles.

También se dice que cuando la luz del sol toca sus alas, este calienta su cuerpo y se vuelve más fiero y poderoso. Quizás esto se deba a que algunos reptiles hacían lo mismo, con respecto al sol y a sus crestas o espinas.

Este Pokémon habita en cavernas, por las cuales se mueve trepando por las paredes, gracias a sus afiladísimas garras y a su escamosa piel, capaz de adherirse a superficies rocosas. Caza abalanzándose sobre sus presas, para darles el golpe mortal y luego arrastrarlas hacia lo más profundo de la cueva en la que habita, para comérselas, o también vuela en busca de una presa y una vez dado el golpe final lo lleva a su cueva."
,"Druddigon no tiene evolución ni evoluciona de ningún Pokémon."
,"");
insert into pokemon values (128, 'Golett', 92,1,"Habita en túneles. Pierde la movilidad si baja su temperatura corporal, por lo que aprovecha la menor oportunidad para tomar el sol."
,"Su nombre proviene del japonés ゴースト gōsuto (fantasma) y 土地 tochi (tierra).

Su nombre occidental está dado por el término golem, ser fantástico creado de tierra y barro, y el sufijo inglés -lett, que se usa para darle la condición de pequeño o joven a algo."
,"Golett fue creado por la ciencia de una antigua civilización, aunque los detalles exactos de como se creó aún son desconocidos. Parece estar inspirado fuertemente en un golem, ya que posee la gran mayoría de sus características. Su cuerpo está formado por trozos de tierra fundida, que se unen gracias al sello de su pecho. En su interior se guarda energía del interior de la Tierra, lo que le permite moverse."
,"Golett evoluciona a Golurk al nivel 43. Golurk no evoluciona."
,"");
insert into pokemon values (129, 'Golurk', 330,2.8,"Si se le desprende el sello del pecho, pierde el control y arrasa con todo sin miramientos: puede convertir un pueblo en un montón de escombros."
,"Su nombre occidental proviene de Golem, y de lurk, merodear o acechar, debido a su condición de guardián que debe estar vigilante de lo que cuida."
,"Esta inspirado en el mítico Golem de Praga, el cual era un ser creado con materiales como barro y arcilla y se le dio vida con alquimia y se le puso un sello en el pecho para no dejar escapar su energía de vida y cuya labor era obedecer a todo aquel que le pusiera un papel en la boca.
Se cree que este Pokémon está basado en un coloso debido a su tamaño y a su forma de golem igual que su preevolución, pero la falda hace creer que se inspira en Talos, el gigante metálico que guardaba la isla de Creta en la mitología griega.

Se dice que vuela por el cielo a la velocidad del sonido. Si se quita el sello de su pecho, su energía se vuelve incontrolable. Esto se comprueba en los videojuegos, cuando al tensar los músculos, el sello tiembla y en el hecho de que su pecho esté agrietado de punta a punta.

Algunas partes de su cuerpo son de colores diferentes, lo cual, en relación a lo anterior, hace suponer que esas partes se rompieron como consecuencia de la acumulación de energía y fueron sustituidas."
,"Golurk no evoluciona."
,"");
insert into pokemon values (130, 'Pawniard', 10.2,0.5,"Desafía sin temor a enemigos poderosos. Si es necesario, se aferra al rival y le clava las cuchillas que le recubren el cuerpo."
,"Su nombre viene de las palabras en inglés pawn (peón) y yard (acorralar).

Puede que su nombre en japonés provenga de la palabra Katana (un tipo de sable usada por los samuráis de la cultura japonesa) debido a las múltiples cuchillas que tiene en el cuerpo.

Su nombre francés, Scalpion, viene de las palabras Scalpel (escalpelo, bisturí) y Pion (peón)."
,"Pese a su pequeño tamaño, es muy fuerte en batalla debido a su carácter y a sus poderosas cuchillas, hechas de un acero que está tan afilado que puede cortar cualquier cosa.

Estos Pokémon usan las afiladas hojas repartidas por todo su cuerpo como su principal arma en combate y son su medio de subsistencia en la vida al aire libre. Normalmente se les ve en estado natural en grupo, bajo las órdenes de un Bisharp dominante. Suelen cazar acorralando a su presa, a la que se aferran y nunca dejan huir. Una vez que su víctima está reducida, le corresponde al Bisharp dominante asestar el golpe de gracia. Debido al constante uso de sus afiladas hojas, Pawniard debe estar afilandolas muy a menudo. Para esta tarea, se sirve de rocas de río. Solían ser usados en castillos junto con su evolución para defender el feudo."
,"Pawniard evoluciona a Bisharp en el nivel 52. Bisharp no evoluciona."
,"");
insert into pokemon values (131, 'Bisharp', 41,1.5,"Dirige a varios Pawniard para conformar grupos. Tras una disputa territorial, el grupo victorioso incorpora a los vencidos."
,"Su nombre viene de las palabras inglesas bishop (alfil) y sharp (afilado).

Su nombre francés, Scalproie, viene de las palabras francesas scalpel (escalpelo o bisturí) y proie (presa) o roi (rey)."
,"Bisharp, junto con su preevolución, están basados en piezas de ajedrez: mientras que Pawniard se basa en un peón, Bisharp se trata de un alfil. Este Pokémon usa las afiladas cuchillas de sus brazos para atacar. Caza presas muy seguido y en grandes cantidades, acompañado por varios individuos de su preevolución Pawniard, actuando como su líder.

Está posición está en constante disputa, pues un Pawniard de su séquito al evolucionar o un Bisharp solitario puede retar al Bisharp dominante por el liderazgo del grupo. Dado que sólo puede haber uno por grupo, una vez que la disputa termina, el Bisharp vencido es expulsado y tendrá tres opciones: formar su propio grupo, entrenarse para volver a combatir por el liderazgo del grupo o desafiar a otro Bisharp de un grupo diferente. Mientras no consiga un nuevo séquito deberá arreglárselas a solas."
," Bisharp no evoluciona."
,"");
insert into pokemon values (132, 'Bouffalant', 94.6,1.6,"Puede destrozar un coche de un solo testarazo. Cuanto más abundante sea su melena, mayor rango tendrá en la jerarquía de la manada."
,"Su nombre es la combinación de las palabras 'bouffant': Palabra francesa que denota el estilo de corte de cabello que tiene, y 'buffalo', búfalo en inglés. Su nombre en japonés proviene de la mezcla de buffalo (búfalo) y del katakana de afro (afuro)."
,"Está basado en un bisonte o un búfalo cafre. Se caracteriza por tener una gran cantidad de pelo y unos grandes cuernos con aros incrustados. Por su forma de bóvido y por el hecho de que cuando se molesta puede ser muy peligroso y agresivo, tiene mucho en común con Tauros.

Cuando este Pokémon da un violento cabezazo, la mata de pelo de su cabeza amortigua y absorbe el daño total del impacto (como si fuese un casco). Pero esto es solo generalmente, ya que en el anime se ha podido ver que aunque entrenan de esta forma, a veces se hacen daño entre ellos. Se suelen encontrar salvajes en las llanuras de Teselia comiendo pastos, mientras que en estado doméstico se encuentran en granjas. Cuando otros Pokémon o personas invaden su territorio suelen atacarlas, a no ser que lleven el pelo de la forma que lo tienen los Bouffalant, ya que en este caso considerarían que son de la misma especie por lo que no les atacarían.
Suelen ser muy protectores puesto que sus crías son sus tesoros más preciados y en época de celo son tan agresivos que todo aquel que se acerque a ellos será corneado brutalmente. Tienen rivalidad con Tauros, por eso viven separados a grandes distancias y los separan de sus crías."
,"Bouffalant no tiene evolución ni evoluciona de ningún Pokémon."
,"");
insert into pokemon values (133, 'Rufflet', 10.5,0.5,"Desafía indiscriminadamente a cualquier rival. Cada vez que le hieren en combate o se debilita, no hace sino aumentar su fortaleza."
,"Su nombre parece estar basado en la combinación de las palabras 'ruffle' que se usa para denominar a algo despeinado o erizado en el caso de las plumas y la palabra 'eaglet' que significa 'aguilucho', haciendo referencia a una cría de águila.

Su nombre japonés podría provenir de 鷲 Washi (águila)."
,"Está basado en un pichón de águila calva, y tiene una pluma colorida en la frente en representación de las tribus indígenas norteamericanas. Es muy seguro de sí mismo.
Con la fuerza de sus garras aplasta cráneos. Se encuentra dispuesto a hacer frente con valentía incluso al adversario más poderoso, puesto que esto lo fortalece en gran medida para alcanzar su forma evolucionada. Suele ser presa de los Krookodile en algunas ocasiones, así como en otras es protegido por sus progenitores."
,"Rufflet evoluciona a Braviary al Nivel 54. Braviary no evoluciona."
,"");
insert into pokemon values (134, 'Braviary', 24.5,0.8,"Guerrero avezado de los cielos. Su número de cicatrices es directamente proporcional al respeto que recibe de los suyos."
,"Su nombre proviene de las palabras inglesas brave (valiente) y aviary (aviario).

Su nombre japonés proviene de las palabras inglesas war (guerra) y eagle (águila), el cual se nota en su aspecto que es muy parecido a una."
,"Está basado en una águila calva, lleva lo que parece ser un tocado indígena en su cabeza como los que usaban algunas tribus indígenas que vivieron en Norteamérica.
Braviary normalmente es solitario, caza sobrevolando bosques y aprovechando su excelente visión, ya que puede divisar una presa a 3000 metros de altura. Su carácter es fuerte y agresivo y se enfada con mucha facilidad (al igual que Primeape y Staraptor).

Siendo un ave rapaz y aerodinámica es capaz de alcanzar grandes velocidades en picado, lo que le da una muy buena ventaja contra Pokémon lentos. Sus presas principales son Patrat y Minccino y en ocasiones se los ve cazando Sandile.
Lucha para proteger a sus amigos sin detenerse a considerar el peligro. Se dice que cuantas más cicatrices tenga, más respeto tendrá entre los suyos."
,"Braviary no evoluciona."
,"");
insert into pokemon values (135, 'Vullaby', 9,0.5,"Usa una calavera del tamaño apropiado para proteger sus posaderas. Es proclive a perseguir Pokémon débiles."
,"Su nombre proviene de las palabras inglesas 'Vulture' (Buitre) y 'baby' (bebé) lo que vendría siendo Buitre bebé, o también de vulture (buitre) y lullaby (canción de cuna)."
,"Vullaby parece estar basado en una cría de buitre. Su cascarón tiene la forma de un cráneo quebrado a la vez que simula un pañal, mientras que su evolución tiene los dientes como cinturón. Ya que sus alas son muy pequeñas, no puede volar muy alto y se cansa rápidamente. Y cuando le queda poco para evolucionar, se desprende de su cascarón."
,"Vullaby evoluciona a Mandibuzz en el nivel 54. Mandibuzz no evoluciona."
,"");
insert into pokemon values (136, 'Mandibuzz', 39.5,1.2,"Busca sin cesar comida para alimentar a Vullaby. Atrapa al instante a cualquier Pokémon cansado que aviste y se lo lleva al nido."
,"Su nombre puede provenir de las palabras, mandible, (mandíbula en inglés), y de buzzard (zopilote en inglés).

Su nombre en japonés viene de vulture (buitre en inglés) y regina (reina en latín, por ser siempre hembra)"
,"Mandibuzz parece estar basada en un buitre o en un quebrantahuesos.
La mitad superior de un cráneo, haciendo de pañal, que tenía su preevolución es cambiada por una mandíbula superior que hace a la vez de mandil, además de que aparece un peculiar hueso haciendo de gancho en su cabeza, posiblemente representa a los que usan algunas tribus africanas. Parece tener un aspecto muy siniestro pero algunos entrenadores llegan a volverse muy buenos amigos de ellas, haciéndose siempre leal a estos. Los egipcios creían que todos los buitres eran hembras, tal vez por eso los Mandibuzz solo pueden ser hembras.

Este Pokémon recopila huesos de otros Pokémon para fabricar su nido. Agarra presas débiles con sus garras y las lleva a su nido de huesos para alimentar a sus crías."
,"Mandibuzz no evoluciona."
,"");
insert into pokemon values (137, 'Heatmor', 58,1.4,"Absorbe aire por el orificio de la cola para prender las llamas que expulsa. Si la abertura se obstruye, enferma."
,"Su nombre proviene de las palabras inglesas heat (calor) y armor (armadura).

Su nombre en japonés procede de アリクイ arikui (oso hormiguero)."
,"Heatmor está basado en un oso hormiguero debido a su apariencia y clara enemistad con los Durant, aunque también podría pensarse que esta inspirado en un pangolín gigante, por sus características físicas tan similares. Este Pokémon se alimenta principalmente de Durant. También se pueden alimentar de otro tipo de insectos una vez cazados y quemados.

Absorbe aire por el agujero de su cola para alimentar a la llama en el interior de su cuerpo y lo expulsa por su hocico, formando una lengua de fuego que derrite fácilmente el acero, permitiendo llegar al interior de los Durant para comérselos. Su potente armadura de magma solidificado le protege de los ataques de su enemigo natural, los Durant."
,"Heatmor no tiene evolución ni evoluciona de ningún Pokémon."
,"");
insert into pokemon values (138, 'Durant', 33,0.3,"Deposita sus huevos en la parte más profunda del nido. Si un Heatmor lo ataca, se defiende mordiéndolo con sus enormes mandíbulas."
,"Su nombre puede provenir de las palabras en inglés: durable (duradero) y ant (hormiga).

Su nombre en japonés proviene de iron (hierro) y ant (hormiga)."
,"Durant está cubierto de una armadura de acero, posee 6 patas y dos antenas. Los Durant viven en grandes hormigueros cavados en las montañas, destacan por su trabajo en equipo y por lanzarse agresivamente a sus presas y enemigos. Ellos contrarrestan los ataques de Heatmor, su enemigo mortal, asaltando en grupo. Durant está inspirado en una hormiga plateada (la hormiga más veloz del mundo)."
,"Durant no tiene evolución ni evoluciona de ningún Pokémon"
,"");
insert into pokemon values (139, 'Deino', 17.3,0.8,"Al no poder ver, su forma de percibir el entorno es mordisquear todo lo que encuentra, incluido su Entrenador hasta que se familiariza con él."
,"Su nombre viene de la palabra deinos ('terrible' en griego) y de ein (palabra usada para el número 1 en alemán), en referencia al número de cabezas que tiene en esta etapa.

Su nombre en japonés viene de mono ('uno' en griego) y zu ('cabeza'), en referencia al número de cabezas que tiene en esta etapa."
,"La conducta de este Pokémon lo lleva a morder cualquier cosa. En cuanto a la comida, se lo come todo. Es peligroso acercarse a él sin cuidado. Su cuerpo está lleno de heridas debido a los placajes que realiza, ya que al tener sus ojos cubiertos, no es capaz de ver muy bien sus objetivos. Cuando se prepara para evolucionar, la escamosa piel que tiene se le endurece."
,"Deino evoluciona a Zweilous en el nivel 50. Zweilous evoluciona a Hydreigon en el nivel 64. Hydreigon no evoluciona."
,"");
insert into pokemon values (140, 'Zweilous', 50,1.4,"Sus dos cabezas se llevan fatal. Si no reciben el mismo afecto por igual, se enzarzan en una gran pelea a causa de los celos."
,"Su nombre proviene de zwei (dos en alemán) y soul (alma en inglés) al revés, quedando como dos almas. Otra interpretación podría ser que el sufijo '-Lous' podría hacer referencia a la palabra 'Jealous' que significa 'Celoso' en inglés, ya que las dos cabezas de este Pokémon siempre están peleando por la comida del otro.

Su nombre japonés proviene de la pronunciación alterna del número dos, 'ni', y 'head', 'cabeza' en inglés."
,"Este Pokémon se come a todas sus presas en su territorio. Cuando acaba, se traslada a una zona distinta. Las dos cabezas que tiene se llevan fatal por sus personalidades distintas. Cuando evoluciona a Hydreigon su cabeza se abre como una flor y se puede ver su verdadera cara. Este Pokémon puede comer de todo y más al ser omnívoro. Vive en frondosos bosques donde normalmente se encuentra cuatro o tres familias de Deino, Hydreigon y Zweilous."
,"Zweilous evoluciona a Hydreigon en el nivel 64. Hydreigon no evoluciona."
,"");
insert into pokemon values (141, 'Hydreigon', 160,1.8,"La cabeza central es la única dotada de cerebro. Si bien posee un gran intelecto, la destrucción es el único pensamiento que le ocupa."
,"Su nombre puede venir de hydra (hidra en inglés, monstruo mitológico griego con el que guarda parecido), drei (tres en alemán) y dragon (dragón en inglés).
Tanto el sa y zan en el nombre japonés de Hydreigon parecen provenir de 三 sa/san, o tres, una referencia a sus tres cabezas. El dora en el nombre de Hydreigon proviene de cualquiera de dragón o hidra, una posible referencia a las múltiples cabezas de hidra de la tradición griega. El 'dora' de su nombre también puede ser una referencia al kaiju King Ghidorah.
Su nombre francés, Trioxhydre, viene de las palabras trio (de tres) y hydre (hidra), junto con la nociva forma gaseosa trioxide (trióxido)."
,"Está basado en una hidra (dragón eslavo) o en el cerbero (perro de tres cabezas), ambos monstruos pertenecientes a la mitología griega en la vida real. Aunque, según se dice guarda similitudes con el segundo ya que es el guardián del inframundo al igual que el mismo cerbero pero en el mundo Pokémon.

Es un Pokémon que vuela continuamente por el cielo con sus seis alas, detectando cualquier cosa que se mueva como un enemigo al que atacar. Hydreigon solo obedecerá a un entrenador que considere digno de su respeto y valentía. Tiene un gran poder y según la mitología de Teselia, se cuenta que cuando un dragón de tres cabezas (Hydreigon) y otro dragón de colmillos desgarradores (Haxorus) se encontraban cada vez, destruían todo a su paso; hoy en día no es algo tan común porque los Pokémon Rangers han distribuido los territorios de estas dos bestias para que no vuelva el caos como en la antigüedad. Este Pokémon no puede entrar en contacto físico con Haxorus, por lo anteriormente dicho.

Además, este Pokémon puede ser un poco molesto; pero si se cuida perfectamente y se le da confianza, puede llegar a ser uno de los mejores Pokémon de un equipo y hasta puede llegar al punto de sacrificar su vida por la de su entrenador. Las cabezas de sus brazos no tienen cerebro. Si se encuentra con alguien aun más fuerte, Hydreigon intentará derrotarlo usando cualquier método posible."
,"Hydreigon no evoluciona."
,"");
insert into pokemon values (142, 'Larvesta', 28.8,1.1,"Antaño lo llamaron la Larva que Hurtó el Sol. Las llamas que brotan de sus cuernos pueden fundir sin problema una plancha de acero."
,"Su nombre proviene de la combinación de las palabras larva y Vesta (Diosa romana del fuego sagrado y del hogar).

Su nombre japonés, Merarva, viene de meramera (メラメラ), 'ardiente' en japonés y de larva."
,"La gente cree que este Pokémon nació del sol. Suele vivir en lo mas profundo del interior de los volcanes y en otros lugares calientes donde el calor es tan fuerte y prolongado que cualquier otro Pokémon no sobreviviría. Cuando evoluciona todo su cuerpo está rodeado en llamas.
Su cuerpo está formado por una columna segmentada similar a la de las orugas, teniendo también una melena blanca que abarca toda su cabeza y la mitad de su cuerpo, mientras que a su alrededor emergiendo del cúmulo blanco, sale una corona de cuernos rojos que dan forma como si fuese un sol, por los cuales escupe fuego como una táctica de defensa. Cuenta con seis patas (tres a cada lado) y sus ojos se tornan azules.

Se dice que cuando este Pokémon está a punto de evolucionar se envuelve en un capullo de fuego para protegerse mientras se halla en ese estado vulnerable de transición."
,"Larvesta evoluciona a Volcarona en el nivel 59. Volcarona no evoluciona."
,"");
insert into pokemon values (143, 'Volcarona', 46,1.6,"El calor que irradia le granjea pocas simpatías en tierras cálidas. Por el contrario, en las regiones más frías lo veneran como encarnación del sol."
,"Su nombre proviene de las palabras inglesas volcano (volcán) y corona (corona solar).

Su nombre japonés, Urgamoth, proviene las palabras ウルカヌス Urukanusu (Vulcano), 蛾 ga (polilla) y de la palabra inglesa moth (polilla)."
,"Volcarona está basado en una Attacus atlas, considerada como la mariposa más grande del mundo. También parece recibir inspiraciones del daikaiju japonés, Mothra, ya que poseen una apariencia similar.

Se dice que cuando la superficie de la Tierra fue ocultada por ceniza volcánica, la llama de Volcarona sirvió de sustituto del sol y gracias a ello salvó a muchos Pokémon de la congelación. Cuando combate, expulsa una gran cantidad de escamas provenientes de sus alas, generando un increíble mar de fuego. Su entrenamiento es difícil y su hábitat engloba zonas áridas y sumamente calurosas."
,"Volcarona no evoluciona."
,"");
insert into pokemon values (144, 'Cobalion', 250,2.1,"Cuenta una leyenda que combatió contra los humanos junto a Terrakion y Virizion para proteger a los Pokémon de Teselia."
,"El nombre deriva de cobalto, tanto el metal como el color y la terminación del trío 'ion', el ion posiblemente provenga de champion (campeón en inglés)."
,"Cobalion parece estar basado en el personaje de Athos de la novela Los tres mosqueteros. Al igual que Athos, Cobalion es el más antiguo y el líder de facto del grupo. Tiene gran parecido a una especie de antílope como el Hipótrago azul. Cobalion es un Pokémon legendario que lucha contra los seres humanos con el fin de proteger a los Pokémon. Tiene una naturaleza serena con un cuerpo y un corazón de acero. Hace mucho tiempo se escondió en la Cueva Loza para protegerse de la destrucción de Teselia por parte de los humanos."
,"Cobalion no tiene evolución ni evoluciona de ningún Pokémon."
,"");
insert into pokemon values (145, 'Terrakion', 260,1.9,"Posee una fuerza extraordinaria, y combatirá sin miramientos contra cualquier adversario que se meta con Pokémon más pequeños y débiles."
,"El nombre Terrakion pudiera derivar de terracota, un material basado en arcilla, así como su color respectivo. También puede provenir de terra, latino para tierra, y la terminación del trío 'ion'."
,"Terrakion parece estar basado en el personaje de Porthos de la novela Los tres mosqueteros. Al igual que Porthos, Terrakion es el más grande y más pesado, además del más fuerte miembro del trío. También tiene rasgos de bueyes o carneros.

Torna batallas contra los seres humanos con el fin de proteger a los Pokémon que han perdido su hábitat debido a las guerras humanas. Tiene el poder de carga para penetrar gruesos muros de un castillo en una sola toma. Un Pokémon que se menciona muy seguido en las leyendas de Teselia. Es difícil indicar su hábitat ya que suele estar en constante movimiento para asegurarse de que los Pokémon estén a salvo y es complicado capturarle ya que se suele decir que solo se mostrará ante los entrenadores con mente, alma y corazón de guerrero pero sobre todo que cuide de sus Pokémon. Una vez capturado es más pacífico hacia los humanos, no como antes, pero también valora mucho su forma de haber sido capturado ya que si lo capturas injustamente te costará bastante dominarle."
,"Terrakion no tiene evolución ni evoluciona de ningún Pokémon."
,"");
insert into pokemon values (146, 'Virizion',200,2,"Según una leyenda, luchó con valentía junto a Cobalion y Terrakion para proteger a los Pokémon de Teselia."
,"Su nombre viene de viridian un tono de verde que es un tanto azulado. También puede venir de la palabra viridarium (jardín en latín) y la palabra ion correspondiente del trío, la cual proviene de champion (campeón en inglés)."
,"Virizion parece estar basado en el personaje de Aramis de la novela Los tres mosqueteros. Al igual que Aramis, es el mejor en esgrima y también el más vanidoso y romántico, cualidades que Virizion posee en relación con sus compañeros. Es un Pokémon que desafía a los seres humanos a la batalla con el fin de proteger a sus compañeros. Su leyenda se ha transmitido de generación en generación. El cuerno de su cabeza es una espada afilada. Se lanza a su enemigo sin rodeos para atacar y acostumbra atacar a corta distancia."
,"Virizion no tiene evolución ni evoluciona de ningún Pokémon."
,"");
insert into pokemon values (147, 'Tornadus', 63,1.5,"La parte inferior de su cuerpo, similar a una nube, está recubierta de un campo de energía. Vuela a 300 km/h."
,"Su nombre viene de las palabras inglesas tornado (tornado) y Aeolus (Eolo, señor griego del viento).

Su nombre en francés (Boréas) y en alemán (Boreos) están basados en el dios griego del viento del norte, Bóreas."
,"Tornadus tiene la apariencia de un genio u ogro verde cabalgando sobre una nube de la que sale una especie de cola que sirve para agarrar y ahogar. Al igual que Thundurus posee cuernos en su cabeza, pero Tornadus tiene dos, mientras que Thundurus solo uno. Está basado en Fūjin, el espíritu del viento.

Su parte inferior está envuelta en una nube, y lo envuelve como un cuerpo de energía. Vuela por el cielo a una velocidad promedio de 300 km/h. La energía que fluye desde la cola de Tornadus despierta grandes tormentas, las cuales pueden llegar a crear hasta grandes ciclones. Tornadus es un Pokémon muy agresivo, para divertirse crea tornados enormes capaces de arrasar casas. Además se mete en los tornados y con su cola agarra lo que desea y se lo lleva al interior del tornado."
,"Tornadus no tiene evolución ni evoluciona de ningún Pokémon."
,"");
insert into pokemon values (148, 'Thundurus', 61,1.5,"Lanza descargas eléctricas por las púas de su cola. Sobrevuela Teselia dejando caer rayos."
,"Su nombre proviene de las palabras inglesas thunder (trueno) y Aeolus (Eolo, señor griego del viento)

Su nombre en japonés puede ser una combinación de volt (trueno), Thor y de Aeolus (Eolo en griego)."
,"Thundurus tiene la apariencia de un genio azul cabalgando sobre una nube. Tiene una cola negra de pinchos eléctricos similar a la del dios japonés del rayo Raijin con la que crea sus grandes descargas eléctricas. Además, posee un cuerno en su cabeza.

Se dice que las tierras por las que Thundurus pasa quedan con incontables cicatrices y marcas provocadas por la caída de su ataque trueno. La energía eléctrica que está cargada en la nube de Thundurus genera grandes lluvias, las cuales pueden despertar grandes tormentas cargadas de truenos. Es un Pokémon muy agresivo ya que lanza rayos sin más, sin importarle lo que le suceda a nadie con tal de divertirse. Sobrevuela la región de Teselia provocando rayos, camuflándose en su propia nube para que no sea distinguido por las personas. Suele estar en el sur por la mañana, centro por la tarde y norte por la noche."
,"Thundurus no tiene evolución ni evoluciona de ningún Pokémon."
,"");
insert into pokemon values (149, 'Reshiram', 330,3.2,"Pokémon legendario capaz de abrasar el mundo con sus llamas. Ayuda a quienes persiguen un mundo veraz."
,"El nombre en japonés de su especie (はくよう) está formado con las palabras はく (color blanco) y よう (Yang), es decir, el punto blanco del Yang, que con Zekrom formarían lo que se conoce como Yin y Yang. También proviene de la palabra shiramu que significa aclarar en japonés o de shiroi que significa blanco."
,"Es el Pokémon Yang, el Pokémon Veraz, el Pokémon de la realidad, al contrario de Zekrom que es el Pokémon Yin, el Pokémon Puro, Pokémon de la imaginación. A Reshiram se le conoce como el portador de la verdad y el calor. Las leyendas cuentan que él y Zekrom eran un mismo Pokémon, y que al convertirse en 'dos', hicieron cenizas la región de Teselia. Desde entonces permanece dormido hasta que sea despertado con la ayuda del Orbe claro.
Su cola es un generador similar a una antorcha que desprende intensas llamas y quema todo a su alrededor. Si a eso le añadimos el aspecto 'humeante' que tiene, tanto su cola en forma de antorcha como su cabellera, recuerdan a humo o vapor, que hacen referencia al tipo fuego.

Las llamas que sopla Reshiram queman completamente sus alrededores. Se dice que el calor que emerge de él mueve la atmósfera terrestre gracias a la energía térmica que produce. Cuando está furioso lanza llamaradas quemando todo sin importarle lo que le pase a los demás, también lanza llamas por su cola. Su cola tiene un gran propulsor que le funciona como conductor ígneo sirviendole para volar mas ágilmente. Este Pokémon es muy fácil de distinguir en el cielo, ya que vuela con mucha elegancia dejando un rastro de llamas similares a las estelas de los meteoritos, generadas por su propulsor ígneo. Es un Pokémon muy serio y de fuerte carácter pero también es muy tranquilo, no soporta a la gente que no es digna ni leal. Dicen que sólo se ha aparecido a personas que tienen un corazón puro y honrado. Puede evaporar el agua de un lago entero con tan sólo lanzar una llamarada. Genera tanto calor dentro de su cuerpo que es capaz de cambiar el clima, provocando grandes sequías y terremotos, pero no lo hace con el fin de hacer daño a nadie.
El hecho de que Reshiram sea mascota de Pokémon Negro, así como Zekrom de Pokémon Blanco, da por entendido el antiguo relato de que Yin tiene un poco de Yang, así como Yang tiene un poco de Yin; lo mismo pasa con los ojos, ya que Reshiram tiene los ojos azules, color de los rayos de Zekrom, y también su aspecto de ángel, cosa que asociamos con el cielo, lugar de donde caen las tormentas y los rayos. Por otra parte, Zekrom tiene los ojos rojos, color de las llamas de Reshiram, y también su aspecto de demonio, cosa que relacionamos con el infierno y fuego. Se dice que él y Zekrom antes eran un sólo Pokémon, y éste se dividió en dos para que cada una de las partes en las que se dividió pudiese irse con un humano distinto, uno que decía que los Pokémon deberían ser libres, y otro que sostenía que eran felices con los humanos."
,"Reshiram no tiene evolución ni evoluciona de ningún Pokémon."
,"");
insert into pokemon values (150, 'Zekrom', 345,2.9,"Pokémon legendario capaz de chamuscar el mundo con sus rayos. Ayuda a quienes persiguen un mundo de ideales."
,"Su nombre, al parecer, proviene del término japonés kuromu, que podría traducirse por 'volverse negro' o 'teñido con oscuridad'. 
Otra posibilidad es que provenga de elektron, palabra griega que significa ámbar, una resina fósil que es capaz de cargarse de electricidad."
,"Es el Pokémon Yin, el Pokémon Puro, Pokémon de la imaginación, al contrario de Reshiram, que es el Pokémon Yang, el Pokémon Veraz, Pokémon de la realidad. Se le conoce como el portador de los sueños y la energía. Las leyendas cuentan que él y Reshiram eran un mismo Pokémon, y que al convertirse en 'dos', hicieron cenizas la región de Teselia. Desde entonces permanece dormido hasta que se le despierte con la ayuda del Orbe oscuro.
Su cuerpo está surcado de canales por donde fluye su energía, y tiene una cresta en forma de rayo que sale de la parte posterior de su cabeza y cuya punta brilla en un color azul. Además, posee una turbina eléctrica en la cola por donde genera su propia electricidad. Se alimenta de nubes que después expulsa para crear tormentas.
Crea electricidad sin parar que llega hasta voltajes impresionantes mediante la turbina de su cola, y puede llegar a ser muy peligroso ya que desprende mucha energía térmica, producto de las altas temperaturas que llega a alcanzar al generar electricidad.

El potencial eléctrico que posee es tan grande que puede producir el apagón de una ciudad entera o descargarlo violentamente en forma de truenos y rayos, destruyendo todo lo que le rodea. Utiliza también esta electricidad para surcar los cielos de la región Teselia, pudiendo alcanzar velocidades de hasta 400 km por hora gracias a la propulsión eléctrica de su turbina. Mientras vuela, se esconde en nubes de tormenta que él mismo genera, y suele causar muchos estragos, ya que por donde pasa va dejando una especie de estela oscura que despierta nubes negras cargadas de potentes tormentas, aunque no lo haga con intención de herir; esto afecta al clima, provocando tempestades eléctricas y generando lluvias y diluvios que ocasionan inundaciones. Zekrom es un Pokémon muy poderoso, pero a la vez no muy violento. Sólo ataca para defenderse o cuando es realmente necesario. 

El hecho de que Zekrom sea mascota de Pokémon Blanco, así como Reshiram de Pokémon Negro, da por entendido el antiguo relato de que Yin tiene un poco de Yang así como Yang tiene un poco de Yin; lo mismo pasa con los ojos, ya que Zekrom tiene los ojos rojos, color que asociamos con el fuego (tipo secundario de Reshiram), y también su aspecto de demonio, cosa que asociamos también con el fuego, mientras que Reshiram tiene los ojos azules, color que asociamos con lo eléctrico (tipo secundario de Zekrom), y también su aspecto de ángel, cosa que relacionamos con las nubes y tormentas. Otro hecho que refuerza esta simbiosis es que el ataque más poderoso de Zekrom, Ataque fulgor, usando la palabra fulgor (la cual se suele relacionar con el fuego, tipo al que pertenece Reshiram), al igual que el ataque más fuerte de Reshiram, Llama azul, usa la palabra azul (el cual es el color de los rayos de Zekrom).

Zekrom sobrevuela la región de Teselia escondiéndose en nubarrones cargados de electricidad generada por él mismo para no ser identificado por las personas."
,"Zekrom no tiene evolución ni evoluciona de ningún Pokémon."
,"");
insert into pokemon values (151, 'Landorus', 68,1.5,"Lo consideran una deidad de las cosechas porque los cultivos crecen en abundancia en las tierras por las que pasa."
,"Su nombre puede ser una combinación de land (tierra en inglés) y el sufijo us que se le agrega a los integrantes del trío al que pertenece.

Su nombre en alemán y francés proviene de Deméter, la cual era la diosa de las cosechas en la mitología griega."
,"Las tierras que Landorus visita acaban con grandes cosechas de trigo, por lo que se le considera el señor de la agricultura.
Cuando se pone agresivo es capaz de hacer levitar árboles a su antojo, manipularlos y lanzarlos donde quiera, similar a un Planta feroz. Puede fertilizar la tierra o volverla estéril. Es el único capaz de parar a Thundurus y Tornadus cuando estos se pelean, así que se le podría considerar como el mediador de los dos."
,"Landorus no tiene evolución ni evoluciona de ningún Pokémon."
,"");
insert into pokemon values (152, 'Kyurem', 325,3,"Pokémon legendario que aguarda al héroe que compense el vacío de su cuerpo de hielo con verdad e ideales."
,"El nombre Kyurem en japonés puede derivar de 急冷 kyuurei (enfriamiento rápido, 冷 Rei significa 'frío' o 'cero'), de kyōryū (恐竜, dinosaurio) o ゆき yuki (雪, nieve)."
,"Su aspecto, racionalmente, parece estar basado en un terópodo y un dragón europeo. Al ser del tipo hielo, puede aludir a la ausencia de energía o desequilibrio ambiental.
Tiene el poder de crear condiciones bajo cero grados, pero en consecuencia se congela su cuerpo también. Kyurem representa las bajas temperaturas, es decir, la pérdida de energía y puede causar enormes nevadas y granizos donde este Pokémon desee.

Este Pokémon habita comúnmente en lugares con temperaturas por debajo de los cero grados, para que el hielo que lo recubra absorba la energía de la nieve y así fortalecerse y tener más poder. Genera una energía poderosa y helada en el interior de su cuerpo pero cualquier fuga termina congelándolo. Es un Pokémon poderoso, ya que es capaz de congelar tanto a sus presas que es capaz de destruirlas. Allá donde va este Pokémon caen poderosas ráfagas de hielo, surgen tormentas de nieve, ventiscas y se forman témpanos de hielo."
,"Kyurem no tiene evolución ni evoluciona de ningún Pokémon."
,"");
insert into pokemon values (153, 'Keldeo', 48.5,1.4,"Corre por mares, ríos o cualquier superficie acuática de todo el mundo. Aparece en aguas límpidas."
,"El nombre Keldeo puede derivarse de Kelpie, caballo acuático de la mitología celta y de rodeo."
,"Puede estar basado en un Kelpie ,'Kirin' o en un 'unicornio'. Este Pokémon corre por todo el mundo, buscando al parecer fuentes de agua limpia donde establecerse. Completa el grupo de espadachines místicos, de la misma forma que D'Artagnan con los tres mosqueteros. Lanza agua desde sus pezuñas, y se mueve por la superficie del agua como si estuviera caminando sobre tierra. Lucha con sus patas usando técnicas especiales. Corre por mares, ríos o cualquier superficie acuática de todo el mundo. Aparece en aguas limpias."
,"Keldeo no tiene evolución ni evoluciona de ningún Pokémon."
,"");
insert into pokemon values (154, 'Meloetta', 6.5,0.6,"Las melodías que canta Meloetta tienen el poder de hacer sentir felicidad a los Pokémon que hay a su alrededor."
,"El nombre de Meloetta en todos los idiomas deriva de las palabras inglesas melody (melodía) y pirouette (pirueta)."
,"En su forma lírica le atrae cantar, y bailar en su forma danza. Canta con una vocalización única capaz de llegar a todas las notas, que manipula libremente las emociones de las criaturas que escuchan su melodía. Tiene la apariencia humana con ojos azul cielo, de pelo verde con el pentagrama musical. Su cuerpo es negro, sus piernas blancas y sus brazos tienen forma de nota musical. A lado de su cabeza tiene un adorno con forma de clave de sol, que también imita un auricular con micrófono relacionando que su forma lírica se basa en una cantante. Lleva una especie de vestido de cola larga.

Su forma danza tiene el cabello con un tono rojizo, al igual que sus ojos y la joya de su frente. El adorno del pelo se convierte en un pasador que recoge su pelo enrollado alrededor de la cabeza y su vestido de cola larga pasa a simular un tutú en forma de flor, esto en referencia a que su forma danza se basa en una bailarina. A pesar de tener forma femenina no es hembra, en vez de eso no tiene género."
,"Meloetta no tiene evolución ni evoluciona de ningún Pokémon."
,"");
insert into pokemon values (155, 'Genesect', 82,1.5,"Pokémon de tipo Bicho de la antigüedad, modificado por el Equipo Plasma. El cañón de su lomo ha sido mejorado."
,"Su nombre podría derivar de las palabras 'genetic' (genético en inglés) e 'insect' (insecto en inglés), haciendo referencia a su tipo bicho y que se trata de un Pokémon artificial. También podría venir de la palabra 'Génesis', en referencia a la antigüedad que tiene, o de la palabra genocidio debido a que fue creado como 'un arma'."
,"Hace 300 millones de años los Genesect eran conocidos como los cazadores más fieros y eficaces.
Estos Pokémon han sido modificados por el Equipo Plasma, a los cuales les hicieron varias mejoras, entre ellas un cañón que llevan en su lomo. No se sabe cómo los consiguió el Equipo Plasma, pero sí se sabe que se decidió no derrochar la oportunidad de crear un Pokémon increíblemente poderoso, por lo que le integraron una armadura y bastante armamento tecnológico al cuerpo de estos Pokémon.

Además, los Genesect hacen que su cuerpo sea más aerodinámico, recogen sus extremidades hacia atrás e insertan su cañón en el agujero que tiene en la parte posterior de su cabeza, así consiguen ser más ligeros. En este estado, la forma de Genesect cambia, y se conoce como forma de vuelo a alta velocidad (高速飛行形態).
Este Pokémon puede cambiar el tipo de su ataque característico, tecno shock, gracias a las diferentes ROMs que se le insertan en el cañón.

No se sabe como era su cuerpo antes de que el Equipo Plasma lo modificara, en la actualidad su cuerpo es de metal morado, con una cabeza en forma de platillo, tiene unos grandes ojos rojos y unos huecos pequeños en la parte de arriba de su cabeza, además se puede notar que posee una franja blanca que pareciera que es su boca aunque no la puede abrir. Además algo muy curioso es que Genesect puede lanzar una especie de hilo pegajoso de la punta de su garra, algo que tiene que ser una habilidad porque él no puede aprender Disparo demora. Otro dato curioso es que en la P16 el Genesect rojo posee la habilidad de controlar a los otros Genesect como un tipo de control mental."
,"Genesect no tiene evolución ni evoluciona de ningún Pokémon."
,"");
insert into pokemon values (156, 'Victini', 4.0, 0.4,"Pokémon que atrae la victoria. Dicen que el Entrenador que lo lleve saldrá vencedor de cualquier batalla."
,"Su nombre es una combinación de las palabras inglesas victory (victoria) y tiny (pequeño)."
,"Tiene aspecto de conejo, probablemente debido al mito de que las patas de conejo dan suerte; además de su forma, su color es blanco, como dicho animal. Produce energía infinita dentro de su cuerpo. Cuando lo toca un aliado, Victini comparte su energía. Este Pokémon atrae la victoria, se dice que cualquier entrenador que posea uno podrá ganar cualquier batalla. Curiosamente se encuentra en la Isla Jardín Libertad, encerrado hace 200 años por un guardián que salvaguarda la Isla Jardín Libertad con el fin de que el Equipo Plasma u otras organizaciones criminales no usaran su inmenso poder para hacer el mal. 
No se sabe dónde vive Victini originalmente, o puede ser un Pokémon migratorio que viaja para dar victoria a quien lo vea. Según la profesora Encina, Victini ocupa el n°000 en la Pokédex porque se dice que contar con él atrae la victoria.

La leyenda dice que un empresario de ciudad Porcelana, en uno de sus malos días, se encontró con Victini, y este descubrió su inmenso poder, así que lo llevó a su apartamento y lo cuidó durante mucho tiempo. Entonces un día Victini se lo agradeció dándole mucha suerte en el trabajo y convirtiéndolo en un millonario. Al estar preocupado de que le hicieran algo, lo encerró reprimido en el sótano del faro donde nadie lo encontrara. Después el empresario compró una empresa y la llamó Victoria en honor a Victini. También construyó la galería de arte para expresar su dolor y su felicidad con Victini."
,"Victini no tiene evolución ni evoluciona de ningún Pokémon."
,"");



insert into pokemon_tipo values (1,11);

insert into pokemon_tipo values (2,11);

insert into pokemon_tipo values (3,11);

insert into pokemon_tipo values (4,7);

insert into pokemon_tipo values (5,7);
insert into pokemon_tipo values (5,9);

insert into pokemon_tipo values (6,7);
insert into pokemon_tipo values (6,9);

insert into pokemon_tipo values (7,2);

insert into pokemon_tipo values (8,2);

insert into pokemon_tipo values (9,2);


insert into pokemon_tipo values (10,10);
insert into pokemon_tipo values (11,10);
insert into pokemon_tipo values (12,10);
insert into pokemon_tipo values (13,10);
insert into pokemon_tipo values (14,10);


insert into pokemon_tipo values (15,14);
insert into pokemon_tipo values (16,14);

insert into pokemon_tipo values (17,11);
insert into pokemon_tipo values (18,11);

insert into pokemon_tipo values (19,7);
insert into pokemon_tipo values (20,7);

insert into pokemon_tipo values (21,2);
insert into pokemon_tipo values (22,2);

insert into pokemon_tipo values (23,12);
insert into pokemon_tipo values (24,12);

insert into pokemon_tipo values (25,10);
insert into pokemon_tipo values (26,10);
insert into pokemon_tipo values (27,10);
insert into pokemon_tipo values (25,17);
insert into pokemon_tipo values (26,17);
insert into pokemon_tipo values (27,17);

insert into pokemon_tipo values (28,5);
insert into pokemon_tipo values (29,5);

insert into pokemon_tipo values (30,13);
insert into pokemon_tipo values (31,13);
insert into pokemon_tipo values (32,13);

insert into pokemon_tipo values (33,12);
insert into pokemon_tipo values (34,12);
insert into pokemon_tipo values (33,17);
insert into pokemon_tipo values (34,17);

insert into pokemon_tipo values (35,15);

insert into pokemon_tipo values (36,15);
insert into pokemon_tipo values (36,1);

insert into pokemon_tipo values (37,10);

insert into pokemon_tipo values (38,9);
insert into pokemon_tipo values (39,9);
insert into pokemon_tipo values (40,9);



insert into pokemon_tipo values (41,2);

insert into pokemon_tipo values (42,2);
insert into pokemon_tipo values (42,15);

insert into pokemon_tipo values (43,2);
insert into pokemon_tipo values (43,15);

insert into pokemon_tipo values (44,9);
insert into pokemon_tipo values (45,9);

insert into pokemon_tipo values (46,3);
insert into pokemon_tipo values (47,3);
insert into pokemon_tipo values (48,3);
insert into pokemon_tipo values (46,11);
insert into pokemon_tipo values (47,11);
insert into pokemon_tipo values (48,11);

insert into pokemon_tipo values (49,3);
insert into pokemon_tipo values (50,3);
insert into pokemon_tipo values (51,3);
insert into pokemon_tipo values (49,16);
insert into pokemon_tipo values (50,16);
insert into pokemon_tipo values (51,16);

insert into pokemon_tipo values (52,11);
insert into pokemon_tipo values (53,11);
insert into pokemon_tipo values (54,11);
insert into pokemon_tipo values (55,11);
insert into pokemon_tipo values (56,2);

insert into pokemon_tipo values (57,15);
insert into pokemon_tipo values (58,15);
insert into pokemon_tipo values (59,15);
insert into pokemon_tipo values (57,14);
insert into pokemon_tipo values (58,14);
insert into pokemon_tipo values (59,14);

insert into pokemon_tipo values (60,7);
insert into pokemon_tipo values (61,7);

insert into pokemon_tipo values (62,11);

insert into pokemon_tipo values (63,3);
insert into pokemon_tipo values (64,3);
insert into pokemon_tipo values (63,15);
insert into pokemon_tipo values (64,15);

insert into pokemon_tipo values (65,14);
insert into pokemon_tipo values (66,14);
insert into pokemon_tipo values (65,9);
insert into pokemon_tipo values (66,9);

insert into pokemon_tipo values (67,12);
insert into pokemon_tipo values (67,17);

insert into pokemon_tipo values (68,6);
insert into pokemon_tipo values (69,6);

insert into pokemon_tipo values (70,2);
insert into pokemon_tipo values (71,2);
insert into pokemon_tipo values (70,13);
insert into pokemon_tipo values (71,13);

insert into pokemon_tipo values (72,13);
insert into pokemon_tipo values (73,13);
insert into pokemon_tipo values (72,17);
insert into pokemon_tipo values (73,17);

insert into pokemon_tipo values (74,16);
insert into pokemon_tipo values (75,16);

insert into pokemon_tipo values (76,14);
insert into pokemon_tipo values (77,14);

insert into pokemon_tipo values (78,10);
insert into pokemon_tipo values (79,10);

insert into pokemon_tipo values (80,12);
insert into pokemon_tipo values (81,12);
insert into pokemon_tipo values (82,12);
insert into pokemon_tipo values (83,12);
insert into pokemon_tipo values (84,12);
insert into pokemon_tipo values (85,12);

insert into pokemon_tipo values (86,2);
insert into pokemon_tipo values (87,2);
insert into pokemon_tipo values (86,17);
insert into pokemon_tipo values (87,17);

insert into pokemon_tipo values (88,8);
insert into pokemon_tipo values (89,8);
insert into pokemon_tipo values (90,8);

insert into pokemon_tipo values (91,10);
insert into pokemon_tipo values (92,10);
insert into pokemon_tipo values (91,11);
insert into pokemon_tipo values (92,11);

insert into pokemon_tipo values (93,5);
insert into pokemon_tipo values (93,17);

insert into pokemon_tipo values (94,3);

insert into pokemon_tipo values (95,3);
insert into pokemon_tipo values (95,17);

insert into pokemon_tipo values (96,11);
insert into pokemon_tipo values (97,11);
insert into pokemon_tipo values (96,16);
insert into pokemon_tipo values (97,16);

insert into pokemon_tipo values (98,2);
insert into pokemon_tipo values (99,2);
insert into pokemon_tipo values (98,6);
insert into pokemon_tipo values (99,6);

insert into pokemon_tipo values (100,2);

insert into pokemon_tipo values (101,3);
insert into pokemon_tipo values (102,3);
insert into pokemon_tipo values (101,5);
insert into pokemon_tipo values (102,5);

insert into pokemon_tipo values (103,11);
insert into pokemon_tipo values (104,11);
insert into pokemon_tipo values (103,1);
insert into pokemon_tipo values (104,1);

insert into pokemon_tipo values (105,1);
insert into pokemon_tipo values (106,1);
insert into pokemon_tipo values (107,1);

insert into pokemon_tipo values (108,5);
insert into pokemon_tipo values (109,5);
insert into pokemon_tipo values (110,5);

insert into pokemon_tipo values (111,12);
insert into pokemon_tipo values (112,12);

insert into pokemon_tipo values (113,6);
insert into pokemon_tipo values (114,6);
insert into pokemon_tipo values (115,6);
insert into pokemon_tipo values (113,7);
insert into pokemon_tipo values (114,7);
insert into pokemon_tipo values (115,7);

insert into pokemon_tipo values (116,4);
insert into pokemon_tipo values (117,4);
insert into pokemon_tipo values (118,4);

insert into pokemon_tipo values (119,8);
insert into pokemon_tipo values (120,8);
insert into pokemon_tipo values (121,8);

insert into pokemon_tipo values (122,3);
insert into pokemon_tipo values (123,3);

insert into pokemon_tipo values (124,5);
insert into pokemon_tipo values (124,15);


insert into pokemon_tipo values (125,9);
insert into pokemon_tipo values (126,9);


insert into pokemon_tipo values (127,4);

insert into pokemon_tipo values (128,13);
insert into pokemon_tipo values (129,13);
insert into pokemon_tipo values (128,6);
insert into pokemon_tipo values (129,6);

insert into pokemon_tipo values (130,1);
insert into pokemon_tipo values (131,1);
insert into pokemon_tipo values (130,14);
insert into pokemon_tipo values (131,14);

insert into pokemon_tipo values (132,10);

insert into pokemon_tipo values (133,10);
insert into pokemon_tipo values (134,10);
insert into pokemon_tipo values (133,17);
insert into pokemon_tipo values (134,17);

insert into pokemon_tipo values (135,14);
insert into pokemon_tipo values (136,14);
insert into pokemon_tipo values (135,17);
insert into pokemon_tipo values (136,17);

insert into pokemon_tipo values (137,7);

insert into pokemon_tipo values (138,3);
insert into pokemon_tipo values (138,1);

insert into pokemon_tipo values (139,14);
insert into pokemon_tipo values (140,14);
insert into pokemon_tipo values (141,14);
insert into pokemon_tipo values (139,4);
insert into pokemon_tipo values (140,4);
insert into pokemon_tipo values (141,4);

insert into pokemon_tipo values (142,3);
insert into pokemon_tipo values (143,3);
insert into pokemon_tipo values (142,7);
insert into pokemon_tipo values (143,7);

insert into pokemon_tipo values (144,1);
insert into pokemon_tipo values (144,9);

insert into pokemon_tipo values (145,13);
insert into pokemon_tipo values (145,9);

insert into pokemon_tipo values (146,11);
insert into pokemon_tipo values (146,9);

insert into pokemon_tipo values (147,17);

insert into pokemon_tipo values (148,5);
insert into pokemon_tipo values (148,17);

insert into pokemon_tipo values (149,4);
insert into pokemon_tipo values (149,7);

insert into pokemon_tipo values (150,4);
insert into pokemon_tipo values (150,5);

insert into pokemon_tipo values (151,13);
insert into pokemon_tipo values (151,17);

insert into pokemon_tipo values (152,4);
insert into pokemon_tipo values (152,8);

insert into pokemon_tipo values (153,2);
insert into pokemon_tipo values (153,9);

insert into pokemon_tipo values (154,10);
insert into pokemon_tipo values (154,12);

insert into pokemon_tipo values (155,3);
insert into pokemon_tipo values (155,1);

insert into pokemon_tipo values (156,12);
insert into pokemon_tipo values (156,7);


INSERT INTO region (nombreRegion) VALUES ('Kanto');
INSERT INTO region (nombreRegion) VALUES ('Johto');
INSERT INTO region (nombreRegion) VALUES ('Hoenn');
INSERT INTO region (nombreRegion) VALUES ('Sinnoh');
INSERT INTO region (nombreRegion) VALUES ('Teselia');
INSERT INTO region (nombreRegion) VALUES ('Kalos');
INSERT INTO region (nombreRegion) VALUES ('Alola');
INSERT INTO region (nombreRegion) VALUES ('Galar');

INSERT INTO ruta (nombreRuta, idRegion) VALUES ('Ruta 1', 5);
INSERT INTO ruta (nombreRuta, idRegion) VALUES ('Ruta 2', 5);
INSERT INTO ruta (nombreRuta, idRegion) VALUES ('Ruta 3', 5);
INSERT INTO ruta (nombreRuta, idRegion) VALUES ('Ruta 4', 5);
INSERT INTO ruta (nombreRuta, idRegion) VALUES ('Ruta 5', 5);
INSERT INTO ruta (nombreRuta, idRegion) VALUES ('Ruta 6', 5);
INSERT INTO ruta (nombreRuta, idRegion) VALUES ('Ruta 7', 5);
INSERT INTO ruta (nombreRuta, idRegion) VALUES ('Ruta 8', 5);
INSERT INTO ruta (nombreRuta, idRegion) VALUES ('Ruta 9', 5);
INSERT INTO ruta (nombreRuta, idRegion) VALUES ('Ruta 10', 5);
INSERT INTO ruta (nombreRuta, idRegion) VALUES ('Ruta 11', 5);
INSERT INTO ruta (nombreRuta, idRegion) VALUES ('Ruta 12', 5);
INSERT INTO ruta (nombreRuta, idRegion) VALUES ('Ruta 13', 5);
INSERT INTO ruta (nombreRuta, idRegion) VALUES ('Ruta 14', 5);
INSERT INTO ruta (nombreRuta, idRegion) VALUES ('Ruta 15', 5);
INSERT INTO ruta (nombreRuta, idRegion) VALUES ('Ruta 16', 5);
INSERT INTO ruta (nombreRuta, idRegion) VALUES ('Ruta 17', 5);
INSERT INTO ruta (nombreRuta, idRegion) VALUES ('Ruta 18', 5);



INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (14, 52); 
INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (14, 54);

INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (13, 17); 
INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (13, 18);
INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (13, 19); 
INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (13, 20);
INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (13, 21);
INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (13, 22);



INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (12, 94);
INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (12, 57);


INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (11, 1); 
INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (11, 2);
INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (11, 3); 
INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (11, 4);
INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (11, 5);
INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (11, 6);
INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (11, 7);
INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (11, 8);
INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (11, 9);

INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (1, 10); 
INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (1, 12);
INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (1, 11); 
INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (1, 13);
INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (1, 65);
INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (1, 37);
INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (1, 56);

INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (2, 10); 
INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (2, 12);
INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (2, 15);
INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (2, 37);

INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (3, 25);
INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (3, 10); 
INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (3, 28);
INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (3, 12);
INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (3, 15);
INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (3, 37);

INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (4, 57);
INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (4, 60); 
INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (4, 65);

INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (5, 80);
INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (5, 83); 
INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (5, 78);
INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (5, 74); 
INSERT INTO pokemonRuta  (idRuta, numeroPokedex) VALUES (5, 16);