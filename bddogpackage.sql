-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-06-2020 a las 21:43:33
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bddogpackage`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `CRUDcomentarios` (IN `vidComentarios` INT, IN `vidusuario` INT, IN `vidDetaServicio` INT, IN `vComentario` MEDIUMTEXT, IN `opcion` VARCHAR(45))  BEGIN
-- Procedimientos almacenados para el crud de comentarios

DECLARE msj varchar(255);
DECLARE fechaYHora varchar (45);
SET fechaYHora = (select bddogpackage.fechaYHora());

case

when opcion = 'guardar' then 
-- Insertamos los datos en la tabla

	INSERT INTO comentarios VALUES (vidComentarios, vidusuario, vidDetaServicio, vComentario, fechaYHora);
    SET msj = concat('Su comentario se ha guardaddo ', vComentario);
    SELECT msj;
    
when opcion = 'modificar' then 
-- Modificamos los comentarios de la columna comentario

		UPDATE comentarios SET Comentario = vComentario, FechaComentario = fechaYHora where idComentarios = vidComentarios;
        SET msj = concat('Su comenntario ha sido modificado ', vComentario);
        SELECT msj;
		END CASE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CRUDdetaservicio` (IN `vidDetaServicio` INT, IN `vidusuario` INT, IN `vidServicios` INT, IN `vidTransaccion` INT, IN `vCantidad` INT, IN `vValorCantidad` DECIMAL(20,2), IN `vCalificacion` TINYINT(1), IN `opcion` VARCHAR(45))  BEGIN
-- Procedimientos almacenados para el crud de detalle de servicio

DECLARE msj varchar(255);

case

when opcion = 'guardar' then 
-- Insertamos los datos en la tabla

	INSERT INTO detaservicio VALUES (vidDetaServicio, vidusuario, vidServicios, vidTransaccion, vCantidad, vValorCantidad, vCalificacion );
    SET msj = concat('Su servicio ha sido guardado ');
    SELECT msj;
    
when opcion = 'modificar' then 
-- Modificamos los comentarios de la columna comentario

		UPDATE detaservicio SET idusuario = vidusuario, idServicios = vidServicios, idTransaccion = vidTransaccion, Cantidad =  vCantidad, ValorCantidad = vValorCantidad, Calificacion = vCalificacion where idDetaServicio = vidDetaServicio;
        SET msj = concat('Su servicio ha sido modificado ');
        SELECT msj;
		END CASE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CRUDempresa` (IN `vidempresa` INT, IN `vNombEmpresa` VARCHAR(45), IN `vEstadoEmpresa` VARCHAR(45), IN `opcion` VARCHAR(45))  BEGIN

DECLARE msj varchar (255);

case

when opcion = 'guardar' then
-- Insertamos los datos en la tabla

	INSERT INTO empresa VALUES(vidempresa,vNombEmpresa,vEstadoEmpresa);
    SET msj = ('Los datos de la empresa han sido guardados');
    SELECT msj;
    
when opcion = 'modificar' then
-- Modificaremos el nombre y el estado de la empresa

	UPDATE empresa SET NombEmpresa = vNombEmpresa, EstadoEmpresa = vEstadoEmpresa where idempresa = vidempresa;
    SET msj = ('El nombre y el estado de la empresa han sido modificados');
    SELECT msj;

when opcion = 'eliminar' then
-- Eliminaremos los datos de la empresa

	DELETE FROM empresa where idempresa = vidempresa;
    SET msj = ('Los datos de la empresa han sido eliminados');
    SELECT msj;
    
    END CASE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CRUDproveedor` (IN `vidProveedor` INT, IN `vidusuario` INT, IN `vidtipo_usuario` INT, IN `vidempresa` INT, IN `opcion` VARCHAR(45))  BEGIN
-- Procedimiento almacenado para el crud de tipo usuario
-- En este caso no hat variables para declarar

DECLARE msj varchar(255);
DECLARE fechaYHora varchar (45);
SET fechaYHora = (select bddogpackage.fechaYHora());


case

when opcion = 'guardar' then 
-- Insertamos los datos en la tabla

	INSERT INTO proveedor VALUES (vidProveedor,vidusuario,vidtipo_usuario,vidempresa,fechaYHora);
	SET msj = ('El proveedor ha sido guardado');
	SELECT msj;
    
    
when opcion = 'eliminar' then 
-- Elinaremos los datos de la tabla

	DELETE FROM proveedor where idProveedor = vidProveedor;
    SET msj = ('El proveedor ha sido eliminado');
    SELECT msj;
    
END CASE; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CRUDregistro_usuario` (IN `vidregistro_usuario` INT, IN `vidusuario` INT, IN `vidtipo_usuario` INT, IN `vdocumento` INT, IN `vnombre_usuario` VARCHAR(45), IN `vapellido_usuario` VARCHAR(45), IN `vedad` INT, IN `vtelefono` INT, IN `vEstaUser` VARCHAR(45), IN `opcion` VARCHAR(45))  BEGIN
-- Procedimiento almacenado para el crud de tipo usuario
-- En este caso no hat variables para declarar

DECLARE msj varchar(255);

case

when opcion = 'guardar' then 
-- Insertamos los datos en la tabla

	INSERT INTO servicios VALUES (vidregistro_usuario,vidusuario,vidtipo_usuario,vdocumento,vnombre_usuario,vapellido_usuario,vedad,vtelefono,vEstaUser);
	SET msj = ('El usuario ha sido registrado ');
	SELECT msj;

when opcion = 'modificar' then
-- Modificamos Los datos del registro del usuario
	
	UPDATE registro_usuario SET documento = vdocumento, nombre_usuario = vnombre_usuario, apellido_usuario = vapellido_usuario, edad = vedad, telefono = vtelefono where idregistro_usuario = vidregistro_usuario;
	SET msj = ('El registro del usuario ha sido modificado');
	SELECT msj;

when opcion = 'eliminar' then
-- Eliminar el registro del usuario

	DELETE FROM registro_usuario where idregistro_usuario = vidregistro_usuario;
    SET msj = ('El registro ha sido eliminado');
    SELECT msj;
    
END CASE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CRUDservicios` (IN `vidServicios` INT, IN `vidTipoServicio` INT, IN `vidempresa` INT, IN `vNombServicio` VARCHAR(25), IN `vValorServicio` DECIMAL(20,2), IN `opcion` VARCHAR(45))  BEGIN
-- Procedimiento almacenado para el crud de tipo usuario
-- En este caso no hat variables para declarar

DECLARE msj varchar(255);

case

when opcion = 'guardar' then 

INSERT INTO servicios VALUES (vidServicios,vidTipoServicio,vidempresa,vNombServicio,vValorServicio);
SET msj = concat('El nombre y el precio del servicio han sido guardados ',vNombServicio, vValorServicio);
SELECT msj;

when opcion = 'modificar' then 
-- Modificaremos el nombre y el valor del servicio

	UPDATE servicios SET NombServicio = vNombServicio, ValorServicio = vValorServicio where idServicios = vidServicios;
	SET msj = concat('El nombre y el precio del servicio han sido modoficados ',vNombServicio, vValorServicio);
	SELECT msj;

when opcion = 'eliminar' then
-- Eliminares el servicio

	DELETE FROM servicios where idServicios = vidServicios;
    SET msj = ('El servicio ha sido eliminado');
    SELECT msj;

END CASE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CRUDtiposervicio` (IN `VidTipoServicio` INT, IN `vNombTipoServ` VARCHAR(155), IN `opcion` VARCHAR(45))  BEGIN
-- Procedimiento almacenado para el crud de tipo usuario
-- En este caso no hat variables para declarar

DECLARE msj varchar(255);

case 

when opcion = 'guardar' then
-- Insertamos los datos en la tabla

	INSERT INTO tiposervicio VALUES (VidTipoServicio, vNombTipoServ);
	SET msj = concat('Se ha guardado el tipo de servicio ',vNombTipoServ);
	SELECT msj;

when opcion = 'modificar' then
-- Modificamos el nombre del servicio de la columna nombtiposerv
	
    UPDATE tiposervicio SET NombTipoServ = vNombTipoServ where idTipoServicio = VidTipoServicio;
	SET msj = concat('EL nombre del servicio ha sido modificado ',vNombTipoServ);
    SELECT msj;

when opcion = 'eliminar' then
-- Eliminaremos el tipo de servicio
 
	DELETE FROM tiposervicio where idTipoServicio = vidTipoServicio;
    SET msj = ('El tipo de servicio ha sido eliminado');
    SELECT msj;
    
END CASE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CRUDtipo_usuario` (IN `vidtipo_usuario` INT, IN `vtipo_usuario` VARCHAR(45), IN `opcion` VARCHAR(45))  BEGIN
-- Procedimiento almacenado para el crud de tipo usuario
-- En este caso no hat variables para declarar

DECLARE msj varchar(255);

case

when opcion = 'modificar' then
	-- Modificamos el tipo de usuario de la columna tipo usuario
    
	UPDATE tipo_usuario SET tipo_usuario = vtipo_usuario where idtipo_usuario = vidtipo_usuario;
    SET msj = concat('Se ha modificado el tipo de usuario ', vtipo_usuario);
    SELECT msj;

when opcion = 'eliminar' then
	-- Eliminamos el tipo de usuario de la columna tipo usuario
    
    DELETE FROM tipo_usuario where idtipo_usuario = vidtipo_usuario;
    SET msj = ('El tipo de usuario ha sido eliminado');
    SELECT msj;
	END CASE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CRUDtransaccion` (IN `vidTransaccion` INT, IN `vEstadoTran` VARCHAR(45), IN `opcion` VARCHAR(45))  BEGIN

DECLARE msj varchar(45);
DECLARE fechaYHora varchar(45);
SET fechaYHora = (select bddogpackage.fechaYHora());
case

when opcion = 'guardar' then
-- Insertamos los datos en la tabla

	INSERT INTO transaccion VALUES(vidTransaccion,fechaYHora,vEstadoTran);
    SET msj = ('La transaccion ha sido guardada');
    SELECT msj;
    
when opcion = 'modificar' then 
-- Modificaremos la fecha y el estado de la transaccion

	UPDATE transaccion SET FechaTran = fechaYHora, EstadoTran = vEstadoTran where idTransaccion = vidTransaccion;
    SET msj = ('Los datos han sido modificados');
    SELECT msj;
    
    
when opcion = 'eliminar' then 
-- Eliminaremos los datos de la transaccion

	DELETE FROM transaccion where idTransaccion = vidTransaccion;
    SET msj = ('La transacción ha sido eliminada');
    SELECT msj;
    
END CASE;    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CRUDusuario` (IN `vidusuario` INT, IN `vidtipo_usuario` INT, IN `vemail` VARCHAR(25), IN `vcontrasenia` VARCHAR(8), IN `opcion` VARCHAR(45))  BEGIN
-- Procedimiento almacenado para el crud de tipo usuario
-- En este caso no hat variables para declarar

DECLARE msj varchar(255);

case

when opcion = 'guardar' then
-- Insertamos los datos en la tabla

	INSERT INTO usuario VALUES (vidusuario,vidtipo_usuario,vemail,vcontrasenia);
	SET msj = concat('El usuario se ha guardado con éxito ',vemail, vcontrasenia);
	SELECT msj;

when opcion = 'modificar' then
-- Modificamos el email y la contraseña

	UPDATE usuario SET email = vemail, contrasenia = vcontrasenia where idusuario = vidusuario;
	SET msj = concat('El email y la contraseña han sido modificados',vemail, vcontrasenia);
	SELECT msj;

when opcion = 'eliminar' then
-- Eliminamos el email y la contraseña

	DELETE FROM usuario where idusuario = vidusuario;
    SET msj = ('El usuario ha sido eliminado');
    SELECT msj;
    
END CASE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `login` (IN `correo` VARCHAR(45), IN `clave` VARCHAR(8))  BEGIN

-- Variables de validación

set @user = (select idtipo_usuario from usuario where email = correo and contrasenia = clave);
    if @user =1 then
		set @mensaje = "bienvenido cliente";
		select @mensaje;
	elseif @user =2 then
		set @mensaje = "bienvenido empresa";
		select @mensaje;
    else 
		set @mensaje = "correo o clave incorrecto";
		select @mensaje;
END if;	
END$$

--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `ContarComentarios` (`vidDetaServicio` INT) RETURNS INT(11) BEGIN

DECLARE a int;

SET a = (select count(idComentarios) from comentarios where idDetaServicio = vidDetaServicio);
RETURN a;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `fechaYHora` () RETURNS VARCHAR(45) CHARSET latin1 BEGIN
declare hora varchar(45);


set hora = (SELECT SYSDATE());
RETURN hora;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `idComentarios` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idDetaServicio` int(11) NOT NULL,
  `Comentario` mediumtext NOT NULL,
  `FechaComentario` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`idComentarios`, `idusuario`, `idDetaServicio`, `Comentario`, `FechaComentario`) VALUES
(1, 3, 1, 'Me encantó el servicio', '2020-03-27 19:26:47'),
(2, 3, 2, 'Muy buena atención', '2020-03-27 21:02:48'),
(3, 4, 3, 'Bien', '2020-03-27 21:09:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detaservicio`
--

CREATE TABLE `detaservicio` (
  `idDetaServicio` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idServicios` int(11) NOT NULL,
  `idTransaccion` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `ValorCantidad` decimal(20,2) NOT NULL,
  `Calificacion` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detaservicio`
--

INSERT INTO `detaservicio` (`idDetaServicio`, `idusuario`, `idServicios`, `idTransaccion`, `Cantidad`, `ValorCantidad`, `Calificacion`) VALUES
(1, 3, 1, 1, 1, '12.00', 5),
(2, 4, 2, 1, 1, '30.00', 3),
(3, 4, 3, 1, 1, '10.00', 5),
(4, 3, 4, 1, 1, '50.00', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `idempresa` int(11) NOT NULL,
  `NombEmpresa` varchar(45) NOT NULL,
  `EstaEmpresa` varchar(45) NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`idempresa`, `NombEmpresa`, `EstaEmpresa`) VALUES
(1, 'Niñeros para tus mascotas', ' '),
(2, 'Guevonaditas para sus perros', ' '),
(3, 'Bañadores de perros', ' '),
(4, 'Peluquería de mascotas', ' '),
(5, 'Helados para perros', ' ');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `empresaflash`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `empresaflash` (
`Código` int(11)
,`Tipo de Usuario` varchar(45)
,`Nombre del Usuario` varchar(25)
,`Nombre de la empresa` varchar(45)
,`Nombre del Servicio` varchar(45)
,`Valor del Servicio` decimal(20,2)
,`Fecha de inicio` datetime
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `idProveedor` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idtipo_usuario` int(11) NOT NULL,
  `idempresa` int(11) NOT NULL,
  `fechaInicio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`idProveedor`, `idusuario`, `idtipo_usuario`, `idempresa`, `fechaInicio`) VALUES
(1, 5, 1, 1, '2020-03-28 16:35:49'),
(2, 6, 1, 2, '2020-03-28 16:58:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_usuario`
--

CREATE TABLE `registro_usuario` (
  `idregistro_usuario` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idtipo_usuario` int(11) NOT NULL,
  `documento` int(11) NOT NULL,
  `nombre_usuario` varchar(45) NOT NULL,
  `apellido_usuario` varchar(45) NOT NULL,
  `edad` int(11) NOT NULL,
  `telefono` int(11) NOT NULL,
  `EstaUser` varchar(45) NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `idServicios` int(11) NOT NULL,
  `idTipoServicio` int(11) NOT NULL,
  `idempresa` int(11) NOT NULL,
  `NombServicio` varchar(45) NOT NULL,
  `ValorServicio` decimal(20,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`idServicios`, `idTipoServicio`, `idempresa`, `NombServicio`, `ValorServicio`) VALUES
(1, 1, 1, 'Paseadores', '12.00'),
(2, 5, 3, 'Baño de perros', '30.00'),
(3, 4, 2, 'Cosas para perros', '10.00'),
(4, 3, 1, 'Guardería', '50.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposervicio`
--

CREATE TABLE `tiposervicio` (
  `idTipoServicio` int(11) NOT NULL,
  `NombTipoServ` varchar(155) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tiposervicio`
--

INSERT INTO `tiposervicio` (`idTipoServicio`, `NombTipoServ`) VALUES
(1, 'Paseadores'),
(2, 'Veterinaria'),
(3, 'Guardería'),
(4, 'Helados'),
(5, 'Baño'),
(6, 'Paseo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `idtipo_usuario` int(11) NOT NULL,
  `tipo_usuario` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`idtipo_usuario`, `tipo_usuario`) VALUES
(1, 'Empresa'),
(2, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transaccion`
--

CREATE TABLE `transaccion` (
  `idTransaccion` int(11) NOT NULL,
  `FechaTran` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `EstaTran` varchar(45) DEFAULT 'Causado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `transaccion`
--

INSERT INTO `transaccion` (`idTransaccion`, `FechaTran`, `EstaTran`) VALUES
(1, '2020-03-11 16:03:25', 'cancelado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `idtipo_usuario` int(11) NOT NULL,
  `email` varchar(25) NOT NULL,
  `contrasenia` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `idtipo_usuario`, `email`, `contrasenia`) VALUES
(3, 2, 'camila@gmail.com', '123'),
(4, 2, 'dayhana@gmail.com', '123'),
(5, 1, 'mascoticas@gmail.com', '123'),
(6, 1, 'organizacion@gmail.com', '123');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `usuarioflash`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `usuarioflash` (
`Código` int(11)
,`Tipo de Usuario` varchar(45)
,`Nombre del Usuario` varchar(25)
,`Comentario` mediumtext
,`Fecha del comentario` datetime
,`Calificación del Servicio` tinyint(1)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `empresaflash`
--
DROP TABLE IF EXISTS `empresaflash`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `empresaflash`  AS  select `u`.`idusuario` AS `Código`,`t`.`tipo_usuario` AS `Tipo de Usuario`,`u`.`email` AS `Nombre del Usuario`,`e`.`NombEmpresa` AS `Nombre de la empresa`,`s`.`NombServicio` AS `Nombre del Servicio`,`s`.`ValorServicio` AS `Valor del Servicio`,`p`.`fechaInicio` AS `Fecha de inicio` from ((((`empresa` `e` join `proveedor` `p` on((`e`.`idempresa` = `p`.`idempresa`))) join `tipo_usuario` `t` on((`t`.`idtipo_usuario` = `p`.`idtipo_usuario`))) join `servicios` `s` on((`e`.`idempresa` = `s`.`idempresa`))) join `usuario` `u` on((`u`.`idusuario` = `p`.`idusuario`))) group by `p`.`fechaInicio` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `usuarioflash`
--
DROP TABLE IF EXISTS `usuarioflash`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `usuarioflash`  AS  select `u`.`idusuario` AS `Código`,`t`.`tipo_usuario` AS `Tipo de Usuario`,`u`.`email` AS `Nombre del Usuario`,`c`.`Comentario` AS `Comentario`,`c`.`FechaComentario` AS `Fecha del comentario`,`d`.`Calificacion` AS `Calificación del Servicio` from (((`usuario` `u` join `tipo_usuario` `t` on((`u`.`idtipo_usuario` = `t`.`idtipo_usuario`))) join `detaservicio` `d` on((`u`.`idusuario` = `d`.`idusuario`))) join `comentarios` `c` on((`u`.`idusuario` = `c`.`idusuario`))) group by `c`.`FechaComentario` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`idComentarios`),
  ADD KEY `fk_Comentarios_usuario1_idx` (`idusuario`),
  ADD KEY `fk_Comentarios_DetaServicio1_idx` (`idDetaServicio`);

--
-- Indices de la tabla `detaservicio`
--
ALTER TABLE `detaservicio`
  ADD PRIMARY KEY (`idDetaServicio`),
  ADD KEY `fk_DetaServicio_usuario1_idx` (`idusuario`),
  ADD KEY `fk_DetaServicio_Servicios1_idx` (`idServicios`),
  ADD KEY `fk_DetaServicio_Transaccion1_idx` (`idTransaccion`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`idempresa`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`idProveedor`),
  ADD KEY `fk_Proveedor_usuario1_idx` (`idusuario`,`idtipo_usuario`),
  ADD KEY `fk_Proveedor_empresa1_idx` (`idempresa`);

--
-- Indices de la tabla `registro_usuario`
--
ALTER TABLE `registro_usuario`
  ADD PRIMARY KEY (`idregistro_usuario`),
  ADD KEY `fk_registro_usuario_usuario1_idx` (`idusuario`,`idtipo_usuario`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`idServicios`),
  ADD KEY `fk_Servicios_TipoServicio1_idx` (`idTipoServicio`),
  ADD KEY `fk_Servicios_empresa1_idx` (`idempresa`);

--
-- Indices de la tabla `tiposervicio`
--
ALTER TABLE `tiposervicio`
  ADD PRIMARY KEY (`idTipoServicio`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`idtipo_usuario`);

--
-- Indices de la tabla `transaccion`
--
ALTER TABLE `transaccion`
  ADD PRIMARY KEY (`idTransaccion`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`,`idtipo_usuario`),
  ADD KEY `fk_usuario_tipo_usuario1_idx` (`idtipo_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `idComentarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `detaservicio`
--
ALTER TABLE `detaservicio`
  MODIFY `idDetaServicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `idempresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `idProveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `registro_usuario`
--
ALTER TABLE `registro_usuario`
  MODIFY `idregistro_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `idServicios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tiposervicio`
--
ALTER TABLE `tiposervicio`
  MODIFY `idTipoServicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `idtipo_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `transaccion`
--
ALTER TABLE `transaccion`
  MODIFY `idTransaccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `fk_Comentarios_DetaServicio1` FOREIGN KEY (`idDetaServicio`) REFERENCES `detaservicio` (`idDetaServicio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Comentarios_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detaservicio`
--
ALTER TABLE `detaservicio`
  ADD CONSTRAINT `fk_DetaServicio_Servicios1` FOREIGN KEY (`idServicios`) REFERENCES `servicios` (`idServicios`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_DetaServicio_Transaccion1` FOREIGN KEY (`idTransaccion`) REFERENCES `transaccion` (`idTransaccion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_DetaServicio_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `fk_Proveedor_empresa1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`idempresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Proveedor_usuario1` FOREIGN KEY (`idusuario`,`idtipo_usuario`) REFERENCES `usuario` (`idusuario`, `idtipo_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `registro_usuario`
--
ALTER TABLE `registro_usuario`
  ADD CONSTRAINT `fk_registro_usuario_usuario1` FOREIGN KEY (`idusuario`,`idtipo_usuario`) REFERENCES `usuario` (`idusuario`, `idtipo_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD CONSTRAINT `fk_Servicios_TipoServicio1` FOREIGN KEY (`idTipoServicio`) REFERENCES `tiposervicio` (`idTipoServicio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Servicios_empresa1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`idempresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_tipo_usuario1` FOREIGN KEY (`idtipo_usuario`) REFERENCES `tipo_usuario` (`idtipo_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

DELIMITER $$
--
-- Eventos
--
CREATE DEFINER=`root`@`localhost` EVENT `MSJ` ON SCHEDULE EVERY 1 MINUTE STARTS '2020-03-12 15:36:00' ENDS '2020-03-12 15:40:00' ON COMPLETION NOT PRESERVE ENABLE DO SELECT CONCAT('Mensaje por minuto', now())$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
