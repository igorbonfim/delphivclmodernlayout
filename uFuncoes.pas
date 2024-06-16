unit uFuncoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uHerancaBase, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  JvExStdCtrls, JvButton, JvCtrls, System.ImageList, Vcl.ImgList, Vcl.DBCtrls,
  uHerancaCadastro, Vcl.ComCtrls;

procedure CriarAba(aForm: TFormClass; aPageControl: TPageControl; aIndexImage: Integer);

implementation

procedure CriarAba(aForm: TFormClass; aPageControl: TPageControl; aIndexImage: Integer);
var
  TabSheet: TTabSheet;
  Form: TForm;
begin
  Form := aForm.Create(nil);

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

end.
