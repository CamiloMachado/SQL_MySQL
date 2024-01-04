/* Modulo 5 */
/* Parte 1 */
USE dba_softblue;

/* Exiba uma lista com os títulos dos cursos da Softblue e o tipo de curso ao lado */
SELECT curso.curso, tipo.tipo FROM curso 
INNER JOIN tipo ON curso.tipo = tipo.codigo;

/* Exiba uma lista com os títulos dos cursos da Softblue, tipo do curso, nome do instrutor responsável pelo mesmo e telefone */
SELECT curso.curso, tipo.tipo, instrutor.instrutor, instrutor.telefone FROM curso 
INNER JOIN tipo ON curso.tipo = tipo.codigo
INNER JOIN instrutor ON curso.instrutor = instrutor.codigo;

/* Exiba uma lista com o código e data e hora dos pedidos e os códigos dos cursos de cada pedido */
SELECT codigo, datahora, curso FROM pedido 
INNER JOIN pedido_detalhe ON pedido.codigo = pedido_detalhe.pedido;

/* Exiba uma lista com o código e data e hora dos pedidos e os títulos dos cursos de cada pedido */
SELECT pedido.codigo, datahora, curso.curso FROM pedido 
INNER JOIN pedido_detalhe ON pedido.codigo = pedido_detalhe.pedido
INNER JOIN curso ON pedido_detalhe.curso = curso.codigo;

/* Exiba uma lista com o código e data e hora dos pedidos, nome do aluno e os títulos dos cursos de cada pedido */
SELECT pedido.codigo, datahora, aluno.aluno, curso.curso FROM pedido 
INNER JOIN pedido_detalhe ON pedido.codigo = pedido_detalhe.pedido
INNER JOIN aluno ON pedido.aluno = aluno.codigo
INNER JOIN curso ON pedido_detalhe.curso = curso.codigo;


/* Parte 2 */
/* Crie uma visão que traga o título e preço somente dos cursos de programação da Softblue */
CREATE VIEW curso_valor AS
SELECT curso, valor FROM curso INNER JOIN tipo ON curso.tipo = tipo.codigo WHERE tipo.codigo = 2;

CREATE VIEW curso_valor2 AS
SELECT curso, valor FROM curso INNER JOIN tipo ON curso.tipo = tipo.codigo WHERE tipo.tipo = 'Programação';

SELECT * FROM curso_valor;

/* Crie uma visão que traga os títulos dos cursos, tipo do curso e nome do instrutor */
CREATE VIEW curso_tipo_instrutor AS
SELECT c.curso, t.tipo, i.instrutor FROM curso c 
INNER JOIN tipo t ON c.tipo = t.codigo
INNER JOIN instrutor i ON i.codigo = c.instrutor; 

SELECT * FROM curso_tipo_instrutor;

/* Crie uma visão que exiba os pedidos realizados, informando o nome do aluno, data e código do pedido */
CREATE VIEW pedido_realizados AS
SELECT  p.codigo, p.datahora, a.aluno FROM pedido p 
INNER JOIN aluno a ON p.aluno = a.codigo;

SELECT * FROM pedido_realizados;
