/*removendo banco de dados se ja existir e criando novamente*/
DROP DATABASE IF EXISTS curso_sql;
CREATE DATABASE curso_sql; -- criando banco de dados
USE curso_sql;

DROP TABLE IF EXISTS estado;

SELECT @@version, @@version_compile_os, @@lower_case_table_names;

CREATE TABLE estado(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL UNIQUE, -- constraint in line
sigla CHAR(2) NOT NULL UNIQUE,
ativo CHAR(1) NOT NULL DEFAULT 'S',
data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT estado_ativo_deve_ser_S_ou_N CHECK (ativo IN ("S", "N")) -- constraint out of line
);

CREATE TABLE cidade(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL,
ativo CHAR(1) NOT NULL DEFAULT "S",
data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
id_estado INT NOT NULL,
CONSTRAINT fk_cidade_estado FOREIGN KEY (id_estado) REFERENCES estado(id),
CONSTRAINT cidade_ativo_deve_ser_S_ou_N CHECK (ativo IN ("S", "N")),
CONSTRAINT cidade_unica UNIQUE(nome,id_estado)
);

INSERT INTO estado(nome, sigla)VALUES("PARANÁ","PR");
INSERT INTO estado(nome, sigla)VALUES("SÃO PAULO","SP");
INSERT INTO estado(nome, sigla)VALUES("RIO DE JANEIRO","RJ");

INSERT INTO EsTaDo (nome, sigla) VALUES("SANTA CATARINA", "SC"); -- valor de insercao sempre em maiusculos

SELECT * FROM estado; -- erro
SELECT * FROM ESTADO; -- certo
SELECT * FROM Estado; -- erro

INSERT INTO cidade (nome, id_estado) VALUES ("PARANAVAÍ", 1); 

SELECT id,nome,ativo, data_cadastro,id_estado FROM cidade; -- ou SELECT * FROM cidade;
SELECT id,nome,sigla,ativo, data_cadastro FROM estado;

ALTER TABLE estado 	ADD COLUMN regiao INT;

DESCRIBE estado; -- DESC

ALTER TABLE estado MODIFY COLUMN regiao VARCHAR(255) NOT NULL;
ALTER TABLE estado  DROP COLUMN regiao;
ALTER TABLE estado ADD COLUMN regiao VARCHAR(255) NOT NULL DEFAULT "VALOR NÃO INFORMADO" AFTER nome;
-- ou
ALTER TABLE estado MODIFY COLUMN regiao VARCHAR(255) NOT NULL AFTER nome;

ALTER TABLE estado CHANGE regiao regiao_estado VARCHAR(255) NOT NULL;

ALTER TABLE estado DROP CONSTRAINT estado_ativo_deve_ser_S_ou_N;
ALTER TABLE estado MODIFY COLUMN ativo ENUM("S", "N") NOT NULL;

INSERT INTO estado (nome, sigla) VALUES("MATO GROSSO", "MT");

CREATE TABLE categoria_produto(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL UNIQUE,
descricao VARCHAR(255) NOT NULL,
ativo ENUM("S", "N") NOT NULL DEFAULT "S",
data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

