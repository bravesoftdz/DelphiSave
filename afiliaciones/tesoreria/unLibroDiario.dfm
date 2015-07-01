object frmLibroDiario: TfrmLibroDiario
  Left = 512
  Top = 261
  Width = 254
  Height = 120
  BorderIcons = []
  Caption = 'Libro Diario'
  Color = clBtnFace
  Constraints.MaxHeight = 120
  Constraints.MaxWidth = 254
  Constraints.MinHeight = 120
  Constraints.MinWidth = 254
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbPediodo: TLabel
    Left = 11
    Top = 26
    Width = 106
    Height = 13
    Caption = 'Periodo del libro Diario'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnAceptar: TButton
    Left = 93
    Top = 59
    Width = 69
    Height = 25
    Caption = '&Aceptar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnAceptarClick
  end
  object btnCancelar: TButton
    Left = 162
    Top = 59
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 1
  end
  object cmbPeriodo: TRxDBLookupCombo
    Left = 130
    Top = 22
    Width = 108
    Height = 21
    DropDownCount = 8
    LookupField = 'PERIOD_NAME'
    LookupDisplay = 'PERIOD_NAME'
    LookupSource = dsConsulta
    TabOrder = 2
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbfinancials'
    Options = []
    SQL.Strings = (
      'select period_name, TO_CHAR( END_DATE, '#39'YYYYMM'#39' ) AS PERIODO'
      'from gl_period_statuses'
      'where closing_status = '#39'C'#39
      'and application_id = 101'
      'and set_of_books_id = 1'
      'order by period_year desc, period_num desc')
    Left = 11
    Top = 55
  end
  object dsConsulta: TDataSource
    DataSet = sdqConsulta
    Left = 39
    Top = 55
  end
end
