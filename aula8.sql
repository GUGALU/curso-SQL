/*removendo banco de dados se ja existir e criando novamente*/
DROP DATABASE IF EXISTS curso_sql;
CREATE DATABASE curso_sql; -- criando banco de dados
USE curso_sql;

DROP TABLE IF EXISTS estado;
DROP TABLE IF EXISTS cidade;

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

INSERT INTO cidade (nome, id_estado) VALUES ("MARINGÁ",1);
INSERT INTO cidade (nome, id_estado) VALUES ("BAURU",2);
INSERT INTO cidade (nome, id_estado) VALUES ("BARRA DOS GARÇAS",3);

-- SQL 89
SELECT cidadede.id "ID CIDADE", 
		cidade.nome "NOMO CIDADE",
         estado.sigla "SIGLA ESTADO"
FROM estado,cidade 
WHERE cidade.id_estado = estado.id 
	AND estado.nome = "PARANÁ";

-- SQL 92
SELECT cidadede.id "ID CIDADE", 
		cidade.nome "NOMO CIDADE",
         estado.sigla "SIGLA ESTADO" 
FROM estado JOIN cidade ON cidade.id_estado = estado.id
WHERE estado.nome = "PARANÁ";

