unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSplash, Vcl.StdCtrls, uHerancaBase,
  Vcl.Buttons, uHerancaListagem, Vcl.ExtCtrls, Vcl.ComCtrls, uDtmConexao,
  uBancoListagem;

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
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;
  Conexao: TDtmConexao;

implementation

{$R *.dfm}

uses uFuncoes;

procedure TFrmPrincipal.BitBtn1Click(Sender: TObject);
begin
  CriarAba(TfrmBancoListagem, pgcPrincipal, -1);
end;

procedure TFrmPrincipal.Button1Click(Sender: TObject);
begin
  frmHerancaBase := TfrmHerancaBase.Create(Self);
  frmHerancaBase.ShowModal;
  frmHerancaBase.Free;
end;

procedure TFrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(dtmConexao) then
    FreeAndNil(dtmConexao);
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  try
    dtmConexao := TDtmConexao.Create(Self);
    dtmConexao.SQLConnection.Connected := true;
  except
    ShowMessage('Erro ao se conectar com o banco de dados');
  end;
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
