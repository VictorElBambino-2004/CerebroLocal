class AiQuestionGenerator
  FALLBACKS = {
    "Historia" => [
      { prompt: "¿En qué año llegó Cristóbal Colón a América?", options: ["1492", "1500", "1488", "1512"], correct_answer: "1492" },
      { prompt: "¿Quién fue el primer emperador del Imperio Romano?", options: ["César Augusto", "Julio César", "Nerón", "Tiberio"], correct_answer: "César Augusto" },
      { prompt: "¿En qué año cayó el Muro de Berlín, marcando el fin de la Guerra Fría?", options: ["1989", "1991", "1985", "1979"], correct_answer: "1989" },
      { prompt: "¿Qué civilización precolombina construyó la ciudadela de Machu Picchu?", options: ["Inca", "Maya", "Azteca", "Tolteca"], correct_answer: "Inca" },
      { prompt: "¿Qué país regaló la Estatua de la Libertad a los Estados Unidos?", options: ["Francia", "Reino Unido", "España", "Italia"], correct_answer: "Francia" },
      { prompt: "¿En qué año comenzó la Primera Guerra Mundial?", options: ["1914", "1918", "1939", "1905"], correct_answer: "1914" },
      { prompt: "¿Quién fue el líder militar y político conocido como 'El Gran Corso'?", options: ["Napoleón Bonaparte", "Alejandro Magno", "Carlomagno", "Guillermo el Conquistador"], correct_answer: "Napoleón Bonaparte" },
      { prompt: "¿Qué emperador ordenó la construcción de la Gran Muralla China unificada?", options: ["Qin Shi Huang", "Kublai Kan", "Sun Tzu", "Wu Zetian"], correct_answer: "Qin Shi Huang" },
      { prompt: "¿En qué año tuvo lugar la Revolución Francesa con la toma de la Bastilla?", options: ["1789", "1776", "1804", "1799"], correct_answer: "1789" },
      { prompt: "¿Qué faraón egipcio fue famoso porque su tumba fue hallada casi intacta en 1922?", options: ["Tutankamón", "Ramsés II", "Akenatón", "Keops"], correct_answer: "Tutankamón" },
      { prompt: "¿Quién fue el general del Ejército de los Andes que libertó Argentina, Chile y Perú?", options: ["José de San Martín", "Simón Bolívar", "Bernardo O'Higgins", "Manuel Belgrano"], correct_answer: "José de San Martín" },
      { prompt: "¿En qué batalla decisiva de 1815 fue derrotado definitivamente Napoleón?", options: ["Batalla de Waterloo", "Batalla de Austerlitz", "Batalla de Trafalgar", "Batalla de Leipzig"], correct_answer: "Batalla de Waterloo" },
      { prompt: "¿Qué civilización antigua construyó las famosas pirámides de Giza en Egipto?", options: ["Antigua Egipcia", "Mesopotámica", "Griega", "Romana"], correct_answer: "Antigua Egipcia" },
      { prompt: "¿En qué año llegó el hombre a la Luna por primera vez durante la misión Apolo 11?", options: ["1969", "1972", "1965", "1975"], correct_answer: "1969" }
    ],
    "Ciencia" => [
      { prompt: "¿Cuál es el elemento químico representado por el símbolo 'O' en la tabla periódica?", options: ["Oxígeno", "Oro", "Osfio", "Oganesón"], correct_answer: "Oxígeno" },
      { prompt: "¿Cuál es el planeta más cercano al Sol en nuestro sistema solar?", options: ["Mercurio", "Venus", "Marte", "Júpiter"], correct_answer: "Mercurio" },
      { prompt: "¿Qué partícula subatómica posee carga eléctrica negativa?", options: ["Electrón", "Protón", "Neutrón", "Positrón"], correct_answer: "Electrón" },
      { prompt: "¿Cuál es el gas más abundante en la atmósfera del planeta Tierra?", options: ["Nitrógeno", "Oxígeno", "Dióxido de carbono", "Argón"], correct_answer: "Nitrógeno" },
      { prompt: "¿Quién formuló la teoría de la relatividad especial y general?", options: ["Albert Einstein", "Isaac Newton", "Nikola Tesla", "Galileo Galilei"], correct_answer: "Albert Einstein" },
      { prompt: "¿Cuál es la velocidad aproximada de la luz en el vacío?", options: ["300.000 km/s", "150.000 km/s", "500.000 km/s", "1.000.000 km/s"], correct_answer: "300.000 km/s" },
      { prompt: "¿Qué órgano humano es el encargado de filtrar la sangre para producir orina?", options: ["Riñones", "Hígado", "Páncreas", "Bazo"], correct_answer: "Riñones" },
      { prompt: "¿Cómo se llama el centro de un átomo compuesto por protones y neutrones?", options: ["Núcleo", "Corteza", "Orbital", "Electrosfera"], correct_answer: "Núcleo" },
      { prompt: "¿Qué científico formuló las tres leyes del movimiento y la gravitación universal?", options: ["Isaac Newton", "René Descartes", "Johannes Kepler", "Robert Hooke"], correct_answer: "Isaac Newton" },
      { prompt: "¿Cuál es la fórmula química del compuesto común conocido como sal de mesa?", options: ["NaCl", "KCl", "NaOH", "HCl"], correct_answer: "NaCl" },
      { prompt: "¿Qué tipo de energía posee un objeto debido exclusivamente a su movimiento?", options: ["Energía cinética", "Energía potencial", "Energía térmica", "Energía química"], correct_answer: "Energía cinética" },
      { prompt: "¿Qué pigmento vegetal le otorga el característico color verde a las plantas?", options: ["Clorofila", "Caroteno", "Antocianina", "Xantófila"], correct_answer: "Clorofila" },
      { prompt: "¿Cuántos elementos químicos conforman la tabla periódica actualmente?", options: ["118", "100", "92", "112"], correct_answer: "118" },
      { prompt: "¿Qué científica fue la primera persona en recibir dos premios Nobel en disciplinas distintas?", options: ["Marie Curie", "Rosalind Franklin", "Lise Meitner", "Dorothy Hodgkin"], correct_answer: "Marie Curie" }
    ],
    "Deportes" => [
      { prompt: "¿Cuántos jugadores integran un equipo de fútbol en cancha por lado?", options: ["11", "10", "12", "9"], correct_answer: "11" },
      { prompt: "¿Cada cuántos años se celebran normalmente los Juegos Olímpicos de Verano?", options: ["4 años", "2 años", "3 años", "5 años"], correct_answer: "4 años" },
      { prompt: "¿En qué deporte de invierno sobre pista se utiliza un disco negro llamado 'puck'?", options: ["Hockey sobre hielo", "Curling", "Bobsleigh", "Patinaje artístico"], correct_answer: "Hockey sobre hielo" },
      { prompt: "¿Quién es el máximo goleador de la historia de las Copas del Mundo de la FIFA?", options: ["Miroslav Klose", "Pelé", "Ronaldo Nazário", "Lionel Messi"], correct_answer: "Miroslav Klose" },
      { prompt: "¿Cuántos puntos vale anotar un tiro libre directo en básquetbol?", options: ["1 punto", "2 puntos", "3 puntos", "4 puntos"], correct_answer: "1 punto" },
      { prompt: "¿En qué país se originó el arte marcial olímpico del judo?", options: ["Japón", "Corea del Sur", "China", "Tailandia"], correct_answer: "Japón" },
      { prompt: "¿Cuál es el torneo de tenis sobre césped más antiguo y prestigioso del mundo?", options: ["Wimbledon", "Roland Garros", "US Open", "Abierto de Australia"], correct_answer: "Wimbledon" },
      { prompt: "¿Cuántos hoyos conforman una ronda regular de golf profesional?", options: ["18 hoyos", "9 hoyos", "12 hoyos", "24 hoyos"], correct_answer: "18 hoyos" },
      { prompt: "¿Qué selección nacional de fútbol ha ganado más Copas del Mundo masculinas?", options: ["Brasil", "Alemania", "Italia", "Argentina"], correct_answer: "Brasil" },
      { prompt: "¿En qué disciplina atlética destacó con 8 oros olímpicos el jamaicano Usain Bolt?", options: ["Velocidad / Atletismo", "Salto en largo", "Natación", "Lanzamiento de jabalina"], correct_answer: "Velocidad / Atletismo" },
      { prompt: "¿Cuántos cuartos se juegan en un partido regular de básquetbol FIBA?", options: ["4 cuartos", "2 tiempos", "3 períodos", "6 sextos"], correct_answer: "4 cuartos" },
      { prompt: "¿Qué nadador estadounidense tiene el récord histórico de más medallas olímpicas?", options: ["Michael Phelps", "Mark Spitz", "Ryan Lochte", "Ian Thorpe"], correct_answer: "Michael Phelps" },
      { prompt: "¿En qué deporte se compite en una piscina de 50 metros en eventos olímpicos?", options: ["Natación", "Waterpolo", "Natación sincronizada", "Polo acuático"], correct_answer: "Natación" },
      { prompt: "¿Cuántos jugadores hay en cada equipo en un partido de voleibol de playa?", options: ["2 jugadores", "3 jugadores", "4 jugadores", "6 jugadores"], correct_answer: "2 jugadores" }
    ],
    "Geografía" => [
      { prompt: "¿Cuál es el río más largo y caudaloso del mundo?", options: ["Amazonas", "Nilo", "Misisipi", "Yangtsé"], correct_answer: "Amazonas" },
      { prompt: "¿Cuál es el país más grande del mundo por superficie terrestre?", options: ["Rusia", "Canadá", "China", "Estados Unidos"], correct_answer: "Rusia" },
      { prompt: "¿En qué continente se ubica el extenso desierto del Sahara?", options: ["África", "Asia", "Oceanía", "América"], correct_answer: "África" },
      { prompt: "¿Cuál es la capital oficial de la Mancomunidad de Australia?", options: ["Canberra", "Sídney", "Melbourne", "Brisbane"], correct_answer: "Canberra" },
      { prompt: "¿Qué cordillera montañosa alberga la cumbre más alta del planeta, el Monte Everest?", options: ["Himalaya", "Andes", "Alpes", "Montañas Rocosas"], correct_answer: "Himalaya" },
      { prompt: "¿Cuál es el océano más grande y profundo de la Tierra?", options: ["Océano Pacífico", "Océano Atlántico", "Océano Índico", "Océano Ártico"], correct_answer: "Océano Pacífico" },
      { prompt: "¿Cuál es la capital oficial de Canadá?", options: ["Ottawa", "Toronto", "Vancouver", "Montreal"], correct_answer: "Ottawa" },
      { prompt: "¿Qué país sudamericano no tiene salida directa al mar junto con Paraguay?", options: ["Bolivia", "Uruguay", "Ecuador", "Guyana"], correct_answer: "Bolivia" },
      { prompt: "¿Cuál es el país más poblado de todo el continente europeo?", options: ["Rusia", "Alemania", "Francia", "Reino Unido"], correct_answer: "Rusia" },
      { prompt: "¿En qué país se encuentra la histórica ciudad de Estambul, puente entre Europa y Asia?", options: ["Turquía", "Grecia", "Egipto", "Rumania"], correct_answer: "Turquía" },
      { prompt: "¿Cuál es el volcán activo más alto de Europa, ubicado en Sicilia?", options: ["Monte Etna", "Vesubio", "Estrómboli", "Teide"], correct_answer: "Monte Etna" },
      { prompt: "¿Qué canal artificial conecta directamente los océanos Atlántico y Pacífico?", options: ["Canal de Panamá", "Canal de Suez", "Canal de Corinto", "Canal de Kiel"], correct_answer: "Canal de Panamá" },
      { prompt: "¿Cuál es la montaña más alta de América, también conocida como 'El Aconcagua'?", options: ["Aconcagua", "Chimborazo", "Ojos del Salado", "Monte Fitz Roy"], correct_answer: "Aconcagua" },
      { prompt: "¿Qué país asiático alberga la Gran Muralla y tiene la mayor población del mundo?", options: ["China", "India", "Indonesia", "Pakistán"], correct_answer: "China" }
    ],
    "Arte" => [
      { prompt: "¿Quién pintó la famosa obra renacentista de 'La Gioconda' (Mona Lisa)?", options: ["Leonardo da Vinci", "Pablo Picasso", "Vincent van Gogh", "Miguel Ángel"], correct_answer: "Leonardo da Vinci" },
      { prompt: "¿En qué célebre museo de París se exhibe la escultura de la 'Venus de Milo'?", options: ["Museo del Louvre", "Museo de Orsay", "Centro Pompidou", "Museo Rodin"], correct_answer: "Museo del Louvre" },
      { prompt: "¿Quién esculpió la icónica estatua del 'David' en mármol blanco?", options: ["Miguel Ángel", "Donatello", "Gian Lorenzo Bernini", "Auguste Rodin"], correct_answer: "Miguel Ángel" },
      { prompt: "¿A qué vanguardia artística y pictórica perteneció el pintor español Salvador Dalí?", options: ["Surrealismo", "Cubismo", "Impresionismo", "Romanticismo"], correct_answer: "Surrealismo" },
      { prompt: "¿Quién pintó la aclamada obra expresionista 'La noche estrellada'?", options: ["Vincent van Gogh", "Claude Monet", "Rembrandt", "Paul Cézanne"], correct_answer: "Vincent van Gogh" },
      { prompt: "¿Quién pintó el monumental mural antibélico 'Guernica' en 1937?", options: ["Pablo Picasso", "Joan Miró", "Diego Rivera", "Francisco de Goya"], correct_answer: "Pablo Picasso" },
      { prompt: "¿En qué capilla del Vaticano pintó Miguel Ángel el fresco de 'El Juicio Final'?", options: ["Capilla Sixtina", "Capilla Paulina", "Capilla Nicolina", "Basílica de San Pedro"], correct_answer: "Capilla Sixtina" },
      { prompt: "¿Quién pintó el célebre cuadro expresionista 'El grito' en 1893?", options: ["Edvard Munch", "Gustav Klimt", "Egon Schiele", "Wassily Kandinsky"], correct_answer: "Edvard Munch" },
      { prompt: "¿Qué artista mexicana es famosa por sus intensos autorretratos y su Casa Azul?", options: ["Frida Kahlo", "Remedios Varo", "Leonora Carrington", "María Izquierdo"], correct_answer: "Frida Kahlo" },
      { prompt: "¿A qué corriente artística perteneció Claude Monet, autor de 'Impresión, sol naciente'?", options: ["Impresionismo", "Expresionismo", "Realismo", "Barroco"], correct_answer: "Impresionismo" },
      { prompt: "¿Quién es el autor de la dorada y emblemática pintura 'El beso' de 1908?", options: ["Gustav Klimt", "Alfons Mucha", "Oskar Kokoschka", "Henri Matisse"], correct_answer: "Gustav Klimt" },
      { prompt: "¿Quién esculpió la célebre obra de bronce 'El pensador'?", options: ["Auguste Rodin", "Alberto Giacometti", "Constantin Brâncuși", "Henry Moore"], correct_answer: "Auguste Rodin" },
      { prompt: "¿Qué movimiento artístico del siglo XX fue fundado por Marcel Duchamp con su obra 'Fontaine'?", options: ["Dadaísmo", "Futurismo", "Constructivismo", "Arte Pop"], correct_answer: "Dadaísmo" },
      { prompt: "¿Qué técnica pictórica consiste en aplicar pintura con grandes manchas de puntos de color?", options: ["Puntillismo", "Acuarela", "Fresco", "Collage"], correct_answer: "Puntillismo" }
    ],
    "Entretenimiento" => [
      { prompt: "¿Quién interpretó al carismático Capitán Jack Sparrow en Piratas del Caribe?", options: ["Johnny Depp", "Brad Pitt", "Tom Cruise", "Keanu Reeves"], correct_answer: "Johnny Depp" },
      { prompt: "¿Cómo se llama el continente ficticio donde transcurre gran parte de 'Game of Thrones'?", options: ["Westeros", "Narnia", "Tierra Media", "Essos"], correct_answer: "Westeros" },
      { prompt: "¿Quién es el emblemático fontanero de gorra roja de los videojuegos de Nintendo?", options: ["Mario", "Luigi", "Wario", "Toad"], correct_answer: "Mario" },
      { prompt: "¿Cuál es la serie animada estadounidense más longeva y emitida en el horario estelar?", options: ["Los Simpson", "Padre de familia", "South Park", "Futurama"], correct_answer: "Los Simpson" },
      { prompt: "¿Cómo se llama el droide dorado de protocolo y relaciones cibernéticas en Star Wars?", options: ["C-3PO", "R2-D2", "BB-8", "K-2SO"], correct_answer: "C-3PO" },
      { prompt: "¿Cuál es el videojuego de construcción y bloques más vendido de todos los tiempos?", options: ["Minecraft", "Tetris", "Grand Theft Auto V", "Roblox"], correct_answer: "Minecraft" },
      { prompt: "¿Cómo se llama el protagonista con traje verde en la saga 'The Legend of Zelda'?", options: ["Link", "Zelda", "Ganon", "Sheik"], correct_answer: "Link" },
      { prompt: "¿Quién es el creador de la saga literaria y de la serie 'The Witcher'?", options: ["Andrzej Sapkowski", "George R.R. Martin", "Brandon Sanderson", "J.K. Rowling"], correct_answer: "Andrzej Sapkowski" },
      { prompt: "¿Cómo se llama el juego de mesa donde se compran calles, estaciones y hoteles?", options: ["Monopoly", "Risk", "Catan", "Cluedo"], correct_answer: "Monopoly" },
      { prompt: "¿Qué superheroína es la princesa de las Amazonas en los cómics de DC?", options: ["Mujer Maravilla", "Batichica", "Superchica", "Catwoman"], correct_answer: "Mujer Maravilla" },
      { prompt: "¿En qué plataforma digital se transmiten directos de videojuegos con emotes como PogChamp?", options: ["Twitch", "YouTube Gaming", "Kick", "Discord"], correct_answer: "Twitch" },
      { prompt: "¿Cómo se llama el perro detective parlante que viaja en 'La Máquina del Misterio'?", options: ["Scooby-Doo", "Pluto", "Snoopy", "Coraje"], correct_answer: "Scooby-Doo" },
      { prompt: "¿Qué personaje ficticio vive en una piña bajo el mar y trabaja en el Cangrejo Crujiente?", options: ["Bob Esponja", "Patrick", "Calamardo", "Arenita"], correct_answer: "Bob Esponja" },
      { prompt: "¿Qué saga de videojuegos de acción y aventura tiene a un espartano llamado Kratos de protagonista?", options: ["God of War", "Halo", "Devil May Cry", "Doom"], correct_answer: "God of War" }
    ],
    "Tecnología" => [
      { prompt: "¿Qué significa la sigla 'RAM' en el hardware informático?", options: ["Random Access Memory", "Read Access Media", "Run Action Mode", "Real Area Memory"], correct_answer: "Random Access Memory" },
      { prompt: "¿Quién cofundó la compañía Apple Computer junto con Steve Jobs en 1976?", options: ["Steve Wozniak", "Bill Gates", "Paul Allen", "Tim Cook"], correct_answer: "Steve Wozniak" },
      { prompt: "¿Qué sistema operativo móvil de código abierto es desarrollado principalmente por Google?", options: ["Android", "iOS", "Symbian", "HarmonyOS"], correct_answer: "Android" },
      { prompt: "¿Qué popular lenguaje de programación multiplataforma tiene como logotipo una taza de café?", options: ["Java", "Python", "Ruby", "C++"], correct_answer: "Java" },
      { prompt: "¿Qué científico británico es reconocido como el inventor de la World Wide Web (WWW)?", options: ["Tim Berners-Lee", "Alan Turing", "Charles Babbage", "Linus Torvalds"], correct_answer: "Tim Berners-Lee" },
      { prompt: "¿Quién creó el núcleo del sistema operativo libre Linux en el año 1991?", options: ["Linus Torvalds", "Richard Stallman", "Ken Thompson", "Dennis Ritchie"], correct_answer: "Linus Torvalds" },
      { prompt: "¿Qué protocolo de red cifra la comunicación segura entre el navegador y los sitios web?", options: ["HTTPS", "FTP", "DNS", "SSH"], correct_answer: "HTTPS" },
      { prompt: "¿Cuál es el buscador web más utilizado a nivel mundial en internet?", options: ["Google", "Bing", "DuckDuckGo", "Yahoo!"], correct_answer: "Google" },
      { prompt: "¿Qué tecnología permite crear registros descentralizados e inmutables como en Bitcoin?", options: ["Blockchain", "Cloud Computing", "Machine Learning", "Big Data"], correct_answer: "Blockchain" },
      { prompt: "¿Qué componente de una computadora es considerado el cerebro que procesa instrucciones?", options: ["CPU / Procesador", "Disco Duro", "Tarjeta Madre", "Fuente de poder"], correct_answer: "CPU / Procesador" },
      { prompt: "¿Qué lenguaje de marcado es el estándar básico para estructurar páginas web?", options: ["HTML", "CSS", "SQL", "JSON"], correct_answer: "HTML" },
      { prompt: "¿Quién es considerado el padre de la computación teórica y pionero de la IA?", options: ["Alan Turing", "Ada Lovelace", "John von Neumann", "Claude Shannon"], correct_answer: "Alan Turing" },
      { prompt: "¿Qué empresa desarrolló el sistema de inteligencia artificial ChatGPT?", options: ["OpenAI", "Google", "Meta", "Microsoft"], correct_answer: "OpenAI" },
      { prompt: "¿Cuántos bits contiene un byte en informática?", options: ["8 bits", "16 bits", "4 bits", "32 bits"], correct_answer: "8 bits" }
    ],
    "Cine" => [
      { prompt: "¿Qué película animada ganó el primer premio Óscar a Mejor Película de Animación en 2002?", options: ["Shrek", "Monsters, Inc.", "Toy Story 2", "La era de hielo"], correct_answer: "Shrek" },
      { prompt: "¿Quién dirigió la aclamada trilogía cinematográfica de 'El Padrino'?", options: ["Francis Ford Coppola", "Martin Scorsese", "Steven Spielberg", "Stanley Kubrick"], correct_answer: "Francis Ford Coppola" },
      { prompt: "¿Cuál es la película más taquillera de todos los tiempos a nivel mundial sin ajuste de inflación?", options: ["Avatar", "Avengers: Endgame", "Titanic", "Star Wars: The Force Awakens"], correct_answer: "Avatar" },
      { prompt: "¿Qué actor encarnó a Tony Stark / Iron Man en el Universo Cinematográfico de Marvel?", options: ["Robert Downey Jr.", "Chris Evans", "Mark Ruffalo", "Chris Hemsworth"], correct_answer: "Robert Downey Jr." },
      { prompt: "¿En qué año se estrenó en las salas de cine la revolucionaria película 'Jurassic Park'?", options: ["1993", "1990", "1995", "1988"], correct_answer: "1993" },
      { prompt: "¿Quién dirigió las obras maestras de ciencia ficción 'Interstellar' y 'El Origen'?", options: ["Christopher Nolan", "Denis Villeneuve", "Ridley Scott", "David Fincher"], correct_answer: "Christopher Nolan" },
      { prompt: "¿Qué famosa película de terror de 1980 dirigida por Kubrick se ambienta en el Hotel Overlook?", options: ["El resplandor", "Psicosis", "El exorcista", "Halloween"], correct_answer: "El resplandor" },
      { prompt: "¿Qué actor protagonizó la saga de acción y ciencia ficción 'Matrix' como Neo?", options: ["Keanu Reeves", "Will Smith", "Tom Cruise", "Nicolas Cage"], correct_answer: "Keanu Reeves" },
      { prompt: "¿Quién dirigió la aclamada trilogía cinematográfica de 'El Señor de los Anillos'?", options: ["Peter Jackson", "Guillermo del Toro", "George Lucas", "James Cameron"], correct_answer: "Peter Jackson" },
      { prompt: "¿Qué película de 1997 protagonizada por DiCaprio y Winslet ganó 11 premios Óscar?", options: ["Titanic", "Gladiador", "Braveheart", "Forrest Gump"], correct_answer: "Titanic" },
      { prompt: "¿Cómo se llama el muñeco vaquero que protagoniza la saga animada 'Toy Story'?", options: ["Woody", "Buzz Lightyear", "Jessie", "Rex"], correct_answer: "Woody" },
      { prompt: "¿Qué director mexicano ganó premios Óscar por 'La forma del agua' y 'Pinocho'?", options: ["Guillermo del Toro", "Alfonso Cuarón", "Alejandro G. Iñárritu", "Robert Rodriguez"], correct_answer: "Guillermo del Toro" }
    ],
    "Música" => [
      { prompt: "¿Cuántas cuerdas suele tener habitualmente una guitarra clásica o española estándar?", options: ["6", "4", "5", "7"], correct_answer: "6" },
      { prompt: "¿De qué ciudad portuaria británica era originaria la legendaria banda The Beatles?", options: ["Liverpool", "Londres", "Manchester", "Birmingham"], correct_answer: "Liverpool" },
      { prompt: "¿A qué genial compositor austriaco del clasicismo se le conoce como 'El niño prodigio de Salzburgo'?", options: ["Wolfgang Amadeus Mozart", "Ludwig van Beethoven", "Johann Sebastian Bach", "Frédéric Chopin"], correct_answer: "Wolfgang Amadeus Mozart" },
      { prompt: "¿Qué artista estadounidense es mundialmente reconocido con el título de 'Rey del Pop'?", options: ["Michael Jackson", "Prince", "Elvis Presley", "Freddie Mercury"], correct_answer: "Michael Jackson" },
      { prompt: "¿Qué instrumento musical tocaba de forma legendaria y revolucionaria Jimi Hendrix?", options: ["Guitarra eléctrica", "Batería", "Bajo", "Saxofón"], correct_answer: "Guitarra eléctrica" },
      { prompt: "¿Quién fue el carismático vocalista y líder de la banda británica de rock Queen?", options: ["Freddie Mercury", "Mick Jagger", "David Bowie", "Robert Plant"], correct_answer: "Freddie Mercury" },
      { prompt: "¿Qué famoso compositor creó la célebre Novena Sinfonía estando completamente sordo?", options: ["Ludwig van Beethoven", "Franz Schubert", "Johannes Brahms", "Piotr Ilich Chaikovski"], correct_answer: "Ludwig van Beethoven" },
      { prompt: "¿Cuántas teclas blancas y negras tiene en total un piano acústico estándar moderno?", options: ["88 teclas", "76 teclas", "64 teclas", "100 teclas"], correct_answer: "88 teclas" },
      { prompt: "¿Qué cantante estadounidense es ampliamente conocida con el título de 'La Reina del Pop'?", options: ["Madonna", "Cyndi Lauper", "Whitney Houston", "Cher"], correct_answer: "Madonna" },
      { prompt: "¿A qué banda británica de rock pertenecía el icónico álbum 'The Dark Side of the Moon'?", options: ["Pink Floyd", "Led Zeppelin", "The Rolling Stones", "The Doors"], correct_answer: "Pink Floyd" },
      { prompt: "¿De qué país sudamericano es originario el tradicional género musical del tango?", options: ["Argentina", "España", "México", "Colombia"], correct_answer: "Argentina" },
      { prompt: "¿Quién compuso la famosa suite orquestal barroca de 'Las cuatro estaciones'?", options: ["Antonio Vivaldi", "George Frideric Handel", "Johann Sebastian Bach", "Arcangelo Corelli"], correct_answer: "Antonio Vivaldi" }
    ],
    "Naturaleza" => [
      { prompt: "¿Cuál es el mamífero terrestre más grande del mundo actual?", options: ["Elefante africano", "Rinoceronte blanco", "Hipopótamo", "Jirafa"], correct_answer: "Elefante africano" },
      { prompt: "¿Qué animal marino es el ser vivo más grande que habita el planeta Tierra?", options: ["Ballena azul", "Calamar gigante", "Tiburón ballena", "Cachalote"], correct_answer: "Ballena azul" },
      { prompt: "¿Cómo se llama el proceso biológico por el cual las plantas convierten luz solar en energía?", options: ["Fotosíntesis", "Respiración celular", "Osmosis", "Quimiosíntesis"], correct_answer: "Fotosíntesis" },
      { prompt: "¿Cuál es considerada el ave voladora más rápida del mundo cuando desciende en picada?", options: ["Halcón peregrino", "Águila real", "Vencejo común", "Halcón gerifalte"], correct_answer: "Halcón peregrino" },
      { prompt: "¿Qué órganos especializados utilizan la gran mayoría de los peces para respirar bajo el agua?", options: ["Branquias", "Pulmones", "Tráqueas", "Espiráculos"], correct_answer: "Branquias" },
      { prompt: "¿Cuál es el felino salvaje terrestre más veloz del mundo en carreras cortas?", options: ["Guepardo / Chita", "León", "Leopardo", "Jaguar"], correct_answer: "Guepardo / Chita" },
      { prompt: "¿Qué marsupial australiano se alimenta casi exclusivamente de hojas de eucalipto?", options: ["Koala", "Canguro", "Uómbat", "Demonio de Tasmania"], correct_answer: "Koala" },
      { prompt: "¿Cómo se llama el árbol más voluminoso y longevo del mundo, nativo de California?", options: ["Secuoya gigante", "Pino de montaña", "Roble blanco", "Baobab"], correct_answer: "Secuoya gigante" },
      { prompt: "¿Cuántas patas tienen todos los insectos en su etapa adulta?", options: ["6 patas", "8 patas", "10 patas", "4 patas"], correct_answer: "6 patas" },
      { prompt: "¿Cuál es la selva tropical más extensa y con mayor biodiversidad del planeta Tierra?", options: ["Selva Amazónica", "Selva del Congo", "Selva de Borneo", "Selva de Daintree"], correct_answer: "Selva Amazónica" },
      { prompt: "¿Qué reptil es reconocido por su notable habilidad de cambiar de color para mimetizarse?", options: ["Camaleón", "Iguana", "Gecko", "Salamandra"], correct_answer: "Camaleón" },
      { prompt: "¿Cómo se llaman los animales cuya temperatura corporal depende del ambiente exterior?", options: ["Poiquilotermos / Ectotermos", "Homeotermos", "Endotermos", "Mamíferos"], correct_answer: "Poiquilotermos / Ectotermos" }
    ],
    "Literatura" => [
      { prompt: "¿Quién es el célebre autor de la gran novela clásica 'Don Quijote de la Mancha'?", options: ["Miguel de Cervantes", "Gabriel García Márquez", "Federico García Lorca", "Jorge Luis Borges"], correct_answer: "Miguel de Cervantes" },
      { prompt: "¿En qué famosa novela de Mary Shelley aparece la criatura creada por Víctor Frankenstein?", options: ["Frankenstein", "Drácula", "El extraño caso del Dr. Jekyll", "El retrato de Dorian Gray"], correct_answer: "Frankenstein" },
      { prompt: "¿Qué escritor colombiano fue galardonado con el Premio Nobel tras publicar 'Cien años de soledad'?", options: ["Gabriel García Márquez", "Mario Vargas Llosa", "Pablo Neruda", "Octavio Paz"], correct_answer: "Gabriel García Márquez" },
      { prompt: "¿Quién escribió la universal obra de teatro y tragedia romántica de 'Romeo y Julieta'?", options: ["William Shakespeare", "Molière", "Dante Alighieri", "Lope de Vega"], correct_answer: "William Shakespeare" },
      { prompt: "¿Cómo se llama el sagaz detective ficticio que reside en 221B Baker Street, creado por Conan Doyle?", options: ["Sherlock Holmes", "Hércules Poirot", "Sam Spade", "C. Auguste Dupin"], correct_answer: "Sherlock Holmes" },
      { prompt: "¿Quién escribió la célebre novela distópica '1984' sobre el Gran Hermano?", options: ["George Orwell", "Aldous Huxley", "Ray Bradbury", "Franz Kafka"], correct_answer: "George Orwell" },
      { prompt: "¿Cómo se titula la epopeya medieval italiana de Dante Alighieri sobre el Infierno y el Paraíso?", options: ["La Divina Comedia", "El Decamerón", "La Ilíada", "Cantar de mío Cid"], correct_answer: "La Divina Comedia" },
      { prompt: "¿Quién escribió el clásico relato poético y filosófico 'El principito' en 1943?", options: ["Antoine de Saint-Exupéry", "Jules Verne", "Albert Camus", "Victor Hugo"], correct_answer: "Antoine de Saint-Exupéry" },
      { prompt: "¿Cuál es el título de la célebre novela de vampiros escrita por Bram Stoker en 1897?", options: ["Drácula", "Carmilla", "Nosferatu", "Entrevista con el vampiro"], correct_answer: "Drácula" },
      { prompt: "¿Qué poeta y dramaturgo español escribió la tragedia teatral 'Bodas de sangre'?", options: ["Federico García Lorca", "Antonio Machado", "Miguel Hernández", "Gustavo Adolfo Bécquer"], correct_answer: "Federico García Lorca" },
      { prompt: "¿Quién es el autor de las antiguas epopeyas griegas 'La Ilíada' y 'La Odisea'?", options: ["Homero", "Hesíodo", "Sófocles", "Eurípides"], correct_answer: "Homero" },
      { prompt: "¿Cómo se llama el hobbit protagonista que porta el Anillo Único en 'El Señor de los Anillos'?", options: ["Frodo Bolsón", "Bilbo Bolsón", "Sam Gamyi", "Pippin Tuk"], correct_answer: "Frodo Bolsón" }
    ]
  }.freeze

  def self.fetch_or_generate(category, exclude_ids = [], exclude_prompts = [])
    ReplenishQuestionsJob.perform_later(category, 1)

    # 1. Buscar en la base de datos excluyendo IDs y prompts ya formulados
    query = Question.where(category: category)
    query = query.where.not(id: exclude_ids) if exclude_ids.present?
    query = query.where.not(prompt: exclude_prompts) if exclude_prompts.present?
    question = query.where("length(prompt) >= 20").order("RANDOM()").first

    return question if question.present?

    # 2. Intentar generar con IA (Gemini si hay key, o Ollama)
    generated = generate(category, exclude_prompts)
    return generated if generated.present? && !exclude_prompts.include?(generated.prompt)

    # 3. Fallback garantizado sin repetición
    fallback_question(category, exclude_prompts)
  end

  def self.generate(category, exclude_prompts = [])
    question = if ENV["GEMINI_API_KEY"].present?
                 generate_with_gemini(category, exclude_prompts)
               else
                 generate_with_ollama(category, exclude_prompts)
               end

    question || fallback_question(category, exclude_prompts)
  rescue StandardError => e
    Rails.logger.error("Error AI: #{e.message}")
    fallback_question(category, exclude_prompts)
  end

  def self.generate_with_gemini(category, exclude_prompts = [])
    api_key = ENV["GEMINI_API_KEY"]
    return nil if api_key.blank?

    url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=#{api_key}"
    prompt_text = <<~PROMPT
      Genera 1 pregunta de trivia educativa de cultura general sobre #{category}.
      REGLAS:
      - Pregunta clara, interesante y objetiva.
      - 4 opciones cortas, solo 1 correcta exactamente igual a una opción.
      - Responde exclusivamente con este JSON:
      {
        "prompt": "¿Pregunta?",
        "options": ["Opción A", "Opción B", "Opción C", "Opción D"],
        "correct_answer": "Opción A"
      }
    PROMPT

    response = Faraday.post(url) do |req|
      req.options.timeout = 5
      req.options.open_timeout = 2
      req.headers["Content-Type"] = "application/json"
      req.body = {
        contents: [{ parts: [{ text: prompt_text }] }],
        generationConfig: { responseMimeType: "application/json", temperature: 0.7 }
      }.to_json
    end

    return nil unless response.success?

    parsed = JSON.parse(response.body)
    text = parsed.dig("candidates", 0, "content", "parts", 0, "text")
    return nil if text.blank?

    data = JSON.parse(text)
    if valid_data?(data) && !exclude_prompts.include?(data["prompt"])
      Question.find_or_create_by!(prompt: data["prompt"]) do |q|
        q.category = category
        q.options = data["options"].shuffle
        q.correct_answer = data["correct_answer"]
      end
    end
  rescue StandardError => e
    Rails.logger.error("Error Gemini: #{e.message}")
    nil
  end

  def self.generate_with_ollama(category, exclude_prompts = [])
    prompt_text = <<~PROMPT
      Genera 1 pregunta de trivia de nivel educativo/cultura general sobre #{category}.
      
      REGLAS:
      - La pregunta debe ser clara, objetiva y tener al menos 6 palabras.
      - NUNCA hagas preguntas ambiguas de opinión o comparaciones simples.
      - 'options': array con 4 respuestas reales y cortas.
      - 'correct_answer': debe ser exactamente igual a una de las 4 opciones.

      Ejemplo:
      {
        "prompt": "¿Cuál es la capital de Francia?",
        "options": ["París", "Londres", "Berlín", "Madrid"],
        "correct_answer": "París"
      }
    PROMPT

    response = Faraday.post("http://localhost:11434/api/generate") do |req|
      req.options.timeout = 5
      req.options.open_timeout = 2
      req.headers["Content-Type"] = "application/json"
      req.body = {
        model: "llama3.2:1b",
        prompt: prompt_text,
        stream: false,
        format: "json",
        keep_alive: "-1",
        options: { num_predict: 200, temperature: 0.3 }
      }.to_json
    end

    raw_response = JSON.parse(response.body)["response"]
    cleaned_json = raw_response.to_s.gsub(/```(?:json)?\s*|```\s*/i, "").strip
    data = JSON.parse(cleaned_json)

    if valid_data?(data) && !exclude_prompts.include?(data["prompt"])
      Question.find_or_create_by!(prompt: data["prompt"]) do |q|
        q.category = category
        q.options = data["options"].shuffle
        q.correct_answer = data["correct_answer"]
      end
    end
  rescue StandardError => e
    Rails.logger.error("Error Ollama: #{e.message}")
    nil
  end

  def self.valid_data?(data)
    return false unless data.is_a?(Hash)
    return false unless data["prompt"].present? && data["options"].is_a?(Array) && data["options"].size == 4
    return false unless data["options"].include?(data["correct_answer"])

    prompt = data["prompt"].to_s
    opts = data["options"].map(&:to_s)

    prompt.length >= 20 &&
      !opts.any? { |opt| opt.include?("?") || opt.downcase.include?("respuesta") }
  end

  def self.fallback_question(category, exclude_prompts = [])
    pool = FALLBACKS[category] || FALLBACKS["Naturaleza"]
    available = pool.reject { |q| exclude_prompts.include?(q[:prompt]) }

    if available.empty?
      all_available = FALLBACKS.values.flatten.reject { |q| exclude_prompts.include?(q[:prompt]) }
      data = all_available.sample || pool.sample
    else
      data = available.sample
    end

    target_category = FALLBACKS.find { |_cat, list| list.include?(data) }&.first || category

    Question.find_or_create_by!(prompt: data[:prompt]) do |q|
      q.category = target_category
      q.options = data[:options].shuffle
      q.correct_answer = data[:correct_answer]
    end
  end
end