unit uBancoListagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uHerancaListagem, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, System.ImageList, Vcl.ImgList,
  Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, JvExStdCtrls, JvButton,
  JvCtrls, Vcl.Mask, Vcl.Imaging.pngimage, Vcl.ExtCtrls, uBancoCadastro, uEnum;

type
  TFrmBancoListagem = class(TFrmHerancaListagem)
    QryListagemBancoId: TIntegerField;
    QryListagemCodBanco: TWideStringField;
    QryListagemDescBanco: TWideStringField;
    QryListagemWebSite: TWideStringField;
    procedure btnNovoClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btmApagarClick(Sender: TObject);
  private
    procedure AbrirCadastro(estadoDoCadastro: TEstadoDoCadastro);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBancoListagem: TFrmBancoListagem;

implementation

{$R *.dfm}

procedure TFrmBancoListagem.AbrirCadastro(estadoDoCadastro: TEstadoDoCadastro);
begin
  try
    frmBancoCadastro := TFrmBancoCadastro.Create(Self);
    frmBancoCadastro.EstadoDoCadastro := estadoDoCadastro;

    case estadoDoCadastro of
      ecNovo: begin
        frmBancoCadastro.QryCadastro.ParamByName('BancoId').AsInteger := -1;
        frmBancoCadastro.QryCadastro.Open;
        frmBancoCadastro.QryCadastro.Append;
      end;

      ecModificar: begin
        frmBancoCadastro.QryCadastro.ParamByName('BancoId').AsInteger := QryListagemBancoId.AsInteger;
        frmBancoCadastro.QryCadastro.Open;
        frmBancoCadastro.QryCadastro.Edit;
      end;

      ecApagar: begin
        frmBancoCadastro.QryCadastro.ParamByName('BancoId').AsInteger := QryListagemBancoId.AsInteger;
        frmBancoCadastro.QryCadastro.Open;
        frmBancoCadastro.HabilitaDesabilitaTela(false);
      end;
    end;

    frmBancoCadastro.ShowModal;
  finally
    frmBancoCadastro.Release;
    Self.RefreshQuery(QryListagem);
  end;
end;

procedure TFrmBancoListagem.btmApagarClick(Sender: TObject);
begin
  inherited;
  AbrirCadastro(ecApagar);
end;

procedure TFrmBancoListagem.btnModificarClick(Sender: TObject);
begin
  inherited;
  AbrirCadastro(ecModificar);
end;

procedure TFrmBancoListagem.btnNovoClick(Sender: TObject);
begin
  inherited;
  AbrirCadastro(ecNovo);
end;

end.
