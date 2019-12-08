CREATE TABLE cliente(
	registro_pessoal varchar (11),
	nome  varchar(85) NOT NULL,
	endereco  varchar(150) NOT NULL,
	telefone1 varchar(14) NOT NULL,
	telefone2 varchar(14),
	PRIMARY KEY (registro_pessoal)
);

CREATE TABLE servico(
	id_servico INT AUTO_INCREMENT,
	nome VARCHAR(50) NOT NULL,
	valor NUMERIC(5,2) NOT NULL,
	PRIMARY KEY (id_servico)
);

CREATE TABLE funcionario(
	matricula INT AUTO_INCREMENT,
	registro_pessoal VARCHAR(11) NOT NULL,
	nome VARCHAR(85) NOT NULL,
	endereco VARCHAR(150) NOT NULL,
	funcao VARCHAR(30) NOT NULL,
	usuario VARCHAR(32) NOT NULL,
	senha VARCHAR(20) NOT NULL,
	nivel VARCHAR(1) NOT NULL,
	telefone1 varchar(14) NOT NULL,
	telefone2 varchar(14),
	PRIMARY KEY (matricula)
);

CREATE TABLE modelo(
	id_modelo INT AUTO_INCREMENT,
	nome VARCHAR(30) NOT NULL,
	PRIMARY KEY (id_modelo)
);

CREATE TABLE fabricante(
	id_fabricante INT AUTO_INCREMENT,
	nome VARCHAR(30) NOT NULL,
	PRIMARY KEY (id_fabricante)
);

CREATE TABLE veiculo(
	placa VARCHAR(7),
	cor VARCHAR(25),
	avarias VARCHAR(400),
	id_modelo INT,
	id_fabricante INT,
	PRIMARY KEY (placa),
	FOREIGN KEY (id_modelo) REFERENCES modelo (id_modelo),
	FOREIGN KEY (id_fabricante) REFERENCES fabricante (id_fabricante)
);

CREATE TABLE pesado(
	placa VARCHAR(7),
	carga VARCHAR(20),
	PRIMARY KEY (placa),
	FOREIGN KEY (placa) REFERENCES veiculo (placa)
	ON DELETE CASCADE
);

CREATE TABLE aluguel(
	placa VARCHAR(7),
	empresa VARCHAR(15) NOT NULL,
	PRIMARY KEY (placa),
	FOREIGN KEY (placa) REFERENCES veiculo (placa)
	ON DELETE CASCADE
);

CREATE TABLE particular(
	placa VARCHAR(7),
	tipo VARCHAR(20) NOT NULL,
	PRIMARY KEY (placa),
	FOREIGN KEY (placa) REFERENCES veiculo (placa)
	ON DELETE CASCADE
);

CREATE TABLE nota_fiscal(
	id_nota INT AUTO_INCREMENT,
	data_inicio TIMESTAMP NOT NULL,
	data_fim TIMESTAMP NULL,
	matricula INT NOT NULL,
	placa VARCHAR(7) NOT NULL,
	registro_pessoal VARCHAR(11) NOT NULL,
	agendado BOOLEAN,
	forma_pagamento VARCHAR(1) NOT NULL,
	PRIMARY KEY (id_nota),
	FOREIGN KEY (matricula) REFERENCES funcionario (matricula),
	FOREIGN KEY (placa) REFERENCES veiculo (placa),
	FOREIGN KEY (registro_pessoal) REFERENCES cliente (registro_pessoal)
);

CREATE TABLE cliente_veiculo(
	registro_pessoal VARCHAR(11),
	placa VARCHAR(7),
	PRIMARY KEY (registro_pessoal, placa),
	FOREIGN KEY (placa) REFERENCES veiculo (placa),
	FOREIGN KEY (registro_pessoal) REFERENCES cliente (registro_pessoal)
	ON DELETE CASCADE
);

CREATE TABLE servico_na_nota(
	id_nota INT,
	id_servico INT,
	PRIMARY KEY (id_nota, id_servico),
	FOREIGN KEY (id_servico) REFERENCES servico (id_servico),
	FOREIGN KEY (id_nota) REFERENCES nota_fiscal (id_nota)
);
	

SET character_set_client = utf8;
SET character_set_connection = utf8;
SET character_set_results = utf8;
SET collation_connection = utf8_general_ci;
