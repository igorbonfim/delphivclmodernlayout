unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSplash, Vcl.StdCtrls, uHerancaBase,
  Vcl.Buttons, uHerancaListagem, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TFrmPrincipal = class(TForm)
    pnlPrincipalLeft: TPanel;
    pnlPrincipalCenter: TPanel;
    pnlPrincipalCenterLeft: TPanel;
    pnlPrincipalCenterRight: TPanel;
    pnlPrincipalCenterTop: TPanel;
    pnlPrincipalCenterBottom: TPanel;
    pgcPrincipal: TPageControl;
    tbsMenu: TTabSheet;
    BitBtn1: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses uFuncoes;

procedure TFrmPrincipal.BitBtn1Click(Sender: TObject);
begin
  {frmHerancaListagem := TfrmHerancaListagem.Create(Self);
  frmHerancaListagem.ShowModal;
  frmHerancaListagem.Release;}
  CriarAba(TfrmHerancaListagem, pgcPrincipal, -1);
end;

procedure TFrmPrincipal.Button1Click(Sender: TObject);
begin
  frmHerancaBase := TfrmHerancaBase.Create(Self);
  frmHerancaBase.ShowModal;
  frmHerancaBase.Free;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  frmSplash := TfrmSplash.Create(Self);
  frmSplash.Show;
  frmSplash.Refresh;
  Sleep(2000);

  if Assigned(frmSplash) then
    frmSplash.Free;
end;

end.
