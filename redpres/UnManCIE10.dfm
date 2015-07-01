object frmManCIE10: TfrmManCIE10
  Left = 199
  Top = 154
  Width = 705
  Height = 452
  Caption = 'Mantenimiento de CIE10'
  Color = clBtnFace
  Constraints.MinHeight = 257
  Constraints.MinWidth = 575
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 697
    Height = 26
    ButtonWidth = 24
    Caption = 'ToolBar1'
    Flat = True
    HotImages = frmPrincipal.imgGenColor
    Images = frmPrincipal.imgGenBW
    TabOrder = 0
    object tbNuevo: TToolButton
      Left = 0
      Top = 0
      Hint = 'Nuevo (Ctrl+N)'
      Caption = 'Nuevo'
      ImageIndex = 23
      ParentShowHint = False
      ShowHint = True
      OnClick = tbNuevoClick
    end
    object tbModificar: TToolButton
      Left = 24
      Top = 0
      Hint = 'Modificar (Ctrl+M)'
      Caption = 'tbModificar'
      ImageIndex = 24
      ParentShowHint = False
      ShowHint = True
      OnClick = tbModificarClick
    end
    object tbEliminar: TToolButton
      Left = 48
      Top = 0
      Hint = 'Eliminar (Ctrl+Del)'
      Caption = 'tbEliminar'
      ImageIndex = 25
      ParentShowHint = False
      ShowHint = True
      OnClick = tbEliminarClick
    end
    object ToolButton11: TToolButton
      Left = 72
      Top = 0
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object tbRefrescar: TToolButton
      Left = 80
      Top = 0
      Hint = 'Refrescar (F5)'
      Caption = 'tbRefrescar'
      ImageIndex = 4
      ParentShowHint = False
      ShowHint = True
      OnClick = tbRefrescarClick
    end
    object ToolButton12: TToolButton
      Left = 104
      Top = 0
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object tbOrdenar: TToolButton
      Left = 112
      Top = 0
      Hint = 'Ordenar (Ctrl+O)'
      Caption = 'tbOrdenar'
      ImageIndex = 5
      ParentShowHint = False
      ShowHint = True
      OnClick = tbOrdenarClick
    end
    object ToolButton10: TToolButton
      Left = 136
      Top = 0
      Width = 8
      Caption = 'ToolButton10'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object tbExportar: TToolButton
      Left = 144
      Top = 0
      Hint = 'Exportar (Ctrl+E)'
      Caption = 'tbExportar'
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = True
      OnClick = tbExportarClick
    end
    object tbImprimir: TToolButton
      Left = 168
      Top = 0
      Hint = 'Imprimir (Ctrl+I)'
      Caption = 'tbImprimir'
      ImageIndex = 7
      ParentShowHint = False
      ShowHint = True
      OnClick = tbImprimirClick
    end
    object ToolButton9: TToolButton
      Left = 192
      Top = 0
      Width = 8
      Caption = 'ToolButton9'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object tbSalir: TToolButton
      Left = 200
      Top = 0
      Hint = 'Salir (Ctrl+S)'
      Caption = 'tbSalir'
      ImageIndex = 8
      ParentShowHint = False
      ShowHint = True
      OnClick = tbSalirClick
    end
  end
  object dbgDatos: TArtDBGrid
    Left = 0
    Top = 26
    Width = 697
    Height = 399
    Align = alClient
    DataSource = dsDatos
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbgDatosDblClick
    IniStorage = FormPlacement
    OnGetCellParams = dbgDatosGetCellParams
    FooterBand = False
    TitleHeight = 17
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'DG_CODIGO'
        Title.Caption = 'C'#243'digo'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_FILA'
        Title.Caption = 'Naturaleza (fila)'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_COLUMNA'
        Title.Caption = 'Zona (Columna)'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_LISTADOCIE10'
        Title.Caption = 'List. CIE10'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Title.Caption = 'Tipo de Diagn'#243'stico'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_DESCRIPCION'
        Title.Caption = 'Denom. del Diagn'#243'stico'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_DIASLEVE'
        Title.Caption = 'D'#237'as Leve'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_DIASMODERADO'
        Title.Caption = 'D'#237'as Mod.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_DIASGRAVE'
        Title.Caption = 'D'#237'as Grave'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_COSTOLEVE'
        Title.Caption = 'Costo Leve'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_COSTOMODERADO'
        Title.Caption = 'Costo Mod.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_COSTOGRAVE'
        Title.Caption = 'Costo Grave'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_INCAPACIDADLEVE'
        Title.Caption = 'Inc. Leve'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_INCAPACIDADMODERADO'
        Title.Caption = 'Inc. Mod.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_INCAPACIDADGRAVE'
        Title.Caption = 'Inc. Grave'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_NATUSRT'
        Title.Caption = 'Naturaleza (SRT)'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_ZONASRT'
        Title.Caption = 'Zona (SRT)'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_FORMASRT'
        Title.Caption = 'Forma (SRT)'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_INCAPSEGURA'
        Title.Caption = 'Incap. Segura'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GP_NOMBRE'
        Title.Caption = 'Grupo Trabajo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_DIAS_EVOL'
        Title.Caption = 'Periodicidad Evoluci'#243'n'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DG_AMERITATRASLADO'
        Title.Alignment = taCenter
        Title.Caption = 'Amerita traslado'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cc_descripcion'
        Title.Caption = 'Cat. s/ CIE-10'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_CANTMAXIMATRASLADOS'
        Title.Caption = 'Cant. max. Traslados'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_CANTMAXIMAFKT'
        Title.Caption = 'Cant. max. FKT'
        Width = 120
        Visible = True
      end>
  end
  object fpABM: TFormPanel
    Left = 36
    Top = 20
    Width = 577
    Height = 362
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    Position = poDesktopCenter
    object Label1: TLabel
      Left = 45
      Top = 11
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 191
      Top = 11
      Width = 82
      Height = 13
      Caption = 'Grupo de trabajo'
    end
    object Label3: TLabel
      Left = 23
      Top = 37
      Width = 55
      Height = 13
      Caption = 'Diagn'#243'stico'
    end
    object Label4: TLabel
      Left = 92
      Top = 85
      Width = 20
      Height = 13
      Caption = 'D'#237'as'
    end
    object Label5: TLabel
      Left = 151
      Top = 85
      Width = 28
      Height = 13
      Caption = 'Costo'
    end
    object Label6: TLabel
      Left = 220
      Top = 85
      Width = 42
      Height = 13
      Caption = 'Incapac.'
    end
    object Label7: TLabel
      Left = 52
      Top = 103
      Width = 23
      Height = 13
      Caption = 'Leve'
    end
    object Label8: TLabel
      Left = 28
      Top = 124
      Width = 48
      Height = 13
      Caption = 'Moderado'
    end
    object Label9: TLabel
      Left = 47
      Top = 147
      Width = 29
      Height = 13
      Caption = 'Grave'
    end
    object Label10: TLabel
      Left = 6
      Top = 185
      Width = 81
      Height = 13
      Caption = 'Naturaleza (fila):'
    end
    object Label11: TLabel
      Left = 8
      Top = 206
      Width = 74
      Height = 13
      Caption = 'Zona (columna)'
    end
    object Label12: TLabel
      Left = 281
      Top = 185
      Width = 82
      Height = 13
      Caption = 'Naturaleza (SRT)'
    end
    object Label13: TLabel
      Left = 309
      Top = 206
      Width = 54
      Height = 13
      Caption = 'Zona (SRT)'
    end
    object Label14: TLabel
      Left = 303
      Top = 228
      Width = 60
      Height = 13
      Caption = 'Forma (SRT)'
    end
    object Bevel1: TBevel
      Left = 5
      Top = 327
      Width = 563
      Height = 2
    end
    object btnLimpiar: TSpeedButton
      Left = 8
      Top = 333
      Width = 23
      Height = 22
      Hint = 'Limpiar'
      Flat = True
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C40E0000C40E0000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0010101020202000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0010
        101020202000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF001F20201F606040606020202000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF001F202066
        666666666620202000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF002F303000808010D0D04FA0A0305F5F20202000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF002F3030666666E3
        E3E3A4A0A066666620202000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF00404040104F4F00D0D000E0E000CFCF00BFBF3050502F2F2F00FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF00404040666666E3E3E3A4
        A0A0E3E3E3A4A0A06666662F2F2F00FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF002F2F2F00909000E0E000C0C000E0E010C0C05FB0B03050502020
        2000FF0000FF0000FF0000FF0000FF0000FF0000FF002F2F2F008080A4A0A0E3
        E3E3CCCCCCD7D7D7B2B2B266666620202000FF0000FF0000FF0000FF0000FF00
        00FF001F1F1F10505000E0E000CFCF00E0E000D0D000DFDF10DFDF2FB0B04060
        6020202000FF0000FF0000FF0000FF0000FF001F1F1F666666B2B2B2E3E3E3CC
        CCCCD7D7D7E3E3E3A4A0A0E3E3E366666620202000FF0000FF0000FF0000FF00
        00FF001010100F80800FD0D000E0E000CFCF00DFDF00D0D03FD0D030DFDF4FB0
        B030606020202000FF0000FF0000FF0000FF00808080666666E3E3E3CCCCCCD7
        D7D7E3E3E3A4A0A0E3E3E3A4A0A0C0C0C066666620202000FF0000FF0000FF00
        302F2F803030204F4F5FC0C000C0C000E0E000D0D030D0D010EFEF00C0C020EF
        EF208F8F10101000FF0000FF0000FF00302F2F808080666666CCCCCCD7D7D7E3
        E3E3A4A0A0E3E3E3A4A0A0C0C0C0C0C0C0B2B2B266666600FF0000FF0000FF00
        80605FD0A0008F502F204F4F5FCFCF00D0D030D0D01FE0E000C0C000E0E0409F
        9F0F20200F0F0F00FF0000FF0000FF0080605F808080808080666666B2B2B2A4
        A0A0E3E3E3A4A0A0C0C0C0C0C0C0B2B2B200666622222200FF0000FF0000FF00
        A05F4FFFF01FDFD06F7F4030204F4F30C0C020DFDF20BFBF40AFAF0F50502F40
        400F0F0F00FF0000FF0000FF0000FF00A4A0A0A4A0A0A4A0A0808080666666E3
        E3E3B2B2B2C0C0C0C0C0C0A4A0A066666639393900FF0000FF0000FF00302F2F
        AF6040E0E06FAFAF7FBF60306F2000204F4F0F8F8F204F4F1F2F2F2F2F2F00FF
        0000FF0000FF0000FF0000FF00302F2FA4A0A0A4A0A0B2B2B2B2B2B280808066
        6666B2B2B233999966666666666600FF0000FF0000FF0000FF0000FF00B07F60
        EFD060C0C0A09F5F3F8030008000003010101010101F1F1F00FF0000FF0000FF
        0000FF0000FF0000FF0000FF00A4A0A0969696C0C0C0B2B2B2B2B2B280808080
        808066666666666600FF0000FF0000FF0000FF0000FF0000FF00805030E0D060
        C0C09F8F502F5F4F4F605F5F605F5F00FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF00666666969696B2B2B2868686969696605F5F605F5F00
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00B06F1FC0C060
        905F302F201F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF00969696A4A0A086868696969600FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF008F4F30605F30
        2F1F1F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0086868686868696969600FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00}
      NumGlyphs = 2
      OnClick = btnLimpiarClick
    end
    object Label15: TLabel
      Left = 254
      Top = 256
      Width = 109
      Height = 13
      Caption = 'Periodicidad evolutivos'
    end
    object Label16: TLabel
      Left = 10
      Top = 62
      Width = 69
      Height = 13
      Caption = 'Cat. s/ CIE-10'
    end
    object Label17: TLabel
      Left = 219
      Top = 280
      Width = 146
      Height = 13
      Caption = 'Cantidad m'#225'xima de Traslados'
    end
    object Label18: TLabel
      Left = 246
      Top = 304
      Width = 118
      Height = 13
      Caption = 'Cantidad m'#225'xima de FKT'
    end
    object edCodigo: TEdit
      Left = 82
      Top = 7
      Width = 86
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 5
      TabOrder = 0
    end
    object edGTrabajo: TEdit
      Left = 279
      Top = 7
      Width = 51
      Height = 21
      MaxLength = 3
      TabOrder = 1
      OnKeyPress = edGTrabajoKeyPress
    end
    object cmbGTrabajo: TArtComboBox
      Left = 331
      Top = 7
      Width = 237
      Height = 21
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 2
      OnChange = cmbGTrabajoChange
      Columns = <
        item
          Expanded = False
          FieldName = 'GP_CODIGO'
          Title.Caption = 'C'#243'digo'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GP_NOMBRE'
          Title.Caption = 'Nombre'
          Width = 100
          Visible = True
        end>
      DataSource = dsGTrabajo
      FieldList = 'GP_NOMBRE'
      FieldKey = 'GP_CODIGO'
      OnCloseUp = cmbGTrabajoCloseUp
    end
    object edDiagnostico: TEdit
      Left = 82
      Top = 32
      Width = 485
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 3
    end
    object rgTipoDiagnostico: TRadioGroup
      Left = 346
      Top = 87
      Width = 220
      Height = 75
      Caption = 'Tipo de Diagn'#243'stico '
      ItemIndex = 0
      Items.Strings = (
        'Conjunto de lesiones'
        'Lesiones localizadas')
      TabOrder = 13
    end
    object chkListCIE10: TCheckBox
      Left = 6
      Top = 232
      Width = 131
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Listado de OMS-Cie10'
      TabOrder = 19
    end
    object btnAceptar: TButton
      Left = 419
      Top = 333
      Width = 73
      Height = 25
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 25
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 492
      Top = 333
      Width = 75
      Height = 25
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 26
    end
    object chkIncapSegura: TCheckBox
      Left = 6
      Top = 252
      Width = 131
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Incapacidad segura'
      TabOrder = 20
    end
    object edDiasEvo: TIntEdit
      Left = 369
      Top = 251
      Width = 46
      Height = 21
      TabOrder = 22
      Text = '5'
      MaxLength = 2
      Value = 5
    end
    inline fraNaturalezaFila: TfraCtbTablas
      Left = 84
      Top = 179
      Width = 192
      Height = 23
      TabOrder = 14
      inherited cmbDescripcion: TArtComboBox
        Width = 129
      end
    end
    inline fraZonaColumna: TfraCtbTablas
      Left = 84
      Top = 201
      Width = 192
      Height = 23
      TabOrder = 16
      inherited cmbDescripcion: TArtComboBox
        Width = 129
      end
    end
    inline fraNaturalezaSRT: TfraCtbTablas
      Left = 367
      Top = 179
      Width = 202
      Height = 23
      TabOrder = 15
      inherited cmbDescripcion: TArtComboBox
        Width = 138
      end
    end
    inline fraZonaSRT: TfraCtbTablas
      Left = 367
      Top = 201
      Width = 202
      Height = 23
      TabOrder = 17
      inherited cmbDescripcion: TArtComboBox
        Width = 138
      end
    end
    inline fraFormaSRT: TfraCtbTablas
      Left = 367
      Top = 223
      Width = 202
      Height = 23
      TabOrder = 18
      inherited cmbDescripcion: TArtComboBox
        Width = 138
      end
    end
    object edDiasLeve: TIntEdit
      Left = 82
      Top = 99
      Width = 46
      Height = 21
      TabOrder = 4
      Text = '0'
      Alignment = taRightJustify
      MaxLength = 3
    end
    object edDiasModerado: TIntEdit
      Left = 82
      Top = 120
      Width = 46
      Height = 21
      TabOrder = 7
      Text = '0'
      Alignment = taRightJustify
      MaxLength = 3
    end
    object edDiasGrave: TIntEdit
      Left = 82
      Top = 141
      Width = 46
      Height = 21
      TabOrder = 10
      Text = '0'
      Alignment = taRightJustify
      MaxLength = 3
    end
    object edCostoLeve: TCurrencyEdit
      Left = 128
      Top = 99
      Width = 84
      Height = 21
      AutoSize = False
      MaxLength = 9
      MaxValue = 9999999.990000000000000000
      TabOrder = 5
      ZeroEmpty = False
    end
    object edCostoModerado: TCurrencyEdit
      Left = 128
      Top = 120
      Width = 84
      Height = 21
      AutoSize = False
      MaxLength = 9
      MaxValue = 9999999.990000000000000000
      TabOrder = 8
      ZeroEmpty = False
    end
    object edCostoGrave: TCurrencyEdit
      Left = 128
      Top = 141
      Width = 84
      Height = 21
      AutoSize = False
      MaxLength = 9
      MaxValue = 9999999.990000000000000000
      TabOrder = 11
      ZeroEmpty = False
    end
    object edIncapacLeve: TCurrencyEdit
      Left = 212
      Top = 99
      Width = 59
      Height = 21
      AutoSize = False
      DisplayFormat = '% ,0.00;-% ,0.00'
      MaxLength = 5
      MaxValue = 100.000000000000000000
      TabOrder = 6
      ZeroEmpty = False
    end
    object edIncapacModerado: TCurrencyEdit
      Left = 212
      Top = 120
      Width = 59
      Height = 21
      AutoSize = False
      DisplayFormat = '% ,0.00;-% ,0.00'
      MaxLength = 5
      MaxValue = 100.000000000000000000
      TabOrder = 9
      ZeroEmpty = False
    end
    object edIncapacGrave: TCurrencyEdit
      Left = 212
      Top = 141
      Width = 59
      Height = 21
      AutoSize = False
      DisplayFormat = '% ,0.00;-% ,0.00'
      MaxLength = 5
      MaxValue = 100.000000000000000000
      TabOrder = 12
      ZeroEmpty = False
    end
    object chkTraslado: TCheckBox
      Left = 6
      Top = 273
      Width = 131
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Amerita traslado'
      TabOrder = 21
    end
    inline fraCatCIE10: TfraCodigoDescripcion
      Left = 81
      Top = 56
      Width = 488
      Height = 23
      TabOrder = 27
      DesignSize = (
        488
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 48
        Width = 437
      end
      inherited edCodigo: TPatternEdit
        Width = 44
      end
    end
    object edCantMaxTraslados: TIntEdit
      Left = 369
      Top = 275
      Width = 46
      Height = 21
      TabOrder = 23
      Text = '0'
      MaxLength = 4
    end
    object edCantMaxFKT: TIntEdit
      Left = 369
      Top = 299
      Width = 46
      Height = 21
      TabOrder = 24
      Text = '0'
      MaxLength = 4
    end
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT dg_codigo, dg_fila, dg_columna, dg_listadocie10, dg_tipo,' +
        ' dg_descripcion, '
      
        '       dg_diasleve, dg_diasmoderado, dg_diasgrave, dg_costoleve,' +
        ' dg_costomoderado, '
      
        '       dg_costograve, dg_incapacidadleve, dg_incapacidadmoderado' +
        ', dg_incapacidadgrave,'
      
        '       dg_natusrt, dg_zonasrt, dg_formasrt, dg_incapsegura, gp_n' +
        'ombre, gp_codigo, '
      '       dg_dias_evol, dg_fechabaja, dg_ameritatraslado, '
      
        '       iif_char(dg_tipo, '#39'C'#39', '#39'Conjunto de Lesiones'#39', '#39'Lesiones ' +
        'Localizadas'#39') tipo, dg_idcategoria,'
      
        '       cc_descripcion, dg_fechaalta, dg_cantmaximatraslados, dg_' +
        'cantmaximaFKT'
      
        '  FROM art.mgp_gtrabajo, art.cdg_diagnostico, SIN.scc_categoriac' +
        'ie10'
      ' WHERE dg_gtrabajo = gp_codigo AND dg_idcategoria = cc_id(+)'
      '')
    Left = 320
    object sdqDatosDG_CODIGO: TStringField
      FieldName = 'DG_CODIGO'
      Required = True
      Size = 5
    end
    object sdqDatosDG_FILA: TFloatField
      FieldName = 'DG_FILA'
    end
    object sdqDatosDG_COLUMNA: TFloatField
      FieldName = 'DG_COLUMNA'
    end
    object sdqDatosDG_LISTADOCIE10: TStringField
      FieldName = 'DG_LISTADOCIE10'
      Size = 1
    end
    object sdqDatosDG_TIPO: TStringField
      FieldName = 'DG_TIPO'
      Size = 2
    end
    object sdqDatosDG_DESCRIPCION: TStringField
      FieldName = 'DG_DESCRIPCION'
      Size = 100
    end
    object sdqDatosDG_DIASLEVE: TFloatField
      FieldName = 'DG_DIASLEVE'
    end
    object sdqDatosDG_DIASMODERADO: TFloatField
      FieldName = 'DG_DIASMODERADO'
    end
    object sdqDatosDG_DIASGRAVE: TFloatField
      FieldName = 'DG_DIASGRAVE'
    end
    object sdqDatosDG_COSTOLEVE: TFloatField
      FieldName = 'DG_COSTOLEVE'
    end
    object sdqDatosDG_COSTOMODERADO: TFloatField
      FieldName = 'DG_COSTOMODERADO'
    end
    object sdqDatosDG_COSTOGRAVE: TFloatField
      FieldName = 'DG_COSTOGRAVE'
    end
    object sdqDatosDG_INCAPACIDADLEVE: TFloatField
      FieldName = 'DG_INCAPACIDADLEVE'
    end
    object sdqDatosDG_INCAPACIDADMODERADO: TFloatField
      FieldName = 'DG_INCAPACIDADMODERADO'
    end
    object sdqDatosDG_INCAPACIDADGRAVE: TFloatField
      FieldName = 'DG_INCAPACIDADGRAVE'
    end
    object sdqDatosDG_NATUSRT: TStringField
      FieldName = 'DG_NATUSRT'
      Size = 10
    end
    object sdqDatosDG_ZONASRT: TStringField
      FieldName = 'DG_ZONASRT'
      Size = 10
    end
    object sdqDatosDG_FORMASRT: TStringField
      FieldName = 'DG_FORMASRT'
      Size = 10
    end
    object sdqDatosDG_INCAPSEGURA: TStringField
      FieldName = 'DG_INCAPSEGURA'
      Size = 1
    end
    object sdqDatosGP_NOMBRE: TStringField
      FieldName = 'GP_NOMBRE'
      Size = 30
    end
    object sdqDatosGP_CODIGO: TStringField
      FieldName = 'GP_CODIGO'
      Required = True
      Size = 4
    end
    object sdqDatosDG_DIAS_EVOL: TFloatField
      FieldName = 'DG_DIAS_EVOL'
    end
    object sdqDatosTIPO: TStringField
      FieldName = 'TIPO'
      Size = 4000
    end
    object sdqDatosDG_FECHABAJA: TDateTimeField
      FieldName = 'DG_FECHABAJA'
    end
    object sdqDatosDG_AMERITATRASLADO: TStringField
      FieldName = 'DG_AMERITATRASLADO'
      Size = 1
    end
    object sdqDatosDG_IDCATEGORIA: TFloatField
      FieldName = 'DG_IDCATEGORIA'
    end
    object sdqDatoscc_descripcion: TStringField
      FieldName = 'cc_descripcion'
    end
    object sdqDatosdg_fechaalta: TDateTimeField
      FieldName = 'dg_fechaalta'
    end
    object sdqDatosDG_CANTMAXIMATRASLADOS: TFloatField
      FieldName = 'DG_CANTMAXIMATRASLADOS'
    end
    object sdqDatosDG_CANTMAXIMAFKT: TFloatField
      FieldName = 'DG_CANTMAXIMAFKT'
    end
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 348
  end
  object sdqGTrabajo: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT GP_CODIGO, GP_NOMBRE'
      'FROM MGP_GTRABAJO'
      'WHERE GP_FBAJA IS NULL'
      'ORDER BY GP_NOMBRE')
    Left = 400
    Top = 72
  end
  object dsGTrabajo: TDataSource
    DataSet = sdqGTrabajo
    Left = 428
    Top = 72
  end
  object SortDialog: TSortDialog
    Caption = 'Orden'
    DataSet = sdqDatos
    SortFields = <
      item
        Title = 'C'#243'digo'
        DataField = 'DG_CODIGO'
        FieldIndex = 0
      end
      item
        Title = 'Naturaleza'
        DataField = 'DG_FILA'
        FieldIndex = 0
      end
      item
        Title = 'Zona'
        DataField = 'DG_COLUMNA'
        FieldIndex = 0
      end
      item
        Title = 'List. CIE10'
        DataField = 'DG_LISTADOCIE10'
        FieldIndex = 0
      end
      item
        Title = 'Tipo de Diagn'#243'stico'
        DataField = 'TIPO'
        FieldIndex = 0
      end
      item
        Title = 'Denom. del Diagn'#243'stico'
        DataField = 'DG_DESCRIPCION'
        FieldIndex = 0
      end
      item
        Title = 'D'#237'as Leve'
        DataField = 'DG_DIASLEVE'
        FieldIndex = 0
      end
      item
        Title = 'D'#237'as Mod.'
        DataField = 'DG_DIASMODERADO'
        FieldIndex = 0
      end
      item
        Title = 'D'#237'as Grave'
        DataField = 'DG_DIASGRAVE'
        FieldIndex = 0
      end
      item
        Title = 'Costo Leve'
        DataField = 'DG_COSTOLEVE'
        FieldIndex = 0
      end
      item
        Title = 'Costo Mod.'
        DataField = 'DG_COSTOMODERADO'
        FieldIndex = 0
      end
      item
        Title = 'Costo Grave'
        DataField = 'DG_COSTOGRAVE'
        FieldIndex = 0
      end
      item
        Title = 'Inc. Leve'
        DataField = 'DG_INCAPACIDADLEVE'
        FieldIndex = 0
      end
      item
        Title = 'Inc. Mod.'
        DataField = 'DG_INCAPACIDADMODERADO'
        FieldIndex = 0
      end
      item
        Title = 'Inc. Grave'
        DataField = 'DG_INCAPACIDADGRAVE'
        FieldIndex = 0
      end
      item
        Title = 'Naturaleza (SRT)'
        DataField = 'DG_NATUSRT'
        FieldIndex = 0
      end
      item
        Title = 'Zona (SRT)'
        DataField = 'DG_ZONASRT'
        FieldIndex = 0
      end
      item
        Title = 'Forma (SRT)'
        DataField = 'DG_FORMASRT'
        FieldIndex = 0
      end
      item
        Title = 'Incap. Segura'
        DataField = 'DG_INCAPSEGURA'
        FieldIndex = 0
      end
      item
        Title = 'Grupo Trabajo'
        DataField = 'GP_NOMBRE'
        FieldIndex = 0
      end
      item
        Title = 'Periodicidad Evoluci'#243'n'
        DataField = 'DG_DIAS_EVOL'
        FieldIndex = 0
      end>
    IniStorage = FormPlacement
    FixedRows = 0
    Left = 404
  end
  object ExportDialog: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqDatos
    Fields = <
      item
        DataField = 'DG_CODIGO'
        Title = 'C'#243'digo'
      end
      item
        DataField = 'DG_FILA'
        Title = 'Naturaleza (fila)'
      end
      item
        DataField = 'DG_COLUMNA'
        Title = 'Zona (columna)'
      end
      item
        DataField = 'DG_LISTADOCIE10'
        Title = 'List. CIE10'
      end
      item
        DataField = 'TIPO'
        Title = 'Tipo de Diagn'#243'stico'
      end
      item
        DataField = 'DG_DESCRIPCION'
        Title = 'Denom. del Diagn'#243'stico'
      end
      item
        DataField = 'DG_DIASLEVE'
        Title = 'D'#237'as Leve'
      end
      item
        DataField = 'DG_DIASMODERADO'
        Title = 'D'#237'as Mod.'
      end
      item
        DataField = 'DG_DIASGRAVE'
        Title = 'D'#237'as Grave'
      end
      item
        DataField = 'DG_COSTOLEVE'
        Title = 'Costo Leve'
      end
      item
        DataField = 'DG_COSTOMODERADO'
        Title = 'Costo Mod.'
      end
      item
        DataField = 'DG_COSTOGRAVE'
        Title = 'Costo Grave'
      end
      item
        DataField = 'DG_INCAPACIDADLEVE'
        Title = 'Inc. Leve'
      end
      item
        DataField = 'DG_INCAPACIDADMODERADO'
        Title = 'Inc. Mod.'
      end
      item
        DataField = 'DG_INCAPACIDADGRAVE'
        Title = 'Inc. Grave'
      end
      item
        DataField = 'DG_NATUSRT'
        Title = 'Naturaleza (SRT)'
      end
      item
        DataField = 'DG_ZONASRT'
        Title = 'Zona (SRT)'
      end
      item
        DataField = 'DG_FORMASRT'
        Title = 'Forma (SRT)'
      end
      item
        DataField = 'DG_INCAPSEGURA'
        Title = 'Inc. Segura'
      end
      item
        DataField = 'GP_NOMBRE'
        Title = 'Grupo Trabajo'
      end
      item
        DataField = 'DG_DIAS_EVOL'
        Title = 'Periodicidad Evoluci'#243'n'
      end
      item
        DataField = 'cc_descripcion'
        Title = 'Cat. s/ CIE-10'
      end
      item
        DataField = 'dg_fechaalta'
        Title = 'Fecha Alta'
      end
      item
        DataField = 'dg_fechabaja'
        Title = 'Fecha Baja'
      end>
    IniStorage = FormPlacement
    OutputFile = 'MantenimientoCIE10.txt'
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    Left = 432
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'C'#243'digo'
        DataField = 'DG_CODIGO'
        MaxLength = 6
      end
      item
        Title = 'Natur. (fila)'
        DataField = 'DG_FILA'
        MaxLength = 8
      end
      item
        Title = 'Zona(Colum)'
        DataField = 'DG_COLUMNA'
        MaxLength = 8
      end
      item
        Title = 'List.CIE10'
        DataField = 'DG_LISTADOCIE10'
        MaxLength = 8
      end
      item
        Title = 'Tipo Diag.'
        DataField = 'TIPO'
        MaxLength = 14
      end
      item
        Title = 'Denom. del Diagn'#243'stico'
        DataField = 'DG_DESCRIPCION'
        MaxLength = 60
      end
      item
        Title = 'D'#237'as Leve'
        DataField = 'DG_DIASLEVE'
        MaxLength = 7
      end
      item
        Title = 'D'#237'as Mod.'
        DataField = 'DG_DIASMODERADO'
        MaxLength = 7
      end
      item
        Title = 'D'#237'as Grave'
        DataField = 'DG_DIASGRAVE'
        MaxLength = 8
      end
      item
        Title = 'Costo Leve'
        DataField = 'DG_COSTOLEVE'
        MaxLength = 8
      end
      item
        Title = 'Costo Mod.'
        DataField = 'DG_COSTOMODERADO'
        MaxLength = 8
      end
      item
        Title = 'Costo Grave'
        DataField = 'DG_COSTOGRAVE'
        MaxLength = 8
      end
      item
        Title = 'Inc.Leve'
        DataField = 'DG_INCAPACIDADLEVE'
        MaxLength = 7
      end
      item
        Title = 'Inc.Mod.'
        DataField = 'DG_INCAPACIDADMODERADO'
        MaxLength = 7
      end
      item
        Title = 'Inc.Grave'
        DataField = 'DG_INCAPACIDADGRAVE'
        MaxLength = 8
      end
      item
        Title = 'Natur.(SRT)'
        DataField = 'DG_NATUSRT'
        MaxLength = 8
      end
      item
        Title = 'Zona(SRT)'
        DataField = 'DG_ZONASRT'
        MaxLength = 8
      end
      item
        Title = 'Forma(SRT)'
        DataField = 'DG_FORMASRT'
        MaxLength = 9
      end
      item
        Title = 'Incap.Seg.'
        DataField = 'DG_INCAPSEGURA'
        MaxLength = 8
      end
      item
        Title = 'Grupo Trabajo'
        DataField = 'GP_NOMBRE'
        MaxLength = 17
      end
      item
        Title = 'Period.Evol.'
        DataField = 'DG_DIAS_EVOL'
        MaxLength = 7
      end>
    DataSource = dsDatos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -16
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Mantenimiento de CIE10'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -8
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = 14737632
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLinesWidth = 0
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Color = 14079702
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Color = 12961221
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    PageOrientation = pxLandscape
    PageSize = psLegal
    Left = 460
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16462
        LinkControl = tbNuevo
      end
      item
        Key = 16461
        LinkControl = tbModificar
      end
      item
        Key = 16430
        LinkControl = tbEliminar
      end
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16463
        LinkControl = tbOrdenar
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end>
    Left = 488
  end
  object FormPlacement: TFormPlacement
    UseRegistry = True
    Left = 516
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = True
    Left = 544
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 376
  end
end
