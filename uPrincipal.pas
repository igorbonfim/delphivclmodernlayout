unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSplash;

type
  TFrmPrincipal = class(TForm)
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  frmSplash := TfrmSplash.Create(Self);
  frmSplash.Show;
  frmSplash.Refresh;
  Sleep(3000);

  if Assigned(frmSplash) then
    frmSplash.Free;
end;

end.
