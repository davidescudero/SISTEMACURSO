-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: May 19, 2020 at 05:36 PM
-- Server version: 5.7.26
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `db_curso`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_COMBO_ROL` ()  SELECT 
rol_id,rol_nombre from rol$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_USUARIO` ()  NO SQL
BEGIN
DECLARE CANTIDAD int;
SET @CANTIDAD := 0;
SELECT 
@CANTIDAD:=@CANTIDAD + 1 AS posicion,
usuario.usu_id,
usuario.usu_nombre,
usuario.usu_sexo,usuario.rol_id,usuario.usu_estatus,rol.rol_nombre
FROM usuario INNER JOIN rol ON rol.rol_id = usuario.rol_id ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_DATOS_USUARIO` (IN `IDUSUARIO` INT, IN `SEXO` CHAR(1), IN `IDROL` INT)  UPDATE usuario SET usu_sexo =SEXO, rol_id = IDROL WHERE usu_id = IDUSUARIO$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_ESTATUS_USUARIO` (IN `IDUSUARIO` INT, `ESTATUS` VARCHAR(20))  UPDATE usuario SET usu_estatus = ESTATUS WHERE usu_id = IDUSUARIO$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_USUARIO` (IN `USU` VARCHAR(20), IN `CONTRA` VARCHAR(250), IN `SEXO` CHAR(1), IN `ROL` INT)  BEGIN  
	DECLARE CANTIDAD INT;
	SET @CANTIDAD := (select count(*) from usuario where usu_nombre = BINARY USU);
	IF @CANTIDAD=0 THEN 
		INSERT INTO usuario(usu_nombre, usu_contrasena,usu_sexo,rol_id,usu_estatus)  VALUES(USU, CONTRA, SEXO, ROL, 'ACTIVO');
		select 1;
	ELSE
		SELECT 2;	

	END IF ;

	END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VERIFICAR_USUARIO` (IN `USUARIO` VARCHAR(20))  SELECT 
usuario.usu_id,usuario.usu_nombre,usuario.usu_contrasena,usuario.usu_sexo,usuario.rol_id,usuario.usu_estatus,rol.rol_nombre
FROM usuario INNER JOIN rol ON rol.rol_id = usuario.rol_id WHERE usu_nombre = BINARY USUARIO$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `rol`
--

CREATE TABLE `rol` (
  `rol_id` int(11) NOT NULL,
  `rol_nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rol`
--

INSERT INTO `rol` (`rol_id`, `rol_nombre`) VALUES
(1, 'ADMINISTRADOR'),
(2, 'INVITADO');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `usu_id` int(11) NOT NULL,
  `usu_nombre` varchar(20) NOT NULL,
  `usu_contrasena` varchar(255) NOT NULL,
  `usu_sexo` char(1) NOT NULL,
  `rol_id` int(11) NOT NULL,
  `usu_estatus` enum('ACTIVO','INACTIVO') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`usu_id`, `usu_nombre`, `usu_contrasena`, `usu_sexo`, `rol_id`, `usu_estatus`) VALUES
(1, 'curso', '$2y$12$D4KQz.DpoAeW5F4xbRFkZe8aqOgwklZn4LIfjtda7175sP1hbz0ke', 'F', 2, 'INACTIVO'),
(2, 'invitado', '$2y$12$D4KQz.DpoAeW5F4xbRFkZe8aqOgwklZn4LIfjtda7175sP1hbz0ke', 'M', 1, 'INACTIVO'),
(3, 'escudero', '$2y$12$D4KQz.DpoAeW5F4xbRFkZe8aqOgwklZn4LIfjtda7175sP1hbz0ke', 'M', 1, 'ACTIVO'),
(5, 'lina', '$2y$10$Eu9KIez1wmbQ9iRzZjFZIOIbJVQGwC1/meVr6EKQU7e1xNBvYqIfO', 'M', 2, 'ACTIVO'),
(6, 'kina', '$2y$10$5S224M5Xlcv/LT1Bh3m32Ozhx8miSbmpMtQxDIGAyen.BgLEJUcnC', 'M', 1, 'ACTIVO');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`rol_id`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usu_id`),
  ADD KEY `rol_id` (`rol_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `rol`
--
ALTER TABLE `rol`
  MODIFY `rol_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`rol_id`);
