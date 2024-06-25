unit uBancoListagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uHerancaListagem, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, System.ImageList, Vcl.ImgList,
  Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, JvExStdCtrls, JvButton,
  JvCtrls, Vcl.Mask, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TFrmBancoListagem = class(TFrmHerancaListagem)
    QryListagemBancoId: TIntegerField;
    QryListagemCodBanco: TWideStringField;
    QryListagemDescBanco: TWideStringField;
    QryListagemWebSite: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBancoListagem: TFrmBancoListagem;

implementation

{$R *.dfm}

end.
