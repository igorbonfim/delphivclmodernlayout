inherited frmCartaoListagem: TfrmCartaoListagem
  Caption = 'Cadastro de Cart'#227'o'
  TextHeight = 15
  inherited pnlHeader: TPanel
    inherited lblTitulo: TLabel
      Width = 104
      Caption = 'Cadastro de Cart'#227'o'
      ExplicitWidth = 104
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
      Columns = <
        item
          Expanded = False
          FieldName = 'cartaoId'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricaoCartao'
          Width = 689
          Visible = True
        end>
    end
  end
  inherited QryListagem: TZQuery
    SortedFields = 'descricaoCartao'
    SQL.Strings = (
      'SELECT cartaoId, descricaoCartao FROM Cartao')
    IndexFieldNames = 'descricaoCartao Asc'
    object QryListagemcartaoId: TIntegerField
      DisplayLabel = '#ID'
      FieldName = 'cartaoId'
      ReadOnly = True
    end
    object QryListagemdescricaoCartao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricaoCartao'
      Required = True
      Size = 30
    end
  end
end
