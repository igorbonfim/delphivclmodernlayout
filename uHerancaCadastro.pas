unit uHerancaCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uHerancaBase, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, JvExStdCtrls,
  JvButton, JvCtrls;

type
  TFrmHerancaCadastro = class(TFrmHerancaBase)
    pnlPrincipalBottom: TPanel;
    pnlPrincipal: TPanel;
    btnCancelar: TJvImgBtn;
    btnGravar: TJvImgBtn;
    btmApagar: TJvImgBtn;
    procedure btmApagarMouseEnter(Sender: TObject);
    procedure btmApagarMouseLeave(Sender: TObject);
    procedure btnCancelarMouseEnter(Sender: TObject);
    procedure btnCancelarMouseLeave(Sender: TObject);
    procedure btnGravarMouseLeave(Sender: TObject);
    procedure btnGravarMouseEnter(Sender: TObject);
  private
    { Private declarations }
  public
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

end.
