USE curso_sql;

/* É necessário verificar o tipo de mecanismo de armazenamento para criar uma tabela que suporta transações */
SHOW ENGINES; /* Procurar o tipo que tenha transation como yes, no nosso caso é o InnoDB */

/* Vamos criar uma tabela usando o mecanismo de armazanamento InnoDB - ele da suporte a transações */
CREATE TABLE contas_bancarias
(
	id int unsigned not null auto_increment,
    titular varchar(45) not null,
    saldo double not null,
    PRIMARY KEY (id)
) engine = InnoDB;

/* Inserindo dados na tabela */
INSERT INTO contas_bancarias (titular, saldo) VALUES ('André', 1000);
INSERT INTO contas_bancarias (titular, saldo) VALUES ('Carlos', 2000);

/* Consultando a tabela */
SELECT * FROM contas_bancarias;

/* Como fazer uma transação */
start transaction; /* Inicia a transação e a tabela fica congelada, não sendo possível outra transação para alterar ela, enquanto não terminar a transação atual */
rollback; /* Quando a transação não ocorre de forma esperada, o rollback cancela as modificações que foram feitas na tabela, voltando ao estado anterior */
commit; /* Quando a transação ocorreu de forma esperada e foi tudo certo, ele confirma as alterações feita na tabela  */

/* Exemplo de transação falha */
start transaction;
UPDATE contas_bancarias SET saldo = saldo - 100 WHERE id = 1;
UPDATE contas_bancarias SET saldo = saldo + 100 WHERE id = 2;
rollback;

/* Exemplo de transação ok */
start transaction;
UPDATE contas_bancarias SET saldo = saldo - 100 WHERE id = 1;
UPDATE contas_bancarias SET saldo = saldo + 100 WHERE id = 2;
commit;

/*
Na hora de modelar o banco de dados, na hora da normalização dos dados, quando estiver com as 5 formas normais definidas,
revisar cada uma das tabelas verificando a necessidade dessa tabela ser transacional ou não.
Para essas tabelas usar a engine que suporta transações.
Sempre olhar o SHOW ENGINES;.
*/

