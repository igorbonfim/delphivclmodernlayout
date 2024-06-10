unit uHerancaBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls;

type
  TFrmHerancaBase = class(TForm)
    pnlHeader: TPanel;
    pnlHeaderLineTop: TPanel;
    pnlHeaderLineLeft: TPanel;
    pnlHeaderLineRight: TPanel;
    pnlFormLineLeft: TPanel;
    pnlFormLineRight: TPanel;
    pnlFormLineBottom: TPanel;
    imgBtnClose: TImage;
    pnlHeaderLineGray: TPanel;
    lblTitulo: TLabel;
    procedure imgBtnCloseClick(Sender: TObject);
    procedure pnlHeaderMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmHerancaBase: TFrmHerancaBase;

implementation

{$R *.dfm}

procedure TFrmHerancaBase.FormShow(Sender: TObject);
begin
  if Self.Caption <> EmptyStr then
    lblTitulo.Caption := Self.Caption;
end;

procedure TFrmHerancaBase.imgBtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmHerancaBase.pnlHeaderMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
  SC_DRAG_MOVE = $F012;
begin
  if Button = mbleft then
  begin
    ReleaseCapture;
    Self.Perform(WM_SYSCOMMAND, SC_DRAG_MOVE, 0);
  end;
end;

end.
