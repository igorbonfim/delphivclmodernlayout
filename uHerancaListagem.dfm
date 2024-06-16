inherited FrmHerancaListagem: TFrmHerancaListagem
  Caption = 'Digite o titulo da tela aqui'
  ClientHeight = 688
  ClientWidth = 1151
  OnClose = FormClose
  ExplicitWidth = 1151
  ExplicitHeight = 688
  TextHeight = 15
  inherited pnlHeader: TPanel
    Width = 1151
    ExplicitWidth = 1151
    inherited imgBtnClose: TImage
      Left = 1128
      ExplicitLeft = 1136
    end
    inherited pnlHeaderLineTop: TPanel
      Width = 1151
      ExplicitWidth = 1151
    end
    inherited pnlHeaderLineRight: TPanel
      Left = 1150
      ExplicitLeft = 1150
    end
    inherited pnlHeaderLineGray: TPanel
      Width = 1132
      ExplicitWidth = 1132
    end
  end
  inherited pnlFormLineLeft: TPanel
    Height = 657
    ExplicitHeight = 657
  end
  inherited pnlFormLineRight: TPanel
    Left = 1150
    Height = 657
    ExplicitLeft = 1150
    ExplicitHeight = 657
  end
  inherited pnlFormLineBottom: TPanel
    Top = 687
    Width = 1151
    ExplicitTop = 687
    ExplicitWidth = 1151
  end
  object pnlFormPrincipal: TPanel [4]
    Left = 1
    Top = 30
    Width = 1149
    Height = 657
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 4
    object pnlFormPrincipalTop: TPanel
      Left = 0
      Top = 0
      Width = 1149
      Height = 70
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        1149
        70)
      object lblPesquisarPor: TLabel
        Left = 9
        Top = 19
        Width = 74
        Height = 15
        Caption = 'Pesquisar por'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object pnlLineTop: TPanel
        Left = 0
        Top = 69
        Width = 1149
        Height = 1
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
      end
      object mskPesquisar: TMaskEdit
        Left = 6
        Top = 35
        Width = 435
        Height = 23
        TabOrder = 1
        Text = ''
        TextHint = 'Digite sua pesquisa'
      end
      object btnNovo: TJvImgBtn
        Left = 835
        Top = 28
        Width = 100
        Height = 36
        Anchors = [akTop, akRight]
        ImageIndex = 1
        Images = imgButtons
        TabOrder = 2
        OnClick = btnNovoClick
        OnMouseEnter = btnNovoMouseEnter
        OnMouseLeave = btnNovoMouseLeave
      end
      object btnModificar: TJvImgBtn
        Left = 941
        Top = 28
        Width = 100
        Height = 36
        Anchors = [akTop, akRight]
        ImageIndex = 3
        Images = imgButtons
        TabOrder = 3
        OnMouseEnter = btnModificarMouseEnter
        OnMouseLeave = btnModificarMouseLeave
      end
      object btmApagar: TJvImgBtn
        Left = 1043
        Top = 28
        Width = 100
        Height = 36
        Anchors = [akTop, akRight]
        ImageIndex = 9
        Images = imgButtons
        TabOrder = 4
        OnMouseEnter = btmApagarMouseEnter
        OnMouseLeave = btmApagarMouseLeave
      end
    end
    object pnlFormPrincipalBottom: TPanel
      Left = 0
      Top = 608
      Width = 1149
      Height = 49
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        1149
        49)
      object pnlLineBottom: TPanel
        Left = 0
        Top = 0
        Width = 1149
        Height = 1
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
      end
      object DBNavigator1: TDBNavigator
        Left = 9
        Top = 6
        Width = 224
        Height = 36
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        TabOrder = 1
      end
      object btnFechar: TJvImgBtn
        Left = 1043
        Top = 6
        Width = 100
        Height = 36
        Anchors = [akTop, akRight]
        ImageIndex = 11
        Images = imgButtons
        TabOrder = 2
        OnClick = btnFecharClick
        OnMouseEnter = btnFecharMouseEnter
        OnMouseLeave = btnFecharMouseLeave
      end
    end
    object grdListagem: TDBGrid
      Left = 0
      Top = 70
      Width = 1149
      Height = 538
      Align = alClient
      BorderStyle = bsNone
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
  inherited imgButtons: TImageList
    Left = 560
    Top = 120
  end
end
