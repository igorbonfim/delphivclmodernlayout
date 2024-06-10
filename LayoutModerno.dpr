program LayoutModerno;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {FrmPrincipal},
  uSplash in 'uSplash.pas' {FrmSplash},
  uHerancaBase in 'uHerancaBase.pas' {FrmHerancaBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmSplash, FrmSplash);
  Application.CreateForm(TFrmHerancaBase, FrmHerancaBase);
  Application.Run;
end.
