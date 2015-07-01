object frmABMOficios: TfrmABMOficios
  Left = 201
  Top = 109
  Width = 708
  Height = 573
  Caption = 'Oficios'
  Color = clBtnFace
  Constraints.MaxHeight = 573
  Constraints.MaxWidth = 708
  Constraints.MinHeight = 573
  Constraints.MinWidth = 708
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object tbGestionDeuda: TToolBar
    Left = 0
    Top = 0
    Width = 700
    Height = 27
    Caption = 'Barra de Herramientas de Dictamenes Acusatorios'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    HotImages = dmLegales.ilByN
    Images = dmLegales.ilColor
    TabOrder = 0
    object tbSeparador0: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'tbSeparador0'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object tbGuardar: TToolButton
      Left = 8
      Top = 0
      Hint = 'Guardar Sumario (Ctrl-G)'
      Caption = 'tbGuardar'
      ImageIndex = 3
      ParentShowHint = False
      ShowHint = True
      OnClick = tbGuardarClick
    end
    object tbSeparador3: TToolButton
      Left = 31
      Top = 0
      Width = 8
      Caption = 'tbSeparador3'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object tbGenerarContestacion: TToolButton
      Left = 39
      Top = 0
      Hint = 'Generar Contestaci'#243'n'
      ImageIndex = 23
      ParentShowHint = False
      ShowHint = True
      OnClick = tbGenerarContestacionClick
    end
    object ToolButton2: TToolButton
      Left = 62
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object tbSalir: TToolButton
      Left = 70
      Top = 0
      Hint = 'Salir del Sumario'
      Caption = 'tbSalir'
      ImageIndex = 5
      ParentShowHint = False
      ShowHint = True
      OnClick = tbSalirClick
    end
  end
  object gbOficio: TGroupBox
    Left = 0
    Top = 27
    Width = 700
    Height = 137
    Align = alTop
    Caption = 'Oficio'
    TabOrder = 1
    DesignSize = (
      700
      137)
    object lbConcurso: TLabel
      Left = 198
      Top = 16
      Width = 49
      Height = 13
      Caption = 'F.Entrada:'
    end
    object lblCaratula: TLabel
      Left = 11
      Top = 39
      Width = 45
      Height = 13
      Caption = 'Car'#225'tula: '
    end
    object lblOficio: TLabel
      Left = 11
      Top = 15
      Width = 50
      Height = 13
      Caption = 'Nro Oficio:'
    end
    object lblContra: TLabel
      Left = 196
      Top = 39
      Width = 12
      Height = 13
      Caption = 'C/'
    end
    object Label1: TLabel
      Left = 11
      Top = 88
      Width = 56
      Height = 13
      Caption = 'Asignado a:'
    end
    object Label3: TLabel
      Left = 354
      Top = 16
      Width = 41
      Height = 13
      Caption = 'F.Salida:'
    end
    object Label4: TLabel
      Left = 354
      Top = 40
      Width = 64
      Height = 13
      Caption = 'F.Recepci'#243'n:'
    end
    object Label7: TLabel
      Left = 11
      Top = 112
      Width = 59
      Height = 13
      Caption = 'Juicio relac.:'
    end
    object edFechaEntrada: TDateComboBox
      Left = 253
      Top = 12
      Width = 88
      Height = 21
      Weekends = [Sun, Sat]
      TabOrder = 1
    end
    object edCARATULA: TEdit
      Left = 84
      Top = 60
      Width = 257
      Height = 21
      AutoSize = False
      CharCase = ecUpperCase
      Color = clWhite
      MaxLength = 1024
      TabOrder = 4
    end
    object edNroOficio: TIntEdit
      Left = 84
      Top = 12
      Width = 78
      Height = 21
      TabStop = False
      Color = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Alignment = taRightJustify
      MaxLength = 8
    end
    object edDemandante: TEdit
      Left = 84
      Top = 36
      Width = 108
      Height = 21
      AutoSize = False
      CharCase = ecUpperCase
      Color = clWhite
      MaxLength = 200
      TabOrder = 2
    end
    object edDemandado: TEdit
      Left = 214
      Top = 36
      Width = 127
      Height = 21
      AutoSize = False
      CharCase = ecUpperCase
      Color = clWhite
      MaxLength = 200
      TabOrder = 3
    end
    object edFechaSalida: TDateComboBox
      Left = 420
      Top = 12
      Width = 88
      Height = 21
      Weekends = [Sun, Sat]
      TabOrder = 7
    end
    object edFechaRecepcion: TDateComboBox
      Left = 420
      Top = 36
      Width = 88
      Height = 21
      Weekends = [Sun, Sat]
      TabOrder = 8
    end
    object chbAgregaDocumentacion: TCheckBox
      Left = 353
      Top = 62
      Width = 153
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Agrega Documentaci'#243'n'
      TabOrder = 9
    end
    inline FraJuicios: TfraCodigoDescripcionExt
      Left = 83
      Top = 106
      Width = 608
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 6
      inherited cmbDescripcion: TArtComboBox
        Left = 55
        Width = 548
        CharCase = ecUpperCase
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'Carpeta'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Title.Caption = 'Car'#225'tula'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'JT_DEMANDADO'
            Title.Caption = 'Demandado'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'JT_CARATULA'
            Title.Caption = 'Car'#225'tula'
            Visible = False
          end>
        OnDropDown = FraJuicioscmbDescripcionDropDown
      end
      inherited edCodigo: TPatternEdit
        Width = 50
        MaxLength = 8
      end
    end
    object tbrVerArchivosAsociados: TToolBar
      Left = 521
      Top = 54
      Width = 33
      Height = 27
      Align = alNone
      Anchors = [akTop, akRight]
      BorderWidth = 1
      ButtonWidth = 25
      EdgeBorders = []
      Flat = True
      HotImages = dmLegales.ilColor
      Images = dmLegales.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      object tbSeleccionArchivosAsociar: TToolButton
        Left = 0
        Top = 0
        Hint = 'Seleccionar Archivos'
        ImageIndex = 26
        OnClick = tbSeleccionArchivosAsociarClick
      end
    end
    inline fraUsuario: TfraUsuario
      Left = 84
      Top = 84
      Width = 602
      Height = 21
      TabOrder = 5
      inherited cmbDescripcion: TArtComboBox
        Width = 518
      end
    end
  end
  object gbOficiante: TGroupBox
    Left = 0
    Top = 164
    Width = 700
    Height = 45
    Align = alTop
    Caption = 'Oficiante'
    TabOrder = 2
    DesignSize = (
      700
      45)
    object Label9: TLabel
      Left = 11
      Top = 19
      Width = 40
      Height = 13
      Caption = 'Nombre:'
    end
    object edOficiante: TEdit
      Left = 85
      Top = 14
      Width = 599
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
  end
  inline fraDatosJuzgadoAsignado: TfraJuzgados
    Left = 0
    Top = 209
    Width = 700
    Height = 62
    Align = alTop
    TabOrder = 3
    inherited gbJuzgados: TGroupBox
      Left = 0
      Top = 0
      Width = 700
      Height = 62
      Align = alClient
      inherited lblJurisdiccion: TLabel
        Left = 11
      end
      inherited lblJuzgado: TLabel
        Left = 11
      end
      inherited lblInstancia: TLabel
        Left = 11
        Top = 74
      end
      inherited lblExpediente: TLabel
        Top = 73
      end
      inherited lblFechaIngreso: TLabel
        Top = 73
      end
      inherited fraFuero: TfraCodigoDescripcionExt
        Width = 326
        inherited cmbDescripcion: TArtComboBox
          Width = 261
        end
      end
      inherited fraSecretaria: TfraCodigoDescripcionExt
        Width = 263
        inherited cmbDescripcion: TArtComboBox
          Width = 198
        end
      end
      inherited peInstancia: TPatternEdit
        Top = 70
        Enabled = True
        Font.Style = [fsBold]
        ParentFont = False
      end
      inherited btnMasDatosJuzgado: TBitBtn
        Left = 631
        Top = 36
        Width = 59
      end
      inherited edNroExpediente: TPatternEdit
        TabOrder = 9
      end
      inherited btnInstanciasAnteriores: TBitBtn
        Top = 70
      end
      inherited dteFechaIngreso: TDateComboBox
        Top = 69
        TabOrder = 6
      end
    end
    inherited sdqJuzgado: TSDQuery
      DataSource = fraDatosJuzgadoAsignado.fraJuzgado.dsDatos
    end
  end
  object gbEntidadOficiante: TGroupBox
    Left = 0
    Top = 319
    Width = 700
    Height = 48
    Align = alTop
    Caption = 'Entidad Oficiante'
    TabOrder = 4
    DesignSize = (
      700
      48)
    object Label2: TLabel
      Left = 11
      Top = 22
      Width = 40
      Height = 13
      Caption = 'Nombre:'
    end
    inline fraEntidad: TfraCodigoDescripcionExt
      Left = 84
      Top = 16
      Width = 578
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Left = 55
        Width = 513
      end
      inherited edCodigo: TPatternEdit
        Width = 50
        MaxLength = 8
      end
    end
    object tbEdicionAbogado: TToolBar
      Left = 658
      Top = 15
      Width = 29
      Height = 27
      Align = alNone
      Anchors = [akTop, akRight]
      BorderWidth = 1
      ButtonWidth = 25
      Caption = 'ToolBar'
      EdgeBorders = []
      Flat = True
      HotImages = dmLegales.ilByN
      Images = dmLegales.ilColor
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      object tbNuevaEntidad: TToolButton
        Left = 0
        Top = 0
        Hint = 'Nuevo'
        ImageIndex = 6
        OnClick = tbNuevaEntidadClick
      end
    end
  end
  object gbDomicilio: TGroupBox
    Left = 0
    Top = 367
    Width = 700
    Height = 75
    Align = alTop
    Caption = 'Domicilio'
    TabOrder = 5
    inline fraDomicilio: TfraDomicilio
      Left = 11
      Top = 16
      Width = 646
      Height = 52
      AutoSize = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        646
        52)
      inherited lbNro: TLabel
        Left = 431
      end
      inherited lbPiso: TLabel
        Left = 503
      end
      inherited lbDto: TLabel
        Left = 579
      end
      inherited lbProvincia: TLabel
        Left = 484
      end
      inherited cmbCalle: TArtComboBox
        Width = 346
      end
      inherited edNumero: TEdit
        Left = 453
      end
      inherited edPiso: TEdit
        Left = 529
      end
      inherited edDto: TEdit
        Left = 601
      end
      inherited cmbLocalidad: TArtComboBox
        Width = 214
      end
      inherited edProvincia: TEdit
        Left = 533
      end
      inherited btnBuscar: TButton
        Left = 396
      end
    end
  end
  object gbDetalle: TGroupBox
    Left = 0
    Top = 442
    Width = 700
    Height = 100
    Align = alTop
    Caption = 'Detalle'
    TabOrder = 6
    object Label5: TLabel
      Left = 11
      Top = 29
      Width = 71
      Height = 13
      Caption = 'Requerimiento:'
    end
    object Label6: TLabel
      Left = 11
      Top = 69
      Width = 54
      Height = 13
      Caption = 'Respuesta:'
    end
    object edRequerimiento: TRichEdit
      Left = 87
      Top = 13
      Width = 604
      Height = 40
      PlainText = True
      TabOrder = 0
    end
    object edRespuesta: TRichEdit
      Left = 87
      Top = 55
      Width = 604
      Height = 40
      PlainText = True
      TabOrder = 1
    end
  end
  object gbDomicilioJuzgado: TGroupBox
    Left = 0
    Top = 271
    Width = 700
    Height = 48
    Align = alTop
    Caption = 'Domicilio Juzgado'
    TabOrder = 7
    DesignSize = (
      700
      48)
    object Label8: TLabel
      Left = 11
      Top = 22
      Width = 48
      Height = 13
      Caption = 'Direcci'#243'n:'
    end
    object edDomicilioJuzgado: TEdit
      Left = 84
      Top = 19
      Width = 590
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      CharCase = ecUpperCase
      Color = clGradientInactiveCaption
      MaxLength = 1024
      ReadOnly = True
      TabOrder = 0
    end
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16462
        LinkControl = tbGuardar
      end
      item
        Key = 16460
      end
      item
        Key = 16453
      end
      item
        Key = 16455
        LinkControl = tbGuardar
      end
      item
        Key = 16467
      end
      item
        Key = 16457
      end
      item
        Key = 16468
      end>
    Left = 337
  end
  object Seguridad: TSeguridad
    AutoEjecutar = False
    Claves = <>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = False
    Left = 366
  end
  object FormStorage: TFormStorage
    Options = [fpState, fpPosition, fpActiveControl]
    UseRegistry = True
    Version = 1
    StoredValues = <>
    Left = 445
  end
  object odAbrirArchivo: TOpenDialog
    Title = 'x'
    Left = 474
  end
  object pmSeguimientoJuicios: TPopupMenu
    Left = 503
    Top = 65535
    object ImprimirExpediente1: TMenuItem
      Caption = '&Expediente'
    end
    object mnuLiquidacion: TMenuItem
      Caption = '&Liquidaci'#243'n'
    end
    object EvolucindeInstancias1: TMenuItem
      Caption = 'Instancias'
    end
    object mnuEventos: TMenuItem
      Caption = 'Eventos'
    end
    object mnuAgenda: TMenuItem
      Caption = 'Agenda'
    end
  end
  object cdsArchivosAsociados: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'PATHARCHIVO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'STATE'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'idxPath'
      end>
    Params = <>
    StoreDefs = True
    Left = 525
    Top = 49
    Data = {
      7F0000009619E0BD0100000018000000040000000000030000007F000B444553
      4352495043494F4E01004900000001000557494454480200020064000B504154
      484152434849564F010049000000010005574944544802000200640002494404
      0001000000000005535441544501004900000001000557494454480200020001
      000000}
  end
  object sdqArchivosAsociados: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT'
      'ao_descripcion, ao_patharchivo, ao_id'
      'FROM legales.LAO_ARCHIVOOFICIO'
      'WHERE ao_idoficio = :Idoficio '
      'and ao_fechabaja is null'
      '')
    Left = 555
    Top = 49
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Idoficio'
        ParamType = ptInput
      end>
  end
  object WordApplication: TWordApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 587
    Top = 49
  end
  object WordDocument: TWordDocument
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    OnClose = WordDocumentClose
    Left = 619
    Top = 49
  end
  object sdqModificacionRegistro: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT *'
      'FROM legales.loj_oficiojudicial'
      'WHERE oj_id = :oj_id ')
    Left = 556
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'oj_id'
        ParamType = ptInput
      end>
  end
end
