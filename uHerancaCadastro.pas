unit uHerancaCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uHerancaBase, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, JvExStdCtrls,
  JvButton, JvCtrls, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZSqlUpdate, uEnum, Vcl.Mask, Vcl.DBCtrls, JvCombobox, JvDBCombobox,
  JvDBControls, Vcl.ComCtrls, JvExComCtrls, JvDateTimePicker,
  JvDBDateTimePicker, JvExMask, JvToolEdit, JvEdit, JvValidateEdit, Vcl.Grids,
  Vcl.DBGrids;

type
  TFrmHerancaCadastro = class(TFrmHerancaBase)
    pnlPrincipalBottom: TPanel;
    pnlPrincipal: TPanel;
    btnCancelar: TJvImgBtn;
    btnGravar: TJvImgBtn;
    btmApagar: TJvImgBtn;
    QryCadastro: TZQuery;
    updCadastro: TZUpdateSQL;
    dtsCadastro: TDataSource;
    procedure btmApagarMouseEnter(Sender: TObject);
    procedure btmApagarMouseLeave(Sender: TObject);
    procedure btnCancelarMouseEnter(Sender: TObject);
    procedure btnCancelarMouseLeave(Sender: TObject);
    procedure btnGravarMouseLeave(Sender: TObject);
    procedure btnGravarMouseEnter(Sender: TObject);
  private
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

procedure TFrmHerancaCadastro.btmApagarMouseEnter(Sender: TObject);
begin
  inherited;
  ButtonMouseEnter(Sender, 8);
end;

procedure TFrmHerancaCadastro.btmApagarMouseLeave(Sender: TObject);
begin
  inherited;
  ButtonMouseEnter(Sender, 9);
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

end.
