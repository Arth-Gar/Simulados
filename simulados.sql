-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 29-Nov-2015 às 01:46
-- Versão do servidor: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `simulados`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `questoes`
--

CREATE TABLE IF NOT EXISTS `questoes` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `texto` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `a` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `b` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `c` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `d` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `e` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `testID` int(255) NOT NULL,
  `feedbk` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'avaliacao',
  `resposta` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'resposta',
  PRIMARY KEY (`id`),
  KEY `fk_testID` (`testID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `simulados`
--

CREATE TABLE IF NOT EXISTS `simulados` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `descri` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `preco` decimal(15,2) DEFAULT NULL,
  `status` int(255) NOT NULL,
  `datahora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `testID` int(255) NOT NULL COMMENT 'fk do simulado desbloqueado',
  `fotoURL` varchar(255) NOT NULL,
  `datainic` datetime DEFAULT CURRENT_TIMESTAMP,
  `pgstatus` varchar(255) NOT NULL COMMENT 'status do pagamento',
  PRIMARY KEY (`id`),
  KEY `fk_testID` (`testID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `questoes`
--
ALTER TABLE `questoes`
  ADD CONSTRAINT `fk_testID` FOREIGN KEY (`testID`) REFERENCES `simulados` (`id`);

--
-- Limitadores para a tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_simuladoID` FOREIGN KEY (`testID`) REFERENCES `simulados` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
