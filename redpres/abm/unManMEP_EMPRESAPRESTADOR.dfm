inherited frmManMEP_EMPRESAPRESTADOR: TfrmManMEP_EMPRESAPRESTADOR
  Left = 240
  Top = 203
  Width = 780
  Height = 580
  Caption = 'Prestadores preferenciales por empresa'
  Constraints.MinHeight = 580
  Constraints.MinWidth = 780
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 772
    Height = 134
    Visible = True
    object pnlFechas: TPanel
      Left = 576
      Top = 0
      Width = 196
      Height = 134
      Align = alRight
      BevelInner = bvLowered
      TabOrder = 1
      DesignSize = (
        196
        134)
      object lblDesde: TLabel
        Left = 12
        Top = 12
        Width = 30
        Height = 13
        Caption = 'Desde'
      end
      object lblHasta: TLabel
        Left = 104
        Top = 12
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object edEP_VIGENCIADESDEDesde: TDateEdit
        Left = 8
        Top = 28
        Width = 89
        Height = 21
        NumGlyphs = 2
        TabOrder = 0
      end
      object edEP_VIGENCIAHASTAHasta: TDateEdit
        Left = 100
        Top = 28
        Width = 89
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
      end
      object rgFiltroPreferencial: TJvRadioGroup
        Left = 9
        Top = 52
        Width = 103
        Height = 61
        Caption = ' Tipo de Prestador '
        ItemIndex = 0
        Items.Strings = (
          'Todo'
          'Preferencial'
          'No preferencial')
        TabOrder = 2
        CaptionVisible = True
        EdgeInner = esNone
        EdgeOuter = esNone
      end
      object chkBajas: TCheckBox
        Left = 11
        Top = 112
        Width = 172
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'No ver registros dados de baja'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
      object rgFiltroAuditoria: TJvRadioGroup
        Left = 117
        Top = 52
        Width = 67
        Height = 61
        Caption = ' Auditado '
        ItemIndex = 0
        Items.Strings = (
          'Todo'
          'Si'
          'No')
        TabOrder = 3
        CaptionVisible = True
        EdgeInner = esNone
        EdgeOuter = esNone
      end
    end
    object pnlFiltroEmpresaPrestador: TPanel
      Left = 0
      Top = 0
      Width = 576
      Height = 134
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 0
      inline fraCO_CONTRATO: TfraEmpresaAGENDA
        Left = 2
        Top = 2
        Width = 572
        Height = 57
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        DesignSize = (
          572
          57)
        inherited lbContrato: TLabel
          Left = 439
        end
        inherited lbInfoEmpresa: TLabel
          Left = 462
        end
        inherited btnValidarDatos: TLabel
          Width = 0
        end
        inherited btnClear: TJvSpeedButton
          Left = 544
        end
        inherited edContrato: TIntEdit
          Left = 486
        end
        inherited cmbRSocial: TArtComboBox
          Width = 204
        end
      end
      inline fraEP_PRESTADOR: TfraPrestadorAGENDA
        Left = 2
        Top = 59
        Width = 572
        Height = 74
        VertScrollBar.Range = 49
        Align = alTop
        AutoScroll = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        DesignSize = (
          572
          74)
        inherited lbCPostal: TLabel
          Left = 486
        end
        inherited cmbCA_DESCRIPCION: TArtComboBox
          Width = 195
        end
        inherited edCA_LOCALIDAD: TEdit
          Width = 106
        end
        inherited edCA_CODPOSTAL: TEdit
          Left = 510
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 134
    Width = 772
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 768
      end>
    inherited ToolBar: TToolBar
      Width = 755
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 163
    Width = 772
    Height = 337
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'EP_PRESTADOR'
        Title.Caption = 'Identificador'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_DESCRIPCION'
        Title.Caption = 'Prestador'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Empresa'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_VIGENCIADESDE'
        Title.Caption = 'Desde'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_VIGENCIAHASTA'
        Title.Caption = 'Hasta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TIPO_RELACION'
        Title.Caption = 'Tipo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AUDITADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Wingdings'
        Font.Style = [fsBold]
        Title.Caption = 'Auditado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACIONES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Wingdings'
        Font.Style = [fsBold]
        Title.Caption = 'Observaciones'
        Width = 80
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 64
    Top = 276
    Width = 697
    OnBeforeShow = fpAbmBeforeShow
    DesignSize = (
      697
      261)
    inherited BevelAbm: TBevel
      Width = 689
    end
    object lbl1: TLabel [1]
      Left = 12
      Top = 132
      Width = 30
      Height = 13
      Caption = 'Desde'
    end
    object lbl2: TLabel [2]
      Left = 104
      Top = 132
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object lbl3: TLabel [3]
      Left = 16
      Top = 180
      Width = 75
      Height = 13
      Caption = 'Tipo de relaci'#243'n'
    end
    object lbl4: TLabel [4]
      Left = 204
      Top = 132
      Width = 425
      Height = 13
      Caption = 
        'Observaciones internas (no se muestran a la hora de cargar Parte' +
        's Evolutivos ni CECAP)'
    end
    inherited btnAceptar: TButton
      Left = 542
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
    inherited btnCancelar: TButton
      Left = 617
      TabOrder = 7
    end
    inline fraEmpresaABM: TfraEmpresaAGENDA
      Left = 0
      Top = 0
      Width = 697
      Height = 57
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      DesignSize = (
        697
        57)
      inherited lbContrato: TLabel
        Left = 564
      end
      inherited lbInfoEmpresa: TLabel
        Left = 587
      end
      inherited btnValidarDatos: TLabel
        Width = 0
      end
      inherited btnClear: TJvSpeedButton
        Left = 669
      end
      inherited edContrato: TIntEdit
        Left = 611
      end
      inherited cmbRSocial: TArtComboBox
        Width = 329
      end
    end
    inline fraPrestadorABM: TfraPrestadorAGENDA
      Left = 0
      Top = 57
      Width = 697
      Height = 75
      VertScrollBar.Range = 49
      Align = alTop
      AutoScroll = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      DesignSize = (
        697
        75)
      inherited lbCPostal: TLabel
        Left = 611
      end
      inherited cmbCA_DESCRIPCION: TArtComboBox
        Width = 320
      end
      inherited edCA_LOCALIDAD: TEdit
        Width = 236
      end
      inherited edCA_CODPOSTAL: TEdit
        Left = 635
      end
    end
    object edFechaDesde: TDateEdit
      Left = 8
      Top = 148
      Width = 89
      Height = 21
      NumGlyphs = 2
      TabOrder = 2
    end
    object edFechaHasta: TDateEdit
      Left = 100
      Top = 148
      Width = 89
      Height = 21
      NumGlyphs = 2
      TabOrder = 3
    end
    object cmbPreferencial: TComboBox
      Left = 8
      Top = 196
      Width = 185
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ParentColor = True
      TabOrder = 4
      TabStop = False
      Items.Strings = (
        'Preferencial'
        'No preferencial u objetada')
    end
    object edObservaciones: TMemo
      Left = 200
      Top = 148
      Width = 489
      Height = 69
      Anchors = [akLeft, akTop, akRight]
      Lines.Strings = (
        'edObservaciones')
      TabOrder = 5
    end
    object chkAuditoria: TCheckBox
      Left = 8
      Top = 236
      Width = 441
      Height = 17
      Caption = 
        'Haga click aqu'#237' para auditar ahora esta relaci'#243'n Empresa / Prest' +
        'ador'
      TabOrder = 8
    end
  end
  object pnlBottom: TPanel [4]
    Left = 0
    Top = 500
    Width = 772
    Height = 53
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 4
    object gbAlta: TJvgGroupBox
      Left = 8
      Top = 4
      Width = 164
      Height = 41
      Caption = ' Alta '
      TabOrder = 0
      Border.Inner = bvSpace
      Border.Outer = bvNone
      Border.Bold = False
      CaptionBorder.Inner = bvSpace
      CaptionBorder.Outer = bvNone
      CaptionBorder.Bold = False
      CaptionGradient.Active = False
      CaptionGradient.Orientation = fgdHorizontal
      CaptionShift.X = 8
      CaptionShift.Y = 0
      Colors.Text = clHighlightText
      Colors.TextActive = clHighlightText
      Colors.Caption = clBtnShadow
      Colors.CaptionActive = clBtnShadow
      Colors.Client = clBtnFace
      Colors.ClientActive = clBtnFace
      Gradient.FromColor = clBlack
      Gradient.ToColor = clGray
      Gradient.Active = False
      Gradient.Orientation = fgdHorizontal
      Options = [fgoCanCollapse, fgoFilledCaption, fgoFluentlyCollapse, fgoFluentlyExpand, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
      FullHeight = 0
      object dbtxtEP_USUALTA: TDBText
        Left = 70
        Top = 20
        Width = 92
        Height = 13
        DataField = 'EP_USUALTA'
        DataSource = dsConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object dbtxtEP_FECHAALTA: TDBText
        Left = 4
        Top = 20
        Width = 66
        Height = 13
        DataField = 'EP_FECHAALTA'
        DataSource = dsConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object JvgGroupBox1: TJvgGroupBox
      Left = 176
      Top = 4
      Width = 164
      Height = 41
      Caption = ' '#218'ltima modificaci'#243'n '
      TabOrder = 1
      Border.Inner = bvSpace
      Border.Outer = bvNone
      Border.Bold = False
      CaptionBorder.Inner = bvSpace
      CaptionBorder.Outer = bvNone
      CaptionBorder.Bold = False
      CaptionGradient.Active = False
      CaptionGradient.Orientation = fgdHorizontal
      CaptionShift.X = 8
      CaptionShift.Y = 0
      Colors.Text = clHighlightText
      Colors.TextActive = clHighlightText
      Colors.Caption = clBtnShadow
      Colors.CaptionActive = clBtnShadow
      Colors.Client = clBtnFace
      Colors.ClientActive = clBtnFace
      Gradient.FromColor = clBlack
      Gradient.ToColor = clGray
      Gradient.Active = False
      Gradient.Orientation = fgdHorizontal
      Options = [fgoCanCollapse, fgoFilledCaption, fgoFluentlyCollapse, fgoFluentlyExpand, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
      FullHeight = 0
      object dbtxtEP_USUMODIF: TDBText
        Left = 70
        Top = 20
        Width = 92
        Height = 13
        DataField = 'EP_USUMODIF'
        DataSource = dsConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object dbtxtEP_FECHAMODIF: TDBText
        Left = 4
        Top = 20
        Width = 66
        Height = 13
        DataField = 'EP_FECHAMODIF'
        DataSource = dsConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object JvgGroupBox2: TJvgGroupBox
      Left = 344
      Top = 4
      Width = 164
      Height = 41
      Caption = ' Baja '
      TabOrder = 2
      Border.Inner = bvSpace
      Border.Outer = bvNone
      Border.Bold = False
      CaptionBorder.Inner = bvSpace
      CaptionBorder.Outer = bvNone
      CaptionBorder.Bold = False
      CaptionGradient.Active = False
      CaptionGradient.Orientation = fgdHorizontal
      CaptionShift.X = 8
      CaptionShift.Y = 0
      Colors.Text = clHighlightText
      Colors.TextActive = clHighlightText
      Colors.Caption = clBtnShadow
      Colors.CaptionActive = clBtnShadow
      Colors.Client = clBtnFace
      Colors.ClientActive = clBtnFace
      Gradient.FromColor = clBlack
      Gradient.ToColor = clGray
      Gradient.Active = False
      Gradient.Orientation = fgdHorizontal
      Options = [fgoCanCollapse, fgoFilledCaption, fgoFluentlyCollapse, fgoFluentlyExpand, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
      FullHeight = 0
      object dbtxtEP_USUBAJA: TDBText
        Left = 70
        Top = 20
        Width = 92
        Height = 13
        DataField = 'EP_USUBAJA'
        DataSource = dsConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object dbtxtEP_FECHABAJA: TDBText
        Left = 4
        Top = 20
        Width = 66
        Height = 13
        DataField = 'EP_FECHABAJA'
        DataSource = dsConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object JvgGroupBox3: TJvgGroupBox
      Left = 512
      Top = 4
      Width = 164
      Height = 41
      Caption = ' Auditor'#237'a '
      TabOrder = 3
      Border.Inner = bvSpace
      Border.Outer = bvNone
      Border.Bold = False
      CaptionBorder.Inner = bvSpace
      CaptionBorder.Outer = bvNone
      CaptionBorder.Bold = False
      CaptionGradient.Active = False
      CaptionGradient.Orientation = fgdHorizontal
      CaptionShift.X = 8
      CaptionShift.Y = 0
      Colors.Text = clHighlightText
      Colors.TextActive = clHighlightText
      Colors.Caption = clBtnShadow
      Colors.CaptionActive = clBtnShadow
      Colors.Client = clBtnFace
      Colors.ClientActive = clBtnFace
      Gradient.FromColor = clBlack
      Gradient.ToColor = clGray
      Gradient.Active = False
      Gradient.Orientation = fgdHorizontal
      Options = [fgoCanCollapse, fgoFilledCaption, fgoFluentlyCollapse, fgoFluentlyExpand, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
      FullHeight = 0
      object dbtxtEP_USUAUDITADO: TDBText
        Left = 70
        Top = 20
        Width = 92
        Height = 13
        DataField = 'EP_USUAUDITADO'
        DataSource = dsConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object dbtxtEP_FECHAAUDITADO: TDBText
        Left = 4
        Top = 20
        Width = 66
        Height = 13
        DataField = 'EP_FECHAAUDITADO'
        DataSource = dsConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object dbmmoObservaciones: TDBMemo
      Left = 680
      Top = 2
      Width = 90
      Height = 49
      Align = alRight
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataField = 'EP_OBSERVACIONES'
      DataSource = dsConsulta
      TabOrder = 4
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT DISTINCT mep.*,'
      '                cpr.ca_descripcion,'
      '                em_nombre,'
      '                co_contrato,'
      '                CASE ep_preferencial'
      '                  WHEN '#39'P'#39' THEN '#39'Preferencial'#39
      '                  WHEN '#39'N'#39' THEN '#39'No preferencial u objetada'#39
      '                  ELSE '#39'?'#39
      '                END'
      '                  tipo_relacion,'
      
        '                CASE WHEN ep_fechaauditado IS NULL THEN '#39#251#39' ELSE' +
        ' '#39#252#39' END auditado,'
      
        '                CASE WHEN ep_observaciones IS NULL THEN '#39#251#39' ELSE' +
        ' '#39#252#39' END observaciones'
      '  FROM art.mep_empresaprestador mep,'
      '       art.cpr_prestador cpr,'
      '       afi.aem_empresa,'
      '       afi.aco_contrato'
      ' WHERE ep_prestador = ca_identificador'
      '   AND ep_cuit = em_cuit'
      '   AND em_id = co_idempresa'
      
        '   AND co_contrato = art.afiliacion.get_contratovigente (em_cuit' +
        ')')
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
    Left = 80
    Top = 200
  end
end
