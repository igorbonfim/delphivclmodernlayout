unit uCartaoListagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uHerancaListagem, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, System.ImageList, Vcl.ImgList,
  Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, JvExStdCtrls, JvButton,
  JvCtrls, Vcl.Mask, Vcl.Imaging.pngimage, Vcl.ExtCtrls, uEnum, uCartaoCadastro,
  uDtmConexao;

type
  TfrmCartaoListagem = class(TFrmHerancaListagem)
    QryListagemcartaoId: TIntegerField;
    QryListagemdescricaoCartao: TWideStringField;
    procedure btnModificarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btmApagarClick(Sender: TObject);
  private
    procedure AbrirCadastro(estadoDoCadastro: TEstadoDoCadastro);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCartaoListagem: TfrmCartaoListagem;

implementation

{$R *.dfm}

procedure TFrmCartaoListagem.AbrirCadastro(estadoDoCadastro: TEstadoDoCadastro);
begin
  try
    frmCartaoCadastro := TFrmCartaoCadastro.Create(Self);
    frmCartaoCadastro.EstadoDoCadastro := estadoDoCadastro;

    case estadoDoCadastro of
      ecNovo: begin
        frmCartaoCadastro.QryCadastro.ParamByName('cartaoId').AsInteger := -1;
        frmCartaoCadastro.QryCadastro.Open;
        frmCartaoCadastro.QryCadastro.Append;
      end;

      ecModificar: begin
        frmCartaoCadastro.QryCadastro.ParamByName('cartaoId').AsInteger := QryListagemCartaoId.AsInteger;
        frmCartaoCadastro.QryCadastro.Open;
        frmCartaoCadastro.QryCadastro.Edit;
      end;

      ecApagar: begin
        frmCartaoCadastro.QryCadastro.ParamByName('cartaoId').AsInteger := QryListagemCartaoId.AsInteger;
        frmCartaoCadastro.QryCadastro.Open;
        frmCartaoCadastro.HabilitaDesabilitaTela(false);
      end;
    end;

    frmCartaoCadastro.ShowModal;
  finally
    frmCartaoCadastro.Release;
    Self.RefreshQuery(QryListagem);
  end;
end;

procedure TfrmCartaoListagem.btmApagarClick(Sender: TObject);
begin
  inherited;
  AbrirCadastro(ecApagar);
end;

procedure TfrmCartaoListagem.btnModificarClick(Sender: TObject);
begin
  inherited;
  AbrirCadastro(ecModificar);
end;

procedure TfrmCartaoListagem.btnNovoClick(Sender: TObject);
begin
  inherited;
  AbrirCadastro(ecNovo);
end;

initialization
  RegisterClass(TFrmCartaoListagem);

end.
