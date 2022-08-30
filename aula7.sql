/*removendo banco de dados se ja existir e criando novamente*/
DROP DATABASE IF EXISTS curso_sql;
CREATE DATABASE curso_sql; -- criando banco de dados
USE curso_sql;

DROP TABLE IF EXISTS estado;

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

INSERT INTO estado(nome,sigla) VALUES("PARANA", "PR");
INSERT INTO estado(nome,sigla) VALUES("SÃO PAULO", "SP"); 
INSERT INTO estado(nome,sigla) VALUES("MATO GROSSO", "MT");
INSERT INTO estado (nome,sigla) VALUES ("SANTA CATARINA","SC");
INSERT INTO estado (nome,sigla) VALUES ("RIO GRANDE DO SUL","RS");

INSERT INTO cidade (nome, id_estado) VALUES ("BAURU",2);
INSERT INTO cidade (nome, id_estado) VALUES ("MARINGÁ",1);
INSERT INTO cidade (nome, id_estado) VALUES ("GUARULHOS",2);
INSERT INTO cidade (nome, id_estado) VALUES ("CAMPINAS",2);
INSERT INTO cidade (nome, id_estado) VALUES ("FLORIANÓPOLIS",4);
INSERT INTO cidade (nome, id_estado) VALUES ("PARANAVAÍ",1);
INSERT INTO cidade (nome, id_estado) VALUES ("CUIABA",3);
INSERT INTO cidade (nome, id_estado) VALUES ("BALNEÁRIO CAMBORIÚ",4);
INSERT INTO cidade (nome, id_estado) VALUES ("LONDRINA",1);
INSERT INTO cidade (nome, id_estado) VALUES ("CASCAVEL",1);
INSERT INTO cidade (nome, id_estado) VALUES ("JOINVILLE",4);
INSERT INTO cidade (nome, id_estado) VALUES ("PORTO ALEGRE",5);
INSERT INTO cidade (nome, id_estado) VALUES ("BLUMENAL",4);
INSERT INTO cidade (nome, id_estado) VALUES ("BARRA DOS GARÇAS",3);
INSERT INTO cidade (nome, id_estado) VALUES ("CHAPECÓ",4);
INSERT INTO cidade (nome, id_estado) VALUES ("ITAJAÍ",4);

-- SELECT * FROM estado;  mostra todas as colunas
SELECT nome, sigla FROM estado;
SELECT * FROM cidade;

/*
SELECT 
	estado.nome AS "ESTADO NOME", -- pode ou nao colocar o AS 
    estado.sigla "SIGLA ESTADO",
    estado.ativo "O ESTADO É ATIVO?"
FROM
	estado;
*/
/*
SELECT 
	e.nome AS "ESTADO NOME", -- pode ou nao colocar o AS 
    e.sigla "SIGLA ESTADO",
    e.ativo "O ESTADO É ATIVO?"
    -- para pegar todas as colunas e so usar *(asteristico)
FROM
	estado e
WHERE
	e.id = 1; -- e.nome = "PARANA" tambem e.ativo = "S"
*/
/*
SELECT 
	e.nome "ESTADO NOME",
    e.sigla "SIGLA ESTADO",
    e.data_cadastro "DATA DE CADASTRO"
FROM
	estado e
WHERE
	YEAR(e.data_cadastro) = 2022; -- YEAR(e.data_cadastro) != 2022; YEAR(e.data_cadastro) >= 2022; YEAR(e.data_cadastro) <= 2022;
*/
/*
SELECT 
	e.nome "ESTADO NOME",
    e.sigla "SIGLA ESTADO",
    e.data_cadastro "DATA DE CADASTRO"
FROM
	estado e
WHERE
	YEAR(e.data_cadastro) = 2020
    OR YEAR(e.data_cadastro) = 2021
    OR YEAR(e.data_cadastro) = 2022;
*/
/*
SELECT 
	e.nome "ESTADO NOME",
    e.sigla "SIGLA ESTADO",
    e.data_cadastro "DATA DE CADASTRO"
FROM
	estado e
WHERE
	YEAR(e.data_cadastro) IN (2020, 2021, 2022);
*/
SELECT 
	e.nome "ESTADO NOME",
    e.sigla "SIGLA ESTADO",
    e.data_cadastro "DATA DE CADASTRO"
FROM
	estado e
WHERE
	YEAR(e.data_cadastro) BETWEEN 2018 AND 2022
    AND ativo = "S";


