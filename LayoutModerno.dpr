program LayoutModerno;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {FrmPrincipal},
  uSplash in 'uSplash.pas' {FrmSplash},
  uHerancaBase in 'uHerancaBase.pas' {FrmHerancaBase},
  uHerancaListagem in 'uHerancaListagem.pas' {FrmHerancaListagem},
  uHerancaCadastro in 'uHerancaCadastro.pas' {FrmHerancaCadastro},
  uFuncoes in 'uFuncoes.pas',
  uDtmConexao in 'uDtmConexao.pas' {dtmConexao: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
