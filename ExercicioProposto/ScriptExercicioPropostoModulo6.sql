/* Modulo 6 */
/* Parte 1 */

USE dba_softblue;

SELECT * FROM tipo;
SELECT * FROM curso;
SELECT * FROM aluno;
SELECT * FROM pedido;
SELECT * FROM pedido_detalhe;

/* Selecione os nomes de todos os alunos que já fizeram matrícula em algun curso na Softblue, sem repetição */
SELECT DISTINCT(aluno.aluno) FROM pedido
INNER JOIN aluno ON pedido.aluno = aluno.codigo;

/* Exiba o nome do aluno mais antigo da Softblue */
SELECT aluno.aluno FROM pedido
INNER JOIN aluno ON pedido.aluno = aluno.codigo ORDER BY datahora ASC LIMIT 1;

/* Exiba o nome do aluno mais recente da Softblue */
SELECT aluno.aluno FROM pedido
INNER JOIN aluno ON pedido.aluno = aluno.codigo ORDER BY datahora DESC LIMIT 1;

/* Exiba o nome do terceiro aluno mais antigo da Softblue */
SELECT aluno.aluno FROM pedido
INNER JOIN aluno ON pedido.aluno = aluno.codigo ORDER BY datahora LIMIT 1 OFFSET 2;

/* Exiba a quantidade de cursos que já foram vendidos pela Softblue */
SELECT COUNT(pedido) FROM pedido_detalhe;

/* Exiba o valor total já arrecadado pelos cursos vendidos pela Softblue */
SELECT SUM(valor) FROM pedido_detalhe;

/* Exiba o valor médio cobrado por curso para o pedido cujo CODIGO é 2 */
SELECT AVG(valor) FROM pedido_detalhe WHERE pedido = 2;

/* Exiba o valor do curso mais caro da Softblue */
SELECT MAX(valor) FROM curso;

/* Exiba o valor do curso mais barato da Softblue */
SELECT MIN(valor) FROM curso;

/* Exiba o valor total de cada pedido realizado na Softblue */
SELECT pedido, SUM(valor) FROM pedido_detalhe GROUP BY pedido;

/* Exiba os nomes dos instrutores da Softblue e a quantidade de cursos que cada um tem sob sua responsabilidade */
SELECT instrutor.instrutor, COUNT(curso.instrutor) AS quantidade_curso FROM curso 
INNER JOIN instrutor ON curso.instrutor = instrutor.codigo GROUP BY instrutor;

/* Exiba o número do pedido, nome do aluno e valor para todos os pedidos realizados na Softblue cujo valor total sejam maiores que 500 */
SELECT pedido, aluno.aluno, SUM(valor) FROM pedido
INNER JOIN aluno ON pedido.aluno = aluno.codigo
INNER JOIN pedido_detalhe ON pedido.codigo = pedido_detalhe.pedido GROUP BY pedido HAVING SUM(valor) > 500;

/* Exiba o número do pedido, nome do aluno e quantos cursos foram comprados no pedido, para todos os pedidos realizados na Softblue que compraram dois ou mais cursos */
SELECT pedido.codigo, aluno.aluno, COUNT(curso) AS quantidade_curso FROM pedido
INNER JOIN aluno ON pedido.aluno = aluno.codigo
INNER JOIN pedido_detalhe ON pedido.codigo = pedido_detalhe.pedido GROUP BY pedido HAVING COUNT(curso) >= 2;

/* Exiba o nome e endereço de todos os alunos que morem em Avenidas (Av.) */
SELECT aluno, endereco FROM aluno WHERE INSTR(endereco, 'Av.');
SELECT aluno, endereco FROM aluno WHERE endereco LIKE'Av%';

/* Exiba os nomes dos cursos de Java da Softblue */
SELECT curso FROM curso WHERE INSTR(curso, 'Java');
SELECT curso FROM curso WHERE curso LIKE '%Java%';


/* Parte 2 */
/* Utilizando subquery, exiba uma lista com os nomes dos cursos disponibilizados pela Softblue informando para cada curso qual o seu menor valor de venda já praticado */
SELECT curso, (SELECT MIN(valor) FROM pedido_detalhe WHERE pedido_detalhe.curso = curso.codigo) AS menor_valor FROM curso;

/* Utilizando subquery e o parâmetro IN, exiba os nomes dos cursos disponibilizados pela Softblue cujo tipo de curso seja 'Programação' */
SELECT curso FROM curso 
WHERE tipo IN
(
	SELECT codigo FROM tipo WHERE tipo = 'Programação'
);

/* Utilizando subquery e o parâmetro EXISTS, exiba novamente os nomes dos cursos disponibilizados pela Softblue cujo tipo de curso seja 'Programação' */
SELECT curso FROM curso 
WHERE EXISTS
(
	SELECT codigo FROM tipo WHERE tipo.codigo = curso.tipo AND tipo.tipo = 'Programação'
);

/* Exiba uma lista com os nomes dos instrutores da Softblue e ao lado o total acumulado das vendas referente aos cursos pelo qual o instrutor é responsável */
SELECT instrutor, 
(
	SELECT SUM(pedido_detalhe.valor) FROM pedido_detalhe 
    INNER JOIN curso ON pedido_detalhe.curso = curso.codigo 
    WHERE curso.instrutor = instrutor.codigo
) 
AS total_de_vendas FROM instrutor;

/* Crie uma visão que exiba os nomes dos alunos e quanto cada um já comprou em cursos */
CREATE VIEW aluno_quantidade_curso_comprado AS
SELECT aluno, 
(
	SELECT SUM(pedido_detalhe.valor) FROM pedido_detalhe 
    INNER JOIN pedido ON pedido_detalhe.pedido = pedido.codigo 
    WHERE pedido.aluno = aluno.codigo
) 
AS total_de_compras FROM aluno;
