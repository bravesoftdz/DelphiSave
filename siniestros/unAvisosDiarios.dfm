inherited frmAvisosDiarios: TfrmAvisosDiarios
  Caption = 'Avisos Diarios'
  ClientHeight = 309
  ClientWidth = 755
  Constraints.MinHeight = 339
  Constraints.MinWidth = 763
  ExplicitWidth = 763
  ExplicitHeight = 339
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 755
    Height = 141
    ExplicitWidth = 755
    ExplicitHeight = 141
    object Label8: TLabel
      Left = 5
      Top = 9
      Width = 59
      Height = 13
      Caption = 'Destinatario:'
    end
    object Label1: TLabel
      Left = 8
      Top = 42
      Width = 29
      Height = 13
      Caption = 'Aviso:'
    end
    object Label3: TLabel
      Left = 8
      Top = 76
      Width = 44
      Height = 13
      Caption = 'Empresa:'
    end
    object Label4: TLabel
      Left = 5
      Top = 110
      Width = 54
      Height = 13
      Caption = 'Trabajador:'
    end
    inline fraDestinatario: TfraUsuario
      Left = 68
      Top = 5
      Width = 356
      Height = 21
      TabOrder = 0
      ExplicitLeft = 68
      ExplicitTop = 5
      ExplicitWidth = 356
      inherited edCodigo: TPatternEdit
        OnChange = fraDestinatarioedCodigoChange
      end
      inherited cmbDescripcion: TArtComboBox
        Left = 81
        Width = 272
        ExplicitLeft = 81
        ExplicitWidth = 272
      end
    end
    inline fraAviso: TfraCodigoDescripcion
      Left = 68
      Top = 36
      Width = 358
      Height = 23
      TabOrder = 3
      ExplicitLeft = 68
      ExplicitTop = 36
      ExplicitWidth = 358
      inherited cmbDescripcion: TArtComboBox
        Width = 293
        ExplicitWidth = 293
      end
    end
    object gbFechaSiniestro: TGroupBox
      Left = 604
      Top = 57
      Width = 120
      Height = 76
      Caption = 'Fecha Aviso'
      TabOrder = 5
      object Label2: TLabel
        Left = 98
        Top = 21
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object dcFAvisoDesde: TDateComboBox
        Left = 8
        Top = 18
        Width = 88
        Height = 21
        MaxDateCombo = dcFAvisoHasta
        TabOrder = 0
      end
      object dcFAvisoHasta: TDateComboBox
        Left = 8
        Top = 45
        Width = 88
        Height = 21
        MinDateCombo = dcFAvisoDesde
        TabOrder = 1
      end
    end
    object gbVerVistos: TGroupBox
      Left = 448
      Top = 3
      Width = 149
      Height = 38
      Caption = 'Ver Vistos'
      TabOrder = 1
      object rbVistos_Si: TRadioButton
        Left = 8
        Top = 16
        Width = 33
        Height = 17
        Caption = 'S'#237
        TabOrder = 0
      end
      object rbVistos_No: TRadioButton
        Left = 49
        Top = 16
        Width = 33
        Height = 17
        Caption = 'No'
        TabOrder = 1
      end
      object rbVistos_Todos: TRadioButton
        Left = 91
        Top = 16
        Width = 52
        Height = 17
        Caption = 'Todos'
        TabOrder = 2
      end
    end
    inline fraEmpresa: TfraEmpresa
      Left = 69
      Top = 71
      Width = 524
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      ExplicitLeft = 69
      ExplicitTop = 71
      ExplicitWidth = 524
      inherited lbContrato: TLabel
        Left = 420
        ExplicitLeft = 412
      end
      inherited edContrato: TIntEdit
        Left = 467
        ExplicitLeft = 467
      end
      inherited cmbRSocial: TArtComboBox
        Width = 285
        ExplicitWidth = 285
      end
    end
    object gbVerBajas: TGroupBox
      Left = 604
      Top = 3
      Width = 149
      Height = 38
      Caption = 'Ver Bajas'
      TabOrder = 2
      object rbBajas_Si: TRadioButton
        Left = 8
        Top = 16
        Width = 33
        Height = 17
        Caption = 'S'#237
        TabOrder = 0
      end
      object rbBajas_No: TRadioButton
        Left = 50
        Top = 16
        Width = 33
        Height = 17
        Caption = 'No'
        TabOrder = 1
      end
      object rbBajas_Todos: TRadioButton
        Left = 91
        Top = 16
        Width = 52
        Height = 17
        Caption = 'Todos'
        TabOrder = 2
      end
    end
    inline fraTrabajadorSIN: TfraTrabajadorSiniestro
      Left = 69
      Top = 104
      Width = 526
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      ExplicitLeft = 69
      ExplicitTop = 104
      ExplicitWidth = 526
      inherited lbSiniestro: TLabel
        Left = 349
        ExplicitLeft = 340
      end
      inherited cmbNombre: TArtComboBox
        Width = 258
        ExplicitWidth = 258
      end
      inherited edSiniestro: TSinEdit
        Left = 416
        Width = 108
        ExplicitLeft = 416
        ExplicitWidth = 108
      end
      inherited ToolBar: TToolBar
        Left = 391
        ExplicitLeft = 391
      end
      inherited ImageList: TImageList
        Bitmap = {
          494C010101000400400010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
          0000000000003600000028000000400000001000000001002000000000000010
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000666666006666660000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000066666600E3E3E300A4A0A00066666600000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000066666600E3E3E300A4A0A000E3E3E300A4A0A000666666000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000808000A4A0A000E3E3E300CCCCCC00D7D7D700B2B2B2006666
          6600000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000066666600B2B2B200E3E3E300CCCCCC00D7D7D700E3E3E300A4A0A000E3E3
          E300666666000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000008080
          800066666600E3E3E300CCCCCC00D7D7D700E3E3E300A4A0A000E3E3E300A4A0
          A000C0C0C0006666660000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000008080
          800066666600CCCCCC00D7D7D700E3E3E300A4A0A000E3E3E300A4A0A000C0C0
          C000C0C0C000B2B2B20066666600000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000008080
          80008080800066666600B2B2B200A4A0A000E3E3E300A4A0A000C0C0C000C0C0
          C000B2B2B2000066660022222200000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000A4A0
          A000A4A0A0008080800066666600E3E3E300B2B2B200C0C0C000C0C0C000A4A0
          A000666666003939390000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000A4A0
          A000B2B2B200B2B2B2008080800066666600B2B2B20033999900666666006666
          6600000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000096969600C0C0
          C000B2B2B200B2B2B20080808000808080006666660066666600000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000096969600B2B2B2008686
          8600969696000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000096969600A4A0A000868686009696
          9600000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000008686860086868600969696000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000424D3E000000000000003E000000
          2800000040000000100000000100010000000000800000000000000000000000
          000000000000000000000000FFFFFF00FFFF000000000000FE7F000000000000
          FC3F000000000000F81F000000000000F80F000000000000F007000000000000
          E003000000000000E001000000000000E001000000000000E003000000000000
          E00F000000000000C03F00000000000087FF0000000000000FFF000000000000
          1FFF000000000000FFFF00000000000000000000000000000000000000000000
          000000000000}
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 141
    Width = 755
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 749
      end>
    ExplicitTop = 141
    ExplicitWidth = 755
    inherited ToolBar: TToolBar
      Width = 740
      ExplicitWidth = 740
      inherited tbEliminar: TToolButton
        Visible = True
        OnClick = tbEliminarClick
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbVisto: TToolButton
        Left = 370
        Top = 0
        Hint = 'Marcar como Visto (Ctrl + Alt + V)'
        Caption = 'tbVisto'
        ImageIndex = 27
        OnClick = tbVistoClick
      end
      object tbNoVisto: TToolButton
        Left = 393
        Top = 0
        Hint = 'Marcar como No Visto (Ctrl + Alt + N)'
        Caption = 'tbNoVisto'
        ImageIndex = 28
        OnClick = tbNoVistoClick
      end
      object ToolButton7: TToolButton
        Left = 416
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 424
        Top = 0
        Hint = 'Salir (Ctrl + S)'
        Caption = 'tbSalir2'
        ImageIndex = 5
        OnClick = tbSalir2Click
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 170
    Width = 755
    Height = 139
    OnCellClick = GridCellClick
    OnDrawColumnCell = GridDrawColumnCell
    OnGetCellParams = GridGetCellParams
    OnContextPopup = GridContextPopup
    Columns = <
      item
        Expanded = False
        FieldName = 'CHECKBOX'
        Title.Caption = '.'
        Width = 20
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VISTO'
        Title.Alignment = taCenter
        Title.Caption = 'Visto'
        Width = 50
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FAVISO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Aviso'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESTINATARIO'
        Title.Caption = 'Destinatario'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Alignment = taCenter
        Title.Caption = 'Siniestro'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FEVENTO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Evento'
        Width = 67
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CODEVENTO'
        Title.Alignment = taCenter
        Title.Caption = 'Cod. Ev.'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMISION'
        Title.Caption = 'Comisi'#243'n'
        Width = 67
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIL'
        Title.Alignment = taCenter
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRABAJADOR'
        Title.Caption = 'Trabajador'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCALIDADTRAB'
        Title.Caption = 'Localidad Trabajador'
        Width = 150
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIT'
        Title.Alignment = taCenter
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPRESA'
        Title.Caption = 'Empresa'
        Width = 150
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FALTAMEDICA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Alta M'#233'dica'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FBAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 70
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT ai_visto visto, ai_fechaalta faviso, ai_usuario destinata' +
        'rio,  '
      
        '       art.utiles.armar_siniestro (ex_siniestro, ex_orden, ex_re' +
        'caida) siniestro,  '
      
        '       ev_fecha fevento, ev_codigo codevento, cm_descripcion com' +
        'ision,  art.utiles.armar_cuit (tj_cuil) cuil, '
      
        '       tj_nombre trabajador, tj_localidad localidadtrab,  art.ut' +
        'iles.armar_cuit (em_cuit) cuit, '
      
        '       em_nombre empresa, ex_altamedica faltamedica,  ai_fechaba' +
        'ja fbaja  '
      
        '  FROM SIN.sai_avisosinca, art.sex_expedientes, ctj_trabajador, ' +
        'aem_empresa, '
      
        '       art.sev_eventosdetramite, SIN.spe_partedeegreso, SIN.scm_' +
        'comisionmedica  '
      ' WHERE ai_idaviso = 1 '
      '   AND ai_usuario = '#39'LPIPARO'#39' '
      '   AND ai_idexpediente = ex_id  '
      '   AND ex_idtrabajador = tj_id  '
      '   AND ex_cuit = em_cuit  '
      '   AND ai_ideventoinca = ev_idevento(+)  '
      '   AND ex_id = pe_idexpediente(+)  '
      '   AND ev_comision = cm_codigo(+) ')
    Left = 16
    Top = 224
  end
  inherited dsConsulta: TDataSource
    Left = 44
    Top = 224
  end
  inherited SortDialog: TSortDialog
    Left = 16
    Top = 252
  end
  inherited ExportDialog: TExportDialog
    Left = 44
    Top = 252
  end
  inherited QueryPrint: TQueryPrint
    PageOrientation = pxLandscape
    PageSize = psLegal
    Left = 44
    Top = 280
  end
  inherited Seguridad: TSeguridad
    Claves = <
      item
        Name = 'Cambiar_Destinatario'
      end>
    Left = 16
    Top = 196
  end
  inherited FormStorage: TFormStorage
    Left = 44
    Top = 196
  end
  inherited PrintDialog: TPrintDialog
    Left = 16
    Top = 280
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
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
        Key = 49238
        LinkControl = tbVisto
      end
      item
        Key = 49230
        LinkControl = tbNoVisto
      end>
    Left = 72
    Top = 196
  end
  inherited FieldHider: TFieldHider
    Left = 72
    Top = 224
  end
end
