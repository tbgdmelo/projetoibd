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
	matricula  INT AUTO_INCREMENT,
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

--CREATE TABLE telefone_func(
--	matricula INT,
--	telefone VARCHAR(14) NOT NULL,
--	PRIMARY KEY (matricula, telefone),
--	FOREIGN KEY (matricula) REFERENCES funcionario (matricula)
--	ON DELETE CASCADE
--);

CREATE TABLE veiculo(
	placa VARCHAR(7),
	cor VARCHAR(25) NOT NULL,
 	modelo VARCHAR(30) NOT NULL,
	fabricante VARCHAR(15) NOT NULL,
	avarias VARCHAR(400),
	PRIMARY KEY (placa)
);

CREATE TABLE pesado(
	placa VARCHAR(7),
	cargas VARCHAR(20) NOT NULL,
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

CREATE TABLE ordem_servico(
	id_ordem INT AUTO_INCREMENT,
	data_inicio TIMESTAMP NOT NULL,
	data_fim TIMESTAMP NULL,
	matricula INT NOT NULL,
	placa VARCHAR(7) NOT NULL,
	PRIMARY KEY (id_ordem),
	FOREIGN KEY (matricula) REFERENCES funcionario (matricula),
	FOREIGN KEY (placa) REFERENCES veiculo (placa)
);

CREATE TABLE cliente_veiculo(
	registro_pessoal VARCHAR(11),
	placa VARCHAR(7),
	PRIMARY KEY (registro_pessoal, placa),
	FOREIGN KEY (placa) REFERENCES veiculo (placa),
	FOREIGN KEY (registro_pessoal) REFERENCES cliente (registro_pessoal)
	ON DELETE CASCADE
);


CREATE TABLE cliente_solic_servico(
	registro_pessoal VARCHAR(11),
	id_servico INT AUTO_INCREMENT,
	PRIMARY KEY (registro_pessoal, id_servico),
	FOREIGN KEY (id_servico) REFERENCES servico (id_servico),
	FOREIGN KEY (registro_pessoal) REFERENCES cliente (registro_pessoal)
);

CREATE TABLE servico_na_ordem(
	id_ordem INT,
	id_servico INT,
	PRIMARY KEY (id_ordem, id_servico),
	FOREIGN KEY (id_servico) REFERENCES servico (id_servico),
	FOREIGN KEY (id_ordem) REFERENCES ordem_servico (id_ordem)
);
	

SET character_set_client = utf8;
SET character_set_connection = utf8;
SET character_set_results = utf8;
SET collation_connection = utf8_general_ci;
