inherited FrmBancoListagem: TFrmBancoListagem
  Caption = 'Cadastro de Banco'
  TextHeight = 15
  inherited pnlHeader: TPanel
    inherited lblTitulo: TLabel
      Width = 102
      Caption = 'Cadastro de Banco'
      ExplicitWidth = 102
    end
  end
  inherited pnlFormPrincipal: TPanel
    inherited pnlFormPrincipalTop: TPanel
      inherited btnNovo: TJvImgBtn
        OnClick = btnNovoClick
      end
      inherited btnModificar: TJvImgBtn
        OnClick = btnModificarClick
      end
      inherited btmApagar: TJvImgBtn
        OnClick = btmApagarClick
      end
    end
    inherited pnlFormPrincipalBottom: TPanel
      inherited DBNavigator1: TDBNavigator
        Hints.Strings = ()
      end
    end
    inherited grdListagem: TDBGrid
      OnDblClick = btnModificarClick
      Columns = <
        item
          Expanded = False
          FieldName = 'BancoId'
          Title.Caption = 'ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CodBanco'
          Title.Caption = 'C'#243'd. Banco'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DescBanco'
          Title.Caption = 'Nome'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'WebSite'
          Visible = True
        end>
    end
  end
  inherited QryListagem: TZQuery
    SQL.Strings = (
      'SELECT * FROM BANCO')
    object QryListagemBancoId: TIntegerField
      FieldName = 'BancoId'
      ReadOnly = True
    end
    object QryListagemCodBanco: TWideStringField
      FieldName = 'CodBanco'
      Required = True
      Size = 3
    end
    object QryListagemDescBanco: TWideStringField
      FieldName = 'DescBanco'
      Required = True
      Size = 50
    end
    object QryListagemWebSite: TWideStringField
      FieldName = 'WebSite'
      Size = 100
    end
  end
end
