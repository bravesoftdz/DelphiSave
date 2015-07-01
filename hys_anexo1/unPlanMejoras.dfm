object frmPlanMejoras: TfrmPlanMejoras
  Left = 214
  Top = 139
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 397
  ClientWidth = 643
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlVisitas: TPanel
    Left = 417
    Top = 0
    Width = 226
    Height = 397
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    object CoolBar3: TCoolBar
      Left = 0
      Top = 0
      Width = 226
      Height = 30
      Bands = <
        item
          Control = ToolBar1
          ImageIndex = -1
          MinHeight = 26
          Width = 222
        end>
      object ToolBar1: TToolBar
        Left = 9
        Top = 0
        Width = 209
        Height = 26
        BorderWidth = 1
        EdgeBorders = []
        Flat = True
        HotImages = frmPrincipal.ilColor
        Images = frmPrincipal.ilByN
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object tbVisAgregar: TToolButton
          Left = 0
          Top = 0
          Hint = 'Nuevo (Ctrl+V)'
          ImageIndex = 6
          OnClick = tbVisAgregarClick
        end
        object tbVisQuitar: TToolButton
          Left = 23
          Top = 0
          Hint = 'Eliminar (Ctrl+E)'
          ImageIndex = 8
          OnClick = tbVisQuitarClick
        end
        object ToolButton5: TToolButton
          Left = 46
          Top = 0
          Width = 8
          Caption = 'ToolButton5'
          ImageIndex = 5
          Style = tbsSeparator
        end
        object tbVisOrdenar: TToolButton
          Left = 54
          Top = 0
          Caption = 'tbVisOrdenar'
          ImageIndex = 2
          OnClick = tbVisOrdenarClick
        end
      end
    end
    object dbgVisitas: TArtDBGrid
      Left = 0
      Top = 30
      Width = 226
      Height = 367
      Align = alClient
      DataSource = dsVisitas
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      IniStorage = FormPlacement
      OnGetCellParams = dbgVisitasGetCellParams
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'TIPO'
          Title.Caption = 'Tipo'
          Width = 119
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pV_FECHA'
          Title.Caption = 'Fecha'
          Width = 72
          Visible = True
        end>
    end
    object fpVisita: TFormPanel
      Left = 12
      Top = 114
      Width = 270
      Height = 97
      Caption = 'Visitas de Seguimiento de Recomend.'
      FormWidth = 0
      FormHeigth = 0
      Position = poScreenCenter
      Constraints.MaxHeight = 97
      Constraints.MinHeight = 97
      Constraints.MinWidth = 200
      DesignSize = (
        270
        97)
      object Label5: TLabel
        Left = 8
        Top = 40
        Width = 87
        Height = 13
        Caption = 'Fecha de la Visita:'
      end
      object Bevel7: TBevel
        Left = 4
        Top = 60
        Width = 262
        Height = 5
        Anchors = [akLeft, akTop, akRight]
        Shape = bsTopLine
      end
      object Label3: TLabel
        Left = 8
        Top = 12
        Width = 24
        Height = 13
        Caption = 'Tipo:'
      end
      object btnVisAceptar: TButton
        Left = 111
        Top = 67
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        TabOrder = 2
        OnClick = btnVisAceptarClick
      end
      object btnVisCancelar: TButton
        Left = 191
        Top = 67
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Cancel = True
        Caption = '&Cancelar'
        ModalResult = 2
        TabOrder = 3
      end
      object edVisFecha: TDateComboBox
        Left = 126
        Top = 36
        Width = 98
        Height = 21
        MinDate = 36526.000000000000000000
        AutoExit = True
        TabOrder = 1
      end
      object cmbVisTipo: TExComboBox
        Left = 126
        Top = 8
        Width = 139
        Height = 22
        Style = csOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 0
        Text = 'C=Cumplimiento'
        Items.Strings = (
          'C=Cumplimiento'
          'I=Incumplimiento')
        ItemIndex = 0
        Options = []
        ValueWidth = 64
      end
    end
  end
  object pnlRecomendaciones: TPanel
    Left = 0
    Top = 0
    Width = 417
    Height = 397
    Align = alClient
    TabOrder = 1
    object CoolBar1: TCoolBar
      Left = 1
      Top = 25
      Width = 415
      Height = 30
      Bands = <
        item
          Control = tBarPlanMejoras
          ImageIndex = -1
          MinHeight = 26
          Width = 411
        end
        item
          Control = DBMemo1
          ImageIndex = -1
          Width = 411
        end>
      object tBarPlanMejoras: TToolBar
        Left = 9
        Top = 0
        Width = 398
        Height = 26
        BorderWidth = 1
        EdgeBorders = []
        Flat = True
        HotImages = frmPrincipal.ilColor
        Images = frmPrincipal.ilByN
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Wrapable = False
        object tbPMRefrescar: TToolButton
          Left = 0
          Top = 0
          Hint = 'Refrescar (F5)'
          Caption = 'tbPMRefrescar'
          ImageIndex = 0
          OnClick = tbPMRefrescarClick
        end
        object ToolButton3: TToolButton
          Left = 23
          Top = 0
          Width = 8
          Caption = 'ToolButton2'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object tbPMNuevo: TToolButton
          Left = 31
          Top = 0
          Hint = 'Nuevo (Ctrl+N)'
          ImageIndex = 6
          OnClick = tbPMNuevoClick
        end
        object tbPMModificar: TToolButton
          Left = 54
          Top = 0
          Hint = 'Modificar (Ctrl+M)'
          ImageIndex = 7
          OnClick = tbPMModificarClick
        end
        object tbPMEliminar: TToolButton
          Left = 77
          Top = 0
          Hint = 'Eliminar (Del)'
          ImageIndex = 8
          OnClick = tbPMEliminarClick
        end
        object ToolButton9: TToolButton
          Left = 100
          Top = 0
          Width = 8
          Caption = 'ToolButton4'
          ImageIndex = 4
          Style = tbsSeparator
        end
        object tbPMOrdenar: TToolButton
          Left = 108
          Top = 0
          Hint = 'Ordenar (Ctrl+O)'
          ImageIndex = 2
          OnClick = tbPMOrdenarClick
        end
        object ToolButton11: TToolButton
          Left = 131
          Top = 0
          Width = 8
          Caption = 'ToolButton6'
          ImageIndex = 5
          Style = tbsSeparator
        end
        object tbPMExportar: TToolButton
          Left = 139
          Top = 0
          Hint = 'Exportar (Ctrl+E)'
          ImageIndex = 3
          OnClick = tbPMExportarClick
        end
      end
      object DBMemo1: TDBMemo
        Left = 9
        Top = 28
        Width = 398
        Height = 25
        TabOrder = 1
      end
    end
    object dbgDenuncias: TArtDBGrid
      Left = 1
      Top = 55
      Width = 415
      Height = 341
      Align = alClient
      DataSource = dsDenuncias
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = tbPMModificarClick
      IniStorage = FormPlacement
      MultiSelect = True
      OnGetCellParams = dbgDenunciasGetCellParams
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'dd_nrorecomendacion'
          Title.Caption = 'Nro. Recomendaci'#243'n'
          Width = 111
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'rv_fecha'
          Title.Alignment = taCenter
          Title.Caption = 'Fecha Visita'
          Width = 71
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'GRUPO'
          Title.Alignment = taCenter
          Title.Caption = 'Grupo'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'rd_codigorubro'
          Title.Caption = 'Nro. Item'
          Width = 54
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dd_observaciones'
          Title.Caption = 'Recomendaci'#243'n'
          Width = 435
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'segperiodo'
          Title.Caption = 'Seguimiento'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dd_operativo'
          Title.Caption = 'Operativo'
          Visible = True
        end>
    end
    object fpDenuncias: TFormPanel
      Left = 16
      Top = 94
      Width = 547
      Height = 299
      FormWidth = 0
      FormHeigth = 0
      BorderIcons = [biSystemMenu]
      BorderStyle = bsSingle
      Position = poScreenCenter
      DesignSize = (
        547
        299)
      object lbItem: TLabel
        Left = 8
        Top = 66
        Width = 23
        Height = 13
        Caption = #205'tem:'
      end
      object Bevel2: TBevel
        Left = 4
        Top = 260
        Width = 539
        Height = 5
        Anchors = [akLeft, akRight, akBottom]
        Shape = bsTopLine
      end
      object Label1: TLabel
        Left = 8
        Top = 38
        Width = 32
        Height = 13
        Caption = 'Grupo:'
      end
      object Label2: TLabel
        Left = 8
        Top = 87
        Width = 92
        Height = 13
        Caption = 'Recomendaciones:'
      end
      object lblVisita: TLabel
        Left = 9
        Top = 213
        Width = 28
        Height = 13
        Caption = 'Visita:'
      end
      object btnBuscarVisitas: TSpeedButton
        Left = 513
        Top = 210
        Width = 23
        Height = 22
        Hint = 'Buscar Visita'
        Anchors = [akRight, akBottom]
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000003131
          310031313100FF00FF00FF00FF00000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF000000000031313100C6C6C600FFFF
          FF00C6C6C600000000000000000031636300639CCE0000000000FF00FF00FF00
          FF00FF00FF00FF00FF000000000031313100C6C6C600FFFFFF00FFFFFF00FFFF
          FF00FFFFFF0000000000316363009CCECE00C6D6EF0000000000FF00FF00FF00
          FF000000000031313100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFCECE00FF63
          63000000000031636300639CCE00C6D6EF0000000000FF00FF00FF00FF00FF00
          FF0084848400FFFFFF00FFFFFF00FFFFFF00FFCECE00FF636300FFCECE000000
          000031636300639CCE00C6D6EF0000000000FF00FF00FF00FF00FF00FF00FF00
          FF0000000000FFFFFF00FFCECE00FF636300FFCECE00FF636300000000003163
          6300639CCE009CCECE000000000000000000FF00FF00FF00FF00FF00FF003131
          3100DEDEDE000000000000000000000000000000000000000000639CCE00319C
          CE00C6D6EF0000000000FFFFFF0031313100FF00FF00FF00FF0000000000FFFF
          FF0000000000CECE3100FFFF9C00CECE3100CECE31000000000000000000319C
          CE0000000000FF636300FFCECE00C6C6C60000000000FF00FF00FF00FF000000
          0000CECE3100FFFF9C00FFFF9C00CECE3100CECE3100CECE3100000000000000
          0000FFCECE00FF636300FF636300FFFFFF0031313100FF00FF0000000000FFFF
          CE00FFFFFF00FFEFCE00FFFF9C00CECE6300CECE3100CECE3100CECE31000000
          0000FF636300FFCECE00FF636300FFCECE00C6C6C6000000000000000000FFFF
          9C00FFEFCE00FFEFCE00FFFF9C00CECE6300CECE3100CECE3100CECE31000000
          0000FFCECE00FFCECE00FFFFFF00FFFFFF00FFFFFF003131310000000000FFFF
          9C00FFFF9C00FFFF9C00FFCE6300CECE3100CECE3100CE9C3100CE9C31000000
          0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6003131310000000000FFFF
          3100FFCE9C00FFCE9C00FFCE6300CECE3100CECE31009C9C3100CE9C31000000
          000094949400DEDEDE00C6C6C6003131310000000000FF00FF00FF00FF000000
          0000CECE6300CECE6300CECE3100CECE3100CECE31009C9C310000000000DEDE
          DE00B5B5B500181818006363630000000000FF00FF00FF00FF00FF00FF00FF00
          FF0000000000CECE3100CECE3100CE9C3100CE9C310000000000848484008484
          8400848484003131310000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000000000000000000000000000000000000000000000000000000
          00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00}
        ParentShowHint = False
        ShowHint = True
        OnClick = btnBuscarVisitasClick
      end
      object lbCodigo: TLabel
        Left = 8
        Top = 11
        Width = 104
        Height = 13
        Caption = 'Nro. Recomendaci'#243'n:'
      end
      object lblSeguimiento: TLabel
        Left = 9
        Top = 240
        Width = 61
        Height = 13
        Caption = 'Seguimiento:'
      end
      object btnPMAceptar: TButton
        Left = 386
        Top = 266
        Width = 75
        Height = 27
        Anchors = [akRight, akBottom]
        Caption = '&Aceptar'
        TabOrder = 6
        OnClick = btnPMAceptarClick
      end
      object btnPMCancelar: TButton
        Left = 466
        Top = 266
        Width = 75
        Height = 27
        Anchors = [akRight, akBottom]
        Cancel = True
        Caption = '&Cancelar'
        ModalResult = 2
        TabOrder = 7
      end
      object edObservacion: TMemo
        Left = 9
        Top = 104
        Width = 531
        Height = 102
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 7900
        ScrollBars = ssBoth
        TabOrder = 3
      end
      object edVisita: TEdit
        Left = 45
        Top = 211
        Width = 463
        Height = 21
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        Color = clSilver
        ReadOnly = True
        TabOrder = 4
      end
      object edNroRecomendacion: TEdit
        Left = 116
        Top = 8
        Width = 69
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
      end
      inline fraGrupoDenuncia: TfraCodigoDescripcion
        Left = 50
        Top = 34
        Width = 490
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        DesignSize = (
          490
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 425
          CharCase = ecUpperCase
        end
        inherited edCodigo: TPatternEdit
          Width = 59
          CharCase = ecNormal
        end
      end
      inline fraRubroDenuncia: TfraCodigoDescripcion
        Left = 50
        Top = 62
        Width = 490
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        DesignSize = (
          490
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 425
          CharCase = ecUpperCase
        end
        inherited edCodigo: TPatternEdit
          Width = 59
          CharCase = ecNormal
        end
      end
      object edMesSeguimiento: TPeriodoPicker
        Left = 74
        Top = 236
        Width = 49
        Height = 21
        TabOrder = 5
        Color = clWindow
        Periodo.AllowNull = True
        Periodo.Orden = poAnoMes
        Periodo.Separador = #0
        Periodo.Mes = 0
        Periodo.Ano = 0
        Periodo.MaxPeriodo = '206010'
        Periodo.MinPeriodo = '196011'
        WidthMes = 19
        Separation = 0
        ShowButton = False
        ShowOrder = poAnoMes
        ReadOnly = False
        Enabled = True
        Fuente.Charset = DEFAULT_CHARSET
        Fuente.Color = clWindowText
        Fuente.Height = -11
        Fuente.Name = 'MS Sans Serif'
        Fuente.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        NullDropDown = SetMax
      end
    end
    object pnlHeaderVisitas: TPanel
      Left = 1
      Top = 1
      Width = 415
      Height = 24
      Align = alTop
      TabOrder = 3
      DesignSize = (
        415
        24)
      object Label9: TLabel
        Left = 245
        Top = 4
        Width = 40
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Fondo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 299
        Top = 9
        Width = 64
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Autom'#225'tico'
        FocusControl = pnlColor4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 299
        Top = -1
        Width = 42
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Manual'
        FocusControl = pnlColor5
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object chkSoloIncumplidos: TCheckBox
        Left = 8
        Top = 3
        Width = 108
        Height = 17
        Caption = 'S'#243'lo Incumplidos'
        TabOrder = 0
      end
      object chkTodosOps: TCheckBox
        Left = 120
        Top = 3
        Width = 125
        Height = 17
        Caption = 'Todos los Operativos'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object pnlColor4: TPanel
        Left = 286
        Top = 1
        Width = 10
        Height = 10
        Hint = 'No Investigar'
        Alignment = taLeftJustify
        Anchors = [akRight, akBottom]
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object pnlColor5: TPanel
        Left = 286
        Top = 11
        Width = 10
        Height = 10
        Hint = 'Asignado al Preventor'
        Alignment = taLeftJustify
        Anchors = [akTop, akRight]
        Color = 16616778
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object chkAnt463: TCheckBox
        Left = 248
        Top = 3
        Width = 135
        Height = 17
        Caption = 'Anteriores a la Res.463'
        TabOrder = 4
      end
    end
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'Diagn'#243'stico'
        TitleAlignment = taCenter
        DataField = 'DE_DIAGNOSTICO'
        Alignment = taCenter
        MaxLength = 12
      end
      item
        Title = 'Tipo'
        TitleAlignment = taCenter
        DataField = 'TIPO'
        MaxLength = 17
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'DE_DESCRIPCION1'
        MaxLength = 60
      end>
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Diagn'#243'stico por Establecimiento'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -11
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = 14737632
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLinesWidth = 0
    Detail.MultiLine = mlAuto
    Detail.MaxLines = 7
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
    Left = 102
    Top = 288
  end
  object FormPlacement: TFormPlacement
    Options = []
    UseRegistry = True
    Left = 132
    Top = 288
  end
  object sdqDenuncias: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqDenunciasAfterScroll
    SQL.Strings = (
      'SELECT  d.*,'
      '        G.gd_descripcion grupo,'
      '        r.rd_descripcionrubro rubro,'
      '        r.rd_codigorubro,'
      '        od_fecha,'
      '        rv_fecha,'
      '        rv_descripcion,'
      '        dd_observaciones,'
      '        dd_operativo,'
      '        dd_tipodenuncia,'
      '        gd_usumodif'
      '  FROM  art.pdd_detalledenuncia d,'
      '        hys.hgd_grupodenuncia G,'
      '        hys.hrd_rubrodenuncia r,'
      '        pod_obradenuncia,'
      '        art.prv_resvisitas'
      ' WHERE  od_id = dd_idpodobradenuncia'
      '    AND od_cuit = :cuit'
      '    AND od_estableci = :estableci'
      '    AND dd_tipo = :tipo'
      '    AND dd_operativo >= r.rd_vigenciadesde'
      '    AND dd_operativo <= NVL (r.rd_vigenciahasta, '#39'210001'#39')'
      '    AND dd_grupo NOT IN ('#39'TE'#39', '#39'PE'#39')'
      '    AND r.rd_idgrupo = G.gd_id'
      '    AND G.gd_codigo = dd_grupo'
      '    AND r.rd_codigorubro = dd_rubro'
      '    AND rv_id(+) = dd_idvisita'
      '    AND dd_observaciones IS NOT NULL')
    Left = 12
    Top = 258
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cuit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'estableci'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptInput
      end>
  end
  object dsDenuncias: TDataSource
    DataSet = sdqDenuncias
    Left = 42
    Top = 258
  end
  object sdPlanMejora: TSortDialog
    Caption = 'Orden'
    DataSet = sdqDenuncias
    SortFields = <
      item
        Title = 'Nro. Recomendaci'#243'n'
        DataField = 'DD_NRORECOMENDACION'
        FieldIndex = 0
      end
      item
        Title = 'Fecha Visita'
        DataField = 'RV_FECHA'
        FieldIndex = 0
      end
      item
        Title = 'Grupo'
        DataField = 'GRUPO'
        FieldIndex = 0
      end
      item
        Title = 'Nro. Item'
        DataField = 'TB_CODIGO'
        FieldIndex = 0
      end
      item
        Title = 'Recomendaci'#243'n'
        DataField = 'DD_OBSERVACIONES'
        FieldIndex = 0
      end
      item
        Title = 'Operativo'
        DataField = 'DD_OPERATIVO'
        FieldIndex = 0
      end>
    IniStorage = FormPlacement
    FixedRows = 0
    Left = 72
    Top = 258
  end
  object edPlanMejora: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqDenuncias
    Fields = <
      item
        DataField = 'rv_fecha'
        Title = 'Fecha Visita'
      end
      item
        DataField = 'Grupo'
        Title = 'Grupo'
      end
      item
        DataField = 'tb_codigo'
        Title = 'Nro. Item'
      end
      item
        DataField = 'dd_observaciones'
        Title = 'Recomendaci'#243'n'
      end
      item
        DataField = 'dd_operativo'
        Title = 'Operativo'
      end>
    IniStorage = FormPlacement
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
    Left = 132
    Top = 258
  end
  object sdqVisitas: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT pv.*,'
      '       iif_char (pv.pv_tipovisita, '#39'C'#39', '#39'Cumplimiento'#39','
      '                 '#39'Incumplimiento'#39') tipo'
      '  FROM ppv_planmvisitas pv'
      ' WHERE pv_iddenuncia = :dd_id'
      'ORDER BY PV_FECHA DESC'
      ''
      ' ')
    Left = 12
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dd_id'
        ParamType = ptInput
      end>
  end
  object dsVisitas: TDataSource
    DataSet = sdqVisitas
    Left = 42
    Top = 288
  end
  object sdVisitas: TSortDialog
    Caption = 'Orden'
    DataSet = sdqVisitas
    SortFields = <
      item
        Title = 'Tipo'
        DataField = 'TIPO'
        FieldIndex = 0
      end
      item
        Title = 'Fecha'
        DataField = 'RV_FECHA'
        FieldIndex = 1
      end>
    IniStorage = FormPlacement
    FixedRows = 0
    Left = 72
    Top = 288
  end
  object qpPlanMejora: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'Recomendaci'#243'n'
        TitleAlignment = taCenter
        DataField = 'RE_RECOMENDACION'
        Alignment = taCenter
        MaxLength = 12
      end
      item
        Title = 'Cumplimiento'
        TitleAlignment = taCenter
        DataField = 'RE_CUMPLIMIENTO'
        Alignment = taCenter
        MaxLength = 15
      end
      item
        Title = 'Seguimiento'
        TitleAlignment = taCenter
        DataField = 'RE_SEGUIMIENTO'
        Alignment = taCenter
        MaxLength = 15
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'RE_DESCRIPCION1'
        MaxLength = 60
      end>
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Recomendaciones por Establecimiento'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -11
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = []
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -11
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = 14737632
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLinesWidth = 0
    Detail.MultiLine = mlAuto
    Detail.MaxLines = 7
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
    Left = 102
    Top = 258
  end
  object sdqListaObservaciones: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT 1, TRIM(rv_descripcion) obs'
      '    FROM art.pdd_detalledenuncia, art.prv_resvisitas'
      
        '   WHERE dd_idpodobradenuncia = :pidobradenuncia AND rv_id = dd_' +
        'idvisita'
      '    AND RV_IDVISITAASOCIADA IS NULL'
      'union'
      'SELECT 2, TRIM(dd_observaciones) obs'
      '    FROM art.pdd_detalledenuncia, art.prv_resvisitas'
      
        '   WHERE dd_idpodobradenuncia = :pidobradenuncia AND rv_id(+) = ' +
        'dd_idvisita'
      'order by 1'
      '')
    Left = 162
    Top = 259
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pidobradenuncia'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pidobradenuncia'
        ParamType = ptInput
      end>
  end
  object sccPlanMejoras: TShortCutControl
    ShortCuts = <
      item
        Key = 16462
        LinkControl = tbPMNuevo
      end
      item
        Key = 16461
        LinkControl = tbPMModificar
      end
      item
        Key = 46
        LinkControl = tbPMEliminar
      end
      item
        Key = 16463
      end
      item
        Key = 16453
        LinkControl = tbVisQuitar
      end
      item
        Key = 16457
      end
      item
        Key = 16449
        OnShortCutPress = btnBuscarVisitasClick
      end
      item
        Key = 16470
        LinkControl = tbVisAgregar
      end
      item
        Key = 116
        LinkControl = tbPMRefrescar
      end>
    Enabled = False
    Left = 163
    Top = 288
  end
  object sdqListaObservacionesVisitas: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT 2, TRIM(dd_observaciones) obs'
      
        '  FROM ppv_planmvisitas, art.pdd_detalledenuncia, pod_obradenunc' +
        'ia'
      ' WHERE pv_iddenuncia = dd_id'
      '   AND pv_fecha = :fecha'
      '   AND pv_tipovisita = '#39'I'#39
      '   AND pv_fechabaja IS NULL'
      '   AND dd_fechabaja IS NULL'
      '   AND od_id = dd_idpodobradenuncia'
      '   AND od_cuit = :cuit'
      '   AND od_estableci = :estableci'
      'UNION'
      'SELECT 1, TRIM(rv_descripcion) obs'
      '  FROM art.prv_resvisitas'
      ' WHERE rv_cuit = :cuit'
      '   AND rv_estableci = :estableci'
      '   AND rv_tipo = :tipo'
      '   AND rv_operativo = :operativo'
      '   AND rv_fecha = :fecha'
      '   AND rv_fechabaja IS NULL'
      '   AND RV_IDVISITAASOCIADA IS NULL'
      'order by 1'
      '')
    Left = 192
    Top = 259
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'cuit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'estableci'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'cuit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'estableci'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'operativo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptInput
      end>
  end
  object qryDenuncias: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT od_id'
      '  FROM pod_obradenuncia'
      ' WHERE od_fechabaja IS NULL'
      '   AND od_cuit = :pcuit'
      '   AND od_estableci = :pestableci'
      ''
      ' ')
    Left = 15
    Top = 228
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pcuit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pestableci'
        ParamType = ptInput
      end>
  end
  object qryObsDenuncias: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT rv_descripcion obs'
      '  FROM art.pdd_detalledenuncia, art.prv_resvisitas'
      ' WHERE rv_fechabaja IS NULL'
      '   AND rv_id = dd_idvisita'
      '   AND dd_idpodobradenuncia = :od_id'
      'UNION'
      'SELECT dd_observaciones obs'
      '  FROM art.pdd_detalledenuncia, ctb_tablas'
      ' WHERE dd_fechabaja IS NULL'
      '   AND tb_clave = '#39'ID_'#39' || dd_grupo'
      '   AND tb_codigo = dd_rubro'
      '   AND dd_idpodobradenuncia = :od_id'
      ''
      ' '
      ' ')
    Left = 45
    Top = 228
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'od_id'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'od_id'
        ParamType = ptInput
      end>
  end
end
