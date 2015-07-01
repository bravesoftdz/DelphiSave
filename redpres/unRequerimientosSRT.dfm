inherited frmRequerimientosSRT: TfrmRequerimientosSRT
  Left = 253
  Top = 178
  Width = 732
  Caption = 'Requerimientos SRT'
  Constraints.MinHeight = 300
  Constraints.MinWidth = 690
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 724
    Height = 168
    object gbFechaRequerimiento: TGroupBox
      Left = 5
      Top = 1
      Width = 222
      Height = 41
      Caption = 'Fecha de &requermiento'
      TabOrder = 0
      object Label2: TLabel
        Left = 104
        Top = 17
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edFechaRequermientoDesde: TDateComboBox
        Left = 7
        Top = 15
        Width = 90
        Height = 21
        MaxDateCombo = edFechaRequermientoHasta
        TabOrder = 0
        OnExit = edFechaRequermientoDesdeExit
      end
      object edFechaRequermientoHasta: TDateComboBox
        Left = 127
        Top = 15
        Width = 90
        Height = 21
        MinDateCombo = edFechaRequermientoDesde
        TabOrder = 1
      end
    end
    object gbFechaVencimiento: TGroupBox
      Left = 230
      Top = 1
      Width = 222
      Height = 41
      Caption = 'Fecha de &vencimiento'
      TabOrder = 1
      object Label1: TLabel
        Left = 104
        Top = 17
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edFechaVencimientoDesde: TDateComboBox
        Left = 7
        Top = 15
        Width = 90
        Height = 21
        MaxDateCombo = edFechaVencimientoHasta
        TabOrder = 0
        OnExit = edFechaVencimientoDesdeExit
      end
      object edFechaVencimientoHasta: TDateComboBox
        Left = 123
        Top = 15
        Width = 90
        Height = 21
        MinDateCombo = edFechaVencimientoDesde
        TabOrder = 1
      end
    end
    object gbEntregadoA: TGroupBox
      Left = 536
      Top = 42
      Width = 183
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      Caption = '&Entregado a'
      TabOrder = 7
      DesignSize = (
        183
        41)
      inline fraUsuarioEntregadoA: TfraUsuario
        Left = 7
        Top = 15
        Width = 170
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Width = 86
        end
      end
    end
    object gbSiniestro: TGroupBox
      Left = 442
      Top = 42
      Width = 91
      Height = 41
      Caption = 'S&iniestro'
      TabOrder = 2
      DesignSize = (
        91
        41)
      object edSiniestro: TSinEdit
        Left = 6
        Top = 15
        Width = 79
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ViewStyle = [etSiniestro]
      end
    end
    object gbNroSRT: TGroupBox
      Left = 344
      Top = 42
      Width = 95
      Height = 41
      Caption = 'Nr&o. SRT'
      TabOrder = 4
      DesignSize = (
        95
        41)
      object edNroSRT: TEdit
        Left = 5
        Top = 15
        Width = 85
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        MaxLength = 20
        TabOrder = 0
      end
    end
    object gbMotivo: TGroupBox
      Left = 3
      Top = 83
      Width = 370
      Height = 42
      Caption = '&Motivo'
      TabOrder = 6
      DesignSize = (
        370
        42)
      inline fraStaticCTBMotivo: TfraStaticCTB_TABLAS
        Left = 7
        Top = 15
        Width = 359
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited edCodigo: TPatternEdit
          Width = 32
        end
        inherited cmbDescripcion: TComboGrid
          Left = 36
          Width = 321
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja'
            'TB_CLAVE'
            'TB_ESPECIAL1')
          ColWidths = (
            40
            300
            -1
            -1
            -1
            -1)
        end
      end
    end
    object gbPresentado: TGroupBox
      Left = 5
      Top = 41
      Width = 141
      Height = 41
      Caption = '&Presentado'
      TabOrder = 3
      object rbSi: TRadioButton
        Left = 8
        Top = 18
        Width = 33
        Height = 17
        Caption = '&Si'
        TabOrder = 0
      end
      object rbNo: TRadioButton
        Left = 45
        Top = 18
        Width = 33
        Height = 17
        Caption = '&No'
        TabOrder = 1
      end
      object rbTodos: TRadioButton
        Left = 83
        Top = 18
        Width = 52
        Height = 17
        Caption = '&Todos'
        Checked = True
        TabOrder = 2
        TabStop = True
      end
    end
    object gbFechaSin: TGroupBox
      Left = 455
      Top = 1
      Width = 222
      Height = 41
      Caption = '&Fecha de siniestro'
      TabOrder = 8
      object Label3: TLabel
        Left = 104
        Top = 17
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edFechaSinDesde: TDateComboBox
        Left = 7
        Top = 15
        Width = 90
        Height = 21
        MaxDateCombo = edFechaSinHasta
        TabOrder = 0
        OnExit = edFechaSinDesdeExit
      end
      object edFechaSinHasta: TDateComboBox
        Left = 123
        Top = 15
        Width = 90
        Height = 21
        MinDateCombo = edFechaSinDesde
        TabOrder = 1
      end
    end
    object gbDelegacion: TGroupBox
      Left = 376
      Top = 83
      Width = 344
      Height = 42
      Anchors = [akLeft, akTop, akRight]
      Caption = ' De&legaci'#243'n '
      TabOrder = 9
      DesignSize = (
        344
        42)
      object cmbDelegacion: TDBCheckCombo
        Left = 7
        Top = 16
        Width = 329
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DataSource = dsDelegacion
        KeyField = 'lg_codigo'
        ListField = 'lg_nombre'
      end
    end
    object gbEntregado: TGroupBox
      Left = 149
      Top = 42
      Width = 192
      Height = 41
      Caption = '&Entregado'
      TabOrder = 5
      object rbEnTermino: TRadioButton
        Left = 4
        Top = 18
        Width = 68
        Height = 17
        Caption = 'En t'#233'rmino'
        TabOrder = 0
      end
      object rbVencido: TRadioButton
        Left = 76
        Top = 18
        Width = 59
        Height = 17
        Caption = 'Vencido'
        TabOrder = 1
      end
      object rbTodosEnt: TRadioButton
        Left = 138
        Top = 18
        Width = 50
        Height = 17
        Caption = '&Todos'
        Checked = True
        TabOrder = 2
        TabStop = True
      end
    end
    object gbGrupoTrabajo: TGroupBox
      Left = 3
      Top = 125
      Width = 412
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Grupo de Trabajo '
      TabOrder = 10
      DesignSize = (
        412
        40)
      object cmbGtrabajo: TDBCheckCombo
        Left = 7
        Top = 14
        Width = 400
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnCloseUp = cmbGtrabajoCloseUp
        DataSource = dsGtrabajo
        KeyField = 'GP_CODIGO'
        ListField = 'GP_NOMBRE'
      end
    end
    object gbGestor: TGroupBox
      Left = 418
      Top = 125
      Width = 301
      Height = 40
      Anchors = [akTop, akRight]
      Caption = ' Usuario gestor '
      TabOrder = 11
      object cmbGestor: TArtComboBox
        Left = 8
        Top = 14
        Width = 285
        Height = 21
        GlyphKind = gkDropDown
        NumGlyphs = 1
        TabOrder = 0
        Columns = <
          item
            Expanded = False
            FieldName = 'UG_USUARIO'
            Title.Caption = 'Usuario'
            Visible = True
          end>
        DataSource = dsGestor
        FieldList = 'UG_USUARIO'
        FieldKey = 'UG_ID'
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 168
    Width = 724
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 720
      end>
    inherited ToolBar: TToolBar
      Width = 707
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      inherited tbNuevo: TToolButton
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbModificar: TToolButton
        Visible = True
        OnClick = tbModificarClick
      end
      inherited tbEliminar: TToolButton
        Visible = True
        OnClick = tbEliminarClick
      end
      inherited tbSalir: TToolButton
        Hint = 'Imagen ART (Ctrl+A)'
        ImageIndex = 42
      end
      object tbImagenSRT: TToolButton
        Left = 370
        Top = 0
        Hint = 'Imagen SRT (Ctrl+U)'
        Caption = 'tbImagenSRT'
        ImageIndex = 42
        OnClick = tbImagenSRTClick
      end
      object tbCantidad: TToolButton
        Left = 393
        Top = 0
        Hint = 'Mostrar total'
        Caption = 'tbCantidad'
        ImageIndex = 26
        Style = tbsCheck
        OnClick = tbCantidadClick
      end
      object ToolButton1: TToolButton
        Left = 416
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 43
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 424
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 8
        OnClick = tbSalir2Click
      end
      object ToolButton2: TToolButton
        Left = 447
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object pnlTotal: TPanel
        Left = 455
        Top = 0
        Width = 206
        Height = 22
        Alignment = taLeftJustify
        BevelOuter = bvNone
        TabOrder = 0
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 197
    Width = 724
    Height = 120
    OnGetCellParams = GridGetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Title.Alignment = taCenter
        Title.Caption = 'Identif.'
        Width = 46
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. Siniestro'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHASIN'
        Title.Alignment = taCenter
        Title.Caption = 'F. Siniestro'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_NOMBRE'
        Title.Caption = 'Trabajador'
        Width = 182
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RS_DETALLE'
        Title.Caption = 'Detalle'
        Width = 374
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RS_FECREQUE'
        Title.Alignment = taCenter
        Title.Caption = 'F. Requerim.'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RS_FECVENCE'
        Title.Alignment = taCenter
        Title.Caption = 'F. Vencim.'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RS_NROSRT'
        Title.Caption = 'Nro. SRT'
        Width = 152
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RS_FIRMASRT'
        Title.Caption = 'Firma SRT'
        Width = 126
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRMOTIVO'
        Title.Caption = 'Motivo'
        Width = 167
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_NOMBRE'
        Title.Caption = 'Entregado a'
        Width = 161
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RS_RECIBOART'
        Title.Caption = 'Recibo AM'
        Width = 134
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RS_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 351
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RS_RECIBOSRT'
        Title.Caption = 'Recibo SRT'
        Width = 155
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RS_FECPRESENTACION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Presentac.'
        Width = 68
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RS_FECPRORROGA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Pr'#243'rroga'
        Width = 74
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RS_IDWF'
        Title.Alignment = taCenter
        Title.Caption = 'WF Asoc.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DELEGACION'
        Title.Caption = 'Delegaci'#243'n'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GP_NOMBRE'
        Title.Caption = 'Grupo trabajo'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUGESTOR'
        Title.Caption = 'Usuario Gestor'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RS_ENTERMINO'
        Title.Alignment = taCenter
        Title.Caption = 'En t'#233'rmino'
        Visible = True
      end>
  end
  object fpImagenSRT: TFormPanel [3]
    Left = 93
    Top = 225
    Width = 577
    Height = 409
    Caption = 'Imagen SRT'
    FormWidth = 0
    FormHeigth = 0
    Position = poOwnerFormCenter
    Constraints.MinHeight = 300
    Constraints.MinWidth = 500
    object ScrollBox1: TScrollBox
      Left = 0
      Top = 0
      Width = 577
      Height = 370
      Align = alClient
      TabOrder = 0
      object imgSRT: TImage
        Left = 0
        Top = 0
        Width = 573
        Height = 366
        AutoSize = True
        IncrementalDisplay = True
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 370
      Width = 577
      Height = 39
      Align = alBottom
      TabOrder = 1
      DesignSize = (
        577
        39)
      object btnCerrarRegion: TBitBtn
        Left = 498
        Top = 7
        Width = 73
        Height = 26
        Anchors = [akRight, akBottom]
        Cancel = True
        Caption = '&Cerrar'
        Default = True
        ModalResult = 2
        TabOrder = 0
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333000033338833333333333333333F333333333333
          0000333911833333983333333388F333333F3333000033391118333911833333
          38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
          911118111118333338F3338F833338F3000033333911111111833333338F3338
          3333F8330000333333911111183333333338F333333F83330000333333311111
          8333333333338F3333383333000033333339111183333333333338F333833333
          00003333339111118333333333333833338F3333000033333911181118333333
          33338333338F333300003333911183911183333333383338F338F33300003333
          9118333911183333338F33838F338F33000033333913333391113333338FF833
          38F338F300003333333333333919333333388333338FFF830000333333333333
          3333333333333333333888330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
    end
  end
  object fpDialogAltaRequerimiento: TFormPanel [4]
    Left = 28
    Top = 208
    Width = 605
    Height = 416
    Caption = 'Alta del Requerimiento SRT'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu, biMaximize]
    Position = poOwnerFormCenter
    Constraints.MinHeight = 416
    Constraints.MinWidth = 605
    OnEnter = fpDialogAltaRequerimientoEnter
    DesignSize = (
      605
      416)
    object Bevel1: TBevel
      Left = 4
      Top = 380
      Width = 597
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object lbDetalle: TLabel
      Left = 7
      Top = 37
      Width = 84
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Detalle'
    end
    object lbFechaRequerimiento: TLabel
      Left = 7
      Top = 132
      Width = 84
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'F. Requerimiento'
    end
    object lbFechaVencimiento: TLabel
      Left = 7
      Top = 157
      Width = 84
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'F. Vencimiento'
    end
    object lbNroSRTAlta: TLabel
      Left = 7
      Top = 184
      Width = 84
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Nro. SRT'
    end
    object lbUsuarioEntregadoAAlta: TLabel
      Left = 7
      Top = 233
      Width = 84
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Entregado a'
    end
    object lbFirmaSRT: TLabel
      Left = 7
      Top = 209
      Width = 84
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Firma SRT'
    end
    object lbReciboART: TLabel
      Left = 7
      Top = 259
      Width = 84
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Recibo AM'
    end
    object lbMotivo: TLabel
      Left = 7
      Top = 282
      Width = 84
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Motivo'
    end
    object lbObservacionesAlta: TLabel
      Left = 7
      Top = 307
      Width = 84
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Observaciones'
    end
    object lbSiniestro: TLabel
      Left = 7
      Top = 13
      Width = 84
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Siniestro'
    end
    object btnAceptarAltaRequerimiento: TButton
      Left = 447
      Top = 386
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 11
      OnClick = btnAceptarAltaRequerimientoClick
    end
    object btnCancelarAltaRequerimiento: TButton
      Left = 525
      Top = 386
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 12
    end
    object edDetalleAlta: TMemo
      Left = 95
      Top = 58
      Width = 499
      Height = 68
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 250
      TabOrder = 2
    end
    object edFechaRequerimientoAlta: TDateComboBox
      Left = 95
      Top = 130
      Width = 88
      Height = 21
      MaxDateCombo = edFechaVencimientoAlta
      TabOrder = 3
      OnExit = edFechaRequermientoDesdeExit
    end
    object edFechaVencimientoAlta: TDateComboBox
      Left = 95
      Top = 155
      Width = 88
      Height = 21
      MinDateCombo = edFechaRequerimientoAlta
      TabOrder = 4
      OnExit = edFechaRequermientoDesdeExit
    end
    object edNroSRTAlta: TEdit
      Left = 95
      Top = 180
      Width = 300
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 20
      TabOrder = 5
    end
    inline fraUsuarioEntregadoAAlta: TfraUsuario
      Left = 95
      Top = 230
      Width = 499
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 7
      inherited cmbDescripcion: TArtComboBox
        Width = 415
      end
    end
    object edFirmaSRTAlta: TEdit
      Left = 95
      Top = 205
      Width = 300
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 30
      TabOrder = 6
    end
    object edReciboARTAlta: TEdit
      Left = 95
      Top = 255
      Width = 300
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 30
      TabOrder = 8
    end
    inline fraStaticCTBMotivoAlta: TfraStaticCTB_TABLAS
      Left = 94
      Top = 278
      Width = 500
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 9
      inherited edCodigo: TPatternEdit
        Width = 61
      end
      inherited cmbDescripcion: TComboGrid
        Width = 435
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'TB_CLAVE'
          'TB_ESPECIAL1')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          -1)
      end
    end
    object edObservacionesAlta: TMemo
      Left = 95
      Top = 304
      Width = 499
      Height = 68
      Anchors = [akLeft, akTop, akRight, akBottom]
      MaxLength = 250
      TabOrder = 10
    end
    object SinEditAlta: TSinEdit
      Left = 95
      Top = 10
      Width = 100
      Height = 21
      OnExit = SinEditAltaExit
      TabOrder = 0
    end
    inline fraTrabajadorSINAlta: TfraTrabajadorSIN
      Left = 59
      Top = 34
      Width = 539
      Height = 27
      TabOrder = 1
      inherited lbTrabCUIL: TLabel
        Left = 7
      end
      inherited dbcTrabNombre: TArtComboBox
        Width = 367
        DataSource = nil
      end
    end
  end
  object fpDialogModifRequerimiento: TFormPanel [5]
    Left = 280
    Top = 208
    Width = 505
    Height = 274
    Caption = 'Modificaci'#243'n del Requerimiento SRT'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu, biMaximize]
    Position = poOwnerFormCenter
    Constraints.MinHeight = 253
    Constraints.MinWidth = 505
    DesignSize = (
      505
      274)
    object BevelAbm: TBevel
      Left = 4
      Top = 238
      Width = 497
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object lbReciboSRT: TLabel
      Left = 8
      Top = 94
      Width = 74
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Recibo SRT'
    end
    object lbFechaPresentacion: TLabel
      Left = 8
      Top = 119
      Width = 74
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'F. Presentaci'#243'n'
    end
    object lbFechaProrroga: TLabel
      Left = 4
      Top = 65
      Width = 74
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'F. Pr'#243'rroga'
    end
    object lbObservaciones: TLabel
      Left = 8
      Top = 142
      Width = 74
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Observaciones'
    end
    object lbEntregadoA2: TLabel
      Left = 8
      Top = 37
      Width = 74
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Entregado a'
    end
    object Label4: TLabel
      Left = -2
      Top = 12
      Width = 84
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Motivo'
    end
    object btnAceptarModifRequerimiento: TButton
      Left = 347
      Top = 244
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 7
      OnClick = btnAceptarModifRequerimientoClick
    end
    object btnCancelarModifRequerimiento: TButton
      Left = 425
      Top = 244
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 8
    end
    object edReciboSRT: TEdit
      Left = 87
      Top = 91
      Width = 408
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 30
      TabOrder = 4
    end
    object edFechaPresentacion: TDateComboBox
      Left = 87
      Top = 116
      Width = 88
      Height = 21
      TabOrder = 5
      OnExit = edFechaRequermientoDesdeExit
    end
    object edFechaProrroga: TDateComboBox
      Left = 87
      Top = 63
      Width = 88
      Height = 21
      TabOrder = 2
      OnExit = edFechaRequermientoDesdeExit
    end
    object edObservaciones: TMemo
      Left = 87
      Top = 144
      Width = 408
      Height = 91
      Anchors = [akLeft, akTop, akRight, akBottom]
      MaxLength = 250
      TabOrder = 6
    end
    inline fraUsuarioEntregadoAMod: TfraUsuario
      Left = 87
      Top = 34
      Width = 410
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited edCodigo: TPatternEdit
        Width = 88
      end
      inherited cmbDescripcion: TArtComboBox
        Left = 91
        Width = 317
      end
    end
    object gbEntregadoM: TGroupBox
      Left = 180
      Top = 56
      Width = 257
      Height = 30
      TabOrder = 3
      object rbEnTerminoM: TRadioButton
        Left = 8
        Top = 10
        Width = 73
        Height = 17
        Caption = 'En t'#233'rmino'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object rbVencidoM: TRadioButton
        Left = 90
        Top = 10
        Width = 61
        Height = 17
        Caption = 'Vencido'
        TabOrder = 1
      end
      object rbNoEntregado: TRadioButton
        Left = 160
        Top = 10
        Width = 87
        Height = 17
        Caption = 'No entregado'
        TabOrder = 2
      end
    end
    inline fraMotivoMod: TfraStaticCTB_TABLAS
      Left = 87
      Top = 6
      Width = 410
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited edCodigo: TPatternEdit
        Width = 58
      end
      inherited cmbDescripcion: TComboGrid
        Width = 346
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'TB_CLAVE'
          'TB_ESPECIAL1')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          -1)
      end
    end
  end
  inherited SortDialog: TSortDialog
    SortFields = <
      item
        Title = 'Identif.'
        DataField = 'RS_ID'
        FieldIndex = 0
      end
      item
        Title = 'Nro. Siniestro'
        DataField = 'SINIESTRO'
        FieldIndex = 1
      end
      item
        Title = 'Trabajador'
        DataField = 'TJ_NOMBRE'
        FieldIndex = 2
      end
      item
        Title = 'Detalle'
        DataField = 'RS_DETALLE'
        FieldIndex = 3
      end
      item
        Title = 'F. Requerim.'
        DataField = 'RS_FECREQUE'
        FieldIndex = 4
      end
      item
        Title = 'F. Vencim.'
        DataField = 'RS_FECVENCE'
        FieldIndex = 5
      end
      item
        Title = 'Nro. SRT'
        DataField = 'RS_NROSRT'
        FieldIndex = 6
      end
      item
        Title = 'Firma SRT'
        DataField = 'RS_FIRMASRT'
        FieldIndex = 7
      end
      item
        Title = 'Motivo'
        DataField = 'DESCRMOTIVO'
        FieldIndex = 8
      end
      item
        Title = 'Entregado a'
        DataField = 'SE_NOMBRE'
        FieldIndex = 9
      end
      item
        Title = 'Recibo AM'
        DataField = 'RS_RECIBOART'
        FieldIndex = 10
      end
      item
        Title = 'Observaciones'
        DataField = 'RS_OBSERVACIONES'
        FieldIndex = 11
      end
      item
        Title = 'Recibo SRT'
        DataField = 'RS_RECIBOSRT'
        FieldIndex = 12
      end
      item
        Title = 'F. Presentac.'
        DataField = 'RS_FECPRESENTACION'
        FieldIndex = 13
      end
      item
        Title = 'F. Pr'#243'rroga'
        DataField = 'RS_FECPRORROGA'
        FieldIndex = 14
      end
      item
        Title = 'G.Trabajo'
        DataField = 'GTRABAJO'
        FieldIndex = 0
      end
      item
        Title = 'Usuario Gestor'
        DataField = 'USUGESTOR'
        FieldIndex = 0
      end>
  end
  inherited ExportDialog: TExportDialog
    Fields = <
      item
        DataField = 'ID'
        Title = 'Identif.'
      end
      item
        DataField = 'SINIESTRO'
        Title = 'Nro. Siniestro'
      end
      item
        DataField = 'FECHASIN'
        Title = 'F. Siniestro'
      end
      item
        DataField = 'TJ_NOMBRE'
        Title = 'Trabajador'
      end
      item
        DataField = 'RS_DETALLE'
        Title = 'Detalle'
      end
      item
        DataField = 'RS_FECREQUE'
        Title = 'F. Requerim.'
      end
      item
        DataField = 'RS_FECVENCE'
        Title = 'F. Vencim.'
      end
      item
        DataField = 'RS_NROSRT'
        Title = 'Nro. SRT'
      end
      item
        DataField = 'RS_FIRMASRT'
        Title = 'Firma SRT'
      end
      item
        DataField = 'DESCRMOTIVO'
        Title = 'Motivo'
      end
      item
        DataField = 'SE_NOMBRE'
        Title = 'Entregado a'
      end
      item
        DataField = 'RS_RECIBOART'
        Title = 'Recibo AM'
      end
      item
        DataField = 'RS_OBSERVACIONES'
        Title = 'Observaciones'
      end
      item
        DataField = 'RS_RECIBOSRT'
        Title = 'Recibo SRT'
      end
      item
        DataField = 'RS_FECPRESENTACION'
        Title = 'F. Presentac.'
      end
      item
        DataField = 'RS_FECPRORROGA'
        Title = 'F. Pr'#243'rroga'
      end
      item
        DataField = 'RS_FECHABAJA'
        Title = 'F. Baja'
        Alignment = taCenter
      end
      item
        DataField = 'DELEGACION'
        Title = 'Delegaci'#243'n'
      end
      item
        DataField = 'GP_NOMBRE'
        Title = 'G. Trabajo'
      end
      item
        DataField = 'USUGESTOR'
        Title = 'Usuario Gestor'
      end>
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'Ident.'
        TitleAlignment = taCenter
        DataField = 'ID'
        Width = 220
        MaxLength = 0
      end
      item
        Title = 'Siniestro'
        TitleAlignment = taCenter
        DataField = 'SINIESTRO'
        Alignment = taCenter
        Width = 400
        MaxLength = 0
      end
      item
        Title = 'Trabajador'
        DataField = 'TJ_NOMBRE'
        Width = 1000
        MaxLength = 0
      end
      item
        Title = 'Detalle'
        DataField = 'RS_DETALLE'
        Width = 1200
        MaxLength = 0
      end
      item
        Title = 'F. Req.'
        TitleAlignment = taCenter
        DataField = 'RS_FECREQUE'
        Alignment = taCenter
        Width = 280
        MaxLength = 0
      end
      item
        Title = 'F. Vencim.'
        TitleAlignment = taCenter
        DataField = 'RS_FECVENCE'
        Alignment = taCenter
        Width = 350
        MaxLength = 0
      end
      item
        Title = 'Nro. SRT'
        DataField = 'RS_NROSRT'
        Width = 350
        MaxLength = 0
      end
      item
        Title = 'Firma SRT'
        DataField = 'RS_FIRMASRT'
        Width = 450
        MaxLength = 0
      end
      item
        Title = 'Entregado a'
        DataField = 'SE_NOMBRE'
        Width = 500
        MaxLength = 0
      end
      item
        Title = 'Recibo AM'
        DataField = 'RS_RECIBOART'
        Width = 600
        MaxLength = 0
      end
      item
        Title = 'Observaciones'
        DataField = 'RS_OBSERVACIONES'
        Width = 1500
        MaxLength = 0
      end
      item
        Title = 'Recibo SRT'
        DataField = 'RS_RECIBOSRT'
        Width = 600
        MaxLength = 0
      end
      item
        Title = 'F. Present.'
        TitleAlignment = taCenter
        DataField = 'RS_FECPRESENTACION'
        Alignment = taCenter
        Width = 350
        MaxLength = 0
      end>
    DataSource = nil
    PageOrientation = pxLandscape
    PageSize = psLegal
    OnGetCellParams = QueryPrintGetCellParams
    Options = [qoZoomPrint, qoZoomCalcFontSize]
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
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
        Key = 16449
        LinkControl = tbSalir
      end
      item
        Key = 16469
        LinkControl = tbImagenSRT
      end>
  end
  object sdqDelegacion: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'select lg_codigo, lg_nombre '
      '  from art.dlg_delegaciones'
      ' order by lg_nombre')
    Left = 472
    Top = 94
  end
  object dsDelegacion: TDataSource
    DataSet = sdqDelegacion
    Left = 500
    Top = 94
  end
  object sdqGtrabajo: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'select gp_codigo, gp_nombre'
      'from art.mgp_gtrabajo'
      'where gp_fbaja is null'
      'order by gp_nombre')
    Left = 122
    Top = 135
  end
  object dsGtrabajo: TDataSource
    DataSet = sdqGtrabajo
    Left = 150
    Top = 135
  end
  object sdqGestor: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT   ug_id, ug_usuario'
      '    FROM mug_usuariogrupotrabajo'
      '   WHERE ug_fechabaja IS NULL'
      '     AND ug_tipousuario IN ('#39'01'#39', '#39'04'#39')'
      '')
    Left = 474
    Top = 135
  end
  object dsGestor: TDataSource
    DataSet = sdqGestor
    Left = 502
    Top = 135
  end
end
