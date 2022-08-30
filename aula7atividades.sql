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

-- ATIVIDADE INSERT

/*
1. Escreva o comando para inserir 3 registros da tabela estado com todas as colunas. 
2. Escreva o comando para inserir 2 registros da tabela estado, definindo todos os dados, exceto a chave  primária que é auto incremento. 
*/

INSERT INTO estado (nome,sigla) VALUES("RIO DE JANEIRO", "RJ"), ("BAHIA", "BA"), ("CEARA", "CE");
INSERT INTO estado (nome,sigla,ativo,data_cadastro) VALUES("PERNAUMBUCO", "PE", "S", "2022-10-09"), ("MARANHAO", "MA", "N", "2022-10-09");

-- ATIVIDADE DELETE E UPDATE

/*
1.	Escreva o comando para alterar o valor de uma coluna de um único registro de uma tabela utilizando como filtro, o Primary Key.
2.	Refaça o exercício anterior alterando os dados de mais que uma coluna de um único registro sem utilizar como filtro a chave primária. 
A escolha da coluna do filtro é muito importante – TOME CUIDADO.
3.	Exclua um único registro de uma tabela sem utilizar como filtro, a chave primária.
*/

UPDATE estado SET ativo = "N" WHERE id = 1;
UPDATE estado SET ativo = "S", sigla = "pr" WHERE nome = "PARANA";

DELETE FROM cidade WHERE id_estado = 1;
DELETE FROM estado WHERE sigla = "PR";

-- ATIVIDADE SELECT

/*
1.	Escreva o comando para seleccionar todos os registros da tabela cidade com todas as colunas.
2.	Escreva o comando para seleccionar o nome de todos os registros da tabela cidade.
*/

SELECT * FROM cidade;
SELECT nome FROM cidade;