object frmImportacion: TfrmImportacion
  Left = 208
  Top = 107
  Width = 690
  Height = 367
  Caption = 'Administraci'#243'n de Importaci'#243'n'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefaultPosOnly
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    682
    340)
  PixelsPerInch = 96
  TextHeight = 13
  object lbCantProc: TLabel
    Left = 34
    Top = 314
    Width = 69
    Height = 13
    Alignment = taRightJustify
    Anchors = [akLeft, akBottom]
    AutoSize = False
  end
  object lbPosActual: TLabel
    Left = 34
    Top = 297
    Width = 69
    Height = 13
    Alignment = taRightJustify
    Anchors = [akLeft, akBottom]
    AutoSize = False
  end
  object GroupBox1: TGroupBox
    Left = 9
    Top = 7
    Width = 93
    Height = 47
    Caption = 'Recuperar'
    TabOrder = 0
    object rbRecuperaSI: TRadioButton
      Left = 8
      Top = 18
      Width = 37
      Height = 20
      Caption = 'Si'
      TabOrder = 0
    end
    object rbRecuperaNO: TRadioButton
      Left = 48
      Top = 17
      Width = 37
      Height = 20
      Caption = 'No'
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 106
    Top = 7
    Width = 551
    Height = 47
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Motivo'
    TabOrder = 1
    DesignSize = (
      551
      47)
    object cmbMotivo: TRxDBLookupCombo
      Left = 9
      Top = 17
      Width = 527
      Height = 21
      DropDownCount = 8
      Anchors = [akLeft, akTop, akRight]
      LookupField = 'TB_CODIGO'
      LookupDisplay = 'TB_DESCRIPCION'
      LookupSource = dsMotivo
      TabOrder = 0
    end
  end
  object GroupBox3: TGroupBox
    Left = 9
    Top = 59
    Width = 92
    Height = 133
    Caption = 'Acci'#243'n'
    TabOrder = 2
    object btnCargaGrilla: TButton
      Left = 9
      Top = 21
      Width = 75
      Height = 25
      Caption = 'Cargar &Grilla'
      TabOrder = 0
      OnClick = btnCargaGrillaClick
    end
    object btnCargaTabla: TButton
      Left = 9
      Top = 55
      Width = 75
      Height = 25
      Caption = 'Cargar &Tabla'
      TabOrder = 1
      OnClick = btnCargaTablaClick
    end
    object btnSalir: TButton
      Left = 10
      Top = 89
      Width = 75
      Height = 25
      Cancel = True
      Caption = '&Salir'
      TabOrder = 2
      OnClick = btnSalirClick
    end
  end
  object ArtDBGrid: TArtDBGrid
    Left = 105
    Top = 66
    Width = 550
    Height = 266
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsConulta
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnGetCellParams = ArtDBGridGetCellParams
    FooterBand = False
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'MP_SINIESTRO'
        Title.Caption = 'Siniestros'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_ORDEN'
        Title.Caption = 'Orden'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_FECHA'
        Title.Caption = 'Fecha'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_ERROR'
        Title.Caption = 'Error'
        Width = 208
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BO_ID'
        Title.Caption = 'C'#243'digo'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BO_NOMBRE'
        Title.Caption = 'Abogado'
        Width = 243
        Visible = True
      end>
  end
  object btnStop: TBitBtn
    Left = 3
    Top = 307
    Width = 31
    Height = 29
    Anchors = [akLeft, akBottom]
    TabOrder = 4
    Visible = False
    OnClick = btnStopClick
    Glyph.Data = {
      76020000424D7602000000000000760000002800000020000000200000000100
      0400000000000002000000000000000000001000000000000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7777777777777777777777777777711111111111111777777777777777771111
      1111111111117777777777777771111111111111111117777777777777111111
      1111111111111177777777777111111111111111111111177777777711111111
      1111111111111111777777711111111111111111111111111777771111111111
      11111111111111111177711111111111111111111111111111177111111FF111
      1F1111FF111F11111117711111F11F111F111F11F11F11111117711111F11F11
      1F111F11F11F11111117711111F11F111F111F11F11F11111117711111111F11
      1F111F11F11F11111117711111111F111F111F11F11F111111177111111FF111
      1F111F11F11FFF111117711111F111111F111F11F11F11F11117711111F11111
      1F111F11F11F11F11117711111F11F111F111F11F11F11F11117711111F11F11
      1F111F11F11F11F111177111111FF11FFFFF11FF111FFF111117711111111111
      1111111111111111111777111111111111111111111111111177777111111111
      1111111111111111177777771111111111111111111111117777777771111111
      1111111111111117777777777711111111111111111111777777777777711111
      1111111111111777777777777777111111111111111177777777777777777111
      1111111111177777777777777777777777777777777777777777}
  end
  object brProgres: TGroupBox
    Left = 10
    Top = 198
    Width = 90
    Height = 39
    Caption = 'Transferencia'
    TabOrder = 5
    Visible = False
    object prbProgres: TProgressBar
      Left = 4
      Top = 16
      Width = 82
      Height = 16
      TabOrder = 0
    end
  end
  object sdqMotivo: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT TB_CODIGO, TB_DESCRIPCION '
      'FROM CTB_TABLAS '
      'WHERE TB_CLAVE = '#39'MORES'#39
      '      AND TB_CODIGO > '#39'0'#39)
    Left = 109
    Top = 23
  end
  object dsMotivo: TDataSource
    DataSet = sdqMotivo
    Left = 138
    Top = 22
  end
  object OpenDialog: TOpenDialog
    Filter = 'Archivo Excel (*xls)|*.xls|Otros|*.*'
    Left = 43
    Top = 240
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = False
    Left = 73
    Top = 241
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'select MP_SINIESTRO, MP_ORDEN, MP_FECHA, MP_ERROR, BO_NOMBRE, A.' +
        'BO_ID ABO_CODIGO'
      '  from tmp_recupero r, LEGALES.lbo_Abogado A'
      ' where r.MP_ABOGADO= a.BO_ID (+)'
      'ORDER BY MP_ERROR DESC')
    Left = 112
    Top = 244
  end
  object dsConulta: TDataSource
    DataSet = sdqConsulta
    Left = 141
    Top = 242
  end
end
