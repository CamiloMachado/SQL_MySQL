USE curso_sql;

SELECT * FROM funcionarios;
SELECT * FROM veiculos;

/* Inner Join */
SELECT * FROM funcionarios INNER JOIN veiculos ON funcionario_id = funcionarios.id;
SELECT * FROM funcionarios f INNER JOIN veiculos v ON v.funcionario_id = f.id;

/* Left Join */
SELECT * FROM funcionarios f LEFT JOIN veiculos v ON v.funcionario_id = f.id;

/* RIGHT Join */
SELECT * FROM funcionarios f RIGHT JOIN veiculos v ON v.funcionario_id = f.id;

/* Inserção de um novo veículo */
INSERT INTO veiculos (funcionario_id, veiculo, placa) VALUES (null, "Moto", "SB-0003"); 

/* Full Join - não é habilitado, precisa ser feito um union do left join com right join*/
-- SELECT * FROM funcionarios f FULL JOIN veiculos v ON v.funcionario_id = f.id;
SELECT * FROM funcionarios f LEFT JOIN veiculos v ON v.funcionario_id = f.id
UNION
SELECT * FROM funcionarios f RIGHT JOIN veiculos v ON v.funcionario_id = f.id;

/* Criação de uma nova tabela */
CREATE TABLE cpfs
(
	id int unsigned not null,
	cpf varchar(14) not null,
    PRIMARY KEY (id),
    CONSTRAINT fk_cpf FOREIGN KEY (id) REFERENCES funcionarios (id)
);

/* Inserção de dados na tabela cpfs */
INSERT INTO cpfs (id, cpf) VALUES (1,'111.111.111-11');
INSERT INTO cpfs (id, cpf) VALUES (2,'222.222.222-22');
INSERT INTO cpfs (id, cpf) VALUES (3,'333.333.333-33');
INSERT INTO cpfs (id, cpf) VALUES (5,'555.555.555-55');

/* Consulta feita na tabela cpfs */
SELECT * FROM cpfs;


/* Equi Join - primeiro a forma normal, depois a forma reduzida */
SELECT *FROM funcionarios INNER JOIN cpfs ON funcionarios.id = cpfs.id;
SELECT *FROM funcionarios INNER JOIN cpfs USING (id);

/* Criação de uma nova tabela */
CREATE TABLE clientes
(
	id int unsigned not null auto_increment,
    nome varchar(45) not null,
    quem_indicou int unsigned,
    PRIMARY KEY (id),
    CONSTRAINT fk_quem_indicou FOREIGN KEY (quem_indicou) REFERENCES clientes (id)
);

/* Inserção de dados na tabela clientes */
INSERT INTO clientes (id, nome, quem_indicou) VALUES (1, 'André', null);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (2, 'Samuel', 1);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (3, 'Carlos', 2);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (4, 'Rafael', 1);

/* Consulta feita na tabela clientes */
SELECT * FROM clientes;

/*Self Join - Reladionamento de uma tabela com ela mesma */
SELECT a.nome AS cliente_indicado, b.nome AS quem_indicou
 FROM clientes a JOIN clientes b ON a.quem_indicou = b.id;

/* Relacionamento triplo ou mais - Mas as tabelas tem que ter campos que se relacionem entre si*/
SELECT * FROM funcionarios 
INNER JOIN veiculos ON veiculos.funcionario_id = funcionarios.id 
INNER JOIN cpfs ON cpfs.id = funcionarios.id;

/* View - Visão*/
CREATE VIEW funcionarios_salarios AS
SELECT * FROM funcionarios WHERE salario >= 1700;

/* Consulta feita através da View */
SELECT * FROM funcionarios_salarios;

/* Atualização de registro para ver o funcionamento da View */
UPDATE funcionarios SET salario = 1500 WHERE id = 3;

/* Alteração da View */
/* O professor recomenda o DROP da View e criar novamente, do que fazer uma alteração */
/* Remoção da View */
DROP VIEW funcionarios_salarios;

CREATE VIEW funcionarios_salarios AS
SELECT * FROM funcionarios WHERE salario >= 2000;