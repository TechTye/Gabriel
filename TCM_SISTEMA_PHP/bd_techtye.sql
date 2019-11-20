-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 20-Nov-2019 às 23:25
-- Versão do servidor: 10.1.38-MariaDB
-- versão do PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bd_techtye`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_administrador`
--

CREATE TABLE `tb_administrador` (
  `adm_cod` int(11) NOT NULL,
  `adm_nome` varchar(100) NOT NULL,
  `adm_email` varchar(50) NOT NULL,
  `adm_perm` int(1) NOT NULL,
  `adm_senha` varchar(32) NOT NULL,
  `adm_funcao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_administrador`
--

INSERT INTO `tb_administrador` (`adm_cod`, `adm_nome`, `adm_email`, `adm_perm`, `adm_senha`, `adm_funcao`) VALUES
(1, 'GABRIEL HENRIQUE', 'ADM@GMAIL.COM', 1, '121212', 3),
(2, 'ANDRÉ SILVA', 'ANDRE@GMAIL.COM', 2, '123456789', 5),
(3, 'JHONATHAN', 'TESTE@GMAIL.COM', 1, '123', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cliente`
--

CREATE TABLE `tb_cliente` (
  `cli_cod` int(11) NOT NULL,
  `cli_nome` varchar(50) NOT NULL,
  `cli_email` varchar(50) NOT NULL,
  `cli_telefone` varchar(20) NOT NULL,
  `cli_CNPJ` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_cliente`
--

INSERT INTO `tb_cliente` (`cli_cod`, `cli_nome`, `cli_email`, `cli_telefone`, `cli_CNPJ`) VALUES
(1, 'SKYFIT ACADEMIA SP', 'SKYFIT@OUTLOOK.COM.BR', '(11) 3993-7447', '25.465.635/0001-2'),
(2, 'TRANSPASSAREDO LOGISTICA LTDA', 'TRANSPASSAREDO.COM.BR', '(11) 4775-3235', '54.300.620/0003-9'),
(8, 'DDS INFORMÃTICA', 'DDSINFO.COM.BR', '(11) 3974-4765', '54.541.620/0563-0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_contrato`
--

CREATE TABLE `tb_contrato` (
  `cnt_cod` int(11) NOT NULL,
  `cnt_titulo` varchar(50) NOT NULL,
  `cnt_desc` varchar(200) NOT NULL,
  `cnt_dta_abertura` datetime NOT NULL,
  `cnt_dta_conclusao` datetime NOT NULL,
  `cnt_status` varchar(250) NOT NULL,
  `cnt_prioridade` char(1) NOT NULL,
  `cnt_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_contrato`
--

INSERT INTO `tb_contrato` (`cnt_cod`, `cnt_titulo`, `cnt_desc`, `cnt_dta_abertura`, `cnt_dta_conclusao`, `cnt_status`, `cnt_prioridade`, `cnt_cliente`) VALUES
(1, 'SISTEMA WMS PERSONALIZADO', 'Criar um sistema personalizado para a SkyFit academias, sistema de gerenciador para a empresa', '2019-11-15 00:00:00', '2020-02-29 00:00:00', 'EM DESENVOLVIMENTO', '0', 1),
(2, 'SISTEMA TMS PERSONALIZADO', 'Criar um sistema TMS para a empresa Trans Passaredo', '2019-11-14 00:00:00', '2020-03-14 00:00:00', 'EM DESENVOLVIMENTO', '0', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_funcao`
--

CREATE TABLE `tb_funcao` (
  `fnc_cod` int(11) NOT NULL,
  `fnc_nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_funcao`
--

INSERT INTO `tb_funcao` (`fnc_cod`, `fnc_nome`) VALUES
(1, 'ANALISTA FRONT END'),
(2, 'ANALISTA BACK END'),
(3, 'ANALISTA DE SISTEMAS'),
(4, 'ANALISTA DE INFRAESTRUTURA'),
(5, 'ANALISTA DE BANCO DE DADOS'),
(6, 'ANALISTA DE MOBILE'),
(7, 'ANALISTA DE TESTES');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_tarefa`
--

CREATE TABLE `tb_tarefa` (
  `taf_cod` int(11) NOT NULL,
  `taf_nome` varchar(50) NOT NULL,
  `taf_desc` varchar(100) NOT NULL,
  `taf_dta_conclusao` datetime NOT NULL,
  `taf_prioridade` char(1) NOT NULL,
  `taf_status` varchar(20) NOT NULL,
  `taf_responsavel` int(11) DEFAULT NULL,
  `taf_contrato` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_tarefa`
--

INSERT INTO `tb_tarefa` (`taf_cod`, `taf_nome`, `taf_desc`, `taf_dta_conclusao`, `taf_prioridade`, `taf_status`, `taf_responsavel`, `taf_contrato`) VALUES
(1, 'CRIAR LAYOUT WMS', 'Criar o layout gráfico para o WMS da SkyFit', '2019-11-22 00:00:00', '0', 'EM ANÁLISE', 1, 1),
(2, 'CRIAR BANCO DE DADOS TMS', 'Desenvolver o Banco de Dados da Trans Passaredo, para uso do TMS da empresa', '2019-11-22 00:00:00', '0', 'EM DESENVOLVIMENTO', 2, 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_tarefa`
-- (See below for the actual view)
--
CREATE TABLE `vw_tarefa` (
`cli_cod` int(11)
,`cli_nome` varchar(50)
,`cli_email` varchar(50)
,`cli_telefone` varchar(20)
,`cli_CNPJ` varchar(20)
);

-- --------------------------------------------------------

--
-- Structure for view `vw_tarefa`
--
DROP TABLE IF EXISTS `vw_tarefa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_tarefa`  AS  select `tb_cliente`.`cli_cod` AS `cli_cod`,`tb_cliente`.`cli_nome` AS `cli_nome`,`tb_cliente`.`cli_email` AS `cli_email`,`tb_cliente`.`cli_telefone` AS `cli_telefone`,`tb_cliente`.`cli_CNPJ` AS `cli_CNPJ` from `tb_cliente` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_administrador`
--
ALTER TABLE `tb_administrador`
  ADD PRIMARY KEY (`adm_cod`),
  ADD KEY `fk_adm_funcao` (`adm_funcao`);

--
-- Indexes for table `tb_cliente`
--
ALTER TABLE `tb_cliente`
  ADD PRIMARY KEY (`cli_cod`),
  ADD UNIQUE KEY `cli_CNPJ` (`cli_CNPJ`);

--
-- Indexes for table `tb_contrato`
--
ALTER TABLE `tb_contrato`
  ADD PRIMARY KEY (`cnt_cod`),
  ADD KEY `fk_cnt_cliente` (`cnt_cliente`);

--
-- Indexes for table `tb_funcao`
--
ALTER TABLE `tb_funcao`
  ADD PRIMARY KEY (`fnc_cod`);

--
-- Indexes for table `tb_tarefa`
--
ALTER TABLE `tb_tarefa`
  ADD PRIMARY KEY (`taf_cod`),
  ADD KEY `fk_taf_responsavel` (`taf_responsavel`),
  ADD KEY `fk_taf_contrato` (`taf_contrato`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_administrador`
--
ALTER TABLE `tb_administrador`
  MODIFY `adm_cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_cliente`
--
ALTER TABLE `tb_cliente`
  MODIFY `cli_cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_contrato`
--
ALTER TABLE `tb_contrato`
  MODIFY `cnt_cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_funcao`
--
ALTER TABLE `tb_funcao`
  MODIFY `fnc_cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_tarefa`
--
ALTER TABLE `tb_tarefa`
  MODIFY `taf_cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `tb_administrador`
--
ALTER TABLE `tb_administrador`
  ADD CONSTRAINT `fk_adm_funcao` FOREIGN KEY (`adm_funcao`) REFERENCES `tb_funcao` (`fnc_cod`);

--
-- Limitadores para a tabela `tb_contrato`
--
ALTER TABLE `tb_contrato`
  ADD CONSTRAINT `fk_cnt_cliente` FOREIGN KEY (`cnt_cliente`) REFERENCES `tb_cliente` (`cli_cod`);

--
-- Limitadores para a tabela `tb_tarefa`
--
ALTER TABLE `tb_tarefa`
  ADD CONSTRAINT `fk_taf_contrato` FOREIGN KEY (`taf_contrato`) REFERENCES `tb_contrato` (`cnt_cod`),
  ADD CONSTRAINT `fk_taf_responsavel` FOREIGN KEY (`taf_responsavel`) REFERENCES `tb_administrador` (`adm_cod`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
