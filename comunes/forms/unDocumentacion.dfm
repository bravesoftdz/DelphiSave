inherited frmDocumentacion: TfrmDocumentacion
  Left = 140
  Top = 160
  ActiveControl = edFechaDesde
  Caption = 'Documentaci'#243'n Mesa de Entradas'
  ClientHeight = 678
  ClientWidth = 1292
  Constraints.MinHeight = 500
  Constraints.MinWidth = 800
  ExplicitLeft = 140
  ExplicitTop = 160
  ExplicitWidth = 1300
  ExplicitHeight = 708
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 1292
    Height = 178
    Visible = True
    ExplicitWidth = 798
    ExplicitHeight = 178
    DesignSize = (
      1292
      178)
    object GroupBox1: TGroupBox
      Left = 4
      Top = 1
      Width = 212
      Height = 44
      Caption = ' Fecha '
      TabOrder = 0
      object Label1: TLabel
        Left = 100
        Top = 20
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Serif'
        Font.Style = []
        ParentFont = False
      end
      object edFechaDesde: TDateComboBox
        Left = 8
        Top = 16
        Width = 88
        Height = 21
        MaxDateCombo = edFechaHasta
        TabOrder = 0
      end
      object edFechaHasta: TDateComboBox
        Left = 116
        Top = 16
        Width = 88
        Height = 21
        MinDateCombo = edFechaDesde
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 220
      Top = 1
      Width = 212
      Height = 44
      Caption = ' C'#243'digo '
      TabOrder = 1
      object Label6: TLabel
        Left = 100
        Top = 20
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Serif'
        Font.Style = []
        ParentFont = False
      end
      object edCodigoDesde: TIntEdit
        Left = 8
        Top = 16
        Width = 88
        Height = 21
        Hint = 'Nota de D'#233'bito Desde'
        TabOrder = 0
        AutoExit = True
        MaxLength = 8
      end
      object edCodigoHasta: TIntEdit
        Left = 116
        Top = 16
        Width = 88
        Height = 21
        Hint = 'Nota de D'#233'bito Hasta'
        TabOrder = 1
        AutoExit = True
        MaxLength = 8
      end
    end
    object GroupBox3: TGroupBox
      Left = 436
      Top = 1
      Width = 852
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Remitente '
      TabOrder = 2
      DesignSize = (
        852
        44)
      object edRemitenteBusqueda: TEdit
        Left = 8
        Top = 16
        Width = 836
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        TabOrder = 0
      end
    end
    object GroupBox4: TGroupBox
      Left = 4
      Top = 44
      Width = 236
      Height = 44
      Caption = ' Usuario Destino '
      TabOrder = 3
      DesignSize = (
        236
        44)
      inline fraUsuarioDestinoBusqueda: TfraUsuarios
        Left = 8
        Top = 16
        Width = 220
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 16
        ExplicitWidth = 220
        DesignSize = (
          220
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 74
          Width = 146
          ExplicitLeft = 74
          ExplicitWidth = 146
        end
        inherited edCodigo: TPatternEdit
          Left = 0
          Width = 72
          ExplicitLeft = 0
          ExplicitWidth = 72
        end
      end
    end
    object GroupBox5: TGroupBox
      Left = 244
      Top = 44
      Width = 236
      Height = 44
      Caption = ' Sector Destino '
      TabOrder = 4
      DesignSize = (
        236
        44)
      inline fraSectorDestinoBusqueda: TfraCodigoDescripcion
        Left = 8
        Top = 16
        Width = 220
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        DoubleBuffered = True
        ParentDoubleBuffered = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 16
        ExplicitWidth = 220
        ExplicitHeight = 24
        DesignSize = (
          220
          24)
        inherited cmbDescripcion: TArtComboBox
          Left = 82
          Width = 139
          DataSource = nil
          ExplicitLeft = 82
          ExplicitWidth = 139
        end
        inherited edCodigo: TPatternEdit
          Width = 80
          ExplicitWidth = 80
        end
      end
    end
    object GroupBox6: TGroupBox
      Left = 484
      Top = 44
      Width = 804
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Usuario Recepci'#243'n '
      TabOrder = 5
      DesignSize = (
        804
        44)
      inline fraUsuarioRecepcionBusqueda: TfraUsuarios
        Left = 8
        Top = 16
        Width = 788
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 16
        ExplicitWidth = 788
        DesignSize = (
          788
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 74
          Width = 714
          ExplicitLeft = 74
          ExplicitWidth = 714
        end
        inherited edCodigo: TPatternEdit
          Left = 0
          Width = 72
          ExplicitLeft = 0
          ExplicitWidth = 72
        end
      end
    end
    object GroupBox7: TGroupBox
      Left = 4
      Top = 87
      Width = 212
      Height = 44
      Caption = ' Fecha Recepci'#243'n '
      TabOrder = 6
      object Label2: TLabel
        Left = 100
        Top = 20
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Serif'
        Font.Style = []
        ParentFont = False
      end
      object edFechaRecepcionDesde: TDateComboBox
        Left = 8
        Top = 16
        Width = 88
        Height = 21
        MaxDateCombo = edFechaRecepcionHasta
        TabOrder = 0
      end
      object edFechaRecepcionHasta: TDateComboBox
        Left = 116
        Top = 16
        Width = 88
        Height = 21
        MinDateCombo = edFechaRecepcionDesde
        TabOrder = 1
      end
    end
    object GroupBox8: TGroupBox
      Left = 220
      Top = 87
      Width = 185
      Height = 44
      Caption = ' Remito '
      TabOrder = 7
      object Label3: TLabel
        Left = 86
        Top = 20
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Serif'
        Font.Style = []
        ParentFont = False
      end
      object edRemitoDesde: TIntEdit
        Left = 8
        Top = 16
        Width = 73
        Height = 21
        Hint = 'Nota de D'#233'bito Desde'
        TabOrder = 0
        OnExit = edRemitoDesdeExit
        AutoExit = True
        MaxLength = 8
      end
      object edRemitoHasta: TIntEdit
        Left = 104
        Top = 16
        Width = 73
        Height = 21
        Hint = 'Nota de D'#233'bito Hasta'
        TabOrder = 1
        OnExit = edRemitoHastaExit
        AutoExit = True
        MaxLength = 8
      end
    end
    object GroupBox11: TGroupBox
      Left = 410
      Top = 87
      Width = 759
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Tipo de Documento '
      TabOrder = 8
      DesignSize = (
        759
        44)
      inline fraTipoDocumentoBusqueda: TfraCtbTablas
        Left = 8
        Top = 16
        Width = 746
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 16
        ExplicitWidth = 746
        DesignSize = (
          746
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 56
          Top = 0
          Width = 688
          ExplicitLeft = 56
          ExplicitTop = 0
          ExplicitWidth = 688
        end
        inherited edCodigo: TPatternEdit
          Left = 0
          Top = 0
          Width = 53
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 53
        end
      end
    end
    object gbSecTrazabilidad: TGroupBox
      Left = 4
      Top = 130
      Width = 127
      Height = 44
      Caption = 'Sec. Trazabilidad'
      TabOrder = 10
      DesignSize = (
        127
        44)
      object edSecTrazabilidad: TCurrencyEdit
        Left = 9
        Top = 16
        Width = 110
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0;-0'
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 10
        TabOrder = 0
      end
    end
    object ogEstado: TOptionGroup
      Left = 136
      Top = 130
      Width = 611
      Height = 44
      Caption = 'Estado'
      Columns = 4
      ItemIndex = 3
      Items.Strings = (
        'Pend. Generar el Remito'
        'Pend. Recepci'#243'n Usuarios'
        'Recepcionados Usuarios'
        'Todos los Documentos')
      TabOrder = 11
    end
    object GroupBox9: TGroupBox
      Left = 1173
      Top = 87
      Width = 115
      Height = 44
      Anchors = [akTop, akRight]
      Caption = 'Destino Documentos'
      TabOrder = 9
      object chkSoloSectorLog: TCheckBox
        Left = 10
        Top = 14
        Width = 99
        Height = 27
        Caption = 'Solo Sector Usu. Logueado'
        TabOrder = 0
        WordWrap = True
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 178
    Width = 1292
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 1286
      end>
    ExplicitTop = 178
    ExplicitWidth = 1292
    inherited ToolBar: TToolBar
      Width = 1277
      ExplicitWidth = 1277
      DesignSize = (
        1273
        23)
      inherited ToolButton4: TToolButton
        Visible = True
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Recepci'#243'n'
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      inherited tbImprimir: TToolButton
        DropdownMenu = popupImprimir
        Style = tbsDropDown
        ExplicitWidth = 38
      end
      inherited tbExportar: TToolButton
        Left = 254
        ExplicitLeft = 254
      end
      inherited tbEnviarMail: TToolButton
        Left = 277
        ExplicitLeft = 277
      end
      inherited ToolButton8: TToolButton
        Left = 300
        Visible = True
        ExplicitLeft = 300
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 308
        Visible = True
        ExplicitLeft = 308
      end
      inherited tbMaxRegistros: TToolButton
        Left = 331
        ExplicitLeft = 331
      end
      inherited ToolButton11: TToolButton
        Left = 354
        Visible = False
        ExplicitLeft = 354
      end
      inherited tbSalir: TToolButton
        Left = 362
        Visible = False
        ExplicitLeft = 362
      end
      object ToolButton1: TToolButton
        Left = 385
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbDerivacion: TToolButton
        Left = 393
        Top = 0
        Hint = 'Derivaci'#243'n (Ctrl+D)'
        ImageIndex = 22
        OnClick = tbDerivacionClick
      end
      object ToolButton7: TToolButton
        Left = 416
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbBuscarCodigoBarras: TToolButton
        Left = 424
        Top = 0
        Hint = 'Buscar C'#243'digo de Barras (F4)'
        ImageIndex = 9
        OnClick = tbBuscarCodigoBarrasClick
      end
      object ToolButton2: TToolButton
        Left = 447
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbHistorico: TToolButton
        Left = 455
        Top = 0
        Hint = 'Hist'#243'rico'
        ImageIndex = 16
        OnClick = tbHistoricoClick
      end
      object ToolButton12: TToolButton
        Left = 478
        Top = 0
        Width = 8
        Caption = 'ToolButton12'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbAnularRemito: TToolButton
        Left = 486
        Top = 0
        Hint = 'Anular Remito'
        ImageIndex = 39
        OnClick = tbAnularRemitoClick
      end
      object tbAnularRecepcion: TToolButton
        Left = 509
        Top = 0
        Hint = 'Anular Recepci'#243'n'
        ImageIndex = 45
        OnClick = tbAnularRecepcionClick
      end
      object ToolButton10: TToolButton
        Left = 532
        Top = 0
        Width = 8
        Caption = 'ToolButton10'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 540
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
      object pnlSeleccionados: TPanel
        Left = 563
        Top = 0
        Width = 160
        Height = 22
        Alignment = taLeftJustify
        Anchors = [akTop, akRight]
        BevelOuter = bvNone
        Caption = ' Cant. Selecc.: '
        TabOrder = 0
        object edCantSelecc: TCardinalEdit
          Left = 74
          Top = 0
          Width = 82
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clSilver
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
      end
      object pnlBajas: TPanel
        Left = 723
        Top = 0
        Width = 107
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object chkNoBajas: TCheckBox
          Left = 4
          Top = 2
          Width = 103
          Height = 18
          Caption = 'No Mostrar Bajas'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 207
    Width = 1292
    Height = 471
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = pmnuGrid
    OnCellClick = GridCellClick
    OnDrawColumnCell = GridDrawColumnCell
    OnKeyUp = GridKeyUp
    OnGetCellProps = GridGetCellProps
    OnGetCellParams = nil
    Columns = <
      item
        Expanded = False
        FieldName = 'CHECKBOX'
        Title.Caption = '.'
        Width = 16
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SECUENCIATRAZABIL'
        Title.Alignment = taCenter
        Title.Caption = 'Sec. Trazabilidad'
        Width = 94
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'DR_ID'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 71
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DR_FECHA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRTIPODOCUMENTO'
        Title.Caption = 'Tipo Documento'
        Width = 139
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DR_REMITENTE'
        Title.Caption = 'Remitente'
        Width = 139
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USE_DEST'
        Title.Caption = 'Usuario Destino'
        Width = 153
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_DESCRIPCION'
        Title.Caption = 'Sector Destino'
        Width = 174
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'DR_REMITO'
        Title.Alignment = taCenter
        Title.Caption = 'Remito'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DR_FECHAREMITO'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Remito'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USE_REC'
        Title.Caption = 'Usuario Recepci'#243'n'
        Width = 128
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DR_FECHARECEPCION'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Recepci'#243'n'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USE_DER'
        Title.Caption = 'Derivado A'
        Width = 122
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHADERIVACION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Derivaci'#243'n'
        Width = 74
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SINICOMPLETO'
        Title.Alignment = taCenter
        Title.Caption = 'Siniestro'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DR_CONTRATO'
        Title.Alignment = taCenter
        Title.Caption = 'Contrato'
        Width = 61
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'DR_NUMERODOCUMENTO'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Documento'
        Width = 90
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIL'
        Title.Alignment = taCenter
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DR_NOMBRE'
        Title.Caption = 'Nombre'
        Width = 169
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DR_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 221
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUALTADOC'
        Title.Caption = 'Usuario Alta Doc.'
        Width = 170
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAALTADOC'
        Title.Alignment = taCenter
        Title.Caption = 'F. Alta Doc.'
        Width = 76
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DR_FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Baja'
        Width = 80
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 123
    Top = 237
    Width = 635
    Height = 378
    Caption = 'Documento'
    BorderStyle = bsDialog
    OnShow = fpAbmShow
    OnEnter = fpAbmEnter
    ExplicitLeft = 123
    ExplicitTop = 237
    ExplicitWidth = 635
    ExplicitHeight = 378
    DesignSize = (
      635
      378)
    inherited BevelAbm: TBevel
      Top = 342
      Width = 627
      ExplicitTop = 292
      ExplicitWidth = 432
    end
    object Label4: TLabel [1]
      Left = 8
      Top = 12
      Width = 94
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'C'#243'digo'
    end
    object Label5: TLabel [2]
      Left = 8
      Top = 40
      Width = 94
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Fecha'
    end
    object Label7: TLabel [3]
      Left = 8
      Top = 95
      Width = 94
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Remitente'
    end
    object Label8: TLabel [4]
      Left = 8
      Top = 123
      Width = 94
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Usuario Destino'
    end
    object Label9: TLabel [5]
      Left = 8
      Top = 151
      Width = 94
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Sector Destino'
    end
    object Label10: TLabel [6]
      Left = 8
      Top = 67
      Width = 94
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Tipo de Documento'
    end
    object Label11: TLabel [7]
      Left = 8
      Top = 321
      Width = 94
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Observaciones'
    end
    object Label12: TLabel [8]
      Left = 8
      Top = 266
      Width = 94
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'CUIL'
    end
    object Label13: TLabel [9]
      Left = 8
      Top = 294
      Width = 94
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Nombre'
    end
    object Label17: TLabel [10]
      Left = 8
      Top = 239
      Width = 94
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'N'#186' de Documento'
    end
    object Label16: TLabel [11]
      Left = 8
      Top = 210
      Width = 94
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'CUIT'
    end
    object Label18: TLabel [12]
      Left = 8
      Top = 179
      Width = 94
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Siniestro'
    end
    inherited btnAceptar: TButton
      Left = 483
      Top = 348
      Width = 72
      TabOrder = 13
      ExplicitLeft = 288
      ExplicitTop = 298
      ExplicitWidth = 72
    end
    inherited btnCancelar: TButton
      Left = 555
      Top = 348
      Width = 72
      Caption = 'Ca&ncelar'
      TabOrder = 14
      ExplicitLeft = 360
      ExplicitTop = 298
      ExplicitWidth = 72
    end
    object edCodigo: TIntEdit
      Left = 112
      Top = 8
      Width = 88
      Height = 21
      TabOrder = 0
      AutoExit = True
    end
    object edFecha: TDateComboBox
      Left = 112
      Top = 36
      Width = 88
      Height = 21
      MinDateCombo = edFechaDesde
      TabOrder = 1
    end
    object edRemitente: TEdit
      Left = 112
      Top = 91
      Width = 515
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 240
      TabOrder = 3
    end
    object edObservaciones: TEdit
      Left = 112
      Top = 317
      Width = 515
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 240
      TabOrder = 11
    end
    object edCuil: TMaskEdit
      Left = 112
      Top = 262
      Width = 80
      Height = 21
      EditMask = '99-99999999-c;0;'
      MaxLength = 13
      TabOrder = 9
    end
    object edNombre: TEdit
      Left = 112
      Top = 290
      Width = 515
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 60
      TabOrder = 10
    end
    inline fraUsuarioDestino: TfraUsuarios
      Left = 112
      Top = 119
      Width = 515
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      ExplicitLeft = 112
      ExplicitTop = 119
      ExplicitWidth = 515
      DesignSize = (
        515
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 82
        Top = 0
        Width = 433
        ExplicitLeft = 82
        ExplicitTop = 0
        ExplicitWidth = 433
      end
      inherited edCodigo: TPatternEdit
        Left = 0
        Top = 0
        Width = 80
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 80
      end
    end
    inline fraTipoDocumento: TfraCtbTablas
      Left = 112
      Top = 63
      Width = 515
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      ExplicitLeft = 112
      ExplicitTop = 63
      ExplicitWidth = 515
      DesignSize = (
        515
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 82
        Top = 0
        Width = 433
        ExplicitLeft = 82
        ExplicitTop = 0
        ExplicitWidth = 433
      end
      inherited edCodigo: TPatternEdit
        Left = 0
        Top = 0
        Width = 80
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 80
      end
    end
    object edNumeroDocumento: TIntEdit
      Left = 112
      Top = 235
      Width = 88
      Height = 21
      TabOrder = 8
      AutoExit = True
      MaxLength = 8
    end
    object btnContinuar: TButton
      Left = 387
      Top = 348
      Width = 80
      Height = 25
      Hint = 
        'Graba los datos actuales y deja la ventana abierta para continua' +
        'r cargando datos nuevos'
      Anchors = [akRight, akBottom]
      Caption = '&Continuar  >>'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
      OnClick = btnContinuarClick
    end
    object chkImprimirEtiqueta: TCheckBox
      Left = 526
      Top = 10
      Width = 101
      Height = 17
      TabStop = False
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'Imprimir Etiqueta'
      TabOrder = 15
    end
    inline fraSectorDestino: TfraCodigoDescripcion
      Left = 112
      Top = 146
      Width = 515
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      DoubleBuffered = True
      ParentDoubleBuffered = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 5
      ExplicitLeft = 112
      ExplicitTop = 146
      ExplicitWidth = 515
      DesignSize = (
        515
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 82
        Width = 433
        DataSource = nil
        ExplicitLeft = 82
        ExplicitWidth = 433
      end
      inherited edCodigo: TPatternEdit
        Left = 0
        Width = 80
        ExplicitLeft = 0
        ExplicitWidth = 80
      end
    end
    inline fraEmpresa: TfraEmpresa
      Left = 113
      Top = 206
      Width = 514
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      TabStop = True
      ExplicitLeft = 113
      ExplicitTop = 206
      ExplicitWidth = 514
      ExplicitHeight = 21
      DesignSize = (
        514
        21)
      inherited lbContrato: TLabel
        Left = 410
        ExplicitLeft = 447
      end
      inherited edContrato: TIntEdit
        Left = 457
        ExplicitLeft = 457
      end
      inherited cmbRSocial: TArtComboBox
        Width = 275
        ExplicitWidth = 275
      end
    end
    object edSiniestro: TSinEdit
      Left = 112
      Top = 176
      Width = 100
      Height = 21
      Hint = 'C'#243'digo de Siniestro '
      TabOrder = 6
    end
  end
  object fpDerivacion: TFormPanel [4]
    Left = 774
    Top = 452
    Width = 392
    Height = 74
    Caption = 'Derivaci'#243'n'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    ActiveControl = fraUsuarioDerivacion.edCodigo
    OnEnter = fpDerivacionEnter
    DesignSize = (
      392
      74)
    object Bevel2: TBevel
      Left = 4
      Top = 38
      Width = 384
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label20: TLabel
      Left = 8
      Top = 13
      Width = 90
      Height = 13
      Caption = 'Usuario Derivaci'#243'n'
    end
    object btnAceptarDerivacion: TButton
      Left = 240
      Top = 44
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 1
      OnClick = btnAceptarDerivacionClick
    end
    object btnCancelarDerivacion: TButton
      Left = 312
      Top = 44
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
    inline fraUsuarioDerivacion: TfraUsuarios
      Left = 104
      Top = 9
      Width = 280
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 104
      ExplicitTop = 9
      ExplicitWidth = 280
      DesignSize = (
        280
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 60
        Width = 218
        ExplicitLeft = 60
        ExplicitWidth = 218
      end
      inherited edCodigo: TPatternEdit
        Left = 0
        Width = 56
        ExplicitLeft = 0
        ExplicitWidth = 56
      end
    end
  end
  object fpRemitosMasivos: TFormPanel [5]
    Left = 774
    Top = 236
    Width = 172
    Height = 114
    Caption = 'Remitos Masivos'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnShow = fpRemitosMasivosShow
    DesignSize = (
      172
      114)
    object Bevel1: TBevel
      Left = 4
      Top = 78
      Width = 164
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
      ExplicitTop = 38
      ExplicitWidth = 384
    end
    object btnrAceptarRemitosMasivos: TButton
      Left = 20
      Top = 84
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 1
      OnClick = btnrAceptarRemitosMasivosClick
    end
    object btnCancelarRemitosMasivos: TButton
      Left = 92
      Top = 84
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
    object ogRemitosMasivos: TOptionGroup
      Left = 10
      Top = 4
      Width = 152
      Height = 70
      Caption = 'Opciones'
      ItemIndex = 0
      Items.Strings = (
        'Generar e Imprimir'
        'Solo Generar')
      TabOrder = 0
    end
  end
  object fpUsuConectado: TFormPanel [6]
    Left = 774
    Top = 532
    Width = 392
    Height = 74
    Caption = 'Conexi'#243'n'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnEnter = fpUsuConectadoEnter
    DesignSize = (
      392
      74)
    object Bevel3: TBevel
      Left = 4
      Top = 38
      Width = 384
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label14: TLabel
      Left = 8
      Top = 13
      Width = 92
      Height = 13
      Caption = 'Conectarse como...'
    end
    object btnAceptarUsuConectado: TButton
      Left = 240
      Top = 46
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 1
      OnClick = btnAceptarUsuConectadoClick
    end
    object btnCancelarUsuConectado: TButton
      Left = 312
      Top = 46
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
    inline fraUsuConectado: TfraUsuarios
      Left = 104
      Top = 9
      Width = 280
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 104
      ExplicitTop = 9
      ExplicitWidth = 280
      DesignSize = (
        280
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 60
        Width = 219
        ExplicitLeft = 60
        ExplicitWidth = 219
      end
      inherited edCodigo: TPatternEdit
        Left = 0
        Width = 56
        ExplicitLeft = 0
        ExplicitWidth = 56
      end
    end
  end
  object fpListDocPendRecepcion: TFormPanel [7]
    Left = 774
    Top = 356
    Width = 552
    Height = 90
    Caption = 'Remitos no Recepcionados'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnEnter = fpListDocPendRecepcionEnter
    DesignSize = (
      552
      90)
    object Bevel4: TBevel
      Left = 4
      Top = 54
      Width = 544
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
      ExplicitTop = 38
      ExplicitWidth = 384
    end
    object btnAceptarDocPendRecepcion: TButton
      Left = 400
      Top = 60
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 2
      OnClick = btnAceptarDocPendRecepcionClick
    end
    object btnCancelarDocPendRecepcion: TButton
      Left = 472
      Top = 60
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 3
    end
    object GroupBox10: TGroupBox
      Left = 8
      Top = 5
      Width = 212
      Height = 44
      Caption = ' Fecha Remito'
      TabOrder = 0
      object Label15: TLabel
        Left = 100
        Top = 20
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Serif'
        Font.Style = []
        ParentFont = False
      end
      object edFRemDesde: TDateComboBox
        Left = 8
        Top = 16
        Width = 88
        Height = 21
        MaxDateCombo = edFRemHasta
        TabOrder = 0
      end
      object edFRemHasta: TDateComboBox
        Left = 116
        Top = 16
        Width = 88
        Height = 21
        MinDateCombo = edFRemDesde
        TabOrder = 1
      end
    end
    object GroupBox12: TGroupBox
      Left = 225
      Top = 5
      Width = 320
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Sector Destino '
      TabOrder = 1
      DesignSize = (
        320
        44)
      inline fraSectorDestinoRem: TfraCodigoDescripcion
        Left = 8
        Top = 16
        Width = 304
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        DoubleBuffered = True
        ParentDoubleBuffered = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 16
        ExplicitWidth = 304
        ExplicitHeight = 24
        DesignSize = (
          304
          24)
        inherited cmbDescripcion: TArtComboBox
          Left = 82
          Width = 220
          DataSource = nil
          ExplicitLeft = 82
          ExplicitWidth = 220
        end
        inherited edCodigo: TPatternEdit
          Width = 80
          ExplicitWidth = 80
        end
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    BeforeOpen = sdqConsultaBeforeOpen
    Top = 284
  end
  inherited dsConsulta: TDataSource
    Top = 284
  end
  inherited SortDialog: TSortDialog
    Top = 312
  end
  inherited ExportDialog: TExportDialog
    Top = 312
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
    Zoom = 80
    Options = [qoZoomPrint, qoZoomCalcFontSize]
    Top = 340
  end
  inherited Seguridad: TSeguridad
    Claves = <
      item
        Name = 'ModificarDocumento'
      end>
    Top = 256
  end
  inherited FormStorage: TFormStorage
    Top = 256
  end
  inherited PrintDialog: TPrintDialog
    Top = 340
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
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
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16463
        LinkControl = tbOrdenar
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end
      item
        Key = 16467
        LinkControl = tbSalir2
      end
      item
        Key = 16452
        LinkControl = tbDerivacion
      end
      item
        Key = 115
        LinkControl = tbBuscarCodigoBarras
      end>
    Top = 256
  end
  inherited FieldHider: TFieldHider
    Top = 284
  end
  object popupImprimir: TPopupMenu
    Left = 80
    Top = 312
    object mnuResultados: TMenuItem
      Caption = 'Resultados'
      OnClick = mnuResultadosClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object mnuRemito: TMenuItem
      Caption = 'Remito'
      OnClick = mnuRemitoClick
    end
    object mnuRemitosMasivos: TMenuItem
      Caption = 'Remitos Masivos'
      OnClick = mnuRemitosMasivosClick
    end
    object mnuRemitosNoRecepc: TMenuItem
      Caption = 'Remitos no Recepcionados'
      OnClick = mnuRemitosNoRecepcClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnuImprimirEtiquetas: TMenuItem
      Caption = 'Etiquetas'
      OnClick = mnuImprimirEtiquetasClick
    end
  end
  object pmnuGrid: TPopupMenu
    Left = 80
    Top = 340
    object mnuSeleccionarTodo: TMenuItem
      Caption = 'Marcar Todos'
      OnClick = mnuSeleccionarTodoClick
    end
    object mnuLimpiarSeleccion: TMenuItem
      Caption = 'Desmarcar Todos'
      OnClick = mnuLimpiarSeleccionClick
    end
    object mnuInvertirSeleccion: TMenuItem
      Caption = 'Invertir la Selecci'#243'n'
      OnClick = mnuInvertirSeleccionClick
    end
  end
  object tConexion: TTimer
    Interval = 500
    OnTimer = tConexionTimer
    Left = 140
    Top = 636
  end
end
