USE bdm;

/*=== Procedure registrar categoria ============================================================================*/
USE `bdm`;
DROP procedure IF EXISTS `registrarCategoria`;

DELIMITER $$
USE `bdm`$$
CREATE PROCEDURE `registrarCategoria` (vnombre VARCHAR(20), vdescripcion VARCHAR(50), vusuario INT)
BEGIN
	INSERT INTO categoria (nombre, descripcion, usuario, fecha)
    VALUES (vnombre,vdescripcion,vusuario, CURDATE());
END$$

DELIMITER ;

SELECT id_categoria, nombre, descripcion, usuario, fecha FROM Categoria;

call registrarCategoria ('Artes', 'Creatividad y manualidades', 1);
call registrarCategoria ('Ilustracion', 'Grafico y creativo', 1);
call registrarCategoria ('Marketing', 'Técnicas y estudios para mejorar la comercialización de un producto.', 1);
call registrarCategoria ('Fotografia', 'Arte y la técnica de obtener imágenes duraderas', 1);
call registrarCategoria ('Video', 'Produccion de contenido audiovisual', 1);
call registrarCategoria ('3D', 'Creación de objetos tridimensionales', 1);
call registrarCategoria ('Animacion', 'Producción gráfica de dibujos animados', 1);
call registrarCategoria ('Musica', 'El arte de coordinar y transmitir efectos sonoros y armoniosos', 1);
call registrarCategoria ('Audio', 'Creacion de audio para distintos medios', 1);
call registrarCategoria ('Diseño Web', 'Planificación, diseño, implementación y mantenimiento de sitios web', 1);

/*==== Procedure registrar usuario =========================================================================================*/

USE `bdm`;
DROP procedure IF EXISTS `registrarUsuario`;

DELIMITER $$
USE `bdm`$$
CREATE PROCEDURE `registrarUsuario` (vnombre VARCHAR(20), vapellido VARCHAR(30), vgenero ENUM ('MASCULINO','FEMENINO'), 
										vfecha_nac DATE, vfoto MEDIUMBLOB, vemail VARCHAR(30), 
                                        vcontraseña INT, vtipo_usuario BOOL)
BEGIN
	INSERT INTO usuario
    (nombre, apellido, genero, fecha_nac, foto, email, contraseña, fecha_registro, tipo_usuario)
    VALUES
    (vnombre, vapellido, vgenero, vfecha_nac, vfoto, vemail, vcontraseña, CURDATE(), vtipo_usuario);
END$$

DELIMITER ;

SELECT id_user, nombre, apellido, genero, fecha_nac, foto, email, contraseña, fecha_registro, tipo_usuario FROM usuario;

CALL registrarUsuario('Yadira', 'Ayala', 'FEMENINO', '1999-03-27', '/img/default.jpg', 'yadi_correo@mail.com', 12345, false);
CALL registrarUsuario('Ernesto', 'Montemayor', 'MASCULINO', '1998-10-01', '/img/default.jpg', 'neto_correo@mail.com', 54321, false);

/* ===Procedure registrar de curso======================================================================== */

USE `bdm`;
DROP procedure IF EXISTS `crearCurso`;

DELIMITER $$
USE `bdm`$$
CREATE PROCEDURE `crearCurso` (vnombre VARCHAR(30), vcosto FLOAT, vdescripcion VARCHAR(50), vimagen MEDIUMBLOB, vcomentarios int,
								vcalificacion INT, vcategoria INT, vtitulo VARCHAR(30), vdiploma INT,
                                vterminado BOOL, vprogreso TINYINT, vfroma_pago ENUM('OXXO','PayPal'))
BEGIN
	INSERT INTO curso
    (nombre, costo, descripcion, imagen, coentarios, calificacion, categorias, titulo, 
    diploma, terminado, progreso, froma_pago)
    VALUES 
    (vnombre, vcosto, vdescripcion, vimagen, vcomentario, vcalificacion, vcategoria, 
	vtitulo, vdiploma, vterminado, vprogreso, vforma_pago);
END$$

DELIMITER ;
SELECT id_curso, nombre, descripcion, costo, imagen, comentarios, calificacion, categorias, titulo, diploma, terminado, progreso, forma_pago FROM Curso;

CALL crearCurso('');

#procedure para el login---------------------------------------------------------------
DELIMITER $$
USE `bdm`$$
CREATE PROCEDURE `sp_Login` (
	IN pUsuario		VARCHAR(300),
	IN pContra		VARCHAR(300)
    )
    BEGIN
		SELECT  email,  contraseña , nombre, id_user
		FROM usuario
		WHERE email = pUsuario AND  contraseña  = pContra;
END$$
