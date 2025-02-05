/* CONTROLE DE VENDAS - */

--CRIA��O DO DATABASE
CREATE DATABASE CONTROLE_VENDAS;
GO

USE CONTROLE_VENDAS
;
GO

/* CRIA��O DAS TABELAS(6) DO DB - SEM A CRIA��O DAS CHAVES PRIM�RIAS E DAS CHAVES ESTRANGERIAS */

--CRIA��O TABELA CLIENTE
CREATE TABLE CLIENTE(
	ID_CLIENTE INT IDENTITY (1,1) NOT NULL,
	NOME_CLIENTE VARCHAR (50) NOT NULL
)
;
GO

--CRIA��O TABELA REGI�O
CREATE TABLE REGIAO(
	ID_REGIAO INT IDENTITY (1,1) NOT NULL,
	NOME_ESTADO VARCHAR (50) NOT NULL,
	SIGLA_ESTADO VARCHAR(2) NOT NULL
)
;
GO

--CRIA��O TABELA PRODUTO
CREATE TABLE PRODUTO(
	ID_PRODUTO INT IDENTITY (1,1) NOT NULL,
	NOME_PRODUTO VARCHAR (50) NOT NULL
)
;
GO

--CRIA��O TABELA VENDEDOR
CREATE TABLE VENDEDOR(
	ID_VENDEDOR INT IDENTITY (1,1) NOT NULL,
	NOME_VENDEDOR VARCHAR (50) NOT NULL
)
;
GO

--CRIA��O TABELA EMPRESA
CREATE TABLE EMPRESA(
	ID_EMPRESA INT IDENTITY (1,1) NOT NULL,
	NOME_EMPRESA VARCHAR (50) NOT NULL,
	FK_PRODUTO INT
)
;
GO

--CRIA��O TABELA VENDAS
CREATE TABLE VENDAS(
	ID_VENDAS INT IDENTITY (1,1) NOT NULL,
	FK_CLIENTE INT NOT NULL,
	FK_PRODUTO INT NOT NULL,
	QTD_VENDIDA INT NOT NULL,
	PRECO_VENDA FLOAT NOT NULL,
	FK_VENDEDOR INT NOT NULL,
	DATA DATETIME NOT NULL,
	FK_REGIAO INT NOT NULL,
	DESCONTO FLOAT NOT NULL
)
;
GO

/* CRIA��O DAS CONSTRAINTS CHAVE PRIM�RIA DAS TABELAS(6) DO DB  */

ALTER TABLE CLIENTE
ADD PRIMARY KEY (ID_CLIENTE)
;
GO

ALTER TABLE REGIAO
ADD PRIMARY KEY (ID_REGIAO)
;
GO

ALTER TABLE PRODUTO
ADD PRIMARY KEY (ID_PRODUTO)
;
GO

ALTER TABLE VENDEDOR
ADD PRIMARY KEY (ID_VENDEDOR)
;
GO

ALTER TABLE EMPRESA
ADD PRIMARY KEY (ID_EMPRESA)
;
GO

ALTER TABLE VENDAS
ADD PRIMARY KEY (ID_VENDAS)
;
GO

/* CRIA��O DAS CONSTRAINTS CHAVE ESTRANGEIRA DAS TABELAS(6) DO DB  */

ALTER TABLE EMPRESA
ADD CONSTRAINT FK_ID_PRODUTO FOREIGN KEY(FK_PRODUTO) REFERENCES PRODUTO (ID_PRODUTO)
;
GO

ALTER TABLE VENDAS
ADD CONSTRAINT FK_ID_CLIENTE FOREIGN KEY(FK_CLIENTE) REFERENCES CLIENTE (ID_CLIENTE)
;
GO

ALTER TABLE VENDAS
ADD CONSTRAINT FK_ID_PRODUTO_VENDAS FOREIGN KEY(FK_PRODUTO) REFERENCES PRODUTO (ID_PRODUTO)
;
GO

ALTER TABLE VENDAS
ADD CONSTRAINT FK_ID_VENDEDOR FOREIGN KEY(FK_VENDEDOR) REFERENCES VENDEDOR (ID_VENDEDOR)
;
GO

ALTER TABLE VENDAS
ADD CONSTRAINT FK_ID_REGIAO FOREIGN KEY(FK_REGIAO) REFERENCES REGIAO (ID_REGIAO)
;
GO

/* MOSTRAR AS TABELAS(6) DO DB  */

SELECT * FROM CLIENTE
;
GO

SELECT * FROM REGIAO
;
GO

SELECT * FROM PRODUTO
;
GO

SELECT * FROM VENDEDOR
;
GO

SELECT * FROM EMPRESA
;
GO

SELECT * FROM VENDAS
;
GO

/*
Sequencia das cargas

1.Cliente
2.Empresa
3.Produto
4.Regiao
5.Vendedor
6.Vendas

7.Metas

*/