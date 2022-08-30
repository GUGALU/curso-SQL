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
CONSTRAINT coluna_ativo_deve_ser_S_ou_N CHECK (ativo IN ("S", "N")) -- constraint out of line
);

INSERT INTO estado(nome, sigla)VALUES("PARANÁ","PR");
INSERT INTO estado(nome, sigla)VALUES("SÃO PAULO","SP");
INSERT INTO estado(nome, sigla)VALUES("RIO DE JANEIRO","RJ");

SELECT id,nome,sigla,ativo, data_cadastro FROM estado;