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
    procedure grdListagemTitleClick(Column: TColumn);
    procedure mskPesquisarChange(Sender: TObject);
  private
    { Private declarations }
    sIndexFieldNames: string;
    sNomeColunaDisplay: string;
    iColunaIndexada: integer;
    procedure MudarCorGridIndice;

  public
    { Public declarations }
    procedure RefreshQuery(aQry: TZQuery);
  end;

var
  FrmHerancaListagem: TFrmHerancaListagem;

implementation

{$R *.dfm}

uses uPrincipal, uFuncoes;

procedure TFrmHerancaListagem.MudarCorGridIndice;
var
  i: integer;
  index: string;
begin
  if QryListagem.IndexFieldNames = EmptyStr then
    QryListagem.IndexFieldNames := sIndexFieldNames;

  index := QryListagem.IndexFieldNames;
  index := StringReplace(index, ' Asc', '', [rfReplaceAll]);
  index := StringReplace(index, ' Desc', '', [rfReplaceAll]);

  for i := 0 to grdListagem.Columns.Count - 1 do
  begin
    if UpperCase(grdListagem.Columns[i].FieldName) = UpperCase(trim(index)) then
    begin
      grdListagem.Columns[i].Color := clBtnFace;
      grdListagem.Columns[i].Title.Font.Color := clBlack;
      grdListagem.Columns[i].Title.Color := clInfoBk;
      lblPesquisarPor.Caption := 'Pesquisar por ' +grdListagem.Columns[i].Title.Caption;
      sNomeColunaDisplay := grdListagem.Columns[i].FieldName;
      iColunaIndexada := i;
    end
    else
    begin
      grdListagem.Columns[i].Color := clWhite;
      grdListagem.Columns[i].Title.Font.Color := clBlack;
      grdListagem.Columns[i].Title.Color := clBtnFace;
    end;
  end;

end;

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

  sIndexFieldNames := QryListagem.IndexFieldNames;
  QryListagem.Open;
  MudarCorGridIndice;
end;

procedure TFrmHerancaListagem.grdListagemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  // Bloqueia o CTRL + DEL
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;
end;

procedure TFrmHerancaListagem.grdListagemTitleClick(Column: TColumn);
var
  i: integer;
begin
  inherited;

  iColunaIndexada := Column.Index;
  QryListagem.IndexFieldNames := Column.FieldName;
  lblPesquisarPor.Caption := 'Pesquisar por ' +Column.Title.Caption;
  sNomeColunaDisplay := Column.FieldName;

  for i := 0 to grdListagem.Columns.Count - 1 do
  begin
    if grdListagem.Columns[i] = Column then
    begin
      Column.Color := clBtnFace;
      Column.Title.Color := clBtnFace;
      Column.Title.Font.Color := clBlack;
    end
    else
    begin
      grdListagem.Columns[i].Color := clWhite;
      grdListagem.Columns[i].Title.Font.Color := clBlack;
      grdListagem.Columns[i].Title.Color := clBtnFace;
    end;
  end;
end;

procedure TFrmHerancaListagem.mskPesquisarChange(Sender: TObject);
begin
  inherited;

  if not QryListagem.IsEmpty then
    QryListagem.Locate(sNomeColunaDisplay, TMaskEdit(Sender).Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TFrmHerancaListagem.RefreshQuery(aQry: TZQuery);
var
  aBookMark: TBookMark;
begin
  try
    aQry.DisableControls;
    aBookMark := aQry.Bookmark;
    aQry.Refresh;
  finally
    //aQry.GotoBookmark(aBookMark);
    aQry.EnableControls;
    aQry.FreeBookmark(aBookMark);
  end;
end;

end.
