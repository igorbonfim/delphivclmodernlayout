unit uBancoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uHerancaCadastro, Data.DB, ZSqlUpdate,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, JvExStdCtrls, JvButton, JvCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, uDtmConexao, Vcl.Mask, Vcl.DBCtrls;

type
  TFrmBancoCadastro = class(TFrmHerancaCadastro)
    QryCadastroBancoId: TIntegerField;
    QryCadastroCodBanco: TWideStringField;
    QryCadastroDescBanco: TWideStringField;
    QryCadastroWebSite: TWideStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBancoCadastro: TFrmBancoCadastro;

implementation

{$R *.dfm}

end.
