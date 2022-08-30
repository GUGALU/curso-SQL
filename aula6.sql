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

INSERT INTO cidade (nome, estado_id) VALUES ("BAURU",2);
INSERT INTO cidade (nome, estado_id) VALUES ("MARINGÁ",1);
INSERT INTO cidade (nome, estado_id) VALUES ("GUARULHOS",2);
INSERT INTO cidade (nome, estado_id) VALUES ("CAMPINAS",2);
INSERT INTO cidade (nome, estado_id) VALUES ("FLORIANÓPOLIS",4);
INSERT INTO cidade (nome, estado_id) VALUES ("PARANAVAÍ",1);
INSERT INTO cidade (nome, estado_id) VALUES ("CUIABA",3);
INSERT INTO cidade (nome, estado_id) VALUES ("BALNEÁRIO CAMBORIÚ",4);
INSERT INTO cidade (nome, estado_id) VALUES ("LONDRINA",1);
INSERT INTO cidade (nome, estado_id) VALUES ("CASCAVEL",1);
INSERT INTO cidade (nome, estado_id) VALUES ("JOINVILLE",4);
INSERT INTO cidade (nome, estado_id) VALUES ("PORTO ALEGRE",5);
INSERT INTO cidade (nome, estado_id) VALUES ("BLUMENAL",4);
INSERT INTO cidade (nome, estado_id) VALUES ("BARRA DOS GARÇAS",3);
INSERT INTO cidade (nome, estado_id) VALUES ("CHAPECÓ",4);
INSERT INTO cidade (nome, estado_id) VALUES ("ITAJAÍ",4);

UPDATE estado SET nome = "PARANA" WHERE id = 1;
UPDATE estado SET nome = "PARANÁ", ativo = "N" WHERE id = 1;
UPDATE estado SET nome = "Parana", ativo = "N", data_cadastro = "2022-10-12" WHERE id = 1;
UPDATE estado SET data_cadastro = CURRENT_TIMESTAMP WHERE id = 1;
UPDATE estado SET nome = "PARANA", data_cadastro = DEFAULT WHERE id = 1;
UPDATE estado SET ativo = "N"; -- assim aplica o ativo como N para todos os estados

UPDATE cidade SET ativo = "N" WHERE id_estado = 1; -- deixamos todas as cidades do PARANA como N ativo

DELETE FROM cidade WHERE id = 1;
DELETE FROM cidade WHERE id_estado = 1;

DELETE FROM cidade WHERE id_estado = 2; -- grupo especifico
DELETE FROM cidade WHERE id = 2;

DELETE FROM cidade; -- apaga todos os dados de uma tabela









