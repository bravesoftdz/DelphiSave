inherited frmDiscrepanciasAuditoria: TfrmDiscrepanciasAuditoria
  Left = 366
  Width = 675
  Caption = 'Discrepancias de auditor'#237'a'
  FormStyle = fsNormal
  Position = poOwnerFormCenter
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 667
  end
  inherited CoolBar: TCoolBar
    Width = 667
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 663
      end>
    inherited ToolBar: TToolBar
      Width = 650
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbFinDiscrepancia: TToolButton
        Left = 370
        Top = 0
        Hint = 'Finalizar discrepancia (Ctrl+F)'
        Caption = 'tbFinDiscrepancia'
        ImageIndex = 18
        OnClick = tbFinDiscrepanciaClick
      end
      object ToolButton2: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object tbAvalarDiscrepancia: TToolButton
        Left = 401
        Top = 0
        Hint = 'Avalar discrepancia (Ctrl+A)'
        Caption = 'tbAvalarDiscrepancia'
        ImageIndex = 23
        OnClick = tbAvalarDiscrepanciaClick
      end
      object tbRechazarDiscrepancia: TToolButton
        Left = 424
        Top = 0
        Hint = 'Rechazar discrepancia (Ctrl+R)'
        Caption = 'tbRechazarDiscrepancia'
        ImageIndex = 24
        OnClick = tbRechazarDiscrepanciaClick
      end
      object ToolButton10: TToolButton
        Left = 447
        Top = 0
        Width = 8
        Caption = 'ToolButton10'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 455
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        Caption = 'tbSalir2'
        ImageIndex = 5
        OnClick = tbSalir2Click
      end
      object pnlVolante: TPanel
        Left = 478
        Top = 0
        Width = 161
        Height = 22
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 667
    Height = 344
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Alignment = taCenter
        Title.Caption = 'Siniestro'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_NOMBRE'
        Title.Caption = 'Trabajador'
        Width = 154
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DD_FECHACIRUGIA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Cirug'#237'a'
        Width = 68
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DD_NUMAUTO'
        Title.Alignment = taCenter
        Title.Caption = 'Autorizaci'#243'n'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DD_OBSERVACION'
        Title.Caption = 'Discrepancia observada'
        Width = 259
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DD_FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DD_USUALTA'
        Title.Caption = 'Usuario alta'
        Width = 90
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DD_FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha alta'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Width = 433
    Height = 195
    BorderStyle = bsSingle
    inherited BevelAbm: TBevel
      Top = 159
      Width = 425
    end
    object Label3: TLabel [1]
      Left = 8
      Top = 87
      Width = 62
      Height = 26
      Caption = 'Discrepancia'#13#10'observada'
    end
    object Label1: TLabel [2]
      Left = 30
      Top = 11
      Width = 40
      Height = 13
      Caption = 'Siniestro'
    end
    object Label2: TLabel [3]
      Left = 4
      Top = 37
      Width = 66
      Height = 13
      Caption = 'Fecha cirug'#237'a'
    end
    object btnAutorizacion: TSpeedButton [4]
      Left = 113
      Top = 58
      Width = 21
      Height = 22
      Enabled = False
      Flat = True
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C40E0000C40E00000000000000000000848404848404
        8484048484048484048484048484048484048484048484048484048484048484
        0404040404040404040484840484840484840484840484840484840484840484
        8404848404848404848404848404848404FFFFFFFFFFFF808080848404848404
        8484048484048484048484048484048484048484048484048484048484040404
        043366666699CC04040484840484840484840484840484840484840484840484
        8404848404848404848404848404FFFFFFC0C0C0C0C0C0808080848404848404
        8484048484048484048484048484048484048484048484048484040404043366
        6699CCCCC6D6EF04040484840484840484840484840484840484840484840484
        8404848404848404848404FFFFFFC0C0C0C0C0C0C0C0C0808080848404848404
        8484048484048484048484048484048484048484048484040404043366666699
        CCC6D6EF04040484840484840484840484840484840484840484840484840484
        8404848404848404FFFFFFC0C0C0C0C0C0C0C0C0808080848404848404848404
        8484048484048484048484048484048484048484040404043366666699CCC6D6
        EF04040484840484840484840484840484840484840484840484840484840484
        8404848404FFFFFFC0C0C0C0C0C0C0C0C0808080848404848404848404848404
        8484048484048484048484048484048484040404043366666699CC99CCCC0404
        0484840484840484840484840484840484840484840484840484840484840484
        8404FFFFFFC0C0C0C0C0C0C0C0C0808080848404848404848404848404848404
        8484040404040404040404040404040404046699CC3399CCC6D6EF0404048484
        04848404848404848404848404848404848404FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFC0C0C0C0C0C0C0C0C0808080848404848404848404848404848404848404
        040404CCCC33FFFF99CCCC33CCCC330404040404043399CC0404048484048484
        04848404848404848404848404848404FFFFFFC0C0C0C0C0C0C0C0C0C0C0C080
        8080808080C0C0C0808080848404848404848404848404848404848404040404
        CCCC33FFFF99FFFF99CCCC33CCCC33CCCC330404040404048484048484048484
        04848404848404848404848404FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0808080808080848404848404848404848404848404848404040404FFFFCC
        FFFFFFFFECCCFFFF99CCCC66CCCC33CCCC33CCCC330404048484048484048484
        04848404848404848404FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0808080848404848404848404848404848404848404040404FFFF99
        FFECCCFFECCCFFFF99CCCC66CCCC33CCCC33CCCC330404048484048484048484
        04848404848404848404FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0808080848404848404848404848404848404848404040404FFFF99
        FFFF99FFFF99FFCC66CCCC33CCCC33CC9933CC99330404048484048484048484
        04848404848404848404FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0808080848404848404848404848404848404848404040404FFFF33
        FFCC99FFCC99FFCC66CCCC33CCCC33999933CC99330404048484048484048484
        04848404848404848404FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0808080848404848404848404848404848404848404848404040404
        CCCC66CCCC66CCCC33CCCC33CCCC339999330404048484048484048484048484
        04848404848404848404848404808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0808080848404848404848404848404848404848404848404848404848404
        040404CCCC33CCCC33CC9933CC99330404048484048484048484048484048484
        04848404848404848404848404848404808080C0C0C0C0C0C0C0C0C0C0C0C080
        8080848404848404848404848404848404848404848404848404848404848404
        8484040404040404040404040404048484048484048484048484048484048484
        0484840484840484840484840484840484840480808080808080808080808084
        8404848404848404848404848404848404848404848404848404}
      NumGlyphs = 2
      OnClick = btnAutorizacionClick
    end
    object Label4: TLabel [5]
      Left = 12
      Top = 62
      Width = 58
      Height = 13
      Caption = 'Autorizaci'#243'n'
    end
    object lblDatSin: TLabel [6]
      Left = 182
      Top = 11
      Width = 247
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    inherited btnAceptar: TButton
      Left = 275
      Top = 165
      TabOrder = 4
    end
    inherited btnCancelar: TButton
      Left = 353
      Top = 165
      TabOrder = 5
    end
    object edDiscrepanciaABM: TMemo
      Left = 76
      Top = 85
      Width = 350
      Height = 68
      Anchors = [akLeft, akTop, akRight, akBottom]
      MaxLength = 600
      TabOrder = 3
    end
    object edSiniestroABM: TSinEdit
      Left = 76
      Top = 8
      Width = 100
      Height = 21
      OnExit = edSiniestroABMExit
      TabOrder = 0
      OnSelect = edSiniestroABMExit
    end
    object dcFechaCirugiaABM: TDateComboBox
      Left = 76
      Top = 34
      Width = 88
      Height = 21
      TabOrder = 1
    end
    object edAutorizacionABM: TIntEdit
      Left = 76
      Top = 59
      Width = 37
      Height = 21
      Enabled = False
      TabOrder = 2
      MaxLength = 4
    end
  end
  object sbDatosDiscre: TStatusBar [4]
    Left = 0
    Top = 418
    Width = 667
    Height = 21
    Hint = 'Estado de la discrepancia'
    Panels = <
      item
        Text = 'Estado'
        Width = 170
      end>
    ParentShowHint = False
    ShowHint = True
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
        LinkControl = tbSalir2
      end
      item
        Key = 16454
        LinkControl = tbFinDiscrepancia
      end
      item
        Key = 16449
        LinkControl = tbAvalarDiscrepancia
      end
      item
        Key = 16466
        LinkControl = tbRechazarDiscrepancia
      end>
    Left = 24
    Top = 172
  end
  object ldgAutorizaciones: TLookupDialog
    Caption = 'Autorizaciones de ortopedia'
    CharCase = ecNormal
    DataSource = dsAutorizaciones
    DataField = 'AU_NUMAUTO'
    Columns = <
      item
        Expanded = False
        FieldName = 'AU_NUMAUTO'
        Title.Caption = 'Num.'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AU_FECHASOLI'
        Title.Caption = 'F.Solicitud'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRESTADOR'
        Title.Caption = 'Prestador'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRESTACION'
        Title.Caption = 'Prestaci'#243'n'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRUPO_T'
        Title.Caption = 'Grupo de Trabajo'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUGESTOR'
        Title.Caption = 'Usuario gestor'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AU_USUAPRO'
        Title.Caption = 'Usuario Apro.'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AU_FECHAPRO'
        Title.Caption = 'Fecha de Apobaci'#243'n'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 200
        Visible = True
      end>
    AutoFill = False
    ShowButtons = False
    ShowEditor = False
    ShowHeaders = True
    AllowCancel = True
    MaxRows = 0
    MinRows = 8
    ShowExportar = True
    Left = 24
    Top = 312
  end
  object sdqAutorizaciones: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT   au_numauto, tb_descripcion estado, au_fechasoli,'
      
        '         ca_descripcion prestador,  pr_descripcion prestacion, g' +
        'p_nombre grupo_t, '
      
        '         art.iif_char(au_estado, '#39'P'#39', au_observaciones, au_detal' +
        'le) observaciones, '
      '         au_usuapro, au_fechapro'
      
        '    FROM art.sau_autorizaciones, art.cpr_prestador, art.ctb_tabl' +
        'as, '
      '         art.mpr_prestaciones, art.mgp_gtrabajo'
      
        '   WHERE art.iif_char(au_estado, '#39'P'#39', au_identifprestador, au_id' +
        'entifapro) = ca_identificador(+)'
      
        '     AND art.iif_char(au_estado, '#39'P'#39', au_pressol, au_presapro) =' +
        ' pr_codigo(+)'
      '     AND au_trabajo = gp_codigo(+)'
      '     AND pr_formulario = '#39'P'#39
      '     AND tb_clave = '#39'MUAUT'#39
      '     AND tb_codigo = au_estado'
      '     AND au_estado NOT IN('#39'R'#39', '#39'U'#39', '#39'V'#39', '#39'X'#39', '#39'N'#39')'
      '     AND au_siniestro = :psiniestro'
      '     AND au_orden = :porden'
      '     AND au_recaida = :precaida'
      '     AND NOT EXISTS (SELECT 1 '
      '                       FROM sin.sdd_detallediscrepancias'
      '                      WHERE dd_siniestro = au_siniestro'
      '                        AND dd_orden = au_orden'
      '                        AND dd_recaida = au_recaida'
      '                        AND dd_numauto = au_numauto'
      '                        AND dd_fechabaja IS NULL)'
      'ORDER BY au_numauto')
    Left = 52
    Top = 312
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pSiniestro'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pOrden'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pRecaida'
        ParamType = ptInput
      end>
    object sdqAutorizacionesAU_NUMAUTO: TFloatField
      FieldName = 'AU_NUMAUTO'
      Required = True
    end
    object sdqAutorizacionesAU_FECHASOLI: TDateTimeField
      FieldName = 'AU_FECHASOLI'
      Required = True
    end
    object sdqAutorizacionesESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 150
    end
    object sdqAutorizacionesPRESTADOR: TStringField
      FieldName = 'PRESTADOR'
      Size = 150
    end
    object sdqAutorizacionesPRESTACION: TStringField
      FieldName = 'PRESTACION'
      Size = 50
    end
    object sdqAutorizacionesGRUPO_T: TStringField
      FieldName = 'GRUPO_T'
      Size = 30
    end
    object sdqAutorizacionesOBSERVACIONES: TStringField
      FieldName = 'OBSERVACIONES'
      Size = 4000
    end
    object sdqAutorizacionesAU_USUAPRO: TStringField
      FieldName = 'AU_USUAPRO'
    end
    object sdqAutorizacionesAU_FECHAPRO: TDateTimeField
      FieldName = 'AU_FECHAPRO'
    end
  end
  object dsAutorizaciones: TDataSource
    DataSet = sdqAutorizaciones
    Left = 80
    Top = 312
  end
end
