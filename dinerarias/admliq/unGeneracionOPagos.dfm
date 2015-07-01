object frmGeneracionOPagos: TfrmGeneracionOPagos
  Left = 344
  Top = 214
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Impresi'#243'n de liquidaci'#243'n Otros Pagos'
  ClientHeight = 196
  ClientWidth = 504
  Color = clBtnFace
  Constraints.MaxHeight = 223
  Constraints.MaxWidth = 512
  Constraints.MinHeight = 223
  Constraints.MinWidth = 512
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label72: TLabel
    Left = 8
    Top = 16
    Width = 83
    Height = 13
    Caption = 'Fecha de emisi'#243'n'
  end
  object Label73: TLabel
    Left = 8
    Top = 46
    Width = 105
    Height = 13
    Caption = 'Fecha de vencimiento'
  end
  object Bevel9: TBevel
    Left = 2
    Top = 158
    Width = 496
    Height = 6
    Shape = bsTopLine
  end
  object Label76: TLabel
    Left = 8
    Top = 84
    Width = 54
    Height = 13
    Caption = 'Paguese a:'
  end
  object Bevel1: TBevel
    Left = 2
    Top = 71
    Width = 496
    Height = 6
    Shape = bsTopLine
  end
  object Label77: TLabel
    Left = 8
    Top = 110
    Width = 49
    Height = 13
    Caption = 'Cheque a:'
  end
  object dcFEmisionOP: TDateComboBox
    Left = 118
    Top = 12
    Width = 88
    Height = 21
    TabStop = False
    Color = 15262169
    ReadOnly = True
    TabOrder = 0
  end
  object dcFVenciOP: TDateComboBox
    Left = 118
    Top = 42
    Width = 88
    Height = 21
    TabStop = False
    Color = 15262169
    ReadOnly = True
    TabOrder = 1
  end
  object gbCantCopiasOP: TGroupBox
    Left = 217
    Top = 4
    Width = 169
    Height = 61
    Caption = ' Cantidad de copias '
    TabOrder = 2
    object Label74: TLabel
      Left = 12
      Top = 40
      Width = 102
      Height = 13
      Caption = 'Recibo de liquidaci'#243'n'
    end
    object Label75: TLabel
      Left = 12
      Top = 18
      Width = 54
      Height = 13
      Caption = 'Liquidaci'#243'n'
    end
    object edCantRecOP: TIntEdit
      Left = 122
      Top = 36
      Width = 37
      Height = 21
      TabOrder = 1
      Text = '2'
      MaxLength = 2
      MaxValue = 9
      Value = 2
    end
    object edCantLiqOP: TIntEdit
      Left = 122
      Top = 12
      Width = 37
      Height = 21
      TabOrder = 0
      Text = '2'
      MaxLength = 2
      MaxValue = 9
      Value = 2
    end
  end
  object btnCerrarOP: TBitBtn
    Left = 421
    Top = 165
    Width = 75
    Height = 26
    Caption = '&Cerrar'
    TabOrder = 9
    Kind = bkCancel
  end
  object btnAceptarOP: TBitBtn
    Left = 340
    Top = 165
    Width = 75
    Height = 26
    Caption = '&Aceptar'
    Default = True
    TabOrder = 8
    OnClick = btnAceptarOPClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object edCuitPagueseOP: TMaskEdit
    Left = 68
    Top = 80
    Width = 89
    Height = 21
    Hint = 'CUIL del Trabajador'
    TabStop = False
    Color = 15262169
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 10
  end
  object edEmpresaPagueseOP: TEdit
    Left = 160
    Top = 80
    Width = 338
    Height = 21
    TabStop = False
    Color = 15262169
    ReadOnly = True
    TabOrder = 11
  end
  object edChequeOP: TEdit
    Left = 88
    Top = 108
    Width = 409
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 5
  end
  object GroupBox6: TGroupBox
    Left = 392
    Top = 4
    Width = 107
    Height = 61
    Caption = ' Tipo de impresi'#243'n '
    TabOrder = 3
    object rbVPreviaOP: TRadioButton
      Left = 12
      Top = 18
      Width = 81
      Height = 17
      Caption = 'Vista previa'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object rbImpresionOP: TRadioButton
      Left = 13
      Top = 39
      Width = 73
      Height = 17
      Caption = 'Impresi'#243'n'
      TabOrder = 1
    end
  end
  object rbChequeOP1: TRadioButton
    Left = 67
    Top = 111
    Width = 17
    Height = 17
    Checked = True
    TabOrder = 4
    TabStop = True
    OnClick = rbChequeOP1Click
  end
  object rbChequeOP2: TRadioButton
    Left = 67
    Top = 134
    Width = 17
    Height = 17
    TabOrder = 6
  end
  inline fraChequeOP: TfraCodDesc
    Left = 88
    Top = 131
    Width = 411
    Height = 23
    TabOrder = 7
    DesignSize = (
      411
      23)
    inherited cmbDescripcion: TArtComboBox
      Left = 60
      Width = 346
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO'
          Title.Caption = 'C'#243'digo'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPCION'
          Title.Caption = 'Descripci'#243'n'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AN_DESCEXTRA'
          Title.Caption = 'Desc. extra'
          Width = 80
          Visible = True
        end>
    end
    inherited edCodigo: TPatternEdit
      Width = 56
    end
    inherited Propiedades: TPropiedadesFrame
      CodigoType = ctInteger
      ExtraFields = ', an_descextra'
      FieldBaja = 'an_fechabaja'
      FieldCodigo = 'an_id'
      FieldDesc = 'an_descripcion'
      FieldID = 'an_id'
      TableName = 'can_chequeanombre'
    end
  end
  object FormStorage: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 11
    Top = 167
  end
end
