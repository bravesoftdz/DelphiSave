inherited frmListSiniConLiqMensuales: TfrmListSiniConLiqMensuales
  Left = 392
  Top = 255
  Width = 715
  Height = 376
  Caption = 'Siniestros con liquidaciones mensuales'
  Constraints.MinHeight = 376
  Constraints.MinWidth = 680
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 707
    Height = 135
    object gbFechaDeLiquidacion: TGroupBox
      Left = 160
      Top = 0
      Width = 207
      Height = 42
      Caption = ' Fecha de Liquidaci'#243'n '
      TabOrder = 1
      TabStop = True
      object Label1: TLabel
        Left = 97
        Top = 19
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object dcFecLiquiDesde: TDateComboBox
        Left = 5
        Top = 16
        Width = 90
        Height = 21
        MaxDateCombo = dcFecLiquiHasta
        TabOrder = 0
      end
      object dcFecLiquiHasta: TDateComboBox
        Left = 111
        Top = 16
        Width = 90
        Height = 21
        MinDateCombo = dcFecLiquiDesde
        TabOrder = 1
      end
    end
    object gbConceptoPago: TGroupBox
      Left = 370
      Top = 0
      Width = 335
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Concepto de Pago '
      TabOrder = 2
      TabStop = True
      DesignSize = (
        335
        43)
      object cmbConceptoPago: TDBCheckCombo
        Left = 9
        Top = 15
        Width = 317
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DataSource = dsConceptoPago
        KeyField = 'CP_CONPAGO'
        ListField = 'CP_DENPAGO'
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 44
      Width = 155
      Height = 43
      Caption = ' Casos actualizados '
      TabOrder = 3
      TabStop = True
      object rbSiCasosActualizados: TRadioButton
        Left = 5
        Top = 19
        Width = 33
        Height = 17
        Caption = 'S'#237
        TabOrder = 0
      end
      object rbNoCasosActualizados: TRadioButton
        Left = 49
        Top = 19
        Width = 36
        Height = 17
        Caption = 'No'
        TabOrder = 1
      end
      object rbTodosCasosActualizados: TRadioButton
        Left = 97
        Top = 19
        Width = 51
        Height = 17
        Caption = 'Todos'
        Checked = True
        TabOrder = 2
        TabStop = True
      end
    end
    object gbEmpresa: TGroupBox
      Left = 159
      Top = 44
      Width = 546
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Empresa '
      TabOrder = 4
      TabStop = True
      DesignSize = (
        546
        43)
      inline fraEmpresa: TfraEmpresa
        Left = 7
        Top = 15
        Width = 532
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        DesignSize = (
          532
          21)
        inherited lbContrato: TLabel
          Left = 428
        end
        inherited edContrato: TIntEdit
          Left = 475
        end
        inherited cmbRSocial: TArtComboBox
          Width = 293
        end
      end
    end
    object gbTrabajador: TGroupBox
      Left = 329
      Top = 89
      Width = 376
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Trabajador '
      TabOrder = 7
      TabStop = True
      DesignSize = (
        376
        41)
      inline fraTrabajador: TfraTrabajador
        Left = 6
        Top = 15
        Width = 364
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          364
          22)
        inherited cmbNombre: TArtComboBox
          Width = 280
        end
      end
    end
    object GroupBox1: TGroupBox
      Left = 158
      Top = 89
      Width = 167
      Height = 41
      Caption = ' Posteriores al decreto 1694/09 '
      TabOrder = 6
      TabStop = True
      object rbSiPostDecre: TRadioButton
        Left = 8
        Top = 19
        Width = 33
        Height = 17
        Caption = 'S'#237
        TabOrder = 0
      end
      object rbNoPostDecre: TRadioButton
        Left = 55
        Top = 19
        Width = 36
        Height = 17
        Caption = 'No'
        TabOrder = 1
      end
      object rbTodosPostDecre: TRadioButton
        Left = 108
        Top = 19
        Width = 51
        Height = 17
        Caption = 'Todos'
        Checked = True
        TabOrder = 2
        TabStop = True
      end
    end
    object GroupBox3: TGroupBox
      Left = 1
      Top = 88
      Width = 154
      Height = 42
      Caption = ' Desvinculados '
      TabOrder = 5
      TabStop = True
      object rbSiDesvinculados: TRadioButton
        Left = 6
        Top = 19
        Width = 33
        Height = 17
        Caption = 'S'#237
        TabOrder = 0
      end
      object rbNoDesvinculados: TRadioButton
        Left = 48
        Top = 19
        Width = 36
        Height = 17
        Caption = 'No'
        TabOrder = 1
      end
      object rbTodosDesvinculados: TRadioButton
        Left = 95
        Top = 19
        Width = 51
        Height = 17
        Caption = 'Todos'
        Checked = True
        TabOrder = 2
        TabStop = True
      end
    end
    object GroupBox4: TGroupBox
      Left = 2
      Top = 0
      Width = 155
      Height = 42
      Caption = ' Rango siniestros '
      TabOrder = 0
      object Label2: TLabel
        Left = 68
        Top = 19
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edSinHasta: TIntEdit
        Left = 81
        Top = 15
        Width = 68
        Height = 21
        TabOrder = 1
        AutoExit = True
      end
      object edSinDesde: TIntEdit
        Left = 5
        Top = 15
        Width = 60
        Height = 21
        TabOrder = 0
        AutoExit = True
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 135
    Width = 707
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 703
      end>
    inherited ToolBar: TToolBar
      Width = 690
      inherited tbNuevo: TToolButton
        Enabled = False
      end
      inherited ToolButton4: TToolButton
        Visible = True
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Actualizar Base (Ctrl+A)'
        ImageIndex = 47
        Visible = True
        OnClick = tbPropiedadesClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 164
    Width = 707
    Height = 185
    Options = [dgAlwaysShowEditor, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    OnCellClick = GridCellClick
    OnDrawColumnCell = GridDrawColumnCell
    ShowGlyphs = False
    OnGetCellParams = GridGetCellParams
    OnContextPopup = GridContextPopup
    ShowSearchButton = False
    Columns = <
      item
        Expanded = False
        FieldName = 'CHECKBOX'
        Title.Caption = '.'
        Width = 20
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Caption = 'Siniestro'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIT'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPRESA'
        Title.Caption = 'Empresa'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIL'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRABAJADOR'
        Title.Caption = 'Trabajador'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FLIQUIDACION'
        Title.Caption = 'Fecha Liquidaci'#243'n'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONPAGO'
        Title.Caption = 'Concepto Pago'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CP_TITPAGO'
        Title.Caption = 'Desc.Con Pago'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FDESVINCULACION'
        Title.Caption = 'Fecha Despido / Fin Pago'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ACTUALIZADO'
        Title.Caption = 'Actualizado'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHAACCIDENTE'
        Title.Caption = 'Fec. Accid.'
        Width = 85
        Visible = True
      end>
  end
  inherited QueryPrint: TQueryPrint
    PageOrientation = pxLandscape
    PageSize = psLegal
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end
      item
        Key = 16463
        LinkControl = tbOrdenar
      end
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16449
        LinkControl = tbPropiedades
      end
      item
        Key = 0
      end
      item
        Key = 0
      end>
  end
  object dsConceptoPago: TDataSource
    DataSet = sdqConceptoPago
    Left = 517
    Top = 6
  end
  object sdqConceptoPago: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'select cp_conpago, cp_denpago from scp_conpago'
      'where cp_fbaja is null'
      '    and CP_TIPO in ('#39'I'#39','#39'P'#39') '
      '    and cp_espagomensual = '#39'S'#39' ')
    Left = 545
    Top = 6
  end
end
