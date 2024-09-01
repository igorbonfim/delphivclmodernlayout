unit uHerancaCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, JvExStdCtrls,
  JvButton, JvCtrls, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZSqlUpdate, uEnum, Vcl.Mask, Vcl.DBCtrls, JvCombobox, JvDBCombobox,
  JvDBControls, Vcl.ComCtrls, JvExComCtrls, JvDateTimePicker,
  JvDBDateTimePicker, JvExMask, JvToolEdit, JvEdit, JvValidateEdit, Vcl.Grids,
  Vcl.DBGrids, ZAbstractConnection, ZConnection, uDtmConexao,
  uHerancaBase;

type
  TFrmHerancaCadastro = class(TFrmHerancaBase)
    pnlPrincipalBottom: TPanel;
    pnlPrincipal: TPanel;
    btnCancelar: TJvImgBtn;
    btnGravar: TJvImgBtn;
    btnApagar: TJvImgBtn;
    QryCadastro: TZQuery;
    updCadastro: TZUpdateSQL;
    dtsCadastro: TDataSource;
    procedure btnApagarMouseEnter(Sender: TObject);
    procedure btnApagarMouseLeave(Sender: TObject);
    procedure btnCancelarMouseEnter(Sender: TObject);
    procedure btnCancelarMouseLeave(Sender: TObject);
    procedure btnGravarMouseLeave(Sender: TObject);
    procedure btnGravarMouseEnter(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure QryCadastroAfterPost(DataSet: TDataSet);
    procedure QryCadastroAfterDelete(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    procedure PostOrDeleteWithCommitOrRollback(aConexao: TZConnection;
      aQry: TZQuery);
    procedure ControleEstado(qry: TZQuery; EstadoDoCadastro: TEstadoDoCadastro;
      BtnSalva, BtnCancelar, BtnExcluir: TJvImgBtn);
    { Private declarations }
  public
    EstadoDoCadastro: TEstadoDoCadastro;
    procedure HabilitaDesabilitaTela(chave: Boolean);
    { Public declarations }
  end;

var
  FrmHerancaCadastro: TFrmHerancaCadastro;

implementation

{$R *.dfm}

uses uPrincipal, uFuncoes;

procedure TFrmHerancaCadastro.btnApagarClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja apagar esse registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    QryCadastro.Delete;
    Close;
  end;
end;

procedure TFrmHerancaCadastro.btnApagarMouseEnter(Sender: TObject);
begin
  inherited;
  ButtonMouseEnter(Sender, 8);
end;

procedure TFrmHerancaCadastro.btnApagarMouseLeave(Sender: TObject);
begin
  inherited;
  ButtonMouseEnter(Sender, 9);
end;

procedure TFrmHerancaCadastro.btnCancelarClick(Sender: TObject);
begin
  inherited;
  QryCadastro.Cancel;
  Close;
end;

procedure TFrmHerancaCadastro.btnCancelarMouseEnter(Sender: TObject);
begin
  inherited;
  ButtonMouseEnter(Sender, 6);
end;

procedure TFrmHerancaCadastro.btnCancelarMouseLeave(Sender: TObject);
begin
  inherited;
  ButtonMouseEnter(Sender, 7);
end;

procedure TFrmHerancaCadastro.btnGravarClick(Sender: TObject);
begin
  inherited;
  try
    QryCadastro.Post;
    Close;
  except on ex:exception do
    ShowMessage(ex.Message);
  end;
end;

procedure TFrmHerancaCadastro.btnGravarMouseEnter(Sender: TObject);
begin
  inherited;
  ButtonMouseEnter(Sender, 4);
end;

procedure TFrmHerancaCadastro.btnGravarMouseLeave(Sender: TObject);
begin
  inherited;
  ButtonMouseEnter(Sender, 5);
end;

procedure TFrmHerancaCadastro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
  begin
    if (QryCadastro.State in [dsInsert, dsEdit]) then
      QryCadastro.Cancel;

    Close;
  end;
end;

procedure TFrmHerancaCadastro.FormShow(Sender: TObject);
begin
  inherited;
  ControleEstado(QryCadastro, EstadoDoCadastro, btnGravar, btnCancelar, btnApagar);
end;

procedure TFrmHerancaCadastro.HabilitaDesabilitaTela(chave: Boolean);
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    //81 -> Utilizada para deixar o campo da tela desabilitada
    //      porém na tela tem que ficar com ENABLED := false
    if (Components[i] is TDBEdit) and (TDBEdit(Components[i]).Tag <> 81) then
      TDBEdit(Components[i]).Enabled := chave;

    if Components[i] is TDBMemo then
      TDBMemo(Components[i]).Enabled := chave;

    if Components[i] is TDBImage then
      TDBImage(Components[i]).Enabled := chave;

    if Components[i] is TDBListBox then
      TDBListBox(Components[i]).Enabled := chave;

    if Components[i] is TDBComboBox then
      TDBComboBox(Components[i]).Enabled := chave;

    if Components[i] is TDBCheckBox then
      TDBCheckBox(Components[i]).Enabled := chave;

    if Components[i] is TDBRadioGroup then
      TDBRadioGroup(Components[i]).Enabled := chave;

    if Components[i] is TDBLookupComboBox then
      TDBLookupComboBox(Components[i]).Enabled := chave;

    if Components[i] is TDBRichEdit then
      TDBRichEdit(Components[i]).Enabled := chave;

    if Components[i] is TJvDBDateEdit then
      TJvDBDateEdit(Components[i]).Enabled := chave;

    if Components[i] is TJvDBDateTimePicker then
      TJvDBDateTimePicker(Components[i]).Enabled := chave;

    if Components[i] is TJvDBComboEdit then
      TJvDBComboEdit(Components[i]).Enabled := chave;

    if Components[i] is TJvDBComboBox then
      TJvDBComboBox(Components[i]).Enabled := chave;

    if Components[i] is TMaskEdit then
      TMaskEdit(Components[i]).Enabled := chave;

    if Components[i] is TEdit then
      TEdit(Components[i]).Enabled := chave;

    if Components[i] is TJvDateEdit then
      TJvDateEdit(Components[i]).Enabled := chave;

    if Components[i] is TJvValidateEdit then
      TJvValidateEdit(Components[i]).Enabled := chave;

    if Components[i] is TDBGrid then
      TDBGrid(Components[i]).Enabled := chave;
  end;
end;

procedure TFrmHerancaCadastro.QryCadastroAfterDelete(DataSet: TDataSet);
begin
  inherited;
  PostOrDeleteWithCommitOrRollback(dtmConexao.SQLConnection, QryCadastro);
end;

procedure TFrmHerancaCadastro.QryCadastroAfterPost(DataSet: TDataSet);
begin
  inherited;
  PostOrDeleteWithCommitOrRollback(dtmConexao.SQLConnection, QryCadastro);
end;

procedure TFrmHerancaCadastro.PostOrDeleteWithCommitOrRollback(aConexao: TZConnection; aQry: TZQuery);
begin
  try
    aConexao.StartTransaction;
    aQry.ApplyUpdates;
    aConexao.Commit;
    aQry.Refresh;
  except
    aConexao.Rollback;
  end;
end;

procedure TFrmHerancaCadastro.ControleEstado(qry: TZQuery; EstadoDoCadastro: TEstadoDoCadastro; BtnSalva: TJvImgBtn; BtnCancelar: TJvImgBtn; BtnExcluir: TJvImgBtn);
begin
  if (EstadoDoCadastro = ecNovo) then
  begin
    BtnExcluir.Visible := false;
    lblTitulo.Caption := lblTitulo.Caption + ' - [NOVO]';
    qry.Append;
  end
  else if (EstadoDoCadastro = ecModificar) then
  begin
    BtnExcluir.Visible := false;
    lblTitulo.Caption := lblTitulo.Caption + ' - [MODIFICAR]';
    qry.Edit;
  end
  else
  begin
    lblTitulo.Caption := lblTitulo.Caption + ' - [APAGAR]';
    BtnExcluir.Left := BtnCancelar.Left;
    BtnSalva.Visible := false;
    BtnCancelar.Visible := false;
    BtnExcluir.Visible := true;
  end;
end;

end.
