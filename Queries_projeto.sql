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

INSERT INTO Banco (CodBanco, DescBanco, WebSite) VALUES('001', 'Banco do Brasil S.A', 'www.bb.com.br');
INSERT INTO Banco (CodBanco, DescBanco, WebSite) VALUES('003', 'Banco da Amazônia S.A', 'www.bancoamazonia.com.br');
INSERT INTO Banco (CodBanco, DescBanco, WebSite) VALUES('004', 'Banco do Nordeste do Brasil S.A', 'www.banconordeste.gov.br');
INSERT INTO Banco (CodBanco, DescBanco, WebSite) VALUES('104', 'Caixa Econômica Federal', 'www.caixa.gov.br');

