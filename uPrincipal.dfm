object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Menu Principal'
  ClientHeight = 632
  ClientWidth = 935
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  WindowState = wsMaximized
  OnShow = FormShow
  TextHeight = 15
  object pnlPrincipalLeft: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 632
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 64
      Top = 80
      Width = 75
      Height = 25
      Caption = 'BitBtn1'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
  end
  object pnlPrincipalCenter: TPanel
    Left = 185
    Top = 0
    Width = 750
    Height = 632
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object pnlPrincipalCenterLeft: TPanel
      Left = 0
      Top = 10
      Width = 10
      Height = 612
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
    end
    object pnlPrincipalCenterRight: TPanel
      Left = 740
      Top = 10
      Width = 10
      Height = 612
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
    end
    object pnlPrincipalCenterTop: TPanel
      Left = 0
      Top = 0
      Width = 750
      Height = 10
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
    end
    object pnlPrincipalCenterBottom: TPanel
      Left = 0
      Top = 622
      Width = 750
      Height = 10
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 3
    end
    object pgcPrincipal: TPageControl
      Left = 10
      Top = 10
      Width = 730
      Height = 612
      ActivePage = tbsMenu
      Align = alClient
      TabOrder = 4
      object tbsMenu: TTabSheet
        Caption = 'Menu'
      end
    end
  end
end
