object DM: TDM
  Height = 353
  Width = 479
  PixelsPerInch = 96
  object UniConnection1: TUniConnection
    ProviderName = 'MySQL'
    Port = 3306
    Database = 'pos'
    Username = 'root'
    Server = 'localhost'
    Connected = True
    LoginPrompt = False
    Left = 80
    Top = 32
  end
  object MySQLUniProvider1: TMySQLUniProvider
    Left = 184
    Top = 32
  end
  object Qtemp: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      '')
    Left = 80
    Top = 96
  end
  object UniSQLMonitor1: TUniSQLMonitor
    Left = 288
    Top = 32
  end
  object Qtemp1: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'select * from')
    Left = 168
    Top = 96
  end
end
