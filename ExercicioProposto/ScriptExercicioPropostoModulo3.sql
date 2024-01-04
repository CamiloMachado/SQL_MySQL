-- Modulo 3
-- Parte 1

CREATE DATABASE dba_softblue DEFAULT CHARSET=latin1;    	-- Criação do banco de dados

USE dba_softblue;

CREATE TABLE tipo                                       	-- Criar a tabela tipo
(
	codigo int unsigned not null auto_increment,      		-- Código interno (PK)
	tipo varchar(32) not null,								-- Descrição
	PRIMARY KEY (codigo)									-- Define o campo CODIGO como PK (Primary Key)
);

CREATE TABLE instrutor                                      -- Criar a tabela instrutor
(
	codigo int unsigned not null auto_increment,       	 	-- Código interno (PK)
	instrutor varchar(64) not null,							-- Nome com até 64 caracteres
	telefone varchar(9) null,								-- Telefone, podendo ser nulo caso não tenha
	PRIMARY KEY (codigo)									-- Define o campo CODIGO como PK (Primary Key)
);


CREATE TABLE curso                                       	-- Criar a tabela curso
(
	codigo int unsigned not null auto_increment,			-- Código interno (PK)
	curso varchar(64) not null,								-- Título com até 64 caracteres
	tipo int unsigned not null,								-- Código do tipo de curso (idêntico a PK em CURSO)
    instrutor int unsigned not null,						-- Código do instrutor (idêntico a PK em INSTRUTOR)
    valor double not null,							-- Valor do curso
    PRIMARY KEY (codigo),									-- Define o campo CODIGO como PK (Primary Key)
    INDEX fk_tipo (tipo),									-- Define o campo TIPO como um índice
    INDEX fk_instrutor (instrutor),							-- Define o campo INSTRUTOR como um índice
    FOREIGN KEY (tipo) REFERENCES tipo (codigo), 			-- Cria o relacionamento (FK) com a tabela TIPO
    FOREIGN KEY (instrutor) REFERENCES instrutor (codigo)	-- Cria o relacionamento (FK) com a tabela INSTRUTOR
);
 
CREATE TABLE aluno                                       	-- Criar a tabela aluno
(
	codigo int unsigned not null auto_increment,      		-- Código interno (PK)
	aluno varchar(64) not null,								-- Nome com até 64 caracteres
    endereco varchar(230) not null,							-- Endereço com até 230 caracteres
    email varchar(128) not null,							-- E-mail com até 128 caracteres
    PRIMARY KEY (codigo)									-- Define o campo CODIGO como PK (Primary Key)
);
 
CREATE TABLE pedido                                       	-- Criar a tabela pedido
(
	codigo int unsigned not null auto_increment,      		-- Código interno (PK)
    aluno int unsigned not null,							-- Código do aluno (idêntico a PK em ALUNO)
    datahora datetime not null,								-- Armazena data e hora em uma única coluna
    PRIMARY KEY (codigo),									-- Define o campo CODIGO como PK (Primary Key)
    INDEX fk_aluno (aluno),									-- Define o campo ALUNO como um índice
    FOREIGN KEY (aluno) REFERENCES aluno (codigo)			-- Cria o relacionamento (FK) com a tabela ALUNO
);

CREATE TABLE pedido_detalhe                                 -- Criar a tabela pedido_detalhe
(
	pedido int unsigned not null,							-- Código do pedido (idêntico a PK em PEDIDO)
    curso int unsigned not null,							-- Código do curso (idêntico a PK em CURSO)
	valor double not null,									-- Valor do curso
    PRIMARY KEY (pedido, curso),							-- Define a chave primária composta
	INDEX fk_pedido (pedido),								-- Define o campo PEDIDO como um índice
	INDEX fk_curso (curso),									-- Define o campo CURSO como um índice
	FOREIGN KEY (pedido) REFERENCES pedido (codigo),		-- Cria o relacionamento (FK) com a tabela PEDIDO
	FOREIGN KEY (curso) REFERENCES curso (codigo)			-- Cria o relacionamento (FK) com a tabela CURSO
);

-- Parte 2

-- Inclua a coluna DATA_NASCIMENTO na tabela ALUNO do tipo string, de tamanho 10 caracteres
ALTER TABLE aluno ADD COLUMN data_nascimento varchar(10);

-- Altere a coluna DATA_NASCIMENTO para NASCIMENTO e seu tipo de dado para DATE
ALTER TABLE aluno CHANGE COLUMN data_nascimento nascimento date null;

-- Crie um novo índice na tabela ALUNO, para o campo ALUNO
ALTER TABLE aluno ADD INDEX index_aluno (aluno);

-- Inclua o campo EMAIL na tabela INSTRUTOR, com tamanho de 100 caracteres
ALTER TABLE instrutor ADD COLUMN email varchar(100);

-- Crie um novo índice na tabela CURSO, para o campo INSTRUTOR
ALTER TABLE curso ADD INDEX index_instrutor (instrutor); -- Duplicação que será depreciada

-- Remova o campo EMAIL da tabela INSTRUTOR
ALTER TABLE instrutor DROP COLUMN email;
