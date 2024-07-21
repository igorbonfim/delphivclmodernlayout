unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSplash, Vcl.StdCtrls, uHerancaBase,
  Vcl.Buttons, uHerancaListagem, Vcl.ExtCtrls, Vcl.ComCtrls, uDtmConexao,
  uBancoListagem, Vcl.Imaging.pngimage, System.ImageList, Vcl.ImgList,
  JvExStdCtrls, JvButton, JvCtrls;

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
    pnlPrincipalTop: TPanel;
    Image1: TImage;
    imgButtons: TImageList;
    btnFechar: TJvImgBtn;
    btnCriarMenu: TBitBtn;
    scbIcones: TScrollBox;
    btnConfiguracoes: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCriarMenuClick(Sender: TObject);
    procedure btnConfiguracoesClick(Sender: TObject);
  private
    { Private declarations }
    pnlAcao, pnlDescAcao, pnlLeft, pnlRight, pnlTop: TPanel;
    lblDescAcao: TLabel;
    imgIcone: TImage;
    procedure ClickChamada(Sender: TObject);
    procedure ControleMouseEnterTImage(Sender: TObject);
    procedure ControleMouseLeaveTImage(Sender: TObject);
    procedure DestroyIconesMenuDinamico;
    procedure MontarMenu(aProcesso: string);
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

procedure TFrmPrincipal.MontarMenu(aProcesso: string);
var
  iLeft, iTop: integer;
  cColorPanelIcone: TColor;
begin
  iLeft := 6;
  iTop  := 6;
  cColorPanelIcone := clBlack;

  DestroyIconesMenuDinamico;
  dtmConexao.QryMenu.Close;
  dtmConexao.QryMenu.ParamByName('processo').AsString := aProcesso;
  dtmConexao.QryMenu.Open;

  while not dtmConexao.QryMenu.Eof do
  begin
    pnlAcao := TPanel.Create(scbIcones);
    pnlAcao.Parent := scbIcones;
    pnlAcao.BevelOuter := bvNone;
    pnlAcao.Height := 82;
    pnlAcao.Left := iLeft;
    pnlAcao.Width := 130;
    pnlAcao.Name := '___pnl___'+dtmConexao.QryMenu.FieldByName('menuId').AsString;
    pnlAcao.Top := iTop;
    pnlAcao.Caption := EmptyStr;
    pnlAcao.Tag := 9999;
    pnlAcao.Color := clWhite;
    pnlAcao.ParentBackground := false;

    pnlDescAcao := TPanel.Create(Application);
    pnlDescAcao.Parent := pnlAcao;
    pnlDescAcao.Color := cColorPanelIcone;
    pnlDescAcao.Height := 15;
    pnlDescAcao.Align := alBottom;
    pnlDescAcao.BevelOuter := bvNone;
    pnlDescAcao.ParentBackground := false;

    pnlLeft := TPanel.Create(Application);
    pnlLeft.Parent := pnlAcao;
    pnlLeft.Align := alLeft;
    pnlLeft.Width := 1;
    pnlLeft.Color := cColorPanelIcone;
    pnlLeft.BevelOuter := bvNone;
    pnlLeft.ParentBackground := false;

    pnlRight := TPanel.Create(Application);
    pnlRight.Parent := pnlAcao;
    pnlRight.Align := alRight;
    pnlRight.Width := 1;
    pnlRight.Color := cColorPanelIcone;
    pnlRight.BevelOuter := bvNone;

    pnlTop := TPanel.Create(Application);
    pnlTop.Parent := pnlAcao;
    pnlTop.Align := alTop;
    pnlTop.Height := 1;
    pnlTop.Color := cColorPanelIcone;
    pnlTop.BevelOuter := bvNone;
    pnlTop.ParentBackground := false;

    lblDescAcao := TLabel.Create(Application);
    lblDescAcao.Parent := pnlDescAcao;
    lblDescAcao.Align := alClient;
    lblDescAcao.Alignment := taCenter;
    lblDescAcao.Font.Style := [fsUnderline, fsBold];
    lblDescAcao.Font.Name := 'Tahoma';
    lblDescAcao.Font.Size := 8;
    lblDescAcao.Font.Color := clWhite;
    lblDescAcao.Cursor := crHandPoint;
    lblDescAcao.Caption := dtmConexao.QryMenu.FieldByName('titulo').AsString;
    lblDescAcao.Hint := dtmConexao.QryMenu.FieldByName('nomeFormulario').AsString;
    lblDescAcao.HelpKeyword := '1';
    lblDescAcao.ShowHint := false;
    lblDescAcao.OnClick := ClickChamada;

    imgIcone := TImage.Create(Application);
    imgIcone.Parent := pnlAcao;
    imgIcone.Align := alClient;
    imgIcone.Transparent := true;
    imgIcone.Center := true;
    imgIcone.Picture.LoadFromFile('C:\Projetos\Sistema Delphi com Layout Moderno - Udemy\Images\' +dtmConexao.QryMenu.FieldByName('nomeImagem').AsString);
    imgIcone.Hint := dtmConexao.QryMenu.FieldByName('nomeFormulario').AsString;
    imgIcone.HelpKeyword := '1';
    imgIcone.ShowHint := false;
    imgIcone.OnClick := ClickChamada;
    imgIcone.OnMouseEnter := ControleMouseEnterTImage;
    imgIcone.OnMouseLeave := ControleMouseLeaveTImage;

    iLeft := iLeft + pnlAcao.Width + 6;

    if iLeft > (self.Width - (pnlPrincipalLeft.Width + pnlAcao.Width)) then
    begin
      iLeft := 6;
      iTop := iTop + pnlAcao.Height + 6;
    end;

    dtmConexao.QryMenu.Next;
  end;

  pgcPrincipal.ActivePage := tbsMenu;
end;

procedure TFrmPrincipal.DestroyIconesMenuDinamico;
var
  i: integer;
begin
  i := scbIcones.ComponentCount;
  while i > 0 do
  begin
    Dec(i);
    if TComponent(scbIcones.Components[i]).Tag = 9999 then
      TComponent(scbIcones.Components[i]).Destroy;
  end;
end;

procedure TFrmPrincipal.ControleMouseEnterTImage(Sender: TObject);
var
  ControleAtivo: TWinControl;
begin
  ControleAtivo := TImage(Sender).Parent;
  if ControleAtivo is TPanel then
  begin
    TPanel(ControleAtivo).Color := $006CC2F0;
    TPanel(ControleAtivo).ParentBackground := false;
  end;
end;

procedure TFrmPrincipal.ControleMouseLeaveTImage(Sender: TObject);
var
  ControleAtivo: TWinControl;
begin
  ControleAtivo := TImage(Sender).Parent;
  if ControleAtivo is TPanel then
  begin
    TPanel(ControleAtivo).Color := clWhite;
    TPanel(ControleAtivo).ParentBackground := false;
  end;
end;

procedure TFrmPrincipal.ClickChamada(Sender: TObject);
begin
  if (Sender is TLabel) then
    CriarAba(TFormClass(FindClass(TLabel(Sender).Hint)), pgcPrincipal, -1)
  else if (Sender is TImage) then
    CriarAba(TFormClass(FindClass(TLabel(Sender).Hint)), pgcPrincipal, -1);
end;

procedure TFrmPrincipal.btnConfiguracoesClick(Sender: TObject);
begin
  MontarMenu('CNF');
end;

procedure TFrmPrincipal.btnCriarMenuClick(Sender: TObject);
begin
  MontarMenu('FIN');
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
