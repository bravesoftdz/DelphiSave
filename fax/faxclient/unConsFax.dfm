inherited frmConsFax: TfrmConsFax
  Left = 221
  Top = 166
  Width = 655
  Height = 448
  Caption = 'Consulta de Faxes'
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter: TJvNetscapeSplitter [0]
    Left = 316
    Top = 88
    Width = 8
    Height = 333
    Align = alRight
    MinSize = 0
    Maximized = False
    Minimized = False
    ButtonCursor = crDefault
  end
  inherited pnlFiltros: TPanel
    Width = 647
    Height = 59
    Visible = True
    DesignSize = (
      647
      59)
    object Label1: TLabel
      Left = 4
      Top = 8
      Width = 50
      Height = 13
      Caption = 'Formulario'
    end
    object lbRecibido: TLabel
      Left = 4
      Top = 36
      Width = 40
      Height = 13
      Caption = 'Recibido'
    end
    object Label3: TLabel
      Left = 152
      Top = 36
      Width = 12
      Height = 13
      Caption = '>>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 260
      Top = 36
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object lbNroDeOrden: TLabel
      Left = 360
      Top = 10
      Width = 65
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Nro de Orden'
    end
    object Label2: TLabel
      Left = 360
      Top = 36
      Width = 35
      Height = 13
      Caption = 'Errores'
    end
    inline fraFiltroFormulario: TfraFFO_FAXFORMULARIO
      Left = 59
      Top = 4
      Width = 294
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        294
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 231
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja')
        ColWidths = (
          40
          300
          -1
          -1)
      end
    end
    object edRecibidoDesde: TDateComboBox
      Left = 60
      Top = 32
      Width = 88
      Height = 21
      MaxDateCombo = edRecibidoHasta
      TabOrder = 2
    end
    object edRecibidoHasta: TDateComboBox
      Left = 168
      Top = 32
      Width = 88
      Height = 21
      MinDateCombo = edRecibidoDesde
      TabOrder = 3
    end
    object edCodigo: TIntEdit
      Left = 299
      Top = 32
      Width = 54
      Height = 21
      TabOrder = 4
    end
    object gbEstado: TGroupBox
      Left = 536
      Top = 1
      Width = 109
      Height = 54
      Anchors = [akTop, akRight]
      Caption = 'Estado'
      TabOrder = 6
      object chkActivos: TCheckBox
        Left = 8
        Top = 32
        Width = 57
        Height = 17
        Caption = 'Activos'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object chkNoImpresos: TCheckBox
        Left = 8
        Top = 14
        Width = 81
        Height = 17
        Caption = 'No Impresos'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
    end
    object edNroOrden: TPatternEdit
      Left = 428
      Top = 6
      Width = 101
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
      Pattern = '0123456789'
    end
    object cmbErrores: TComboBox
      Left = 400
      Top = 32
      Width = 129
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 5
      Items.Strings = (
        '(Todos)'
        'Sin Errores'
        'Con Errores')
    end
  end
  inherited CoolBar: TCoolBar
    Top = 59
    Width = 647
    Bands = <
      item
        Break = False
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 26
        Width = 643
      end>
    inherited ToolBar: TToolBar
      Width = 630
      Height = 26
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited ToolButton4: TToolButton
        Visible = True
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Vista Previa'
        Down = True
        ImageIndex = 14
        Style = tbsCheck
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        ImageIndex = 9
        Visible = True
      end
      inherited tbImprimir: TToolButton
        DropdownMenu = pmnuImprimir
        Style = tbsDropDown
      end
      inherited tbExportar: TToolButton
        Left = 252
      end
      inherited tbEnviarMail: TToolButton
        Left = 275
      end
      inherited ToolButton8: TToolButton
        Left = 298
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 306
        Visible = True
      end
      inherited tbMaxRegistros: TToolButton
        Left = 329
      end
      inherited ToolButton11: TToolButton
        Left = 352
      end
      inherited tbSalir: TToolButton
        Left = 360
        Visible = False
      end
      object tbVerificarArchivos: TToolButton
        Left = 383
        Top = 0
        Hint = 'Verificar Archivos'
        ImageIndex = 18
        OnClick = tbVerificarArchivosClick
      end
      object tbCantidadDeHojas: TToolButton
        Left = 406
        Top = 0
        Hint = 'Contar Faxes y P'#225'ginas'
        Caption = 'tbCantidadDeHojas'
        ImageIndex = 39
        OnClick = tbCantidadDeHojasClick
      end
      object ToolButton2: TToolButton
        Left = 429
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 437
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 88
    Width = 316
    Height = 333
    PopupMenu = pmnuSeleccion
    TitleFont.Name = 'Tahoma'
    MultiSelect = True
    Columns = <
      item
        Expanded = False
        FieldName = 'FE_ID'
        Title.Caption = 'C'#243'digo'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FO_DESCRIPCION'
        Title.Caption = 'Formulario'
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FE_PAGINAS'
        Title.Caption = 'P'#225'ginas'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FE_FECHAINGRESO'
        Title.Caption = 'Fecha Ingreso'
        Width = 139
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FE_FECHAALTA'
        Title.Caption = 'Fecha Alta'
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FE_NROORDEN'
        Title.Caption = 'Nro.Orden'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FE_FECHAIMPRESION'
        Title.Caption = 'Fecha Impresi'#243'n'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FE_USUIMPRESION'
        Title.Caption = 'Usuario Impresi'#243'n'
        Width = 88
        Visible = True
      end>
  end
  object pnlVistaPrevia: TPanel [4]
    Left = 324
    Top = 88
    Width = 323
    Height = 333
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 3
    object imgFax: TImgEdit
      Left = 0
      Top = 29
      Width = 323
      Height = 285
      DataBindings = <>
      Align = alClient
      DragCursor = crHandPoint
      TabOrder = 0
      OnDragOver = imgFaxDragOver
      OnMouseUp = imgFaxMouseUp
      OnMouseMove = imgFaxMouseMove
      OnMouseDown = imgFaxMouseDown
      OnLoad = imgFaxLoad
      ControlData = {
        0200020062210000751D000060000000010001FFFEFF00FFFEFF0000000000FF
        FEFF0969006D00670049006D006100670065006E00000000010000000000C842
        00000200FF000000FFFF00000000FF000000000352E30B918FCE119DE300AA00
        4BB851010000009001C0D401000D4D532053616E7320536572696600000000FF
        FEFF00FFFEFF0001000100000400011700000452E30B918FCE119DE300AA004B
        B8516C7400006C00000001000000580000000000000000000000FFFFFFFFFFFF
        FFFF00000000000000006C520000B83D000020454D46000001006C0000000200
        0000010000000000000000000000000000002003000058020000D30000009E00
        00000E0000001400000000000000100000001400000001010000000003000000
        00730B03FCF1C9640000010000C964FCF1FCF100100000001000004949FFFEFF
        00FFFEFF00}
    end
    object CoolBar1: TCoolBar
      Left = 0
      Top = 0
      Width = 323
      Height = 29
      Bands = <
        item
          Control = ToolBar1
          ImageIndex = -1
          MinHeight = 26
          Width = 319
        end>
      object ToolBar1: TToolBar
        Left = 9
        Top = 0
        Width = 306
        Height = 26
        BorderWidth = 1
        Caption = 'ToolBar'
        EdgeBorders = []
        Flat = True
        HotImages = frmPrincipal.ilColor
        Images = frmPrincipal.ilByN
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object tbZoomDec: TToolButton
          Left = 0
          Top = 0
          ImageIndex = 37
          OnClick = tbZoomDecClick
        end
        object edZoom: TCurrencyEdit
          Left = 23
          Top = 0
          Width = 38
          Height = 22
          Alignment = taCenter
          AutoSize = False
          DisplayFormat = ',0.##;-,0.##'
          MaxLength = 11
          MaxValue = 400.000000000000000000
          MinValue = 2.000000000000000000
          TabOrder = 1
          Value = 25.000000000000000000
          OnKeyPress = edZoomKeyPress
        end
        object tbZoomInc: TToolButton
          Left = 61
          Top = 0
          ImageIndex = 38
          OnClick = tbZoomIncClick
        end
        object ToolButton10: TToolButton
          Left = 84
          Top = 0
          Width = 8
          Caption = 'ToolButton10'
          ImageIndex = 37
          Style = tbsSeparator
        end
        object tbPageFirst: TToolButton
          Left = 92
          Top = 0
          ImageIndex = 33
          OnClick = tbPageFirstClick
        end
        object tbPagePrior: TToolButton
          Left = 115
          Top = 0
          ImageIndex = 34
          OnClick = tbPagePriorClick
        end
        object edPage: TIntEdit
          Left = 138
          Top = 0
          Width = 25
          Height = 22
          TabOrder = 0
          Text = '1'
          OnKeyPress = edPageKeyPress
          Alignment = taCenter
          MinValue = 1
          Value = 1
        end
        object edPageCount: TIntEdit
          Left = 163
          Top = 0
          Width = 25
          Height = 22
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 2
          Text = '1'
          Alignment = taCenter
          Value = 1
        end
        object tbPageNext: TToolButton
          Left = 188
          Top = 0
          ImageIndex = 35
          OnClick = tbPageNextClick
        end
        object tbPageLast: TToolButton
          Left = 211
          Top = 0
          ImageIndex = 36
          OnClick = tbPageLastClick
        end
        object ToolButton1: TToolButton
          Left = 234
          Top = 0
          Width = 8
          Caption = 'ToolButton1'
          ImageIndex = 37
          Style = tbsSeparator
        end
        object tbAbrirImagen: TToolButton
          Left = 242
          Top = 0
          Hint = 'Abrir Imagen'
          Enabled = False
          ImageIndex = 13
          OnClick = tbAbrirImagenClick
        end
        object tbGuardarImagen: TToolButton
          Left = 265
          Top = 0
          Caption = 'Guardar Imagen'
          ImageIndex = 3
          OnClick = tbGuardarImagenClick
        end
      end
    end
    object pnlImgStatus: TPanel
      Left = 0
      Top = 314
      Width = 323
      Height = 19
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
    end
  end
  object fpImpresionAutomatica: TFormPanel [5]
    Left = 9
    Top = 312
    Width = 416
    Height = 84
    Caption = 'Impresi'#243'n Autom'#225'tica'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    Constraints.MinHeight = 73
    Constraints.MinWidth = 163
    DesignSize = (
      416
      84)
    object Bevel1: TBevel
      Left = 4
      Top = 48
      Width = 408
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object lbImpAutom: TLabel
      Left = 8
      Top = 32
      Width = 401
      Height = 13
      Alignment = taCenter
      AutoSize = False
    end
    object btnImpAutCancel: TButton
      Left = 167
      Top = 54
      Width = 75
      Height = 25
      Anchors = [akBottom]
      Cancel = True
      Caption = '&Cancelar'
      TabOrder = 0
      OnClick = btnImpAutCancelClick
    end
    object pbImpAutom: TProgressBar
      Left = 6
      Top = 12
      Width = 405
      Height = 16
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
  end
  inherited fpAbm: TFormPanel
    Left = 13
    Top = 232
    Width = 356
    Height = 73
    Constraints.MinHeight = 73
    Constraints.MinWidth = 282
    DesignSize = (
      356
      73)
    inherited BevelAbm: TBevel
      Top = 37
      Width = 348
    end
    object Label5: TLabel [1]
      Left = 4
      Top = 13
      Width = 50
      Height = 13
      Caption = 'Formulario'
    end
    inherited btnAceptar: TButton
      Left = 198
      Top = 43
      TabOrder = 1
    end
    inherited btnCancelar: TButton
      Left = 276
      Top = 43
      TabOrder = 2
    end
    inline fraFE_IDFORMULARIO: TfraFFO_FAXFORMULARIO
      Left = 60
      Top = 8
      Width = 292
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        292
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 229
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja')
        ColWidths = (
          40
          300
          -1
          -1)
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT FE_ID, FE_IDFORMULARIO, FO_DESCRIPCION, FE_NROORDEN, FE_P' +
        'AGINAS, FE_ARCHIVOIMAGEN, FE_FECHAINGRESO, FE_FECHAALTA, FE_USUV' +
        'ISUALIZA, FE_FECHAVISUALIZA, FE_USUIMPRESION, FE_FECHAIMPRESION,' +
        ' FE_FECHABAJA FROM FFE_FAXENTRANTES, FFO_FAXFORMULARIO, FFU_FORM' +
        'ULARIOUSUARIO WHERE FO_ID = FE_IDFORMULARIO AND FU_IDFORMULARIO ' +
        '= FE_IDFORMULARIO AND FU_USUARIO = '#39'FFIRENZE'#39' ')
    Left = 20
    Top = 140
  end
  inherited dsConsulta: TDataSource
    OnDataChange = dsConsultaDataChange
    Left = 48
    Top = 140
  end
  inherited SortDialog: TSortDialog
    Left = 20
    Top = 168
  end
  inherited ExportDialog: TExportDialog
    Left = 48
    Top = 168
  end
  inherited QueryPrint: TQueryPrint
    Left = 48
    Top = 196
  end
  inherited Seguridad: TSeguridad
    Left = 20
    Top = 112
  end
  inherited FormStorage: TFormStorage
    Left = 48
    Top = 112
  end
  inherited PrintDialog: TPrintDialog
    Left = 20
    Top = 196
  end
  inherited ShortCutControl: TShortCutControl
    Left = 76
    Top = 112
  end
  inherited FieldHider: TFieldHider
    Left = 76
    Top = 140
  end
  object pmnuImprimir: TPopupMenu
    Left = 76
    Top = 168
    object mnuImpResultados: TMenuItem
      Caption = 'Imprimir Resultados'
      OnClick = mnuImpResultadosClick
    end
    object mnuImpImagenes: TMenuItem
      Caption = 'Imprimir Im'#225'genes'
      OnClick = mnuImpImagenesClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnuImpresionAutomatica: TMenuItem
      Caption = 'Impresi'#243'n Autom'#225'tica'
      OnClick = mnuImpresionAutomaticaClick
    end
  end
  object pmnuSeleccion: TPopupMenu
    Left = 76
    Top = 196
    object mnuSelTodo: TMenuItem
      Caption = 'Seleccionar Todo'
      OnClick = mnuSelTodoClick
    end
    object mnuSelLimpiar: TMenuItem
      Caption = 'Limpiar la Seleccin'
      OnClick = mnuSelLimpiarClick
    end
    object mnuSelInvertir: TMenuItem
      Caption = 'Invertir la Selecci'#243'n'
      OnClick = mnuSelInvertirClick
    end
  end
  object sd: TSaveDialog
    DefaultExt = '*.bmp'
    Filter = 'Archivo de Im'#225'genes BMP|*.bmp'
    Left = 160
    Top = 120
  end
end
