-- Criação das tabelas
CREATE TABLE Banco (
	BancoId int identity(1,1) NOT NULL,
	CodBanco varchar(03) unique NOT NULL,
	DescBanco varchar(50) NOT NULL,
	WebSite varchar(100),

	PRIMARY KEY (BancoId)
);

CREATE TABLE Menu (
	menuId int identity(1,1) NOT NULL,
	titulo varchar(25) NOT NULL,
	nomeImagem varchar(100) NOT NULL,
	nomeFormulario varchar(50) NOT NULL,
	processo CHAR(3) NOT NULL

	PRIMARY KEY(menuId)
);

CREATE TABLE Cartao (
	cartaoId int identity(1,1) NOT NULL,
	descricaoCartao varchar(30) NOT NULL,

	PRIMARY KEY(cartaoId)
)

CREATE TABLE Usuario
(
	usuarioId INT IDENTITY NOT NULL,
	nomeUsuario VARCHAR(30) NOT NULL UNIQUE,
	senha VARCHAR(30) NOT NULL,

	PRIMARY KEY (usuarioId)
);

-- Bancos
INSERT INTO Banco (CodBanco, DescBanco, WebSite) VALUES('001', 'Banco do Brasil S.A', 'www.bb.com.br');
INSERT INTO Banco (CodBanco, DescBanco, WebSite) VALUES('003', 'Banco da Amazônia S.A', 'www.bancoamazonia.com.br');
INSERT INTO Banco (CodBanco, DescBanco, WebSite) VALUES('004', 'Banco do Nordeste do Brasil S.A', 'www.banconordeste.gov.br');
INSERT INTO Banco (CodBanco, DescBanco, WebSite) VALUES('104', 'Caixa Econômica Federal', 'www.caixa.gov.br');
-- Opções do menu
INSERT INTO Menu(titulo, nomeImagem, nomeFormulario, processo) values('Cadastro de Banco', 'BancoFebraban.png', 'TFrmBancoListagem', 'FIN');
INSERT INTO Menu(titulo, nomeImagem, nomeFormulario, processo) values('Cadastro de Cartão', 'CartaoCredito.png', 'TFrmBancoListagem', 'FIN');
INSERT INTO Menu(titulo, nomeImagem, nomeFormulario, processo) values('Configurações', 'Configuracao.png', 'TFrmBancoListagem', 'CNF');

INSERT INTO USUARIO(NOMEUSUARIO, SENHA) VALUES('TESTE', 'MUDAR@123');

UPDATE Menu SET nomeFormulario = 'TFrmCartaoListagem' WHERE menuId = 2;

