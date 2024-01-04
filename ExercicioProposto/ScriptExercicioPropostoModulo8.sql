USE dba_softblue;

/*
Baseado na tabela, construa uma transação que atualiza o valor aplicado em cada conta bancária baseado 
no índice de correção percentual de 3%, garantindo que a instrução de UPDATE seja realizada na tabela 
toda, com as propriedades ACID.
*/

CREATE TABLE conta_bancaria 
(
CODIGO INTEGER UNSIGNED NOT NULL AUTO_INCREMENT, -- Código interno (PK)
TITULAR VARCHAR(32) NOT NULL, -- Nome do titular da conta
SALDO DOUBLE NOT NULL, -- Representa o saldo da conta
PRIMARY KEY(CODIGO) -- Define o campo CODIGO como PK (Primary Key)
) engine = InnoDB;

INSERT INTO conta_bancaria VALUES (1, 'André', 213);
INSERT INTO conta_bancaria VALUES (2, 'Diogo', 489);
INSERT INTO conta_bancaria VALUES (3, 'Rafael', 568);
INSERT INTO conta_bancaria VALUES (4, 'Carlos', 712);
INSERT INTO conta_bancaria VALUES (5, 'Peter', -38);

/* Resolução */
START TRANSACTION;
UPDATE conta_bancaria SET saldo = saldo + (saldo * 0.03) WHERE saldo > 0;
COMMIT;