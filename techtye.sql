-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 06-Nov-2019 às 14:29
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
-- Database: `techtye`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `cli_cod` int(11) NOT NULL,
  `cli_nome` varchar(50) NOT NULL,
  `cli_email` varchar(100) NOT NULL,
  `cli_CNPJ` varchar(20) NOT NULL,
  `cli_telefone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`cli_cod`, `cli_nome`, `cli_email`, `cli_CNPJ`, `cli_telefone`) VALUES
(1, 'Montreal Tecnologia', 'montreal@montreal.com.br', '22.071.011/6666-32', '(21) 2291-6116');

-- --------------------------------------------------------

--
-- Estrutura da tabela `contrato`
--

CREATE TABLE `contrato` (
  `cnt_cod` int(11) NOT NULL,
  `cnt_titulo` varchar(20) NOT NULL,
  `cnt_descricao` varchar(200) NOT NULL,
  `cnt_prioridade` varchar(10) NOT NULL,
  `cnt_status` varchar(20) NOT NULL,
  `cnt_dta_abertura` datetime NOT NULL,
  `cnt_dta_conclusao` datetime DEFAULT NULL,
  `cnt_responsavel` int(11) DEFAULT NULL,
  `cnt_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `contrato`
--

INSERT INTO `contrato` (`cnt_cod`, `cnt_titulo`, `cnt_descricao`, `cnt_prioridade`, `cnt_status`, `cnt_dta_abertura`, `cnt_dta_conclusao`, `cnt_responsavel`, `cnt_cliente`) VALUES
(1, 'Site PHP+Bootstrap', 'Hello World', 'ALTA', 'EM DESENVOLVIMENTO', '2019-11-01 00:00:00', '0000-00-00 00:00:00', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcao`
--

CREATE TABLE `funcao` (
  `fnc_cod` int(11) NOT NULL,
  `fnc_nome` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `funcao`
--

INSERT INTO `funcao` (`fnc_cod`, `fnc_nome`) VALUES
(1, 'Desenvolvedor'),
(2, 'Analista');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `fun_cod` int(11) NOT NULL,
  `fun_nome` varchar(50) NOT NULL,
  `fun_email` varchar(100) NOT NULL,
  `fun_senha` varchar(32) NOT NULL,
  `fun_perm` int(2) NOT NULL,
  `fun_funcao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`fun_cod`, `fun_nome`, `fun_email`, `fun_senha`, `fun_perm`, `fun_funcao`) VALUES
(1, 'Gabriel Henrique Artemio Ferreira', 'adm@gmail.com', '121212', 1, 1),
(2, 'Wellington Cidade ', 'cidade@gmail.com', '123456', 2, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `relatorio`
--

CREATE TABLE `relatorio` (
  `rlt_cod` int(11) NOT NULL,
  `rlt_dta_criacao` datetime NOT NULL,
  `rlt_responsavel` int(11) DEFAULT NULL,
  `rlt_contrato` int(11) DEFAULT NULL,
  `rlt_obs` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tarefa`
--

CREATE TABLE `tarefa` (
  `tfr_cod` int(11) NOT NULL,
  `trf_titulo` varchar(30) NOT NULL,
  `trf_status` varchar(20) NOT NULL,
  `trf_obs` varchar(50) DEFAULT NULL,
  `trf_contrato` int(11) DEFAULT NULL,
  `trf_func` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tarefa`
--

INSERT INTO `tarefa` (`tfr_cod`, `trf_titulo`, `trf_status`, `trf_obs`, `trf_contrato`, `trf_func`) VALUES
(1, 'Site de PHP', 'EM DESENVOLVIMENTO', 'Entregar até o mês de Janeiro', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cli_cod`),
  ADD UNIQUE KEY `cli_nome` (`cli_nome`),
  ADD UNIQUE KEY `cli_email` (`cli_email`),
  ADD UNIQUE KEY `cli_CNPJ` (`cli_CNPJ`),
  ADD UNIQUE KEY `cli_telefone` (`cli_telefone`);

--
-- Indexes for table `contrato`
--
ALTER TABLE `contrato`
  ADD PRIMARY KEY (`cnt_cod`),
  ADD KEY `fk_resp` (`cnt_responsavel`),
  ADD KEY `fk_cliente` (`cnt_cliente`);

--
-- Indexes for table `funcao`
--
ALTER TABLE `funcao`
  ADD PRIMARY KEY (`fnc_cod`);

--
-- Indexes for table `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`fun_cod`),
  ADD UNIQUE KEY `fun_nome` (`fun_nome`),
  ADD UNIQUE KEY `fun_email` (`fun_email`),
  ADD KEY `fun_funcao` (`fun_funcao`);

--
-- Indexes for table `relatorio`
--
ALTER TABLE `relatorio`
  ADD PRIMARY KEY (`rlt_cod`),
  ADD KEY `fk_respo` (`rlt_responsavel`),
  ADD KEY `fk_contrato` (`rlt_contrato`);

--
-- Indexes for table `tarefa`
--
ALTER TABLE `tarefa`
  ADD PRIMARY KEY (`tfr_cod`),
  ADD KEY `fk_contr` (`trf_contrato`),
  ADD KEY `fk_funci` (`trf_func`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `cli_cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contrato`
--
ALTER TABLE `contrato`
  MODIFY `cnt_cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `funcao`
--
ALTER TABLE `funcao`
  MODIFY `fnc_cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `fun_cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `relatorio`
--
ALTER TABLE `relatorio`
  MODIFY `rlt_cod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tarefa`
--
ALTER TABLE `tarefa`
  MODIFY `tfr_cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `contrato`
--
ALTER TABLE `contrato`
  ADD CONSTRAINT `fk_cliente` FOREIGN KEY (`cnt_cliente`) REFERENCES `cliente` (`cli_cod`),
  ADD CONSTRAINT `fk_resp` FOREIGN KEY (`cnt_responsavel`) REFERENCES `funcionario` (`fun_cod`);

--
-- Limitadores para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `fun_funcao` FOREIGN KEY (`fun_funcao`) REFERENCES `funcao` (`fnc_cod`);

--
-- Limitadores para a tabela `relatorio`
--
ALTER TABLE `relatorio`
  ADD CONSTRAINT `fk_contrato` FOREIGN KEY (`rlt_contrato`) REFERENCES `contrato` (`cnt_cod`),
  ADD CONSTRAINT `fk_respo` FOREIGN KEY (`rlt_responsavel`) REFERENCES `funcionario` (`fun_cod`);

--
-- Limitadores para a tabela `tarefa`
--
ALTER TABLE `tarefa`
  ADD CONSTRAINT `fk_contr` FOREIGN KEY (`trf_contrato`) REFERENCES `contrato` (`cnt_cod`),
  ADD CONSTRAINT `fk_funci` FOREIGN KEY (`trf_func`) REFERENCES `funcionario` (`fun_cod`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
