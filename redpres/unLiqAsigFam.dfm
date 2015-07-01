object frmLiqAsigFam: TfrmLiqAsigFam
  Left = 265
  Top = 158
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Liquidación de Asignaciones Familiares'
  ClientHeight = 347
  ClientWidth = 458
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel3: TBevel
    Left = 6
    Top = 305
    Width = 447
    Height = 2
  end
  object Label12: TLabel
    Left = 179
    Top = 325
    Width = 85
    Height = 13
    Caption = 'Total liquidado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnAceptar: TBitBtn
    Left = 9
    Top = 316
    Width = 76
    Height = 28
    Caption = '&Aceptar'
    Default = True
    TabOrder = 5
    OnClick = btnAceptarClick
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
  object btnCancelar: TBitBtn
    Left = 366
    Top = 316
    Width = 85
    Height = 28
    Caption = '&Cancelar'
    TabOrder = 7
    OnClick = btnCancelarClick
    Kind = bkCancel
  end
  object btnLiquidar: TBitBtn
    Left = 93
    Top = 316
    Width = 76
    Height = 28
    Caption = '&Liquidar'
    TabOrder = 6
    OnClick = btnLiquidarClick
  end
  object gbUbicDenuncia: TGroupBox
    Left = 8
    Top = 8
    Width = 329
    Height = 185
    Caption = ' Datos de la ubicación de la denuncia '
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 29
      Width = 65
      Height = 13
      Caption = 'Código Postal'
    end
    object Label2: TLabel
      Left = 29
      Top = 56
      Width = 44
      Height = 13
      Caption = 'Provincia'
    end
    object Label3: TLabel
      Left = 27
      Top = 82
      Width = 46
      Height = 13
      Caption = 'Localidad'
    end
    object Label4: TLabel
      Left = 193
      Top = 28
      Width = 30
      Height = 13
      Caption = 'C.P.A.'
    end
    object Bevel1: TBevel
      Left = 6
      Top = 109
      Width = 310
      Height = 2
    end
    object Label5: TLabel
      Left = 6
      Top = 159
      Width = 46
      Height = 13
      Caption = 'Localidad'
    end
    object Label6: TLabel
      Left = 19
      Top = 128
      Width = 33
      Height = 13
      Caption = 'Partido'
    end
    object edCodPostal: TEdit
      Left = 85
      Top = 24
      Width = 81
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object edCPA: TEdit
      Left = 232
      Top = 24
      Width = 82
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object edProv: TEdit
      Left = 85
      Top = 51
      Width = 29
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
    end
    object edDescProv: TEdit
      Left = 117
      Top = 51
      Width = 197
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
    end
    object edLocalidad: TEdit
      Left = 85
      Top = 78
      Width = 229
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
    end
    object cmbLocalidad: TArtComboBox
      Left = 56
      Top = 155
      Width = 265
      Height = 21
      CharCase = ecUpperCase
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 30
      NumGlyphs = 1
      TabOrder = 6
      Columns = <
        item
          Expanded = False
          FieldName = 'LOCALIDADES'
          ReadOnly = True
          Title.Caption = 'Localidades'
          Width = 200
          Visible = True
        end>
      DataSource = dsLocalidad
      FieldList = 'LOCALIDADES'
      FieldKey = 'LOCALIDADES'
      OnCloseUp = cmbLocalidadCloseUp
      OnDropDown = cmbLocalidadDropDown
      ClearOnCancel = True
    end
    object cmbPartidos: TArtComboBox
      Left = 56
      Top = 123
      Width = 265
      Height = 21
      CharCase = ecUpperCase
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 5
      Columns = <
        item
          Expanded = False
          FieldName = 'PARTIDO'
          ReadOnly = True
          Title.Caption = 'Partidos'
          Visible = True
        end>
      DataSource = dsPartidos
      FieldList = 'PARTIDO'
      FieldKey = 'PARTIDO'
      OnDropDown = cmbPartidosDropDown
    end
  end
  object gbCalculoAsigFam: TGroupBox
    Left = 8
    Top = 197
    Width = 329
    Height = 101
    Caption = ' Cálculo de las asignaciones familiares '
    TabOrder = 1
    object Label7: TLabel
      Left = 79
      Top = 23
      Width = 18
      Height = 13
      Caption = 'Hijo'
    end
    object Label8: TLabel
      Left = 8
      Top = 49
      Width = 87
      Height = 13
      Caption = 'Hijo discapacitado'
    end
    object Label9: TLabel
      Left = 30
      Top = 76
      Width = 67
      Height = 13
      Caption = 'Ayuda escolar'
    end
    object Label10: TLabel
      Left = 207
      Top = 23
      Width = 39
      Height = 13
      Caption = 'Prenatal'
    end
    object Label11: TLabel
      Left = 193
      Top = 49
      Width = 53
      Height = 13
      Caption = 'Maternidad'
    end
    object edAsigHijo: TCurrencyEdit
      Left = 103
      Top = 20
      Width = 66
      Height = 20
      TabStop = False
      AutoSize = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object edAsigHijoDisc: TCurrencyEdit
      Left = 103
      Top = 46
      Width = 66
      Height = 20
      TabStop = False
      AutoSize = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object edAsigAyuda: TCurrencyEdit
      Left = 103
      Top = 72
      Width = 66
      Height = 20
      TabStop = False
      AutoSize = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
    end
    object edAsigPrenatal: TCurrencyEdit
      Left = 253
      Top = 20
      Width = 66
      Height = 20
      TabStop = False
      AutoSize = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
    end
    object edAsigMatern: TCurrencyEdit
      Left = 253
      Top = 46
      Width = 66
      Height = 20
      TabStop = False
      AutoSize = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
    end
  end
  object edAsigTotal: TCurrencyEdit
    Left = 270
    Top = 321
    Width = 84
    Height = 20
    TabStop = False
    AutoSize = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 8
  end
  object btnLocPartido: TBitBtn
    Left = 346
    Top = 163
    Width = 106
    Height = 28
    Caption = '&Grabar Loc-Partido'
    TabOrder = 2
    OnClick = btnLocPartidoClick
  end
  object btnHijos: TBitBtn
    Left = 344
    Top = 215
    Width = 106
    Height = 28
    Caption = 'Asig. &Hijos'
    TabOrder = 3
    OnClick = btnHijosClick
  end
  object btnEspeciales: TBitBtn
    Left = 344
    Top = 249
    Width = 106
    Height = 28
    Caption = 'Asig. &Especiales'
    TabOrder = 4
    OnClick = btnEspecialesClick
  end
  object dsLocalidad: TDataSource
    DataSet = sdqLocalidad
    Left = 204
    Top = 158
  end
  object sdqLocalidad: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      
        'SELECT distinct co_localidad localidades, co_secuencia secuencia' +
        ' FROM cco_partidos_codigospostales')
    Left = 176
    Top = 158
  end
  object dsPartidos: TDataSource
    DataSet = sdqPartidos
    Left = 192
    Top = 124
  end
  object sdqPartidos: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'SELECT DISTINCT co_partido partido'
      '   FROM cco_partidos_codigospostales'
      'WHERE co_provincia = :pProvincia'
      ' ORDER BY partido')
    Left = 164
    Top = 124
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pProvincia'
        ParamType = ptInput
      end>
  end
  object FormStorage1: TFormStorage
    StoredValues = <>
    Left = 344
    Top = 16
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    PermitirEdicion = False
    DBLogin = frmPrincipal.DBLogin
    Claves = <
      item
        Name = 'GrabarLocalidadPartido'
      end>
    Left = 376
    Top = 16
  end
end
