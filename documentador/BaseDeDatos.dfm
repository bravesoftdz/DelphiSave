object DM_BaseDeDatos: TDM_BaseDeDatos
  OldCreateOrder = True
  Left = 339
  Top = 199
  Height = 153
  Width = 221
  object BaseDeDatos: TSDDatabase
    LoginPrompt = False
    DatabaseName = 'BaseDeDatos'
    Params.Strings = (
      'USER NAME=ART'
      'PASSWORD=FFOP')
    RemoteDatabase = 'PART'
    ServerType = stOracle
    SessionName = 'Default'
    Left = 18
    Top = 8
  end
  object SDQ_ValorSql: TSDQuery
    DatabaseName = 'basededatos'
    Options = []
    UpdateObject = Sql_Ejecutar
    Left = 84
    Top = 8
  end
  object Sql_Ejecutar: TSDUpdateSQL
    Left = 12
    Top = 60
  end
  object UpdateSQL1: TUpdateSQL
    Left = 84
    Top = 60
  end
  object SDQuery: TSDQuery
    DatabaseName = 'basededatos'
    Options = []
    Left = 152
    Top = 8
  end
end
