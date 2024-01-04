USE curso_sql; /* Não é obrigátorio para os comandos de controle de acesso */

/* CREATE USER 'nome do usuário'@'localdeacesso' IDENTIFIED BY 'password'; */
/* CREATE USER 'andre'@'200.200.190.190' IDENTIFIED BY 'milani123456'; */
/* CREATE USER 'andre'@'%' IDENTIFIED BY 'milani123456'; */

CREATE USER 'andre'@'localhost' IDENTIFIED BY 'milani123456';
GRANT ALL ON curso_sql.* TO 'andre'@'localhost';

CREATE USER 'andre'@'%' IDENTIFIED BY 'andreviagem';
GRANT SELECT ON curso_sql.* TO 'andre'@'%';
/* GRANT INSERT ON curso_sql.* TO 'andre'@'%'; */
GRANT INSERT ON curso_sql.funcionarios TO 'andre'@'%';


REVOKE INSERT ON curso_sql.funcionarios FROM 'andre'@'%';
REVOKE SELECT ON curso_sql.* FROM 'andre'@'%';
REVOKE ALL ON curso_sql.* FROM 'andre'@'localhost';

GRANT INSERT ON curso_sql.funcionarios TO 'andre'@'%';
GRANT INSERT ON curso_sql.veiculos TO 'andre'@'%';

REVOKE INSERT ON curso_sql.funcionarios FROM 'andre'@'%';
REVOKE INSERT ON curso_sql.veiculos FROM 'andre'@'%';

DROP USER 'andre'@'%';
DROP USER 'andre'@'localhost';

/* Consultar usuários criados - só pode ser feito pelo root */
SELECT USER FROM mysql.user;
SHOW GRANTS FOR 'andre'@'%';