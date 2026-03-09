-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19/09/2024 às 23:38
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `projeto de banco de dados`
--
CREATE DATABASE IF NOT EXISTS `projeto de banco de dados` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `projeto de banco de dados`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `agendas`
--

CREATE TABLE `agendas` (
  `ID` int(11) NOT NULL,
  `CRM_Medico` varchar(20) DEFAULT NULL,
  `Data` date DEFAULT NULL,
  `Horario` time DEFAULT NULL,
  `Disponivel` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `consultas`
--

CREATE TABLE `consultas` (
  `Numero_Consulta` int(11) NOT NULL,
  `Numero_Paciente` int(11) DEFAULT NULL,
  `Data` date DEFAULT NULL,
  `Medico_CRM` varchar(20) DEFAULT NULL,
  `Diagnostico` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `consultas_exames`
--

CREATE TABLE `consultas_exames` (
  `ID` int(11) NOT NULL,
  `Numero_Consulta` int(11) DEFAULT NULL,
  `Exame_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `consultas_medicamentos`
--

CREATE TABLE `consultas_medicamentos` (
  `ID` int(11) NOT NULL,
  `Numero_Consulta` int(11) DEFAULT NULL,
  `Receita_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `convenios`
--

CREATE TABLE `convenios` (
  `id_convenio` int(11) NOT NULL,
  `nome_convenio` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `exames`
--

CREATE TABLE `exames` (
  `ID` int(11) NOT NULL,
  `Numero_Consulta` int(11) DEFAULT NULL,
  `Exame` varchar(100) DEFAULT NULL,
  `Data` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `internacoes`
--

CREATE TABLE `internacoes` (
  `ID` int(11) NOT NULL,
  `Numero_Paciente` int(11) DEFAULT NULL,
  `Data_Entrada` date DEFAULT NULL,
  `Data_Saida` date DEFAULT NULL,
  `Quarto` varchar(10) DEFAULT NULL,
  `Medico_Responsavel_CRM` varchar(20) DEFAULT NULL,
  `Motivo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `medicos`
--

CREATE TABLE `medicos` (
  `CRM` varchar(20) NOT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `Especialidade` varchar(50) DEFAULT NULL,
  `Telefone` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Endereco` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pacientes`
--

CREATE TABLE `pacientes` (
  `Numero_Paciente` int(11) NOT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `Data_Nasc` date DEFAULT NULL,
  `Sexo` char(1) DEFAULT NULL,
  `Convenio` int(11) DEFAULT NULL,
  `Estado_Civil` varchar(20) DEFAULT NULL,
  `RG` varchar(20) DEFAULT NULL,
  `Telefone` varchar(20) DEFAULT NULL,
  `Endereco` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pacientes_medicos`
--

CREATE TABLE `pacientes_medicos` (
  `Numero_Paciente` int(11) NOT NULL,
  `CRM_Medico` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `receitas`
--

CREATE TABLE `receitas` (
  `ID` int(11) NOT NULL,
  `Numero_Consulta` int(11) DEFAULT NULL,
  `Medicamento` varchar(100) DEFAULT NULL,
  `Dosagem` varchar(50) DEFAULT NULL,
  `Frequencia` varchar(50) DEFAULT NULL,
  `Duracao` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `agendas`
--
ALTER TABLE `agendas`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CRM_Medico` (`CRM_Medico`);

--
-- Índices de tabela `consultas`
--
ALTER TABLE `consultas`
  ADD PRIMARY KEY (`Numero_Consulta`),
  ADD KEY `Numero_Paciente` (`Numero_Paciente`),
  ADD KEY `Medico_CRM` (`Medico_CRM`);

--
-- Índices de tabela `consultas_exames`
--
ALTER TABLE `consultas_exames`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Numero_Consulta` (`Numero_Consulta`),
  ADD KEY `Exame_ID` (`Exame_ID`);

--
-- Índices de tabela `consultas_medicamentos`
--
ALTER TABLE `consultas_medicamentos`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Numero_Consulta` (`Numero_Consulta`),
  ADD KEY `Receita_ID` (`Receita_ID`);

--
-- Índices de tabela `convenios`
--
ALTER TABLE `convenios`
  ADD PRIMARY KEY (`id_convenio`);

--
-- Índices de tabela `exames`
--
ALTER TABLE `exames`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Numero_Consulta` (`Numero_Consulta`);

--
-- Índices de tabela `internacoes`
--
ALTER TABLE `internacoes`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Numero_Paciente` (`Numero_Paciente`),
  ADD KEY `Medico_Responsavel_CRM` (`Medico_Responsavel_CRM`);

--
-- Índices de tabela `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`CRM`);

--
-- Índices de tabela `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`Numero_Paciente`),
  ADD KEY `Convenio` (`Convenio`);

--
-- Índices de tabela `pacientes_medicos`
--
ALTER TABLE `pacientes_medicos`
  ADD PRIMARY KEY (`Numero_Paciente`,`CRM_Medico`),
  ADD KEY `CRM_Medico` (`CRM_Medico`);

--
-- Índices de tabela `receitas`
--
ALTER TABLE `receitas`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Numero_Consulta` (`Numero_Consulta`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `agendas`
--
ALTER TABLE `agendas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `consultas`
--
ALTER TABLE `consultas`
  MODIFY `Numero_Consulta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `consultas_exames`
--
ALTER TABLE `consultas_exames`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `consultas_medicamentos`
--
ALTER TABLE `consultas_medicamentos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `convenios`
--
ALTER TABLE `convenios`
  MODIFY `id_convenio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `exames`
--
ALTER TABLE `exames`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `internacoes`
--
ALTER TABLE `internacoes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `Numero_Paciente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `receitas`
--
ALTER TABLE `receitas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `agendas`
--
ALTER TABLE `agendas`
  ADD CONSTRAINT `agendas_ibfk_1` FOREIGN KEY (`CRM_Medico`) REFERENCES `medicos` (`CRM`) ON DELETE CASCADE;

--
-- Restrições para tabelas `consultas`
--
ALTER TABLE `consultas`
  ADD CONSTRAINT `consultas_ibfk_1` FOREIGN KEY (`Numero_Paciente`) REFERENCES `pacientes` (`Numero_Paciente`) ON DELETE CASCADE,
  ADD CONSTRAINT `consultas_ibfk_2` FOREIGN KEY (`Medico_CRM`) REFERENCES `medicos` (`CRM`) ON DELETE CASCADE;

--
-- Restrições para tabelas `consultas_exames`
--
ALTER TABLE `consultas_exames`
  ADD CONSTRAINT `consultas_exames_ibfk_1` FOREIGN KEY (`Numero_Consulta`) REFERENCES `consultas` (`Numero_Consulta`) ON DELETE CASCADE,
  ADD CONSTRAINT `consultas_exames_ibfk_2` FOREIGN KEY (`Exame_ID`) REFERENCES `exames` (`ID`) ON DELETE CASCADE;

--
-- Restrições para tabelas `consultas_medicamentos`
--
ALTER TABLE `consultas_medicamentos`
  ADD CONSTRAINT `consultas_medicamentos_ibfk_1` FOREIGN KEY (`Numero_Consulta`) REFERENCES `consultas` (`Numero_Consulta`) ON DELETE CASCADE,
  ADD CONSTRAINT `consultas_medicamentos_ibfk_2` FOREIGN KEY (`Receita_ID`) REFERENCES `receitas` (`ID`) ON DELETE CASCADE;

--
-- Restrições para tabelas `exames`
--
ALTER TABLE `exames`
  ADD CONSTRAINT `exames_ibfk_1` FOREIGN KEY (`Numero_Consulta`) REFERENCES `consultas` (`Numero_Consulta`) ON DELETE CASCADE;

--
-- Restrições para tabelas `internacoes`
--
ALTER TABLE `internacoes`
  ADD CONSTRAINT `internacoes_ibfk_1` FOREIGN KEY (`Numero_Paciente`) REFERENCES `pacientes` (`Numero_Paciente`) ON DELETE CASCADE,
  ADD CONSTRAINT `internacoes_ibfk_2` FOREIGN KEY (`Medico_Responsavel_CRM`) REFERENCES `medicos` (`CRM`) ON DELETE CASCADE;

--
-- Restrições para tabelas `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `pacientes_ibfk_1` FOREIGN KEY (`Convenio`) REFERENCES `convenios` (`id_convenio`) ON DELETE SET NULL;

--
-- Restrições para tabelas `pacientes_medicos`
--
ALTER TABLE `pacientes_medicos`
  ADD CONSTRAINT `pacientes_medicos_ibfk_1` FOREIGN KEY (`Numero_Paciente`) REFERENCES `pacientes` (`Numero_Paciente`) ON DELETE CASCADE,
  ADD CONSTRAINT `pacientes_medicos_ibfk_2` FOREIGN KEY (`CRM_Medico`) REFERENCES `medicos` (`CRM`) ON DELETE CASCADE;

--
-- Restrições para tabelas `receitas`
--
ALTER TABLE `receitas`
  ADD CONSTRAINT `receitas_ibfk_1` FOREIGN KEY (`Numero_Consulta`) REFERENCES `consultas` (`Numero_Consulta`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
