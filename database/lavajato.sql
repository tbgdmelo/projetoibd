-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: db-lavajato
-- Tempo de geração: 12-Dez-2019 às 15:25
-- Versão do servidor: 5.7.28
-- versão do PHP: 7.2.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `lavajato`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `applavajato_user`
--

CREATE TABLE `applavajato_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(15) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `applavajato_user`
--

INSERT INTO `applavajato_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `is_staff`, `is_active`) VALUES
(1, 'pbkdf2_sha256$180000$fOkPQxq9JDLw$XOjaWclHKO0rX4Je6rt6/wBDF99X1+ZFD+S1VjEFB14=', NULL, 1, 'lavajato', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `applavajato_user_groups`
--

CREATE TABLE `applavajato_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `applavajato_user_user_permissions`
--

CREATE TABLE `applavajato_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add permission', 1, 'add_permission'),
(2, 'Can change permission', 1, 'change_permission'),
(3, 'Can delete permission', 1, 'delete_permission'),
(4, 'Can view permission', 1, 'view_permission'),
(5, 'Can add group', 2, 'add_group'),
(6, 'Can change group', 2, 'change_group'),
(7, 'Can delete group', 2, 'delete_group'),
(8, 'Can view group', 2, 'view_group'),
(9, 'Can add content type', 3, 'add_contenttype'),
(10, 'Can change content type', 3, 'change_contenttype'),
(11, 'Can delete content type', 3, 'delete_contenttype'),
(12, 'Can view content type', 3, 'view_contenttype'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add cliente', 5, 'add_cliente'),
(18, 'Can change cliente', 5, 'change_cliente'),
(19, 'Can delete cliente', 5, 'delete_cliente'),
(20, 'Can view cliente', 5, 'view_cliente'),
(21, 'Can add fabricante', 6, 'add_fabricante'),
(22, 'Can change fabricante', 6, 'change_fabricante'),
(23, 'Can delete fabricante', 6, 'delete_fabricante'),
(24, 'Can view fabricante', 6, 'view_fabricante'),
(25, 'Can add funcionario', 7, 'add_funcionario'),
(26, 'Can change funcionario', 7, 'change_funcionario'),
(27, 'Can delete funcionario', 7, 'delete_funcionario'),
(28, 'Can view funcionario', 7, 'view_funcionario'),
(29, 'Can add modelo', 8, 'add_modelo'),
(30, 'Can change modelo', 8, 'change_modelo'),
(31, 'Can delete modelo', 8, 'delete_modelo'),
(32, 'Can view modelo', 8, 'view_modelo'),
(33, 'Can add servico', 9, 'add_servico'),
(34, 'Can change servico', 9, 'change_servico'),
(35, 'Can delete servico', 9, 'delete_servico'),
(36, 'Can view servico', 9, 'view_servico'),
(37, 'Can add veiculo', 10, 'add_veiculo'),
(38, 'Can change veiculo', 10, 'change_veiculo'),
(39, 'Can delete veiculo', 10, 'delete_veiculo'),
(40, 'Can view veiculo', 10, 'view_veiculo'),
(41, 'Can add nota fiscal', 11, 'add_notafiscal'),
(42, 'Can change nota fiscal', 11, 'change_notafiscal'),
(43, 'Can delete nota fiscal', 11, 'delete_notafiscal'),
(44, 'Can view nota fiscal', 11, 'view_notafiscal'),
(45, 'Can add log entry', 12, 'add_logentry'),
(46, 'Can change log entry', 12, 'change_logentry'),
(47, 'Can delete log entry', 12, 'delete_logentry'),
(48, 'Can view log entry', 12, 'view_logentry'),
(49, 'Can add session', 13, 'add_session'),
(50, 'Can change session', 13, 'change_session'),
(51, 'Can delete session', 13, 'delete_session'),
(52, 'Can view session', 13, 'view_session');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `registro_pessoal` varchar(11) NOT NULL,
  `nome` varchar(85) NOT NULL,
  `endereco` varchar(150) NOT NULL,
  `telefone1` varchar(14) NOT NULL,
  `telefone2` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(12, 'admin', 'logentry'),
(5, 'applavajato', 'cliente'),
(6, 'applavajato', 'fabricante'),
(7, 'applavajato', 'funcionario'),
(8, 'applavajato', 'modelo'),
(11, 'applavajato', 'notafiscal'),
(9, 'applavajato', 'servico'),
(4, 'applavajato', 'user'),
(10, 'applavajato', 'veiculo'),
(2, 'auth', 'group'),
(1, 'auth', 'permission'),
(3, 'contenttypes', 'contenttype'),
(13, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-12-12 15:18:27.593243'),
(2, 'contenttypes', '0002_remove_content_type_name', '2019-12-12 15:18:28.613957'),
(3, 'auth', '0001_initial', '2019-12-12 15:18:29.622856'),
(4, 'auth', '0002_alter_permission_name_max_length', '2019-12-12 15:18:32.473400'),
(5, 'auth', '0003_alter_user_email_max_length', '2019-12-12 15:18:32.530200'),
(6, 'auth', '0004_alter_user_username_opts', '2019-12-12 15:18:32.593058'),
(7, 'auth', '0005_alter_user_last_login_null', '2019-12-12 15:18:32.652098'),
(8, 'auth', '0006_require_contenttypes_0002', '2019-12-12 15:18:32.695327'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2019-12-12 15:18:32.750094'),
(10, 'auth', '0008_alter_user_username_max_length', '2019-12-12 15:18:32.814898'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2019-12-12 15:18:32.874292'),
(12, 'auth', '0010_alter_group_name_max_length', '2019-12-12 15:18:33.039812'),
(13, 'auth', '0011_update_proxy_permissions', '2019-12-12 15:18:33.099699'),
(14, 'applavajato', '0001_initial', '2019-12-12 15:18:36.801826'),
(15, 'applavajato', '0002_remove_cliente_usuario', '2019-12-12 15:18:48.316287'),
(16, 'admin', '0001_initial', '2019-12-12 15:22:28.049553'),
(17, 'admin', '0002_logentry_remove_auto_add', '2019-12-12 15:22:29.704634'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2019-12-12 15:22:29.802846'),
(19, 'sessions', '0001_initial', '2019-12-12 15:22:30.343796');

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fabricante`
--

CREATE TABLE `fabricante` (
  `id_fabricante` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `matricula` int(11) NOT NULL,
  `registro_pessoal` varchar(11) NOT NULL,
  `nome` varchar(85) NOT NULL,
  `endereco` varchar(150) NOT NULL,
  `funcao` varchar(30) NOT NULL,
  `telefone1` varchar(14) NOT NULL,
  `telefone2` varchar(14) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `modelo`
--

CREATE TABLE `modelo` (
  `id_modelo` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `nota_fiscal`
--

CREATE TABLE `nota_fiscal` (
  `id_nota` int(11) NOT NULL,
  `data_inicio` datetime(6) NOT NULL,
  `data_fim` datetime(6) DEFAULT NULL,
  `forma_pagamento` varchar(8) NOT NULL,
  `valor_final` decimal(6,2) NOT NULL,
  `cliente_id` varchar(11) NOT NULL,
  `funcionario_id` int(11) NOT NULL,
  `veiculo_id` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `nota_fiscal_servicos`
--

CREATE TABLE `nota_fiscal_servicos` (
  `id` int(11) NOT NULL,
  `notafiscal_id` int(11) NOT NULL,
  `servico_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `servico`
--

CREATE TABLE `servico` (
  `id_servico` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `valor` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `veiculo`
--

CREATE TABLE `veiculo` (
  `placa` varchar(7) NOT NULL,
  `cor` varchar(25) DEFAULT NULL,
  `avarias` varchar(400) DEFAULT NULL,
  `tipo_veiculo` varchar(10) NOT NULL,
  `cliente_id` varchar(11) NOT NULL,
  `fabricante_id` int(11) NOT NULL,
  `modelo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `applavajato_user`
--
ALTER TABLE `applavajato_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Índices para tabela `applavajato_user_groups`
--
ALTER TABLE `applavajato_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `applavajato_user_groups_user_id_group_id_41d7486a_uniq` (`user_id`,`group_id`),
  ADD KEY `applavajato_user_groups_group_id_aa1ce9ac_fk_auth_group_id` (`group_id`);

--
-- Índices para tabela `applavajato_user_user_permissions`
--
ALTER TABLE `applavajato_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `applavajato_user_user_pe_user_id_permission_id_8feddbfa_uniq` (`user_id`,`permission_id`),
  ADD KEY `applavajato_user_use_permission_id_d9f5ceba_fk_auth_perm` (`permission_id`);

--
-- Índices para tabela `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices para tabela `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Índices para tabela `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`registro_pessoal`);

--
-- Índices para tabela `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_applavajato_user_id` (`user_id`);

--
-- Índices para tabela `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Índices para tabela `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Índices para tabela `fabricante`
--
ALTER TABLE `fabricante`
  ADD PRIMARY KEY (`id_fabricante`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`matricula`),
  ADD UNIQUE KEY `registro_pessoal` (`registro_pessoal`),
  ADD UNIQUE KEY `usuario_id` (`usuario_id`);

--
-- Índices para tabela `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`id_modelo`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Índices para tabela `nota_fiscal`
--
ALTER TABLE `nota_fiscal`
  ADD PRIMARY KEY (`id_nota`),
  ADD KEY `nota_fiscal_cliente_id_79da7c0c_fk_cliente_registro_pessoal` (`cliente_id`),
  ADD KEY `nota_fiscal_funcionario_id_fb49907e_fk_funcionario_matricula` (`funcionario_id`),
  ADD KEY `nota_fiscal_veiculo_id_4b0bffb9_fk_veiculo_placa` (`veiculo_id`);

--
-- Índices para tabela `nota_fiscal_servicos`
--
ALTER TABLE `nota_fiscal_servicos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nota_fiscal_servicos_notafiscal_id_servico_id_d1627980_uniq` (`notafiscal_id`,`servico_id`),
  ADD KEY `nota_fiscal_servicos_servico_id_40893ec2_fk_servico_id_servico` (`servico_id`);

--
-- Índices para tabela `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`id_servico`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Índices para tabela `veiculo`
--
ALTER TABLE `veiculo`
  ADD PRIMARY KEY (`placa`),
  ADD KEY `veiculo_cliente_id_366297d5_fk_cliente_registro_pessoal` (`cliente_id`),
  ADD KEY `veiculo_fabricante_id_c68da55b_fk_fabricante_id_fabricante` (`fabricante_id`),
  ADD KEY `veiculo_modelo_id_eae68fda_fk_modelo_id_modelo` (`modelo_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `applavajato_user`
--
ALTER TABLE `applavajato_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `applavajato_user_groups`
--
ALTER TABLE `applavajato_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `applavajato_user_user_permissions`
--
ALTER TABLE `applavajato_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de tabela `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `fabricante`
--
ALTER TABLE `fabricante`
  MODIFY `id_fabricante` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `matricula` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `modelo`
--
ALTER TABLE `modelo`
  MODIFY `id_modelo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `nota_fiscal`
--
ALTER TABLE `nota_fiscal`
  MODIFY `id_nota` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `nota_fiscal_servicos`
--
ALTER TABLE `nota_fiscal_servicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `servico`
--
ALTER TABLE `servico`
  MODIFY `id_servico` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `applavajato_user_groups`
--
ALTER TABLE `applavajato_user_groups`
  ADD CONSTRAINT `applavajato_user_groups_group_id_aa1ce9ac_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `applavajato_user_groups_user_id_6c37a26e_fk_applavajato_user_id` FOREIGN KEY (`user_id`) REFERENCES `applavajato_user` (`id`);

--
-- Limitadores para a tabela `applavajato_user_user_permissions`
--
ALTER TABLE `applavajato_user_user_permissions`
  ADD CONSTRAINT `applavajato_user_use_permission_id_d9f5ceba_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `applavajato_user_use_user_id_90e1df67_fk_applavaja` FOREIGN KEY (`user_id`) REFERENCES `applavajato_user` (`id`);

--
-- Limitadores para a tabela `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Limitadores para a tabela `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Limitadores para a tabela `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_applavajato_user_id` FOREIGN KEY (`user_id`) REFERENCES `applavajato_user` (`id`);

--
-- Limitadores para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `funcionario_usuario_id_89713158_fk_applavajato_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `applavajato_user` (`id`);

--
-- Limitadores para a tabela `nota_fiscal`
--
ALTER TABLE `nota_fiscal`
  ADD CONSTRAINT `nota_fiscal_cliente_id_79da7c0c_fk_cliente_registro_pessoal` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`registro_pessoal`),
  ADD CONSTRAINT `nota_fiscal_funcionario_id_fb49907e_fk_funcionario_matricula` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionario` (`matricula`),
  ADD CONSTRAINT `nota_fiscal_veiculo_id_4b0bffb9_fk_veiculo_placa` FOREIGN KEY (`veiculo_id`) REFERENCES `veiculo` (`placa`);

--
-- Limitadores para a tabela `nota_fiscal_servicos`
--
ALTER TABLE `nota_fiscal_servicos`
  ADD CONSTRAINT `nota_fiscal_servicos_notafiscal_id_f8e519ae_fk_nota_fisc` FOREIGN KEY (`notafiscal_id`) REFERENCES `nota_fiscal` (`id_nota`),
  ADD CONSTRAINT `nota_fiscal_servicos_servico_id_40893ec2_fk_servico_id_servico` FOREIGN KEY (`servico_id`) REFERENCES `servico` (`id_servico`);

--
-- Limitadores para a tabela `veiculo`
--
ALTER TABLE `veiculo`
  ADD CONSTRAINT `veiculo_cliente_id_366297d5_fk_cliente_registro_pessoal` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`registro_pessoal`),
  ADD CONSTRAINT `veiculo_fabricante_id_c68da55b_fk_fabricante_id_fabricante` FOREIGN KEY (`fabricante_id`) REFERENCES `fabricante` (`id_fabricante`),
  ADD CONSTRAINT `veiculo_modelo_id_eae68fda_fk_modelo_id_modelo` FOREIGN KEY (`modelo_id`) REFERENCES `modelo` (`id_modelo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
