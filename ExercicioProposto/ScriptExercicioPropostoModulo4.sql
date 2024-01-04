-- Modulo 4
-- Parte 1

USE dba_softblue;

-- Tabela tipo
INSERT INTO tipo (codigo, tipo) VALUES (1, 'Banco de Dados');
INSERT INTO tipo (tipo)VALUES ('Programação');
INSERT INTO tipo VALUES (3, 'Modelagem de dados');

SELECT * FROM tipo;

-- Tabela instrutor
INSERT INTO instrutor (codigo, instrutor, telefone) VALUES (1, 'André Milani', '1111-1111');
INSERT INTO instrutor (instrutor, telefone)VALUES ('Carlos Tosin', '1212-1212');

SELECT * FROM instrutor;

-- Tabela curso
INSERT INTO curso (codigo, curso, tipo, instrutor, valor) VALUES (1, 'Java Fundamentos', 2, 2, 270);
INSERT INTO curso (curso, tipo, instrutor, valor) VALUES ('Java Avançado', 2, 2, 330);
INSERT INTO curso (curso, tipo, instrutor, valor) VALUES ('SQL Completo', 1, 1, 170);
INSERT INTO curso (curso, tipo, instrutor, valor) VALUES ('Php Básico', 2, 1, 270);

SELECT * FROM curso;

-- Tabela aluno
INSERT INTO aluno (codigo, aluno, endereco, email) VALUES (1, 'José', 'Rua XV de Novembro 72', 'jose@softblue.com.br');
INSERT INTO aluno (aluno, endereco, email) VALUES ('Wagner', 'Av. Paulista', 'wagner@softblue.com.br');
INSERT INTO aluno (aluno, endereco, email) VALUES ('Emílio', 'Rua Lajes 103, ap: 701', 'emilio@softblue.com.br');
INSERT INTO aluno (aluno, endereco, email) VALUES ('Cris', 'Rua Tauney 22', 'cris@softblue.com.br');
INSERT INTO aluno (aluno, endereco, email) VALUES ('Regina', 'Rua Salles 305', 'regina@softblue.com.br');
INSERT INTO aluno (aluno, endereco, email) VALUES ('Fernando', 'Av. Central 30', 'fernando@softblue.com.br');

SELECT * FROM aluno;

-- Tabela pedido
INSERT INTO pedido (codigo, aluno, datahora) VALUES (1, 2, '2010-04-15 11:23:32');
INSERT INTO pedido (aluno, datahora) VALUES (2, '2010-04-15 14:36:21');
INSERT INTO pedido (aluno, datahora) VALUES (3, '2010-04-16 11:17:45');
INSERT INTO pedido (aluno, datahora) VALUES (4, '2010-04-17 14:27:22');
INSERT INTO pedido (aluno, datahora) VALUES (5, '2010-04-18 11:18:19');
INSERT INTO pedido (aluno, datahora) VALUES (6, '2010-04-19 13:47:35');
INSERT INTO pedido VALUES (7, 6, '2010-04-20 18:13:44');

SELECT * FROM pedido;

-- Tabela pedido_detalhe
INSERT INTO pedido_detalhe (pedido, curso, valor) VALUES (1, 1, 270);
INSERT INTO pedido_detalhe VALUES (1, 2, 330);
INSERT INTO pedido_detalhe VALUES (2, 1, 270);
INSERT INTO pedido_detalhe VALUES (2, 2, 330);
INSERT INTO pedido_detalhe VALUES (2, 3, 170);
INSERT INTO pedido_detalhe VALUES (3, 4, 270);
INSERT INTO pedido_detalhe VALUES (4, 2, 330);
INSERT INTO pedido_detalhe VALUES (4, 4, 270);
INSERT INTO pedido_detalhe VALUES (5, 3, 170);
INSERT INTO pedido_detalhe VALUES (6, 3, 170);
INSERT INTO pedido_detalhe VALUES (7, 4, 270);

SELECT * FROM pedido_detalhe;

-- Parte 2

-- Exibir todas as informações de todos os alunos
SELECT * FROM aluno;

-- Exibir somente o título de cada curso da Softblue
SELECT curso FROM curso;

-- Exibir somente o título e valor de cada curso da Softblue cujo preço seja maior que 200
SELECT curso FROM curso WHERE valor > 200;

-- Exibir somente o título e valor de cada curso da Softblue cujo preço seja maior que 200 e menor que 300
SELECT curso, valor FROM curso WHERE valor > 200 AND valor < 300;

-- Outra solução para o exercício seria esta
SELECT curso, valor FROM curso WHERE valor BETWEEN 200 AND 300;

-- Exibir as informações da tabela PEDIDOS para os pedidos realizados entre 15/04/2010 e 18/04/2010
SELECT * FROM pedido WHERE datahora BETWEEN '2010-04-15' AND '2010-04-19';

-- Outra solução para o exercício seria esta
SELECT * FROM pedido WHERE datahora > '2010-04-15' AND datahora < '2010-04-19';

-- Exibir as informações da tabela PEDIDOS para os pedidos realizados na data de 15/04/2010
SELECT * FROM pedido WHERE DATE(datahora) = '2010-04-15';

-- Parte 3

-- Altere o endereço do aluno JOSÉ para 'Av. Brasil 778'
UPDATE aluno SET endereco = 'Av. Brasil 778' WHERE aluno = 'José';
UPDATE aluno SET endereco = 'Av. Brasil 778' WHERE codigo = 1;

-- Altere o e-mail do aluno CRIS para 'cristiano@softblue.com.br'
UPDATE aluno SET email = 'cristiano@softblue.com.br' WHERE aluno = 'Cris';
UPDATE aluno SET email = 'cristiano@softblue.com.br' WHERE codigo = 4;

-- Aumente em 10% o valor dos cursos abaixo de 300
SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES = 1;
UPDATE curso SET valor = ROUND(valor * 1.1) WHERE valor < 300;

-- Altere o nome do curso de Php Básico para Php Fundamentos
UPDATE curso SET curso = 'Php Fundamentos' WHERE curso = 'Php Básico';
