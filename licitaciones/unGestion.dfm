object frmGestion: TfrmGestion
  Left = 203
  Top = 116
  ActiveControl = edFechaNotificacion
  BorderStyle = bsDialog
  Caption = 'Gesti'#243'n'
  ClientHeight = 553
  ClientWidth = 792
  Color = clBtnFace
  Constraints.MinHeight = 580
  Constraints.MinWidth = 800
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 792
    Height = 25
    Caption = 'ToolBar'
    EdgeBorders = [ebTop, ebBottom]
    Flat = True
    HotImages = frmPrincipal.ilColor
    Images = frmPrincipal.ilByN
    TabOrder = 0
    object ToolButton4: TToolButton
      Left = 0
      Top = 0
      Width = 6
      Caption = 'ToolButton4'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object tbMainLimpiar: TToolButton
      Left = 6
      Top = 0
      Hint = 'Limpiar (Ctrl + L)'
      Caption = 'tbMainLimpiar'
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = True
      OnClick = tblLimpiarClick
    end
    object ToolButton2: TToolButton
      Left = 29
      Top = 0
      Width = 3
      Caption = 'ToolButton2'
      ImageIndex = 2
      Marked = True
      Style = tbsDivider
    end
    object tbMainGuardar: TToolButton
      Left = 32
      Top = 0
      Hint = 'Guardar (Ctrl + G)'
      Caption = 'tbMainGuardar'
      ImageIndex = 3
      ParentShowHint = False
      ShowHint = True
      OnClick = tbMainGuardarClick
    end
    object ToolButton3: TToolButton
      Left = 55
      Top = 0
      Width = 3
      Caption = 'ToolButton3'
      ImageIndex = 4
      Style = tbsDivider
    end
    object ToolButton1: TToolButton
      Left = 58
      Top = 0
      Width = 3
      Caption = 'ToolButton1'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object tbMainImprimir: TToolButton
      Left = 61
      Top = 0
      Hint = 'Imprimir (Ctrl + I)'
      Caption = 'tbMainImprimir'
      ImageIndex = 4
      ParentShowHint = False
      ShowHint = True
      Visible = False
    end
    object ToolButton7: TToolButton
      Left = 84
      Top = 0
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 6
      Style = tbsSeparator
      Visible = False
    end
    object tbMainExpediente: TToolButton
      Left = 92
      Top = 0
      Hint = 'Expediente (Ctrl + E)'
      Caption = 'tbMainExpediente'
      ImageIndex = 28
      ParentShowHint = False
      ShowHint = True
      OnClick = tbMainExpedienteClick
    end
    object ToolButton9: TToolButton
      Left = 115
      Top = 0
      Width = 3
      Caption = 'ToolButton9'
      ImageIndex = 9
      Style = tbsDivider
    end
    object tbMainSalir: TToolButton
      Left = 118
      Top = 0
      Hint = 'Salir (Ctrl + S)'
      Caption = 'tbMainSalir'
      ImageIndex = 5
      ParentShowHint = False
      ShowHint = True
      OnClick = tbMainSalirClick
    end
  end
  object pnGestion: TPanel
    Left = 0
    Top = 25
    Width = 792
    Height = 208
    Align = alTop
    TabOrder = 1
    DesignSize = (
      792
      208)
    object Label1: TLabel
      Left = 8
      Top = 9
      Width = 88
      Height = 13
      Alignment = taRightJustify
      Caption = 'F. Notificaci'#243'n:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 208
      Top = 9
      Width = 68
      Height = 13
      Caption = 'F. Apertura:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbCUIT: TLabel
      Left = 398
      Top = 9
      Width = 42
      Height = 13
      Caption = 'C.U.I.T.:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbContacto: TLabel
      Left = 8
      Top = 41
      Width = 74
      Height = 13
      Alignment = taRightJustify
      Caption = 'Raz'#243'n Social:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 555
      Top = 9
      Width = 88
      Height = 13
      Caption = 'Nro. Licitaci'#243'n:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbNivel: TLabel
      Left = 8
      Top = 105
      Width = 74
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Capitas:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbPROCENTAJE_MASA_SALARIAL: TLabel
      Left = 145
      Top = 105
      Width = 81
      Height = 13
      Caption = 'Masa Salarial:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 352
      Top = 73
      Width = 69
      Height = 13
      Caption = 'Delegaci'#243'n:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 362
      Top = 105
      Width = 58
      Height = 13
      Caption = 'ART Actual:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 153
      Width = 74
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Tarifa Actual:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 88
      Top = 130
      Width = 72
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Fijo'
    end
    object Label8: TLabel
      Left = 192
      Top = 130
      Width = 72
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Variable'
    end
    object Label9: TLabel
      Left = 8
      Top = 185
      Width = 98
      Height = 13
      Caption = 'Costo por Empleado:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 352
      Top = 153
      Width = 70
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Sector:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label22: TLabel
      Left = 328
      Top = 185
      Width = 94
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Estado Licitaci'#243'n:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label42: TLabel
      Left = 302
      Top = 41
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = 'Domicilio:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label43: TLabel
      Left = 548
      Top = 41
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tel'#233'fono:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label44: TLabel
      Left = 8
      Top = 73
      Width = 74
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Contacto:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edFechaNotificacion: TDateComboBox
      Left = 104
      Top = 4
      Width = 88
      Height = 21
      TabOrder = 0
    end
    object edFechaApertura: TDateComboBox
      Left = 281
      Top = 4
      Width = 88
      Height = 21
      TabOrder = 1
    end
    object edCUIT: TMaskEdit
      Left = 448
      Top = 4
      Width = 88
      Height = 21
      EditMask = '99-99999999-c;0;'
      MaxLength = 13
      TabOrder = 2
    end
    object edRazonSocial: TEdit
      Left = 88
      Top = 36
      Width = 200
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 4
    end
    object edNumeroLicitacion: TCardinalEdit
      Left = 650
      Top = 4
      Width = 132
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
    end
    object edMasaSalarial: TCurrencyEdit
      Left = 232
      Top = 100
      Width = 105
      Height = 21
      AutoSize = False
      DecimalPlaces = 4
      DisplayFormat = '0.0000'
      MaxLength = 15
      MaxValue = 99999999999.000000000000000000
      TabOrder = 10
      OnKeyPress = edTarifaFijaKeyPress
    end
    inline fraDelegacion: TfraCodigoDescripcion
      Left = 424
      Top = 68
      Width = 360
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 8
      DesignSize = (
        360
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 297
        CharCase = ecUpperCase
      end
    end
    inline fraART: TfraCodigoDescripcion
      Left = 424
      Top = 100
      Width = 360
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 11
      DesignSize = (
        360
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 297
        CharCase = ecUpperCase
      end
    end
    object edTarifaFija: TCurrencyEdit
      Left = 88
      Top = 148
      Width = 72
      Height = 21
      AutoSize = False
      DecimalPlaces = 4
      DisplayFormat = '0.00'
      MaxLength = 10
      TabOrder = 12
      OnChange = CalcularCostoPorEmpleado
      OnKeyPress = edTarifaFijaKeyPress
    end
    object edTarifaVariable: TCurrencyEdit
      Left = 192
      Top = 148
      Width = 72
      Height = 21
      AutoSize = False
      DecimalPlaces = 4
      DisplayFormat = '0.00'
      MaxLength = 10
      TabOrder = 13
      OnChange = CalcularCostoPorEmpleado
      OnKeyPress = edTarifaFijaKeyPress
    end
    object edCostoPorEmpleado: TCurrencyEdit
      Left = 112
      Top = 180
      Width = 80
      Height = 21
      AutoSize = False
      DisplayFormat = '0.00'
      MaxLength = 10
      TabOrder = 15
      OnKeyPress = edTarifaFijaKeyPress
    end
    object edCapitas: TIntEdit
      Left = 88
      Top = 100
      Width = 40
      Height = 21
      TabOrder = 9
    end
    inline fraSector: TfraCtbTablas
      Left = 424
      Top = 148
      Width = 360
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 14
      DesignSize = (
        360
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 307
        CharCase = ecUpperCase
      end
    end
    inline fraEstado: TfraCtbTablas
      Left = 424
      Top = 180
      Width = 360
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 16
      DesignSize = (
        360
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 307
        CharCase = ecUpperCase
      end
    end
    object edDomicilio: TEdit
      Left = 352
      Top = 36
      Width = 184
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 5
    end
    object edTelefono: TEdit
      Left = 600
      Top = 36
      Width = 182
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 6
    end
    object edContacto: TEdit
      Left = 88
      Top = 68
      Width = 249
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 7
    end
    object fpPliegos: TFormPanel
      Left = 436
      Top = 60
      Width = 320
      Height = 104
      Caption = 'Expediente'
      FormWidth = 0
      FormHeigth = 0
      BorderIcons = [biSystemMenu]
      BorderStyle = bsSingle
      Position = poOwnerFormCenter
      ActiveControl = edRutaPliegos
      DesignSize = (
        320
        104)
      object btnFecha: TButton
        Left = 184
        Top = 72
        Width = 64
        Height = 23
        Anchors = [akLeft, akBottom]
        Caption = 'Aceptar'
        Default = True
        ModalResult = 1
        TabOrder = 2
      end
      object btnSalir2: TButton
        Left = 248
        Top = 72
        Width = 64
        Height = 23
        Anchors = [akLeft, akBottom]
        Cancel = True
        Caption = '&Salir'
        ModalResult = 2
        TabOrder = 3
      end
      object GroupBox8: TGroupBox
        Left = 8
        Top = 8
        Width = 305
        Height = 56
        Caption = ' Ruta Pliegos Digitalizados '
        TabOrder = 0
        object edRutaPliegos: TEdit
          Left = 16
          Top = 24
          Width = 256
          Height = 21
          TabOrder = 0
          Text = 'edRutaPliegos'
        end
        object btnSeleccionarRutaPliegos: TButton
          Left = 272
          Top = 24
          Width = 21
          Height = 21
          Hint = 'Elegir ruta'
          Caption = '...'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btnSeleccionarRutaPliegosClick
        end
      end
      object btnVerPliegos: TButton
        Left = 8
        Top = 72
        Width = 64
        Height = 23
        Caption = 'Ver Pliegos'
        TabOrder = 1
        OnClick = btnVerPliegosClick
      end
    end
  end
  object pcMasDatos: TPageControl
    Left = 0
    Top = 233
    Width = 792
    Height = 320
    ActivePage = tsPrincipal
    Align = alClient
    TabOrder = 2
    object tsPrincipal: TTabSheet
      Caption = 'Principal'
      DesignSize = (
        784
        292)
      object Label15: TLabel
        Left = 8
        Top = 181
        Width = 65
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Costo Pliego:'
      end
      object edCostoPliego: TCurrencyEdit
        Left = 88
        Top = 176
        Width = 80
        Height = 21
        AutoSize = False
        DisplayFormat = '0.00'
        MaxLength = 7
        TabOrder = 2
        OnKeyPress = edTarifaFijaKeyPress
      end
      object checkPliegoSinCosto: TCheckBox
        Left = 23
        Top = 146
        Width = 77
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Sin Costo:'
        TabOrder = 1
        OnClick = checkPliegoSinCostoClick
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 8
        Width = 768
        Height = 120
        Anchors = [akLeft, akTop, akRight]
        Caption = ' Decisi'#243'n '
        TabOrder = 0
        DesignSize = (
          768
          120)
        object Label11: TLabel
          Left = 136
          Top = 29
          Width = 45
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Canal:'
        end
        object Label12: TLabel
          Left = 136
          Top = 61
          Width = 45
          Height = 13
          Caption = 'Comisi'#243'n:'
        end
        object Label13: TLabel
          Left = 136
          Top = 93
          Width = 45
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Motivos:'
        end
        object lbBroker: TLabel
          Left = 384
          Top = 61
          Width = 34
          Height = 13
          Caption = 'Broker:'
        end
        object rbPresentacion: TRadioButton
          Left = 28
          Top = 29
          Width = 84
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Presentaci'#243'n'
          TabOrder = 0
          OnClick = rbPresentacionClick
        end
        object rbNoPresentacion: TRadioButton
          Left = 8
          Top = 93
          Width = 104
          Height = 17
          Alignment = taLeftJustify
          Caption = 'NO Presentaci'#243'n'
          TabOrder = 1
          OnClick = rbNoPresentacionClick
        end
        object cbDirectoIndirecto: TComboBox
          Left = 192
          Top = 24
          Width = 144
          Height = 21
          Style = csDropDownList
          CharCase = ecUpperCase
          Enabled = False
          ItemHeight = 13
          TabOrder = 2
          OnChange = cbDirectoIndirectoChange
          Items.Strings = (
            'DIRECTO'
            'INDIRECTO')
        end
        inline fraCanal: TfraCodigoDescripcion
          Left = 360
          Top = 24
          Width = 392
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          Enabled = False
          TabOrder = 3
          OnExit = fraCanalExit
          DesignSize = (
            392
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 327
            CharCase = ecUpperCase
          end
        end
        object edComision: TCurrencyEdit
          Left = 192
          Top = 56
          Width = 80
          Height = 21
          AutoSize = False
          DisplayFormat = '0.00%'
          Enabled = False
          MaxLength = 5
          TabOrder = 4
          OnKeyPress = edTarifaFijaKeyPress
        end
        inline fraMotivo: TfraCtbTablas
          Left = 191
          Top = 89
          Width = 561
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 6
          DesignSize = (
            561
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 508
          end
        end
        object edBroker: TEdit
          Left = 424
          Top = 56
          Width = 327
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          CharCase = ecUpperCase
          MaxLength = 100
          TabOrder = 5
        end
      end
    end
    object tsSeguimiento: TTabSheet
      Caption = 'Seguimiento'
      ImageIndex = 4
      DesignSize = (
        784
        292)
      object ArtDBGrid: TArtDBGrid
        Left = 7
        Top = 32
        Width = 772
        Height = 140
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = sdDatos
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
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
            FieldName = 'SC_DESCRIPCION'
            Title.Caption = 'Sector'
            Width = 222
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LS_FECHASOLICITUD'
            Title.Caption = 'Fecha Solicitud'
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LS_FECHARESPUESTA'
            Title.Caption = 'Fecha Respuesta'
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SE_NOMBRE'
            Title.Caption = 'Responsable'
            Width = 264
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LS_MAIL'
            Title.Caption = 'E-mail'
            Width = 218
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LS_MOTIVO'
            Title.Caption = 'Motivo'
            Width = 204
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LS_RESULTADO'
            Title.Caption = 'Resultado'
            Width = 213
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LS_USUALTA'
            Title.Caption = 'Usuario Alta'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LS_FECHAALTA'
            Title.Caption = 'Fecha Alta'
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LS_USUBAJA'
            Title.Caption = 'Usuario Baja'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LS_FECHABAJA'
            Title.Caption = 'Fecha Baja'
            Width = 96
            Visible = True
          end>
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 180
        Width = 772
        Height = 108
        Anchors = [akLeft, akRight, akBottom]
        Caption = ' Datos del Seguimiento '
        TabOrder = 1
        DesignSize = (
          772
          108)
        object Label14: TLabel
          Left = 8
          Top = 21
          Width = 65
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Sector:'
        end
        object Label16: TLabel
          Left = 415
          Top = 21
          Width = 55
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'F. Solicitud:'
        end
        object Label17: TLabel
          Left = 8
          Top = 85
          Width = 65
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Motivo:'
        end
        object Label18: TLabel
          Left = 8
          Top = 53
          Width = 65
          Height = 13
          Caption = 'Responsable:'
        end
        object Label19: TLabel
          Left = 415
          Top = 53
          Width = 55
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          AutoSize = False
          Caption = 'E-mail:'
        end
        object Label20: TLabel
          Left = 599
          Top = 21
          Width = 66
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'F. Respuesta:'
        end
        object Label21: TLabel
          Left = 344
          Top = 85
          Width = 55
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Resultado:'
        end
        inline fraSeguimientoResponsable: TfraCodigoDescripcion
          Left = 80
          Top = 48
          Width = 312
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          DesignSize = (
            312
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 247
            CharCase = ecUpperCase
          end
          inherited edCodigo: TPatternEdit
            OnExit = fraSeguimientoResponsableedCodigoExit
          end
        end
        object edSeguimientoFechaSolicitud: TDateComboBox
          Left = 480
          Top = 16
          Width = 88
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 1
        end
        object edSeguimientoMotivo: TEdit
          Left = 80
          Top = 80
          Width = 240
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 100
          TabOrder = 5
        end
        inline fraSeguimientoSector: TfraCodigoDescripcion
          Left = 80
          Top = 16
          Width = 312
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          DesignSize = (
            312
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 249
            CharCase = ecUpperCase
          end
          inherited edCodigo: TPatternEdit
            OnExit = fraSeguimientoSectoredCodigoExit
          end
        end
        object edSeguimientoResultado: TEdit
          Left = 408
          Top = 80
          Width = 352
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          CharCase = ecUpperCase
          MaxLength = 100
          TabOrder = 6
        end
        object edSeguimientoFechaRespuesta: TDateComboBox
          Left = 672
          Top = 16
          Width = 88
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 2
        end
        object edSeguimientoEmail: TEdit
          Left = 480
          Top = 48
          Width = 280
          Height = 21
          Anchors = [akTop, akRight]
          CharCase = ecUpperCase
          MaxLength = 100
          TabOrder = 4
        end
      end
      object tlbControl: TToolBar
        Left = 0
        Top = 0
        Width = 784
        Height = 30
        BorderWidth = 1
        Caption = 'tlbControl'
        Color = clBtnFace
        EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
        Flat = True
        HotImages = frmPrincipal.ilColor
        Images = frmPrincipal.ilByN
        ParentColor = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        object tblSeparador1: TToolButton
          Left = 0
          Top = 0
          Width = 5
          Caption = 'tblSeparador1'
          ImageIndex = 6
          Style = tbsDivider
        end
        object tlbNuevo: TToolButton
          Left = 5
          Top = 0
          Hint = 'Nuevo'
          Caption = 'tlbNuevo'
          ImageIndex = 6
          ParentShowHint = False
          ShowHint = True
          OnClick = tlbNuevoClick
        end
        object tlbGuardar: TToolButton
          Left = 28
          Top = 0
          Hint = 'Guardar'
          Caption = 'tlbGuardar'
          ImageIndex = 3
          ParentShowHint = False
          ShowHint = True
          OnClick = tlbGuardarClick
        end
        object tlbBaja: TToolButton
          Left = 51
          Top = 0
          Hint = 'Baja'
          Caption = 'tlbBaja'
          ImageIndex = 8
          ParentShowHint = False
          ShowHint = True
          OnClick = tlbBajaClick
        end
        object tblSeparador2: TToolButton
          Left = 74
          Top = 0
          Width = 5
          Caption = 'tblSeparador2'
          ImageIndex = 6
          Style = tbsDivider
        end
        object tbSeguimientoLimpiar: TToolButton
          Tag = 1
          Left = 79
          Top = 0
          Hint = 'Limpiar'
          Caption = 'tbSeguimientoLimpiar'
          ImageIndex = 1
          ParentShowHint = False
          ShowHint = True
          OnClick = tbLimpiarClick
        end
        object tbSeguimientoOrdenar: TToolButton
          Tag = 1
          Left = 102
          Top = 0
          Hint = 'Ordenar'
          Caption = 'tbSeguimientoOrdenar'
          ImageIndex = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = tbOrdenarClick
        end
        object tbSeguimientoMostrar: TToolButton
          Tag = 1
          Left = 125
          Top = 0
          Hint = 'Mostrar / Ocultar Columnas'
          Caption = 'tbSeguimientoMostrar'
          ImageIndex = 14
          OnClick = tbMostrarClick
        end
        object tbSeguimientoImprimir: TToolButton
          Tag = 1
          Left = 148
          Top = 0
          Hint = 'Imprimir'
          Caption = 'tbSeguimientoImprimir'
          ImageIndex = 4
          OnClick = tbImprimirClick
        end
        object tbSeguimientoExportar: TToolButton
          Tag = 1
          Left = 171
          Top = 0
          Hint = 'Exportar'
          Caption = 'tbSeguimientoExportar'
          ImageIndex = 3
          ParentShowHint = False
          ShowHint = True
          OnClick = tbExportarClick
        end
        object ToolButton27: TToolButton
          Left = 194
          Top = 0
          Width = 8
          Caption = 'ToolButton27'
          ImageIndex = 6
          Style = tbsSeparator
        end
        object tlbSalir: TToolButton
          Left = 202
          Top = 0
          Hint = 'Salir'
          Caption = 'tlbSalir'
          ImageIndex = 5
          ParentShowHint = False
          ShowHint = True
          Visible = False
        end
      end
    end
    object tsFinal: TTabSheet
      Caption = 'Final'
      ImageIndex = 2
      DesignSize = (
        784
        292)
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 784
        Height = 72
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object GroupBox3: TGroupBox
          Left = 0
          Top = 0
          Width = 784
          Height = 64
          Align = alTop
          Caption = ' Oferta '
          TabOrder = 0
          object Label23: TLabel
            Left = 24
            Top = 16
            Width = 80
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Fijo'
          end
          object Label24: TLabel
            Left = 184
            Top = 16
            Width = 80
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Variable'
          end
          object Label25: TLabel
            Left = 336
            Top = 16
            Width = 95
            Height = 13
            Caption = 'Costo por Empleado'
          end
          object Label26: TLabel
            Left = 504
            Top = 16
            Width = 80
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Costo Mensual'
          end
          object Label27: TLabel
            Left = 652
            Top = 16
            Width = 101
            Height = 13
            Caption = 'Costo anual con SAC'
          end
          object edFijo: TCurrencyEdit
            Left = 24
            Top = 32
            Width = 80
            Height = 21
            AutoSize = False
            DecimalPlaces = 4
            DisplayFormat = '0.0000'
            MaxLength = 10
            TabOrder = 0
            OnChange = CalcularCosto
            OnKeyPress = edTarifaFijaKeyPress
          end
          object edVariable: TCurrencyEdit
            Left = 184
            Top = 32
            Width = 80
            Height = 21
            AutoSize = False
            DecimalPlaces = 4
            DisplayFormat = '0.0000'
            MaxLength = 10
            TabOrder = 1
            OnChange = CalcularCosto
            OnKeyPress = edTarifaFijaKeyPress
          end
          object edCostoAnual: TCurrencyEdit
            Left = 664
            Top = 32
            Width = 80
            Height = 21
            AutoSize = False
            Color = clBtnFace
            DecimalPlaces = 4
            DisplayFormat = '0.0000'
            MaxLength = 10
            ReadOnly = True
            TabOrder = 4
          end
          object edCostoMensual: TCurrencyEdit
            Left = 504
            Top = 32
            Width = 80
            Height = 21
            AutoSize = False
            Color = clBtnFace
            DecimalPlaces = 4
            DisplayFormat = '0.0000'
            MaxLength = 10
            ReadOnly = True
            TabOrder = 3
          end
          object edCostoEmpleado: TCurrencyEdit
            Left = 344
            Top = 32
            Width = 80
            Height = 21
            AutoSize = False
            Color = clBtnFace
            DecimalPlaces = 4
            DisplayFormat = '0.0000'
            MaxLength = 10
            ReadOnly = True
            TabOrder = 2
          end
        end
      end
      object ToolBar1: TToolBar
        Left = 0
        Top = 72
        Width = 784
        Height = 30
        BorderWidth = 1
        Caption = 'tlbControl'
        Color = clBtnFace
        EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
        Flat = True
        HotImages = frmPrincipal.ilColor
        Images = frmPrincipal.ilByN
        ParentColor = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        object ToolButton6: TToolButton
          Left = 0
          Top = 0
          Hint = 'Nuevo'
          Caption = 'tlbNuevo'
          ImageIndex = 6
          ParentShowHint = False
          ShowHint = True
          OnClick = ToolButton6Click
        end
        object ToolButton10: TToolButton
          Left = 23
          Top = 0
          Hint = 'Guardar'
          Caption = 'tlbGuardar'
          ImageIndex = 3
          ParentShowHint = False
          ShowHint = True
          OnClick = ToolButton10Click
        end
        object ToolButton11: TToolButton
          Left = 46
          Top = 0
          Hint = 'Baja'
          Caption = 'tlbBaja'
          ImageIndex = 8
          ParentShowHint = False
          ShowHint = True
          OnClick = ToolButton11Click
        end
        object ToolButton12: TToolButton
          Left = 69
          Top = 0
          Width = 5
          Caption = 'tblSeparador2'
          ImageIndex = 6
          Style = tbsDivider
        end
        object tbFinalLimpiar: TToolButton
          Tag = 2
          Left = 74
          Top = 0
          Hint = 'Limpiar'
          Caption = 'tbFinalLimpiar'
          ImageIndex = 1
          ParentShowHint = False
          ShowHint = True
          OnClick = tbLimpiarClick
        end
        object tbFinalOrdenar: TToolButton
          Tag = 2
          Left = 97
          Top = 0
          Hint = 'Ordenar'
          Caption = 'tbFinalOrdenar'
          ImageIndex = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = tbOrdenarClick
        end
        object tbFinalMostrar: TToolButton
          Tag = 2
          Left = 120
          Top = 0
          Hint = 'Mostrar / Ocultar Columnas'
          Caption = 'tbFinalMostrar'
          ImageIndex = 14
          ParentShowHint = False
          ShowHint = True
          OnClick = tbMostrarClick
        end
        object tbFinalImprimir: TToolButton
          Tag = 2
          Left = 143
          Top = 0
          Hint = 'Imprimir'
          Caption = 'tbFinalImprimir'
          ImageIndex = 4
          OnClick = tbImprimirClick
        end
        object tbFinalExportar: TToolButton
          Tag = 2
          Left = 166
          Top = 0
          Hint = 'Exportar'
          Caption = 'tbFinalExportar'
          ImageIndex = 3
          ParentShowHint = False
          ShowHint = True
          OnClick = tbExportarClick
        end
        object ToolButton14: TToolButton
          Left = 189
          Top = 0
          Width = 8
          Caption = 'ToolButton2'
          ImageIndex = 6
          Style = tbsSeparator
        end
        object ToolButton15: TToolButton
          Left = 197
          Top = 0
          Hint = 'Salir'
          Caption = 'tlbSalir'
          ImageIndex = 5
          ParentShowHint = False
          ShowHint = True
          Visible = False
        end
      end
      object dbgridFinal: TArtDBGrid
        Left = 8
        Top = 104
        Width = 768
        Height = 128
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsFinal
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnGetCellParams = dbgridFinalGetCellParams
        FooterBand = False
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'AR_NOMBRE'
            Title.Caption = 'Oferente'
            Width = 280
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LR_VALORFIJO'
            Title.Caption = 'Fijo'
            Width = 112
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LR_VALORVARIABLE'
            Title.Caption = 'Variable'
            Width = 112
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LR_COSTOEMPLEADO'
            Title.Caption = 'Costo por Empleado'
            Width = 112
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LR_COSTOANUAL'
            Title.Caption = 'Costo anual con SAC'
            Width = 112
            Visible = True
          end>
      end
      object GroupBox4: TGroupBox
        Left = 8
        Top = 240
        Width = 768
        Height = 52
        Anchors = [akLeft, akRight, akBottom]
        Caption = ' Datos Finales '
        TabOrder = 3
        DesignSize = (
          768
          52)
        object Label28: TLabel
          Left = 8
          Top = 25
          Width = 54
          Height = 13
          Alignment = taRightJustify
          Caption = 'Oferente:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label29: TLabel
          Left = 484
          Top = 25
          Width = 25
          Height = 13
          Alignment = taCenter
          Anchors = [akTop, akRight]
          Caption = 'Fijo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label30: TLabel
          Left = 618
          Top = 25
          Width = 51
          Height = 13
          Alignment = taCenter
          Anchors = [akTop, akRight]
          Caption = 'Variable:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        inline fraFinalSector: TfraCodigoDescripcion
          Left = 64
          Top = 20
          Width = 408
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          DesignSize = (
            408
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 343
            CharCase = ecUpperCase
          end
        end
        object edFinalFijo: TCurrencyEdit
          Left = 512
          Top = 20
          Width = 80
          Height = 21
          AutoSize = False
          DecimalPlaces = 4
          DisplayFormat = '0.0000'
          Anchors = [akTop, akRight]
          MaxLength = 10
          TabOrder = 1
          OnKeyPress = edTarifaFijaKeyPress
        end
        object edFinalVariable: TCurrencyEdit
          Left = 672
          Top = 20
          Width = 80
          Height = 21
          AutoSize = False
          DecimalPlaces = 4
          DisplayFormat = '0.0000'
          Anchors = [akTop, akRight]
          MaxLength = 10
          TabOrder = 2
          OnKeyPress = edTarifaFijaKeyPress
        end
      end
    end
    object tsAdjudicacion: TTabSheet
      Caption = 'Adjudicaci'#243'n'
      ImageIndex = 3
      DesignSize = (
        784
        292)
      object Label31: TLabel
        Left = 8
        Top = 21
        Width = 135
        Height = 13
        Caption = 'F. Notificaci'#243'n Adjudicaci'#243'n:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label32: TLabel
        Left = 312
        Top = 21
        Width = 64
        Height = 13
        Caption = 'Adjudicaci'#243'n:'
      end
      object Label33: TLabel
        Left = 8
        Top = 53
        Width = 35
        Height = 13
        Caption = 'Motivo:'
      end
      object Label34: TLabel
        Left = 8
        Top = 85
        Width = 74
        Height = 13
        Caption = 'Observaciones:'
      end
      object Label45: TLabel
        Left = 8
        Top = 117
        Width = 76
        Height = 13
        Caption = 'Fecha Llamado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label46: TLabel
        Left = 8
        Top = 149
        Width = 46
        Height = 13
        Caption = 'Contacto:'
      end
      object Label47: TLabel
        Left = 8
        Top = 181
        Width = 61
        Height = 13
        Caption = 'Comentarios:'
      end
      object edFechaNotificacionAdjudicacion: TDateComboBox
        Left = 152
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 0
      end
      inline fraAdjudicacion: TfraCodigoDescripcion
        Left = 392
        Top = 16
        Width = 376
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        DesignSize = (
          376
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 311
          CharCase = ecUpperCase
        end
      end
      inline fraMotivoAdjudicacion: TfraCtbTablas
        Left = 88
        Top = 48
        Width = 680
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        DesignSize = (
          680
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 627
          CharCase = ecUpperCase
        end
      end
      object edObservaciones: TEdit
        Left = 88
        Top = 80
        Width = 680
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        Text = 'edObservaciones'
      end
      object edFechaLlamadoAdjudicacion: TDateComboBox
        Left = 88
        Top = 112
        Width = 88
        Height = 21
        TabOrder = 4
      end
      object edContactoAdjudicacion: TEdit
        Left = 88
        Top = 144
        Width = 680
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 5
      end
      object edComentariosAdjudicacion: TEdit
        Left = 88
        Top = 176
        Width = 680
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 6
      end
    end
    object tsContratacion: TTabSheet
      Caption = 'Contrataci'#243'n'
      ImageIndex = 4
      DesignSize = (
        784
        292)
      object GroupBox5: TGroupBox
        Left = 0
        Top = 0
        Width = 784
        Height = 80
        Align = alTop
        Caption = ' Oferta '
        TabOrder = 0
        DesignSize = (
          784
          80)
        object Label36: TLabel
          Left = 240
          Top = 20
          Width = 89
          Height = 13
          Caption = 'Opci'#243'n a Pr'#243'rroga:'
        end
        object Label37: TLabel
          Left = 240
          Top = 52
          Width = 61
          Height = 13
          Caption = 'Condiciones:'
        end
        object GroupBox6: TGroupBox
          Left = 9
          Top = 16
          Width = 214
          Height = 52
          Caption = ' Per'#237'odo de Cobertura '
          TabOrder = 0
          object Label35: TLabel
            Left = 103
            Top = 24
            Width = 12
            Height = 10
            Caption = '>>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edPeriodoCoberturaDesde: TDateComboBox
            Left = 12
            Top = 20
            Width = 88
            Height = 21
            MaxDateCombo = edPeriodoCoberturaHasta
            TabOrder = 0
          end
          object edPeriodoCoberturaHasta: TDateComboBox
            Left = 118
            Top = 20
            Width = 88
            Height = 21
            MinDateCombo = edPeriodoCoberturaDesde
            TabOrder = 1
          end
        end
        object rbContratacionSi: TRadioButton
          Left = 344
          Top = 20
          Width = 32
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Si'
          TabOrder = 1
          OnClick = rbContratacionSiClick
        end
        object rbContratacionNo: TRadioButton
          Left = 392
          Top = 20
          Width = 32
          Height = 17
          Alignment = taLeftJustify
          Caption = 'No'
          TabOrder = 2
          OnClick = rbContratacionSiClick
        end
        object edContratacionCondiciones: TEdit
          Left = 312
          Top = 47
          Width = 456
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          CharCase = ecUpperCase
          MaxLength = 100
          TabOrder = 3
        end
      end
      object ToolBar2: TToolBar
        Left = 0
        Top = 80
        Width = 784
        Height = 30
        BorderWidth = 1
        Caption = 'tlbControl'
        Color = clBtnFace
        EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
        Flat = True
        HotImages = frmPrincipal.ilColor
        Images = frmPrincipal.ilByN
        ParentColor = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        object ToolButton16: TToolButton
          Left = 0
          Top = 0
          Hint = 'Nuevo'
          Caption = 'tlbNuevo'
          ImageIndex = 6
          OnClick = ToolButton16Click
        end
        object ToolButton18: TToolButton
          Left = 23
          Top = 0
          Hint = 'Guardar'
          Caption = 'tlbGuardar'
          ImageIndex = 3
          OnClick = ToolButton18Click
        end
        object ToolButton19: TToolButton
          Left = 46
          Top = 0
          Hint = 'Baja'
          Caption = 'tlbBaja'
          ImageIndex = 8
          OnClick = ToolButton19Click
        end
        object ToolButton20: TToolButton
          Left = 69
          Top = 0
          Width = 5
          Caption = 'tblSeparador2'
          ImageIndex = 6
          Style = tbsDivider
        end
        object tbContratacionLimpiar: TToolButton
          Tag = 3
          Left = 74
          Top = 0
          Hint = 'Limpiar'
          Caption = 'tbContratacionLimpiar'
          ImageIndex = 1
          OnClick = tbLimpiarClick
        end
        object tbContratacionOrdenar: TToolButton
          Tag = 3
          Left = 97
          Top = 0
          Hint = 'Ordenar'
          Caption = 'tbContratacionOrdenar'
          ImageIndex = 2
          OnClick = tbOrdenarClick
        end
        object tbContratacionMostrar: TToolButton
          Tag = 3
          Left = 120
          Top = 0
          Hint = 'Mostrar / Ocultar Columnas'
          Caption = 'tbContratacionMostrar'
          ImageIndex = 14
          OnClick = tbMostrarClick
        end
        object tbContratacionImprimir: TToolButton
          Tag = 3
          Left = 143
          Top = 0
          Hint = 'Imprimir'
          Caption = 'tbContratacionImprimir'
          ImageIndex = 4
          OnClick = tbImprimirClick
        end
        object tbContratacionExportar: TToolButton
          Tag = 3
          Left = 166
          Top = 0
          Hint = 'Exportar'
          Caption = 'tbContratacionExportar'
          ImageIndex = 3
          OnClick = tbExportarClick
        end
        object ToolButton22: TToolButton
          Left = 189
          Top = 0
          Width = 8
          Caption = 'ToolButton2'
          ImageIndex = 6
          Style = tbsSeparator
        end
        object ToolButton23: TToolButton
          Left = 197
          Top = 0
          Hint = 'Salir'
          Caption = 'tlbSalir'
          ImageIndex = 5
          Wrap = True
          Visible = False
        end
      end
      object dbgrtidContratacion: TArtDBGrid
        Left = 8
        Top = 112
        Width = 768
        Height = 96
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsContratacion
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnGetCellParams = dbgrtidContratacionGetCellParams
        FooterBand = False
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'SC_DESCRIPCION'
            Title.Caption = 'Sector'
            Width = 184
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SE_NOMBRE'
            Title.Caption = 'Responsable'
            Width = 184
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LC_OBLIGACION'
            Title.Caption = 'Obligaciones Contractuales'
            Width = 368
            Visible = True
          end>
      end
      object GroupBox7: TGroupBox
        Left = 8
        Top = 216
        Width = 768
        Height = 76
        Anchors = [akLeft, akRight, akBottom]
        Caption = ' Datos Contrataci'#243'n '
        TabOrder = 3
        DesignSize = (
          768
          76)
        object Label38: TLabel
          Left = 8
          Top = 21
          Width = 65
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Sector:'
        end
        object Label39: TLabel
          Left = 8
          Top = 53
          Width = 65
          Height = 13
          Caption = 'Responsable:'
        end
        object Label40: TLabel
          Left = 400
          Top = 53
          Width = 55
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'E-mail:'
        end
        object Label41: TLabel
          Left = 400
          Top = 21
          Width = 55
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Obligaci'#243'n:'
        end
        inline fraContratacionSector: TfraCodigoDescripcion
          Left = 80
          Top = 16
          Width = 312
          Height = 23
          TabOrder = 0
          DesignSize = (
            312
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 246
            CharCase = ecUpperCase
          end
          inherited edCodigo: TPatternEdit
            OnExit = fraContratacionSectoredCodigoExit
          end
        end
        inline fraContratacionResponsable: TfraCodigoDescripcion
          Left = 80
          Top = 48
          Width = 312
          Height = 23
          TabOrder = 2
          DesignSize = (
            312
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 246
            CharCase = ecUpperCase
          end
          inherited edCodigo: TPatternEdit
            OnExit = fraContratacionResponsableedCodigoExit
          end
        end
        object edContratacionEmail: TEdit
          Left = 464
          Top = 48
          Width = 296
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          CharCase = ecUpperCase
          MaxLength = 100
          TabOrder = 3
        end
        object edContratacionObligacion: TEdit
          Left = 464
          Top = 16
          Width = 296
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          CharCase = ecUpperCase
          MaxLength = 100
          TabOrder = 1
        end
      end
    end
  end
  object sdqSeguimientoDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqSeguimientoDatosAfterScroll
    SQL.Strings = (
      'SELECT ALS_LICITACIONSEGUIMIENTO.*, SC_DESCRIPCION, SE_NOMBRE'
      '  FROM ALS_LICITACIONSEGUIMIENTO, USC_SECTORES, USE_USUARIOS'
      ' WHERE LS_IDSECTOR = SC_ID (+)'
      '   AND LS_RESPONSABLE = SE_ID (+)'
      '   AND LS_IDLICITACION = :IDLICITACION')
    Left = 668
    Top = 412
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDLICITACION'
        ParamType = ptInput
      end>
  end
  object sdDatos: TDataSource
    DataSet = sdqSeguimientoDatos
    Left = 700
    Top = 412
  end
  object sdqFinalDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqFinalDatosAfterScroll
    SQL.Strings = (
      
        'SELECT AR_NOMBRE, LR_COSTOANUAL, LR_COSTOEMPLEADO, LR_FECHABAJA,' +
        ' LR_ID, LR_IDART, LR_VALORFIJO, LR_VALORVARIABLE'
      '  FROM ALR_LICITACIONRESULTADO, AAR_ART'
      ' WHERE LR_IDART = AR_ID (+)'
      '       AND LR_IDLICITACION = :IDLICITACION')
    Left = 668
    Top = 444
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDLICITACION'
        ParamType = ptInput
      end>
  end
  object dsFinal: TDataSource
    DataSet = sdqFinalDatos
    Left = 700
    Top = 444
  end
  object sdqContratacionDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqContratacionDatosAfterScroll
    SQL.Strings = (
      
        'SELECT LC_FECHABAJA, LC_ID, LC_IDSECTOR, LC_MAIL, LC_OBLIGACION,' +
        ' LC_RESPONSABLE, SC_DESCRIPCION, SE_NOMBRE'
      '  FROM ALC_LICITACIONCONTRATACION, USC_SECTORES, USE_USUARIOS'
      ' WHERE LC_IDSECTOR = SC_ID (+)'
      '   AND LC_RESPONSABLE = SE_ID (+)'
      '   AND LC_IDLICITACION = :IDLICITACION')
    Left = 668
    Top = 476
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDLICITACION'
        ParamType = ptInput
      end>
  end
  object dsContratacion: TDataSource
    DataSet = sdqContratacionDatos
    Left = 700
    Top = 476
  end
  object SortDialogSeguimiento: TSortDialog
    Caption = 'Orden'
    DataSet = sdqSeguimientoDatos
    SortFields = <>
    IniStorage = frmPrincipal.FormPlacement
    FixedRows = 0
    Left = 604
    Top = 416
  end
  object ExportDialogSeguimiento: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqSeguimientoDatos
    Fields = <>
    IniStorage = frmPrincipal.FormPlacement
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
    Left = 532
    Top = 416
  end
  object FieldHiderSeguimiento: TFieldHider
    IniStorage = frmPrincipal.FormPlacement
    DBGrid = ArtDBGrid
    SortDialog = SortDialogSeguimiento
    ExportDialog = ExportDialogSeguimiento
    Left = 568
    Top = 416
  end
  object ExportDialogFinal: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqFinalDatos
    Fields = <>
    IniStorage = frmPrincipal.FormPlacement
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
    Left = 532
    Top = 448
  end
  object FieldHiderFinal: TFieldHider
    IniStorage = frmPrincipal.FormPlacement
    DBGrid = dbgridFinal
    SortDialog = SortDialogFinal
    ExportDialog = ExportDialogFinal
    Left = 568
    Top = 448
  end
  object SortDialogFinal: TSortDialog
    Caption = 'Orden'
    DataSet = sdqFinalDatos
    SortFields = <>
    IniStorage = frmPrincipal.FormPlacement
    FixedRows = 0
    Left = 604
    Top = 448
  end
  object ExportDialogContratacion: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqContratacionDatos
    Fields = <>
    IniStorage = frmPrincipal.FormPlacement
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
    Left = 532
    Top = 480
  end
  object FieldHiderContratacion: TFieldHider
    IniStorage = frmPrincipal.FormPlacement
    DBGrid = dbgrtidContratacion
    SortDialog = SortDialogContratacion
    ExportDialog = ExportDialogContratacion
    Left = 568
    Top = 480
  end
  object SortDialogContratacion: TSortDialog
    Caption = 'Orden'
    DataSet = sdqContratacionDatos
    SortFields = <>
    IniStorage = frmPrincipal.FormPlacement
    FixedRows = 0
    Left = 604
    Top = 480
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 77
    Top = 426
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blTop, blLeft, blRight, blBottom]
    Fields = <>
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Listado de Licitaciones'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 14211288
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clBlack
    Headers.Font.Height = -11
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = clWhite
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLines = [glHorizontal, glVertical]
    Detail.GridLinesWidth = 0
    Detail.MultiLine = mlAuto
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    PageOrientation = pxLandscape
    PageSize = psLegal
    PrinterOptions.PrintDialog = PrintDialog
    Left = 104
    Top = 426
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16460
        LinkControl = tbMainLimpiar
      end
      item
        Key = 16455
        LinkControl = tbMainGuardar
      end
      item
        Key = 16457
        LinkControl = tbMainImprimir
      end
      item
        Key = 16453
        LinkControl = tbMainExpediente
      end
      item
        Key = 16467
        LinkControl = tbMainSalir
      end>
    Left = 384
    Top = 32
  end
end
