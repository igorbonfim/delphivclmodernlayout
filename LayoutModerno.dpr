program LayoutModerno;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {FrmPrincipal},
  uSplash in 'uSplash.pas' {FrmSplash},
  uHerancaBase in 'uHerancaBase.pas' {FrmHerancaBase},
  uHerancaListagem in 'uHerancaListagem.pas' {FrmHerancaListagem};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
