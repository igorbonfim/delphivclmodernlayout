unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSplash, Vcl.StdCtrls, uHerancaBase,
  Vcl.Buttons, uHerancaListagem, Vcl.ExtCtrls, Vcl.ComCtrls, uDtmConexao,
  uBancoListagem, Vcl.Imaging.pngimage, System.ImageList, Vcl.ImgList,
  JvExStdCtrls, JvButton, JvCtrls, Vcl.WinXCtrls, uLogin;

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
    pnlPrincipalTop: TPanel;
    Image1: TImage;
    imgButtons: TImageList;
    scbIcones: TScrollBox;
    Panel1: TPanel;
    Label1: TLabel;
    imgBtnClose: TImage;
    pnlPesquisa: TPanel;
    edtLocalizaMenu: TSearchBox;
    Panel2: TPanel;
    Panel3: TPanel;
    Image2: TImage;
    Label2: TLabel;
    btnFinanceiro: TJvImgBtn;
    btnVendas: TJvImgBtn;
    btnConfiguracoes: TJvImgBtn;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtLocalizaMenuInvokeSearch(Sender: TObject);
    procedure imgBtnCloseClick(Sender: TObject);
    procedure btnFinanceiroClick(Sender: TObject);
    procedure btnVendasClick(Sender: TObject);
    procedure btnConfiguracoesClick(Sender: TObject);
    procedure btnFinanceiroMouseEnter(Sender: TObject);
    procedure btnFinanceiroMouseLeave(Sender: TObject);
    procedure btnVendasMouseEnter(Sender: TObject);
    procedure btnVendasMouseLeave(Sender: TObject);
    procedure btnConfiguracoesMouseEnter(Sender: TObject);
    procedure btnConfiguracoesMouseLeave(Sender: TObject);
  private
    { Private declarations }
    pnlAcao, pnlDescAcao, pnlLeft, pnlRight, pnlTop: TPanel;
    lblDescAcao: TLabel;
    imgIcone: TImage;
    procedure ClickChamada(Sender: TObject);
    procedure ControleMouseEnterTImage(Sender: TObject);
    procedure ControleMouseLeaveTImage(Sender: TObject);
    procedure DestroyIconesMenuDinamico;
    procedure MontarMenu;
    procedure FiltrarMenuProcesso(aProcesso: string);
    procedure FiltrarMenuLikeTitulo(aLike: string);
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;
  Conexao: TDtmConexao;

implementation

{$R *.dfm}

uses uFuncoes;

procedure TFrmPrincipal.FiltrarMenuProcesso(aProcesso: string);
begin
  dtmConexao.QryMenu.Close;
  dtmConexao.QryMenu.SQL.Clear;
  dtmConexao.QryMenu.SQL.Add(' SELECT menuId, titulo, nomeImagem, nomeFormulario, processo FROM Menu ');
  dtmConexao.QryMenu.SQL.Add(' WHERE processo = :processo ');
  dtmConexao.QryMenu.ParamByName('processo').AsString := aProcesso;
  dtmConexao.QryMenu.Open;
  MontarMenu;
end;

procedure TFrmPrincipal.FiltrarMenuLikeTitulo(aLike: string);
begin
  dtmConexao.QryMenu.Close;
  dtmConexao.QryMenu.SQL.Clear;
  dtmConexao.QryMenu.SQL.Add(' SELECT menuId, titulo, nomeImagem, nomeFormulario, processo FROM Menu ');
  dtmConexao.QryMenu.SQL.Add(' WHERE titulo like :titulo ');
  dtmConexao.QryMenu.ParamByName('titulo').AsString :=  '%' + aLike + '%';
  dtmConexao.QryMenu.Open;
  MontarMenu;
end;

procedure TFrmPrincipal.MontarMenu;
var
  iLeft, iTop: integer;
  cColorPanelIcone: TColor;
begin
  iLeft := 6;
  iTop  := 6;
  cColorPanelIcone := $00EBDDDA;

  DestroyIconesMenuDinamico;

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
    lblDescAcao.Font.Color := clBlack;
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

procedure TFrmPrincipal.edtLocalizaMenuInvokeSearch(Sender: TObject);
begin
  FiltrarMenuLikeTitulo(TSearchBox(Sender).Text);
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
  FiltrarMenuProcesso('CNF');
end;

procedure TFrmPrincipal.btnConfiguracoesMouseEnter(Sender: TObject);
begin
  ButtonMouseEnter(Sender, 4);
end;

procedure TFrmPrincipal.btnConfiguracoesMouseLeave(Sender: TObject);
begin
  ButtonMouseLeave(Sender, 5);
end;

procedure TFrmPrincipal.btnFinanceiroClick(Sender: TObject);
begin
  FiltrarMenuProcesso('FIN');
end;

procedure TFrmPrincipal.btnFinanceiroMouseEnter(Sender: TObject);
begin
  ButtonMouseEnter(Sender, 0);
end;

procedure TFrmPrincipal.btnFinanceiroMouseLeave(Sender: TObject);
begin
  ButtonMouseLeave(Sender, 1);
end;

procedure TFrmPrincipal.btnVendasClick(Sender: TObject);
begin
  FiltrarMenuProcesso('VEN');
end;

procedure TFrmPrincipal.btnVendasMouseEnter(Sender: TObject);
begin
  ButtonMouseEnter(Sender, 2);
end;

procedure TFrmPrincipal.btnVendasMouseLeave(Sender: TObject);
begin
  ButtonMouseLeave(Sender, 3);
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

  frmLogin := TfrmLogin.Create(Self);
  frmLogin.ShowModal;
  frmLogin.Release;

  FiltrarMenuProcesso('FIN');

  Sleep(1000);

  if Assigned(frmSplash) then
    frmSplash.Free;

  Self.FormStyle := fsStayOnTop;
end;

procedure TFrmPrincipal.imgBtnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.
