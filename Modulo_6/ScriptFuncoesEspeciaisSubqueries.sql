USE curso_sql;

SELECT * FROM funcionarios;

/* COUNT - Contar */
SELECT COUNT(*) FROM funcionarios;
SELECT COUNT(*) FROM funcionarios WHERE salario > 1600;
SELECT COUNT(*) FROM funcionarios WHERE salario > 1600 AND departamento = 'Jurídico';

SELECT * FROM funcionarios WHERE salario > 1600 AND departamento = 'Jurídico';

/* SUM - Soma*/
SELECT SUM(salario) FROM funcionarios;
SELECT SUM(salario) FROM funcionarios WHERE departamento = 'TI';

/* AVG - Average - média */
SELECT AVG(salario) FROM funcionarios;
SELECT AVG(salario) FROM funcionarios WHERE departamento = 'TI';

/* MAX - Máximo*/
SELECT MAX(salario) FROM funcionarios;
SELECT MAX(salario) FROM funcionarios WHERE departamento = 'TI';

/* MIN - Mínimo*/
SELECT MIN(salario) FROM funcionarios;
SELECT MIN(salario) FROM funcionarios WHERE departamento = 'TI';

/* DISTINCT - faz a consulta e retorna resultados únicos */
SELECT departamento FROM funcionarios;
SELECT DISTINCT(departamento) FROM funcionarios;

/* Order By - Ordenação de registro */
SELECT * FROM funcionarios;
SELECT * FROM funcionarios ORDER BY nome; /* Sem informar o padrão é crescente*/
SELECT * FROM funcionarios ORDER BY nome DESC; /* Informando que será decrescente */
SELECT * FROM funcionarios ORDER BY salario; 
SELECT * FROM funcionarios ORDER BY departamento, salario; /* Ordena por departamento e depois ordena por salário */
SELECT * FROM funcionarios ORDER BY departamento, salario DESC; /* Ordena por departamento e depois ordena por salário de forma decrescente */
SELECT * FROM funcionarios ORDER BY departamento DESC, salario DESC; /* Ordena por departamento de forma decrescente e depois ordena por salário de forma decrescente */

/* Páginação - LIMIT - Quantos registro serão retornados na consulta */
SELECT * FROM funcionarios;
SELECT * FROM funcionarios LIMIT 2;
SELECT * FROM funcionarios LIMIT 2 OFFSET 1; /* OFFSET Informa o número de registro que será ignorado antes de mostra o resultado da consulta */
SELECT * FROM funcionarios LIMIT 1, 2; /* 1º número informa o número de registro que será ignorado antes de mostra o resultado da consulta, 2º o número de registro que será retornado na consulta */

/* Agrupamento - GROUP BY*/
SELECT * FROM funcionarios;
SELECT departamento, AVG(salario) FROM funcionarios WHERE departamento = 'TI'
UNION
SELECT departamento, AVG(salario) FROM funcionarios WHERE departamento = 'Jurídico'; 

SELECT departamento, AVG(salario) FROM funcionarios GROUP BY departamento; /* Exemplo feito com o AVG, mas pode ser usado o MAX, MIN, SUM e COUNT */
SELECT departamento, AVG(salario) FROM funcionarios GROUP BY departamento HAVING AVG(salario) > 2000; /* HAVING é um WHERE para resultados agrupados */

SELECT departamento, COUNT(*) FROM funcionarios GROUP BY departamento;


/* Subqueries */
SELECT departamento, AVG(salario) FROM funcionarios GROUP BY departamento;
SELECT nome FROM funcionarios WHERE departamento = 'Jurídico';

SELECT nome FROM funcionarios WHERE departamento IN ('TI', 'Jurídico'); /* Procura em departamento qualquer valor que foi informado dentro do parênteses de IN */
SELECT nome FROM funcionarios 
WHERE departamento IN 
(
	SELECT departamento FROM funcionarios GROUP BY departamento HAVING AVG(salario) > 2000
); /* Dentro do parênteses de IN, pode ser usado uma subconsulta*/













