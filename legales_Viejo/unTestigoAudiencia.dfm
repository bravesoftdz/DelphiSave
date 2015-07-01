inherited frmTestigoAudiencia: TfrmTestigoAudiencia
  Left = 546
  Top = 263
  Width = 523
  Height = 168
  Caption = 'Testigos Audiencia'
  Constraints.MinHeight = 168
  Constraints.MinWidth = 523
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object BevelAbm: TBevel [0]
    Left = 3
    Top = 101
    Width = 506
    Height = 1
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
  end
  object Testigo: TLabel [1]
    Left = 11
    Top = 13
    Width = 35
    Height = 13
    Caption = 'Testigo'
  end
  object Label1: TLabel [2]
    Left = 16
    Top = 42
    Width = 71
    Height = 13
    Caption = 'F.Presentaci'#243'n'
  end
  object Label2: TLabel [3]
    Left = 16
    Top = 68
    Width = 91
    Height = 13
    Caption = 'Hora Presentaci'#243'n:'
  end
  object btnAceptar: TButton [4]
    Left = 352
    Top = 107
    Width = 75
    Height = 24
    Anchors = [akRight, akBottom]
    Caption = '&Aceptar'
    TabOrder = 3
    OnClick = btnAceptarClick
  end
  object btnCancelar: TButton [5]
    Left = 432
    Top = 107
    Width = 75
    Height = 24
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 4
  end
  inline fraTestigo: TfraCodigoDescripcion [6]
    Left = 108
    Top = 8
    Width = 403
    Height = 23
    TabOrder = 0
    inherited cmbDescripcion: TArtComboBox
      Width = 339
      Height = 20
    end
  end
  object edHora: TDateTimePicker [7]
    Left = 110
    Top = 63
    Width = 68
    Height = 21
    Date = 37372.000000000000000000
    Time = 37372.000000000000000000
    DateMode = dmUpDown
    Kind = dtkTime
    TabOrder = 2
  end
  object edFechaPresentacion: TDateComboBox [8]
    Left = 110
    Top = 36
    Width = 88
    Height = 21
    Weekends = [Sun, Sat]
    TabOrder = 1
  end
  inherited FormStorage: TFormStorage [9]
    Left = 432
    Top = 40
  end
  inherited XPMenu: TXPMenu [10]
    Left = 460
    Top = 40
  end
  inherited ilByN: TImageList [11]
    Left = 432
    Top = 68
  end
  inherited ilColor: TImageList [12]
    Left = 460
    Top = 68
  end
  inherited IconosXP: TImageList
    Left = 488
    Top = 68
  end
  object sdqTestigo: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT a.*, se_nombre'
      '  FROM legales.lat_audienciatestigo a, art.use_usuarios'
      ' WHERE at_idusuario = se_id'
      '   AND at_id = :idtestigo')
    Left = 486
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idtestigo'
        ParamType = ptInput
      end>
  end
end
