unit uFuncoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  JvExStdCtrls, JvButton, JvCtrls, System.ImageList, Vcl.ImgList, Vcl.DBCtrls,
  Vcl.ComCtrls;

procedure CriarAba(aForm: TFormClass; aPageControl: TPageControl; aIndexImage: Integer);
function AbaExiste(aNomeAba: string; aPageControl: TPageControl): Boolean;
procedure FecharAba(aNomeAba: string; aPageControl: TPageControl);
procedure ButtonMouseEnter(Sender: TObject; ImageIndex: Integer);
procedure ButtonMouseLeave(Sender: TObject; ImageIndex: Integer);

implementation

procedure CriarAba(aForm: TFormClass; aPageControl: TPageControl; aIndexImage: Integer);
var
  TabSheet: TTabSheet;
  Form: TForm;
begin
  Form := aForm.Create(nil);

  if AbaExiste(Form.Caption, aPageControl) then
  begin
    if Assigned(Form) then
      FreeAndNil(Form);
    exit;
  end;

  TabSheet := TTabSheet.Create(nil);
  TabSheet.PageControl := aPageControl;
  TabSheet.Caption := Form.Caption;
  TabSheet.ImageIndex := aIndexImage;

  Form.Align := alClient;
  Form.BorderStyle := bsNone;
  Form.Parent := TabSheet;
  Form.Show;

  aPageControl.ActivePage := TabSheet;
end;

function AbaExiste(aNomeAba: string; aPageControl: TPageControl): Boolean;
var
  i: Integer;
begin
  Result := false;

  for i := 0 to aPageControl.PageCount - 1 do
  begin
    if LowerCase(aPageControl.Pages[i].Caption) = LowerCase(aNomeAba) then
    begin
      aPageControl.ActivePage := aPageControl.Pages[i];
      aPageControl.TabIndex := i;
      Result := true;
      break;
    end;
  end;
end;

procedure FecharAba(aNomeAba: string; aPageControl: TPageControl);
var
  i: Integer;
begin
  for i := 0 to aPageControl.PageCount - 1 do
  begin
    if LowerCase(aPageControl.Pages[i].Caption) = LowerCase(aNomeAba) then
    begin
      aPageControl.Pages[i].Destroy;
      aPageControl.ActivePageIndex := 0;
      break;
    end;
  end;
end;

procedure ButtonMouseEnter(Sender: TObject; ImageIndex: Integer);
begin
  (Sender as TJvImgBtn).ImageIndex := ImageIndex;
  (Sender as TJvImgBtn).Cursor := CrHandPoint;
end;

procedure ButtonMouseLeave(Sender: TObject;
  ImageIndex: Integer);
begin
  (Sender as TJvImgBtn).ImageIndex := ImageIndex;
  (Sender as TJvImgBtn).Cursor := crDefault;
end;

end.
