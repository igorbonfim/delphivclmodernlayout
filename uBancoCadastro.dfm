inherited FrmBancoCadastro: TFrmBancoCadastro
  Caption = 'Cadastro de Banco'
  TextHeight = 15
  inherited pnlHeader: TPanel
    inherited lblTitulo: TLabel
      Width = 102
      Caption = 'Cadastro de Banco'
      ExplicitWidth = 102
    end
  end
  inherited pnlPrincipal: TPanel
    object Label1: TLabel [0]
      Left = 9
      Top = 24
      Width = 18
      Height = 15
      Caption = '#ID'
      FocusControl = DBEdit1
    end
    object Label2: TLabel [1]
      Left = 9
      Top = 72
      Width = 61
      Height = 15
      Caption = 'Cod. Banco'
      FocusControl = DBEdit2
    end
    object Label3: TLabel [2]
      Left = 9
      Top = 120
      Width = 51
      Height = 15
      Caption = 'Descri'#231#227'o'
      FocusControl = DBEdit3
    end
    object Label4: TLabel [3]
      Left = 9
      Top = 168
      Width = 19
      Height = 15
      Caption = 'Site'
      FocusControl = DBEdit4
    end
    object DBEdit1: TDBEdit
      Tag = 81
      Left = 9
      Top = 40
      Width = 154
      Height = 23
      DataField = 'BancoId'
      DataSource = dtsCadastro
      Enabled = False
      TabOrder = 1
    end
    object DBEdit2: TDBEdit
      Left = 9
      Top = 88
      Width = 49
      Height = 23
      DataField = 'CodBanco'
      DataSource = dtsCadastro
      TabOrder = 2
    end
    object DBEdit3: TDBEdit
      Left = 9
      Top = 136
      Width = 450
      Height = 23
      DataField = 'DescBanco'
      DataSource = dtsCadastro
      TabOrder = 3
    end
    object DBEdit4: TDBEdit
      Left = 9
      Top = 184
      Width = 450
      Height = 23
      DataField = 'WebSite'
      DataSource = dtsCadastro
      TabOrder = 4
    end
  end
  inherited QryCadastro: TZQuery
    SQL.Strings = (
      'SELECT * FROM BANCO WHERE BANCOID = :BANCOID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'BANCOID'
        ParamType = ptUnknown
      end>
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BANCOID'
        ParamType = ptUnknown
      end>
    object QryCadastroBancoId: TIntegerField
      DisplayLabel = '#ID'
      FieldName = 'BancoId'
      ReadOnly = True
    end
    object QryCadastroCodBanco: TWideStringField
      DisplayLabel = 'Cod. Banco'
      FieldName = 'CodBanco'
      Required = True
      Size = 3
    end
    object QryCadastroDescBanco: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DescBanco'
      Required = True
      Size = 50
    end
    object QryCadastroWebSite: TWideStringField
      DisplayLabel = 'Site'
      FieldName = 'WebSite'
      Size = 100
    end
  end
  inherited updCadastro: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM BANCO'
      'WHERE'
      
        '  ((BANCO.BancoId IS NULL AND :OLD_BancoId IS NULL) OR (BANCO.Ba' +
        'ncoId = :OLD_BancoId))')
    InsertSQL.Strings = (
      'INSERT INTO BANCO'
      '  (CodBanco, DescBanco, WebSite)'
      'VALUES'
      '  (:CodBanco, :DescBanco, :WebSite)')
    ModifySQL.Strings = (
      'UPDATE BANCO SET'
      '  CodBanco = :CodBanco,'
      '  DescBanco = :DescBanco,'
      '  WebSite = :WebSite'
      'WHERE'
      
        '  ((BANCO.BancoId IS NULL AND :OLD_BancoId IS NULL) OR (BANCO.Ba' +
        'ncoId = :OLD_BancoId))')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CodBanco'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DescBanco'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WebSite'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_BancoId'
        ParamType = ptUnknown
      end>
  end
end
