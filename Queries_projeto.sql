-- Cria��o das tabelas
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

	primary key(menuId)
);

CREATE TABLE Cartao (
	cartaoId int identity NOT NULL,
	descricaoCartao varchar(30) NOT NULL,
	primary key(cartaoId)
)

-- Bancos
INSERT INTO Banco (CodBanco, DescBanco, WebSite) VALUES('001', 'Banco do Brasil S.A', 'www.bb.com.br');
INSERT INTO Banco (CodBanco, DescBanco, WebSite) VALUES('003', 'Banco da Amaz�nia S.A', 'www.bancoamazonia.com.br');
INSERT INTO Banco (CodBanco, DescBanco, WebSite) VALUES('004', 'Banco do Nordeste do Brasil S.A', 'www.banconordeste.gov.br');
INSERT INTO Banco (CodBanco, DescBanco, WebSite) VALUES('104', 'Caixa Econ�mica Federal', 'www.caixa.gov.br');
-- Op��es do menu
INSERT INTO Menu(titulo, nomeImagem, nomeFormulario, processo) values('Cadastro de Banco', 'BancoFebraban.png', 'TFrmBancoListagem', 'FIN');
INSERT INTO Menu(titulo, nomeImagem, nomeFormulario, processo) values('Cadastro de Cart�o', 'CartaoCredito.png', 'TFrmBancoListagem', 'FIN');
INSERT INTO Menu(titulo, nomeImagem, nomeFormulario, processo) values('Configura��es', 'Configuracao.png', 'TFrmBancoListagem', 'CNF');

