inherited frmPrincipal: TfrmPrincipal
  Width = 187
  Height = 118
  Caption = 'Principal Trucho'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object DBLogin: TDBLogin
    DataBaseName = dmPrincipal.sdbPrincipal
    AutoEjecutar = False
    Top = 56
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    PermitirEdicion = False
    DBLogin = DBLogin
    Claves = <>
    Left = 28
    Top = 56
  end
end
