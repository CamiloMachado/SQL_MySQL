USE curso_sql;

CREATE TABLE pedidos
(
	id int unsigned not null auto_increment,
    descricao varchar(100) not null,
    valor double not null default'0',
    pago varchar(3) not null default 'Não',
    PRIMARY KEY (id)
);

INSERT INTO pedidos (descricao, valor) VALUES ('TV', 3000);
INSERT INTO pedidos (descricao, valor) VALUES ('Geladeira', 1400);
INSERT INTO pedidos (descricao, valor) VALUES ('DVD Player', 300);

SELECT * FROM pedidos;

CALL limpa_pedidos();

CREATE TABLE estoque
(
	id int unsigned not null auto_increment,
    descricao varchar(50) not null,
    quantidade int not null ,
    PRIMARY KEY (id)
);

CREATE TRIGGER gatilho_limpa_pedidos
BEFORE INSERT 
ON estoque
FOR EACH ROW
CALL limpa_pedidos();

SELECT * FROM pedidos;
INSERT INTO pedidos (descricao, valor) VALUES ('TV', 3000);
INSERT INTO pedidos (descricao, valor) VALUES ('Geladeira', 1400);
INSERT INTO pedidos (descricao, valor) VALUES ('DVD Player', 300);
SELECT * FROM pedidos;
UPDATE pedidos SET pago = 'Sim' WHERE id = 11;

INSERT INTO estoque (descricao, quantidade) VALUES ('Fogão', 5);
INSERT INTO estoque (descricao, quantidade) VALUES ('Forno', 3);
SELECT * FROM estoque;