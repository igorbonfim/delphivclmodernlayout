inherited FrmCartaoCadastro: TFrmCartaoCadastro
  Caption = 'FrmCartaoCadastro'
  ClientHeight = 201
  ClientWidth = 515
  ExplicitWidth = 515
  ExplicitHeight = 201
  TextHeight = 15
  inherited pnlHeader: TPanel
    Width = 515
    ExplicitWidth = 515
    inherited imgBtnClose: TImage
      Left = 492
      ExplicitLeft = 591
    end
    inherited pnlHeaderLineTop: TPanel
      Width = 515
      ExplicitWidth = 515
    end
    inherited pnlHeaderLineRight: TPanel
      Left = 514
      ExplicitLeft = 514
    end
    inherited pnlHeaderLineGray: TPanel
      Width = 496
      ExplicitWidth = 496
    end
  end
  inherited pnlFormLineLeft: TPanel
    Height = 170
    ExplicitHeight = 170
  end
  inherited pnlFormLineRight: TPanel
    Left = 514
    Height = 170
    ExplicitLeft = 514
    ExplicitHeight = 170
  end
  inherited pnlFormLineBottom: TPanel
    Top = 200
    Width = 515
    ExplicitTop = 200
    ExplicitWidth = 515
  end
  inherited pnlPrincipal: TPanel
    Width = 513
    Height = 170
    ExplicitWidth = 513
    ExplicitHeight = 170
    object Label1: TLabel [0]
      Left = 16
      Top = 16
      Width = 11
      Height = 15
      Caption = 'ID'
      FocusControl = DBEdit1
    end
    object Label2: TLabel [1]
      Left = 16
      Top = 64
      Width = 51
      Height = 15
      Caption = 'Descri'#231#227'o'
      FocusControl = DBEdit2
    end
    inherited pnlPrincipalBottom: TPanel
      Top = 121
      Width = 513
      ExplicitTop = 121
      ExplicitWidth = 513
    end
    object DBEdit1: TDBEdit
      Tag = 81
      Left = 16
      Top = 32
      Width = 90
      Height = 23
      DataField = 'cartaoId'
      DataSource = dtsCadastro
      Enabled = False
      TabOrder = 1
    end
    object DBEdit2: TDBEdit
      Left = 16
      Top = 82
      Width = 454
      Height = 23
      DataField = 'descricaoCartao'
      DataSource = dtsCadastro
      TabOrder = 2
    end
  end
  inherited QryCadastro: TZQuery
    SQL.Strings = (
      'SELECT * FROM Cartao WHERE cartaoId = :cartaoId')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cartaoId'
        ParamType = ptUnknown
      end>
    Left = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cartaoId'
        ParamType = ptUnknown
      end>
    object QryCadastrocartaoId: TIntegerField
      FieldName = 'cartaoId'
      ReadOnly = True
    end
    object QryCadastrodescricaoCartao: TWideStringField
      FieldName = 'descricaoCartao'
      Required = True
      Size = 30
    end
  end
  inherited updCadastro: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM Cartao'
      'WHERE'
      
        '  ((Cartao.cartaoId IS NULL AND :OLD_cartaoId IS NULL) OR (Carta' +
        'o.cartaoId = :OLD_cartaoId))')
    InsertSQL.Strings = (
      'INSERT INTO Cartao'
      '  (cartaoId, descricaoCartao)'
      'VALUES'
      '  (:cartaoId, :descricaoCartao)')
    ModifySQL.Strings = (
      'UPDATE Cartao SET'
      '  cartaoId = :cartaoId,'
      '  descricaoCartao = :descricaoCartao'
      'WHERE'
      
        '  ((Cartao.cartaoId IS NULL AND :OLD_cartaoId IS NULL) OR (Carta' +
        'o.cartaoId = :OLD_cartaoId))')
    Left = 289
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cartaoId'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'descricaoCartao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_cartaoId'
        ParamType = ptUnknown
      end>
  end
  inherited dtsCadastro: TDataSource
    Left = 369
  end
end
