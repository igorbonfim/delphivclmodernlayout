object dtmConexao: TdtmConexao
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object SQLConnection: TZConnection
    ControlsCodePage = cCP_UTF16
    AutoEncodeStrings = True
    Catalog = ''
    Properties.Strings = (
      'controls_cp=CP_UTF16')
    TransactIsolationLevel = tiReadCommitted
    HostName = '.'
    Port = 0
    Database = 'dbLayoutModerno'
    User = 'sa'
    Password = ''
    Protocol = 'mssql'
    LibraryLocation = 
      'C:\Projetos\Sistema Delphi com Layout Moderno - Udemy\ntwdblib.d' +
      'll'
    Left = 56
    Top = 24
  end
end
