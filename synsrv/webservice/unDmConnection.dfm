object dmConnection: TdmConnection
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 353
  Top = 193
  Height = 150
  Width = 215
  object Connection: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=xxx;Persist Security Info=True;User' +
      ' ID=pmarrone;Initial Catalog=Legales;Data Source=PC405;Use Proce' +
      'dure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstat' +
      'ion ID=PC405;Use Encryption for Data=False;Tag with column colla' +
      'tion when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 16
  end
end
