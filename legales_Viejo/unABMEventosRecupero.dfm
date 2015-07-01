inherited frmABMEventosRecupero: TfrmABMEventosRecupero
  Left = 392
  Top = 107
  Width = 676
  Height = 477
  Caption = 'Administraci'#243'n de Eventos (Recupero).'
  Constraints.MinHeight = 477
  Constraints.MinWidth = 676
  FormStyle = fsNormal
  OldCreateOrder = True
  Visible = False
  OnActivate = FSFormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 668
    Height = 118
    DesignSize = (
      668
      118)
    object lbAbogado: TLabel
      Left = 61
      Top = 32
      Width = 46
      Height = 13
      Caption = 'Abogado:'
    end
    object lbRS_SINIESTRO: TLabel
      Left = 61
      Top = 5
      Width = 43
      Height = 13
      Caption = 'Siniestro:'
    end
    object Label1: TLabel
      Left = 61
      Top = 60
      Width = 44
      Height = 13
      Caption = 'Empresa:'
    end
    object Label2: TLabel
      Left = 61
      Top = 87
      Width = 20
      Height = 13
      Caption = 'Cuil:'
    end
    inline fraAbogados: TfraAbogadosLegales
      Left = 114
      Top = 27
      Width = 539
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        539
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 46
        Top = 1
        Width = 491
        TabStop = False
        Color = clWhite
        ReadOnly = True
        DataSource = nil
      end
      inherited edCodigo: TPatternEdit
        Top = 1
        Width = 42
        TabStop = False
        Color = clWhite
        ReadOnly = True
      end
    end
    inline fraEmpresa: TfraEmpresa
      Left = 115
      Top = 56
      Width = 537
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
      TabOrder = 1
      DesignSize = (
        537
        21)
      inherited lbContrato: TLabel
        Left = 433
        Top = 5
      end
      inherited mskCUIT: TMaskEdit
        TabStop = False
        Color = clWhite
        ReadOnly = True
      end
      inherited edContrato: TIntEdit
        Left = 478
        TabStop = False
        Color = clWhite
        ReadOnly = True
      end
      inherited cmbRSocial: TArtComboBox
        Width = 262
        TabStop = False
        Color = clWhite
        ReadOnly = True
        DataSource = nil
      end
    end
    object edRS_SINIESTRO: TSinEdit
      Left = 114
      Top = 2
      Width = 100
      Height = 21
      TabOrder = 2
      ViewStyle = [etSiniestro, etOrden]
      Enabled = False
      Color = clWhite
    end
    inline fraTrabajador: TfraTrabajador
      Left = 114
      Top = 85
      Width = 492
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      TabOrder = 3
      DesignSize = (
        492
        22)
      inherited mskCUIL: TMaskEdit
        Color = clWhite
      end
      inherited cmbNombre: TArtComboBox
        Width = 311
        Color = clWhite
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 118
    Width = 668
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 28
        Width = 664
      end>
    inherited ToolBar: TToolBar
      Width = 651
      Height = 28
      inherited tbRefrescar: TToolButton
        Visible = False
      end
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
      inherited tbLimpiar: TToolButton
        Visible = False
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        ImageIndex = 9
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 147
    Width = 668
    Height = 303
    Columns = <
      item
        Expanded = False
        FieldName = 'RE_NROEVENTO'
        Title.Caption = 'Nro. Evento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TB_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 198
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RE_FECHA'
        Title.Caption = 'Fecha'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RE_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 330
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RE_CODIGO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TIENEADJUNTO'
        Title.Caption = 'Tiene Adjunto'
        Width = 76
        Visible = True
      end>
  end
  object frmPanelABMEventos: TFormPanel [3]
    Left = 125
    Top = 165
    Width = 446
    Height = 278
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    Constraints.MinHeight = 278
    Constraints.MinWidth = 446
    DesignSize = (
      446
      278)
    object lbNroGasto: TLabel
      Left = 29
      Top = 11
      Width = 57
      Height = 13
      Caption = 'Nro.Evento:'
      Visible = False
    end
    object lbConcepto: TLabel
      Left = 47
      Top = 35
      Width = 37
      Height = 13
      Caption = 'Evento:'
    end
    object lbFecha: TLabel
      Left = 51
      Top = 61
      Width = 33
      Height = 13
      Caption = 'Fecha:'
    end
    object lbObservaciones: TLabel
      Left = 10
      Top = 83
      Width = 74
      Height = 13
      Caption = 'Observaciones:'
    end
    object lblArchivosAsociados: TLabel
      Left = 13
      Top = 223
      Width = 64
      Height = 13
      Caption = 'Asociar Doc.:'
    end
    object lblEventoJA: TLabel
      Left = 91
      Top = 35
      Width = 68
      Height = 13
      Caption = 'lblEventoJA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnAceptar: TButton
      Left = 279
      Top = 247
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 5
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 361
      Top = 247
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 6
    end
    object edRE_NROEVENTO: TIntEdit
      Left = 89
      Top = 7
      Width = 75
      Height = 21
      TabStop = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Visible = False
      Alignment = taRightJustify
    end
    object edRE_FECHA: TDateComboBox
      Left = 89
      Top = 57
      Width = 88
      Height = 21
      TabOrder = 2
    end
    object eRE_OBSERVACIONES: TMemo
      Left = 90
      Top = 84
      Width = 344
      Height = 129
      Anchors = [akLeft, akTop, akRight, akBottom]
      MaxLength = 4000
      TabOrder = 3
    end
    inline fraEvento: TfraCtbTablas
      Left = 88
      Top = 31
      Width = 350
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      DesignSize = (
        350
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 296
      end
    end
    object edtArchivosAsociados: TEdit
      Left = 90
      Top = 220
      Width = 281
      Height = 21
      Anchors = [akLeft, akRight]
      Color = 16776176
      ReadOnly = True
      TabOrder = 4
    end
    object tbrVerArchivosAsociados: TToolBar
      Left = 375
      Top = 217
      Width = 60
      Height = 27
      Align = alNone
      Anchors = [akRight, akBottom]
      BorderWidth = 1
      ButtonWidth = 25
      EdgeBorders = []
      Flat = True
      HotImages = dmLegales.ilColor
      Images = dmLegales.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      object tbSeleccionArchivosAsociar: TToolButton
        Left = 0
        Top = 0
        Hint = 'Seleccionar Archivos'
        ImageIndex = 26
        OnClick = tbSeleccionArchivosAsociarClick
      end
      object tbAsociarDoc: TToolButton
        Left = 25
        Top = 0
        Hint = 'Asociar Doc.'
        ImageIndex = 23
        OnClick = tbAsociarDocClick
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT   re_nroevento, re_codigo, tb_descripcion, re_fecha, re_o' +
        'bservaciones, re_id,'
      '         NVL((SELECT DISTINCT '#39'S'#39
      '                         FROM legales.ler_eventoarchivorecupero'
      '                        WHERE er_ideventorecupero = re_id'
      
        '                          AND er_fechabaja IS NULL), '#39'N'#39') tienea' +
        'djunto'
      '    FROM ctb_tablas, lre_recuperoeventos'
      '   WHERE tb_codigo = re_codigo'
      '     AND tb_clave = '#39'EVRES'#39
      '     AND re_siniestro = :nex_siniestro'
      '     AND re_orden = :nex_orden'
      '     AND re_nroevento > 0'
      'ORDER BY re_fecha')
    Left = 8
    Top = 321
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nEX_Siniestro'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'nEx_Orden'
        ParamType = ptInput
      end>
  end
  inherited dsConsulta: TDataSource
    Left = 37
    Top = 322
  end
  inherited SortDialog: TSortDialog
    SortFields = <
      item
        Title = 'Nro. Evento'
        DataField = 'RE_NROEVENTO'
        FieldIndex = 0
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'TB_DESCRIPCION'
        FieldIndex = 0
      end
      item
        Title = 'Fecha'
        DataField = 'RE_FECHA'
        FieldIndex = 0
      end
      item
        Title = 'Observaciones'
        DataField = 'RE_OBSERVACIONES'
        FieldIndex = 0
      end
      item
        Title = 'RE_CODIGO'
        DataField = 'RE_CODIGO'
        FieldIndex = 0
      end>
    Left = 9
    Top = 350
  end
  inherited ExportDialog: TExportDialog
    Fields = <
      item
        DataField = 'RE_NROEVENTO'
        Title = 'Nro. Evento'
      end
      item
        DataField = 'TB_DESCRIPCION'
        Title = 'Descripci'#243'n'
      end
      item
        DataField = 'RE_FECHA'
        Title = 'Fecha'
      end
      item
        DataField = 'RE_OBSERVACIONES'
        Title = 'Observaciones'
      end
      item
        DataField = 'RE_CODIGO'
        Title = 'RE_CODIGO'
      end>
    Left = 37
    Top = 350
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'Nro. Evento'
        DataField = 'RE_NROEVENTO'
        MaxLength = 0
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'TB_DESCRIPCION'
        MaxLength = 0
      end
      item
        Title = 'Fecha'
        DataField = 'RE_FECHA'
        MaxLength = 0
      end
      item
        Title = 'Observaciones'
        DataField = 'RE_OBSERVACIONES'
        MaxLength = 0
      end
      item
        Title = 'RE_CODIGO'
        DataField = 'RE_CODIGO'
        MaxLength = 0
      end>
    Title.Text = 'Eventos'
    SubTitle.Font.Height = -11
    SubTitle.Font.Style = []
    SubTitle.Alignment = taLeftJustify
    PageOrientation = pxLandscape
    Left = 34
    Top = 378
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
    Left = 8
    Top = 294
  end
  inherited FormStorage: TFormStorage
    Left = 37
    Top = 294
  end
  inherited PrintDialog: TPrintDialog
    Left = 9
    Top = 378
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end>
    Left = 65
    Top = 294
  end
  inherited FieldHider: TFieldHider
    Left = 64
    Top = 322
  end
  object sdqCarga: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'Select Ex_Siniestro, Ex_Orden, Ex_Cuil, Ex_Cuit, Rs_Abogado'
      'From Sex_Expedientes, Lrs_RecuperoSiniestros'
      'Where Rs_Siniestro = :nEx_Siniestro'
      '  and Rs_Orden'#9'   = :nEx_Orden'
      '  and Ex_Recaida   = 0'
      '  and Rs_Siniestro = Ex_Siniestro'
      '  and Rs_Orden     = Ex_Orden')
    Left = 4
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nEx_Siniestro'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'nEx_Orden'
        ParamType = ptInput
      end>
  end
  object ShortCutControl1: TShortCutControl
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
        LinkControl = tbSalir
      end>
    Left = 96
    Top = 294
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
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 285
    Top = 377
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
      'SELECT er_descripcion, er_patharchivo, er_id'
      '  FROM legales.ler_eventoarchivorecupero'
      ' WHERE er_ideventorecupero = :ideventorecupero'
      '   AND er_fechabaja IS NULL')
    Left = 256
    Top = 377
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ideventorecupero'
        ParamType = ptInput
      end>
  end
end
