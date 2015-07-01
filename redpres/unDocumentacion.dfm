inherited frmDocumentacion: TfrmDocumentacion
  Left = 397
  Top = 70
  Width = 775
  Height = 629
  ActiveControl = edFechaDesde
  Caption = 'Documentaci'#243'n'
  Constraints.MinHeight = 417
  Constraints.MinWidth = 775
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 767
    Height = 143
    Visible = True
    DesignSize = (
      767
      143)
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
      Width = 327
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Remitente '
      TabOrder = 2
      DesignSize = (
        327
        44)
      object edRemitenteBusqueda: TEdit
        Left = 8
        Top = 16
        Width = 311
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        TabOrder = 0
      end
    end
    object GroupBox4: TGroupBox
      Left = 4
      Top = 47
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
        DesignSize = (
          220
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 74
          Width = 146
        end
        inherited edCodigo: TPatternEdit
          Left = 0
          Width = 72
        end
      end
    end
    object GroupBox5: TGroupBox
      Left = 244
      Top = 47
      Width = 236
      Height = 44
      Caption = ' Sector Destino '
      TabOrder = 4
      DesignSize = (
        236
        44)
      inline fraSectorDestinoBusqueda: TfraSectores
        Left = 8
        Top = 16
        Width = 220
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          220
          24)
        inherited edCodigo: TPatternEdit
          Width = 72
        end
        inherited cmbDescripcion: TArtComboBox
          Left = 74
          Width = 146
          Columns = <
            item
              Expanded = False
              FieldName = 'SC_CODIGO'
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SC_DESCRIPCION'
              Title.Caption = 'Descripci'#243'n'
              Width = 200
              Visible = True
            end>
        end
      end
    end
    object GroupBox6: TGroupBox
      Left = 484
      Top = 47
      Width = 279
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Usuario Recepci'#243'n '
      TabOrder = 5
      DesignSize = (
        279
        44)
      inline fraUsuarioRecepcionBusqueda: TfraUsuarios
        Left = 8
        Top = 16
        Width = 263
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          263
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 74
          Width = 189
        end
        inherited edCodigo: TPatternEdit
          Left = 0
          Width = 72
        end
      end
    end
    object GroupBox7: TGroupBox
      Left = 4
      Top = 94
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
      Top = 94
      Width = 212
      Height = 44
      Caption = ' Remito '
      TabOrder = 7
      object Label3: TLabel
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
      object edRemitoDesde: TIntEdit
        Left = 8
        Top = 16
        Width = 88
        Height = 21
        Hint = 'Nota de D'#233'bito Desde'
        TabOrder = 0
        AutoExit = True
        MaxLength = 8
      end
      object edRemitoHasta: TIntEdit
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
    object GroupBox9: TGroupBox
      Left = 436
      Top = 94
      Width = 88
      Height = 44
      TabOrder = 8
      object checkSinRecibir: TCheckBox
        Left = 4
        Top = 18
        Width = 76
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Sin Recibir'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
    end
    object GroupBox10: TGroupBox
      Left = 528
      Top = 94
      Width = 88
      Height = 44
      TabOrder = 9
      object checkSinRemito: TCheckBox
        Left = 4
        Top = 18
        Width = 76
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Sin Remito'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
    end
    object GroupBox11: TGroupBox
      Left = 620
      Top = 94
      Width = 143
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Tipo de Documento '
      TabOrder = 10
      DesignSize = (
        143
        44)
      inline fraTipoDocumentoBusqueda: TfraCtbTablas
        Left = 8
        Top = 16
        Width = 130
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          130
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 56
          Top = 0
          Width = 72
        end
        inherited edCodigo: TPatternEdit
          Left = 0
          Top = 0
          Width = 53
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 143
    Width = 767
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 763
      end>
    inherited ToolBar: TToolBar
      Width = 750
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
      end
      inherited tbExportar: TToolButton
        Left = 252
      end
      inherited tbEnviarMail: TToolButton
        Left = 275
      end
      inherited ToolButton8: TToolButton
        Left = 298
        Visible = True
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
        Visible = False
      end
      inherited tbSalir: TToolButton
        Left = 360
        Visible = False
      end
      object ToolButton1: TToolButton
        Left = 383
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbDerivacion: TToolButton
        Left = 391
        Top = 0
        Hint = 'Derivaci'#243'n (Ctrl+D)'
        ImageIndex = 22
        OnClick = tbDerivacionClick
      end
      object ToolButton2: TToolButton
        Left = 414
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 422
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 172
    Width = 767
    Height = 430
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    PopupMenu = pmnuGrid
    MultiSelect = True
    Columns = <
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'dr_id'
        Title.Alignment = taRightJustify
        Title.Caption = 'C'#243'digo'
        Width = 71
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'dr_fecha'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dr_remitente'
        Title.Caption = 'Remitente'
        Width = 139
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'use_dest'
        Title.Caption = 'Usuario Destino'
        Width = 133
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sc_descripcion'
        Title.Caption = 'Sector Destino'
        Width = 139
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tb_descripcion'
        Title.Caption = 'Tipo Documento'
        Width = 133
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'dr_numerodocumento'
        Title.Alignment = taRightJustify
        Title.Caption = 'N'#186' Documento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dr_observaciones'
        Title.Caption = 'Observaciones'
        Width = 221
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'use_rec'
        Title.Caption = 'Usuario Recepci'#243'n'
        Width = 120
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'dr_fecharecepcion'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Recepci'#243'n'
        Width = 125
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'dr_remito'
        Title.Alignment = taRightJustify
        Title.Caption = 'Remito'
        Width = 86
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'dr_fecharemito'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Remito'
        Width = 104
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'dr_cuil'
        Title.Alignment = taCenter
        Title.Caption = 'CUIL'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dr_nombre'
        Title.Caption = 'Nombre'
        Width = 109
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'dr_fechabaja'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Baja'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'use_der'
        Title.Caption = 'Derivado A'
        Width = 122
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'fechaderivacion'
        Title.Alignment = taCenter
        Title.Caption = 'F. Derivaci'#243'n'
        Width = 74
        Visible = True
      end>
  end
  object fpRecepcion: TFormPanel [3]
    Left = 444
    Top = 15
    Width = 392
    Height = 136
    Caption = 'Recepci'#243'n'
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    ActiveControl = fraRemito.edCodigo
    DesignSize = (
      392
      136)
    object Bevel1: TBevel
      Left = 4
      Top = 100
      Width = 384
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label14: TLabel
      Left = 8
      Top = 12
      Width = 33
      Height = 13
      Caption = 'Remito'
    end
    object Label15: TLabel
      Left = 8
      Top = 40
      Width = 85
      Height = 13
      Caption = 'Fecha Recepci'#243'n'
    end
    object Label16: TLabel
      Left = 8
      Top = 68
      Width = 91
      Height = 13
      Caption = 'Usuario Recepci'#243'n'
    end
    object btnAceptar2: TButton
      Left = 240
      Top = 106
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 3
      OnClick = btnAceptar2Click
    end
    object btnCancelar2: TButton
      Left = 312
      Top = 106
      Width = 72
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 4
      OnClick = btnCancelar2Click
    end
    inline fraUsuarioRecepcion: TfraUsuarios
      Left = 104
      Top = 64
      Width = 280
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      DesignSize = (
        280
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 60
        Width = 220
      end
      inherited edCodigo: TPatternEdit
        Left = 0
        Width = 56
      end
    end
    inline fraRemito: TfraCodDesc
      Left = 104
      Top = 8
      Width = 137
      Height = 23
      TabOrder = 0
      DesignSize = (
        137
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 60
        Top = 0
        Width = 76
      end
      inherited edCodigo: TPatternEdit
        Left = 0
        Top = 0
        Width = 57
        TabStop = False
      end
      inherited Propiedades: TPropiedadesFrame
        CodigoType = ctInteger
        FieldCodigo = 'codigo'
        FieldDesc = 'descripcion'
        FieldID = 'id'
        IdType = ctInteger
        ShowBajas = True
        Sql = 
          'SELECT DISTINCT dr_remito ID, dr_remito codigo, dr_remitente des' +
          'cripcion, dr_fechabaja baja FROM cdr_documentacionrecibida WHERE' +
          ' dr_fechabaja IS NULL AND dr_fecharecepcion IS NULL AND dr_remit' +
          'o IS NOT NULL'
        TableName = 'cdr_documentacionrecibida'
        Left = 64
        Top = 6
      end
    end
    object edFechaRecepcion: TDateComboBox
      Left = 104
      Top = 36
      Width = 88
      Height = 21
      TabOrder = 1
    end
  end
  inherited fpAbm: TFormPanel
    Left = 172
    Top = 223
    Width = 440
    Height = 328
    Caption = 'Documento'
    BorderStyle = bsDialog
    OnShow = fpAbmShow
    DesignSize = (
      440
      328)
    inherited BevelAbm: TBevel
      Top = 292
      Width = 432
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
      Left = 12
      Top = 68
      Width = 94
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Remitente'
    end
    object Label8: TLabel [4]
      Left = 8
      Top = 96
      Width = 94
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Usuario Destino'
    end
    object Label9: TLabel [5]
      Left = 8
      Top = 124
      Width = 94
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Sector Destino'
    end
    object Label10: TLabel [6]
      Left = 8
      Top = 152
      Width = 94
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Tipo de Documento'
    end
    object Label11: TLabel [7]
      Left = 8
      Top = 208
      Width = 94
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Observaciones'
    end
    object Label12: TLabel [8]
      Left = 8
      Top = 236
      Width = 94
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'C.U.I.L.'
    end
    object Label13: TLabel [9]
      Left = 8
      Top = 264
      Width = 94
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Nombre'
    end
    object Label17: TLabel [10]
      Left = 8
      Top = 180
      Width = 94
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'N'#186' de Documento'
    end
    inherited btnAceptar: TButton
      Left = 288
      Top = 298
      Width = 72
      TabOrder = 11
    end
    inherited btnCancelar: TButton
      Left = 360
      Top = 298
      Width = 72
      Caption = 'Ca&ncelar'
      TabOrder = 12
    end
    object edCodigo: TIntEdit
      Left = 112
      Top = 8
      Width = 88
      Height = 21
      TabOrder = 0
      AutoExit = True
      MaxLength = 8
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
      Top = 64
      Width = 320
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 240
      TabOrder = 2
    end
    object edObservaciones: TEdit
      Left = 112
      Top = 204
      Width = 320
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 240
      TabOrder = 7
    end
    object edCuil: TMaskEdit
      Left = 112
      Top = 232
      Width = 80
      Height = 21
      EditMask = '99-99999999-c;0;'
      MaxLength = 13
      TabOrder = 8
    end
    object edNombre: TEdit
      Left = 112
      Top = 260
      Width = 320
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 60
      TabOrder = 9
    end
    inline fraUsuarioDestino: TfraUsuarios
      Left = 112
      Top = 92
      Width = 320
      Height = 23
      TabOrder = 3
      DesignSize = (
        320
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 82
        Top = 0
        Width = 238
      end
      inherited edCodigo: TPatternEdit
        Left = 0
        Top = 0
        Width = 80
      end
    end
    inline fraSectorDestino: TfraSectores
      Left = 112
      Top = 120
      Width = 320
      Height = 24
      TabOrder = 4
      DesignSize = (
        320
        24)
      inherited edCodigo: TPatternEdit
        Width = 80
      end
      inherited cmbDescripcion: TArtComboBox
        Left = 82
        Width = 238
        Columns = <
          item
            Expanded = False
            FieldName = 'SC_CODIGO'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SC_DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 200
            Visible = True
          end>
      end
    end
    inline fraTipoDocumento: TfraCtbTablas
      Left = 112
      Top = 148
      Width = 320
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
      DesignSize = (
        320
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 82
        Top = 0
        Width = 238
      end
      inherited edCodigo: TPatternEdit
        Left = 0
        Top = 0
        Width = 80
      end
    end
    object edNumeroDocumento: TIntEdit
      Left = 112
      Top = 176
      Width = 88
      Height = 21
      TabOrder = 6
      AutoExit = True
      MaxLength = 8
    end
    object btnContinuar: TButton
      Left = 192
      Top = 298
      Width = 80
      Height = 25
      Hint = 
        'Graba los datos actuales y deja la ventana abierta para continua' +
        'r cargando datos nuevos'
      Caption = '&Continuar  >>'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnClick = btnContinuarClick
    end
  end
  object fpDerivacion: TFormPanel [5]
    Left = 380
    Top = 87
    Width = 392
    Height = 74
    Caption = 'Derivaci'#243'n'
    FormWidth = 0
    FormHeigth = 0
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
      DesignSize = (
        280
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 60
        Width = 218
      end
      inherited edCodigo: TPatternEdit
        Left = 0
        Width = 56
      end
    end
  end
  inherited sdqConsulta: TSDQuery
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
    object mnuRemito: TMenuItem
      Caption = 'Remito'
      OnClick = mnuRemitoClick
    end
    object mnuRemitosMasivos: TMenuItem
      Caption = 'Remitos Masivos'
      OnClick = mnuRemitosMasivosClick
    end
  end
  object pmnuGrid: TPopupMenu
    Left = 80
    Top = 340
    object mnuSeleccionarTodo: TMenuItem
      Caption = 'Seleccionar Todo'
      OnClick = mnuSeleccionarTodoClick
    end
    object mnuLimpiarSeleccion: TMenuItem
      Caption = 'Limpiar la Selecci'#243'n'
      OnClick = mnuLimpiarSeleccionClick
    end
    object mnuInvertirSeleccion: TMenuItem
      Caption = 'Invertir la Selecci'#243'n'
      OnClick = mnuInvertirSeleccionClick
    end
  end
end
