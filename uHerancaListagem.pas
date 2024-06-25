unit uHerancaListagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uHerancaBase, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  JvExStdCtrls, JvButton, JvCtrls, System.ImageList, Vcl.ImgList, Vcl.DBCtrls,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, uDtmConexao;

type
  TFrmHerancaListagem = class(TFrmHerancaBase)
    pnlFormPrincipal: TPanel;
    pnlFormPrincipalTop: TPanel;
    pnlFormPrincipalBottom: TPanel;
    grdListagem: TDBGrid;
    pnlLineBottom: TPanel;
    pnlLineTop: TPanel;
    mskPesquisar: TMaskEdit;
    lblPesquisarPor: TLabel;
    btnNovo: TJvImgBtn;
    btnModificar: TJvImgBtn;
    btmApagar: TJvImgBtn;
    DBNavigator1: TDBNavigator;
    btnFechar: TJvImgBtn;
    QryListagem: TZQuery;
    dtsListagem: TDataSource;
    procedure btnNovoMouseEnter(Sender: TObject);
    procedure btnNovoMouseLeave(Sender: TObject);
    procedure btnModificarMouseLeave(Sender: TObject);
    procedure btnModificarMouseEnter(Sender: TObject);
    procedure btmApagarMouseEnter(Sender: TObject);
    procedure btmApagarMouseLeave(Sender: TObject);
    procedure btnFecharMouseEnter(Sender: TObject);
    procedure btnFecharMouseLeave(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grdListagemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmHerancaListagem: TFrmHerancaListagem;

implementation

{$R *.dfm}

uses uPrincipal, uFuncoes;

procedure TFrmHerancaListagem.btmApagarMouseEnter(Sender: TObject);
begin
  inherited;
  ButtonMouseEnter(Sender, 8);
end;

procedure TFrmHerancaListagem.btmApagarMouseLeave(Sender: TObject);
begin
  inherited;
  ButtonMouseEnter(Sender, 9);
end;

procedure TFrmHerancaListagem.btnFecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmHerancaListagem.btnFecharMouseEnter(Sender: TObject);
begin
  inherited;
  ButtonMouseEnter(Sender, 10);
end;

procedure TFrmHerancaListagem.btnFecharMouseLeave(Sender: TObject);
begin
  inherited;
  ButtonMouseEnter(Sender, 11);
end;

procedure TFrmHerancaListagem.btnModificarMouseEnter(Sender: TObject);
begin
  inherited;
  ButtonMouseEnter(Sender, 2);
end;

procedure TFrmHerancaListagem.btnModificarMouseLeave(Sender: TObject);
begin
  inherited;
  ButtonMouseEnter(Sender, 3);
end;

procedure TFrmHerancaListagem.btnNovoMouseEnter(Sender: TObject);
begin
  inherited;
  ButtonMouseEnter(Sender, 0);
end;

procedure TFrmHerancaListagem.btnNovoMouseLeave(Sender: TObject);
begin
  inherited;
  ButtonMouseLeave(Sender, 1);
end;

procedure TFrmHerancaListagem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FecharAba(Self.Caption, frmPrincipal.pgcPrincipal);
end;

procedure TFrmHerancaListagem.FormShow(Sender: TObject);
begin
  if QryListagem.SQL.Text = EmptyStr then
  begin
    MessageDlg('Nao existe instrução SQL no componente', mtWarning, [mbOk], 0);
    abort;
  end;
  inherited;
  QryListagem.Open;
end;

procedure TFrmHerancaListagem.grdListagemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  // Bloqueia o CTRL + DEL
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;
end;

end.
