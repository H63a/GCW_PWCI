CREATE DATABASE bdm;
USE bdm;

CREATE TABLE usuario
(
	id_user INT AUTO_INCREMENT NOT NULL comment'Identificaro unico para cada usuario', 
	nombre VARCHAR(20) NOT NULL comment'Primer nombre del usuario', 
    apellido VARCHAR(30) comment'Apellido paterno del usuario',
    genero ENUM ('MASCULINO','FEMENINO') NOT NULL comment'Seleccion de genero del usuario',
    fecha_nac DATE NOT NULL comment'Fecha de nacimiento del usuario',
    foto MEDIUMBLOB NOT NULL comment'Imagen de perfil del usuario',
    email VARCHAR(30) unique NOT NULL comment'Dirección de correo electronico del usuario',
    contraseña INT NOT NULL comment'Contraseña para la cuenta del usuario',
    fecha_registro DATE NOT NULL comment 'Fecha en la que se registro el usuario',
    tipo_usuario BOOL DEFAULT(false) NOT NULL comment 'Tipo de usuario, estudiante(false) o escuela(true)',
    
    PRIMARY KEY(id_user)
);

CREATE TABLE Curso
(
	id_curso INT AUTO_INCREMENT NOT NULL comment'Identificaro unico para cada curso',
    nombre VARCHAR(30) NOT NULL comment 'Nombre del curo',
    descripcion VARCHAR(50) NOT NULL comment 'Pequeño texto que describa el contenido del curso',
    costo FLOAT NOT NULL comment 'Costo por el curso completo',
    imagen MEDIUMBLOB NOT NULL comment 'Imagen que presentara al curso',
    comentarios INT comment 'Comentarios hechos por usuarios que ya terminaron el curso NO LO USES',
    calificacion INT comment 'Calificacion otorgado por usuarios que ya terminaron el curso',
    categorias INT NOT NULL comment'categorias a las que pertence este curso',
    titulo VARCHAR(30) NOT NULL comment 'Titulo que representa el contenido del curso',
    diploma INT comment 'FK Diplima que se otorga si se termina un curso',
    terminado BOOL default(FALSE) comment 'Curso terminado(true) o impcompleto(false)',
    progreso TINYINT comment 'Progreso del usuario en el cuerso',
    forma_pago ENUM('OXXO','PayPal') NOT NULL comment 'forma deseada de pago',
    
    PRIMARY KEY (id_curso),
    FOREIGN KEY (categorias) REFERENCES Categoria (id_categoria)
);

CREATE TABLE Nivel
(
	id_nivel INT AUTO_INCREMENT NOT NULL comment'Identificador para cada nivel de cada curso',
    curso INT NOT NULL comment 'Curso al que pertenece este nivel',
    titulo VARCHAR(30) NOT NULL comment 'Titulo de este nivel del curso',
    texto VARCHAR(150) NOT NULL comment 'Contenido informativo del curso',
    imagen MEDIUMBLOB NOT NULL comment 'Imagen representativa del contenido del nivel',
    video MEDIUMBLOB  NOT NULL comment 'Video con información del nivel',
    
    PRIMARY KEY (id_nivel),
    FOREIGN KEY (curso) REFERENCES Curso(id_curso)
);

CREATE TABLE Diploma 
(
	id_diploma INT AUTO_INCREMENT NOT NULL comment'Identificador el diploma',
    curso INT NOT NULL comment 'Curso por el que se otorga este diploma',
    alumno INT NOT  NULL comment 'Alumno al que se le otorgara el diploma',
    fecha_terminado DATE NOT NULL comment 'Fecha en la que se termino el curso',
    nombre_escuela VARCHAR(20) NOT NULL comment 'Nombre de la escuela',
    
    PRIMARY KEY (id_diploma),
    FOREIGN KEY (curso) REFERENCES Curso(id_curso),
    FOREIGN KEY (alumno) REFERENCES Usuario(id_user)
);

CREATE TABLE Categoria
(
	id_categoria INT AUTO_INCREMENT NOT NULL comment'Identificador de la categoria',
    nombre VARCHAR(20) NOT NULL comment 'Nombre para la categoria',
    descripcion VARCHAR(50) NOT NULL comment 'Pequeña descripción sobre la categoria',
    usuario INT NOT NULL comment 'Usuario que creo la categoria',
    fecha DATE NOT NULL comment 'Fecha en la que se creo la categoria',
    
    PRIMARY KEY (id_categoria),
    FOREIGN KEY (usuario) REFERENCES usuario(id_user)
);

CREATE TABLE cursoAlumno
(
	id_ca INT AUTO_INCREMENT NOT NULL comment 'Identificador por usuario obteniendo un curso',
    estudiante INT NOT NULL comment 'Estudiante que tiene el curso',
    curso INT NOT NULL comment 'Curso deseado por el estudiante',
    
    PRIMARY KEY (id_ca),
    FOREIGN KEY (estudiante) REFERENCES Usuario(id_user),
    FOREIGN KEY (curso) REFERENCES Curso(id_curso)
);

CREATE TABLE categoriaCurso /*Pendiente*/
(
	id_cc INT AUTO_INCREMENT NOT NULL comment 'Identificador de otorgacion de categoria',
    curso INT NOT NULL comment 'Curso al que se le otorgara categorias',
    categoria INT NOT NULL comment 'Categoria para el curso',
    
    PRIMARY KEY (id_cc),
    FOREIGN KEY (curso) REFERENCES Curso(id_curso),
	FOREIGN KEY (categoria) REFERENCES Categoria(id_categoria)
);

CREATE TABLE Mensaje
(
	id_mensaje INT AUTO_INCREMENT NOT NULL comment 'Identificador para el mensaje',
    estudiante INT NOT NULL comment'Estudiante en la conversacion',
    escuela INT NOT NULL comment 'Escuela en la conversacion',
    fecha_hora DATETIME NOT NULL comment 'Fecha y hora del mensaje',
    
    PRIMARY KEY (id_mensaje),
    FOREIGN KEY (estudiante) REFERENCES Usuario(id_user),
    FOREIGN KEY (escuela) REFERENCES Usuario(id_user)
);

CREATE TABLE Historial
(
	id_historial INT AUTO_INCREMENT NOT NULL comment 'Identificador para el mensaje',
    estudiante INT NOT NULL comment 'Estudiante al que pertenece el historial',
    curso INT NOT NULL comment 'Cursos del estudiante',
    fecha_inscripcion DATE NOT NULL comment 'Fecha de inscripcion',
    u_fecha_Ingreso DATE NOT NULL comment 'fecha de ingreso del usuario',
    fecha_Termino DATE NOT NULL comment 'Fecha en la que se finalizo el curso',
    
    PRIMARY KEY (id_historial),
    FOREIGN KEY (estudiante) REFERENCES Usuario(id_user),
    FOREIGN KEY (curso) REFERENCES Curso(id_curso)
);

CREATE TABLE Comentario
(
	id_comentario INT AUTO_INCREMENT NOT NULL comment 'Identificador para el mensaje',
    estudiante INT NOT NULL comment 'Estudiante que realizo el comentario',
    curso INT NOT NULL comment 'Curso al que se le da el comentario',
    calificación INT NOT NULL comment 'calificación que el estudiante le otorga al curso',
    texto VARCHAR(100) comment 'Opinion del usuario sobre el curso',
    
    PRIMARY KEY (id_comentario),
    FOREIGN KEY (estudiante) REFERENCES Usuario(id_user),
    FOREIGN KEY (curso) REFERENCES Curso(id_curso)
);

CREATE TABLE Venta
(
	id_venta INT AUTO_INCREMENT NOT NULL comment 'Identificador de la venta',
    estudiante INT NOT NULL comment 'Alumno que tiene el curso',
    escuela INT NOT NULL comment 'Dueño del curso',
    curso INT NOT NULL comment 'Curso a comprar',
    cantidad_alumnos INT NOT NULL comment 'Cantidad de alumnos inscritos al curso',
    nivel_promedio FLOAT NOT NULL comment 'Nivel promedio que han cursado los alumnos',
    ingresos_curso INT NOT NULL comment 'Ganancias por un curso en especifico',
    total_ingreso INT NOT NULL comment 'Ganancias por todos los cursos',
    fecha_inscripcion DATE NOT NULL comment 'fecha de inscripcion',
    nivel_avance TINYINT NOT NULL comment 'Avance del curso',
    pago INT NOT NULL comment 'Pago realizado por la compra del curso',
    forma_pago ENUM('OXXO','PayPal') NOT NULL comment 'froma deseada de pago',
    
    PRIMARY KEY (id_venta),
    FOREIGN KEY (estudiante) REFERENCES Usuario(id_user),
    FOREIGN KEY (escuela) REFERENCES Usuario(id_user),
    FOREIGN KEY (curso) REFERENCES Curso(id_curso)
);