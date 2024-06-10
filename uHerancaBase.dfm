object FrmHerancaBase: TFrmHerancaBase
  Left = 0
  Top = 0
  Hint = 'pnlHeaderMouseDown'
  BorderStyle = bsNone
  Caption = 'Coloque o T'#237'TULO AQUI'
  ClientHeight = 476
  ClientWidth = 656
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 656
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    OnMouseDown = pnlHeaderMouseDown
    ExplicitWidth = 657
    DesignSize = (
      656
      30)
    object imgBtnClose: TImage
      Left = 633
      Top = 7
      Width = 16
      Height = 16
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      AutoSize = True
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
        00100804000000B5FA37EA0000000467414D410000B18F0BFC61050000000262
        4B47440000AA8D2332000000097048597300000EC400000EC401952B0E1B0000
        000774494D4507E30C14172A35663E53BB000000914944415478DA95913B0EC2
        301044DF9E85B305508A04E8E0045024CA87EFE1B8077458B623AF6111C295BD
        F3648F6784863B67EC55321356B4D48C865C7063276E632373AE6C39883F2C39
        396CCCE40B1B7A903858381F6B867739011A51B20626E499DD950150D179D343
        1AFD0584271EDA8106D2574D93795831A4047C66E963661F003BEA8884B22A8E
        DFCBFA51F70BBFDE381B45DC79610000002574455874646174653A6372656174
        6500323031392D31322D32305432333A34323A35332B30303A3030807DAF5A00
        00002574455874646174653A6D6F6469667900323031392D31322D3230543233
        3A34323A35332B30303A3030F12017E60000001974455874536F667477617265
        007777772E696E6B73636170652E6F72679BEE3C1A0000000049454E44AE4260
        82}
      OnClick = imgBtnCloseClick
      ExplicitLeft = 634
    end
    object lblTitulo: TLabel
      Left = 7
      Top = 8
      Width = 110
      Height = 15
      Caption = 'Digite o t'#237'tulo da tela'
      OnMouseDown = pnlHeaderMouseDown
    end
    object pnlHeaderLineTop: TPanel
      Left = 0
      Top = 0
      Width = 656
      Height = 1
      Align = alTop
      BevelOuter = bvNone
      Color = clBlack
      ParentBackground = False
      TabOrder = 0
      ExplicitWidth = 640
    end
    object pnlHeaderLineLeft: TPanel
      Left = 0
      Top = 1
      Width = 1
      Height = 29
      Align = alLeft
      BevelOuter = bvNone
      Color = clBlack
      ParentBackground = False
      TabOrder = 1
      ExplicitHeight = 640
    end
    object pnlHeaderLineRight: TPanel
      Left = 655
      Top = 1
      Width = 1
      Height = 29
      Align = alRight
      BevelOuter = bvNone
      Color = clBlack
      ParentBackground = False
      TabOrder = 2
      ExplicitLeft = 0
      ExplicitTop = 40
      ExplicitHeight = 640
    end
    object pnlHeaderLineGray: TPanel
      Left = 10
      Top = 27
      Width = 637
      Height = 1
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvNone
      Color = clSilver
      ParentBackground = False
      TabOrder = 3
      ExplicitWidth = 634
    end
  end
  object pnlFormLineLeft: TPanel
    Left = 0
    Top = 30
    Width = 1
    Height = 445
    Align = alLeft
    BevelOuter = bvNone
    Color = clBlack
    ParentBackground = False
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = 9
    ExplicitHeight = 40
  end
  object pnlFormLineRight: TPanel
    Left = 655
    Top = 30
    Width = 1
    Height = 445
    Align = alRight
    BevelOuter = bvNone
    Color = clBlack
    ParentBackground = False
    TabOrder = 2
    ExplicitLeft = 656
    ExplicitTop = 41
    ExplicitHeight = 1
  end
  object pnlFormLineBottom: TPanel
    Left = 0
    Top = 475
    Width = 656
    Height = 1
    Align = alBottom
    BevelOuter = bvNone
    Color = clBlack
    ParentBackground = False
    TabOrder = 3
    ExplicitTop = 8
    ExplicitWidth = 657
  end
end
