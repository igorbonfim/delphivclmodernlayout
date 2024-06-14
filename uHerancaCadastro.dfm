inherited FrmHerancaCadastro: TFrmHerancaCadastro
  Caption = ''
  TextHeight = 15
  object pnlPrincipal: TPanel [4]
    Left = 1
    Top = 30
    Width = 654
    Height = 445
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 4
    object pnlPrincipalBottom: TPanel
      Left = 0
      Top = 396
      Width = 654
      Height = 49
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object btnCancelar: TJvImgBtn
        Left = 6
        Top = 7
        Width = 100
        Height = 36
        ImageIndex = 7
        Images = imgButtons
        TabOrder = 0
        OnMouseEnter = btnCancelarMouseEnter
        OnMouseLeave = btnCancelarMouseLeave
      end
      object btnGravar: TJvImgBtn
        Left = 112
        Top = 7
        Width = 100
        Height = 36
        ImageIndex = 5
        Images = imgButtons
        TabOrder = 1
        OnMouseEnter = btnGravarMouseEnter
        OnMouseLeave = btnGravarMouseLeave
      end
      object btmApagar: TJvImgBtn
        Left = 218
        Top = 7
        Width = 100
        Height = 36
        ImageIndex = 9
        Images = imgButtons
        TabOrder = 2
        OnMouseEnter = btmApagarMouseEnter
        OnMouseLeave = btmApagarMouseLeave
      end
    end
  end
end
