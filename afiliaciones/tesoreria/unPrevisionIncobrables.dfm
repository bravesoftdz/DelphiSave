inherited frmPrevisionIncobrables: TfrmPrevisionIncobrables
  Left = 246
  Top = 109
  Width = 608
  Height = 400
  ActiveControl = ppPeriodo
  Caption = 'Consulta de Previsi'#243'n Incobrables'
  Constraints.MinHeight = 400
  Constraints.MinWidth = 608
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 600
    Height = 196
    Visible = True
    DesignSize = (
      600
      196)
    object GroupBox1: TGroupBox
      Left = 80
      Top = 4
      Width = 516
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Empresa '
      TabOrder = 1
      DesignSize = (
        516
        44)
      inline fraEmpresa: TfraEmpresa
        Left = 8
        Top = 15
        Width = 498
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
        TabOrder = 0
        DesignSize = (
          498
          21)
        inherited lbContrato: TLabel
          Left = 396
        end
        inherited edContrato: TIntEdit
          Left = 441
        end
        inherited cmbRSocial: TArtComboBox
          Width = 259
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 4
      Top = 52
      Width = 292
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Actividad '
      TabOrder = 2
      DesignSize = (
        292
        44)
      inline fraActividad: TfraActividad
        Left = 10
        Top = 14
        Width = 276
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          276
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 227
        end
      end
    end
    object GroupBox3: TGroupBox
      Left = 300
      Top = 52
      Width = 296
      Height = 44
      Anchors = [akTop, akRight]
      Caption = ' Sector '
      TabOrder = 3
      inline fraSector: TfraStaticCTB_TABLAS
        Left = 8
        Top = 14
        Width = 280
        Height = 23
        TabOrder = 0
        DesignSize = (
          280
          23)
        inherited cmbDescripcion: TComboGrid
          Width = 216
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
    object GroupBox4: TGroupBox
      Left = 4
      Top = 100
      Width = 292
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Estado '
      TabOrder = 4
      DesignSize = (
        292
        44)
      inline fraEstado: TfraStaticCTB_TABLAS
        Left = 8
        Top = 14
        Width = 276
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          276
          23)
        inherited cmbDescripcion: TComboGrid
          Width = 212
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
    object GroupBox5: TGroupBox
      Left = 4
      Top = 148
      Width = 376
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Motivo Baja '
      TabOrder = 6
      DesignSize = (
        376
        44)
      inline fraMotivoBaja: TfraStaticCTB_TABLAS
        Left = 8
        Top = 14
        Width = 360
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          360
          23)
        inherited cmbDescripcion: TComboGrid
          Width = 296
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
    object GroupBox6: TGroupBox
      Left = 384
      Top = 148
      Width = 212
      Height = 44
      Anchors = [akTop, akRight]
      Caption = ' Fecha de Baja '
      TabOrder = 7
      object Label2: TLabel
        Left = 101
        Top = 21
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object dcbFechaBajaDesde: TDateComboBox
        Left = 9
        Top = 16
        Width = 88
        Height = 21
        MaxDateCombo = dcbFechaBajaHasta
        TabOrder = 0
      end
      object dcbFechaBajaHasta: TDateComboBox
        Left = 117
        Top = 16
        Width = 88
        Height = 21
        MinDateCombo = dcbFechaBajaDesde
        TabOrder = 1
      end
    end
    object GroupBox7: TGroupBox
      Left = 300
      Top = 100
      Width = 296
      Height = 44
      Anchors = [akTop, akRight]
      TabOrder = 5
      object Label1: TLabel
        Left = 144
        Top = 17
        Width = 57
        Height = 13
        Caption = 'Saldo Total:'
      end
      object checkConcurso: TCheckBox
        Left = 8
        Top = 17
        Width = 116
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Concurso o Quiebra:'
        TabOrder = 0
      end
      object cbSaldoTotal: TComboBox
        Left = 208
        Top = 12
        Width = 80
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        Items.Strings = (
          'Todos'
          '> 0'
          '< 0'
          '= 0')
      end
    end
    object GroupBox8: TGroupBox
      Left = 4
      Top = 4
      Width = 72
      Height = 44
      Caption = ' Per'#237'odo '
      TabOrder = 0
      object ppPeriodo: TPeriodoPicker
        Left = 8
        Top = 16
        Width = 56
        Height = 21
        TabOrder = 0
        Color = clWindow
        Periodo.AllowNull = True
        Periodo.Orden = poAnoMes
        Periodo.Separador = #0
        Periodo.Mes = 0
        Periodo.Ano = 0
        Periodo.MaxPeriodo = '205309'
        Periodo.MinPeriodo = '195310'
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
  end
  inherited CoolBar: TCoolBar
    Top = 196
    Width = 600
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 596
      end>
    inherited ToolBar: TToolBar
      Width = 583
      inherited ToolButton5: TToolButton
        Visible = False
      end
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = True
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbImprimir2: TToolButton
        Left = 370
        Top = 0
        Hint = 'Imprimir Prev. Incobrabilidad (Ctrl+P)'
        ImageIndex = 4
        OnClick = tbImprimir2Click
      end
      object tbTotalesRegGrilla: TToolButton
        Left = 393
        Top = 0
        ImageIndex = 23
      end
      object ToolButton1: TToolButton
        Left = 416
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 424
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 225
    Width = 600
    Height = 148
    OnPaintFooter = GridPaintFooter
    AutoTitleHeight = True
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIT'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Title.Caption = 'Nombre'
        Width = 188
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRATO'
        Title.Alignment = taCenter
        Title.Caption = 'Contrato'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ACTIVIDAD'
        Title.Caption = 'Actividad'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SECTOR'
        Title.Caption = 'Sector'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Width = 166
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_BAJA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Baja'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOT_BAJA'
        Title.Caption = 'Motivo Baja'
        Width = 178
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CONCURSO'
        Title.Alignment = taCenter
        Title.Caption = 'Concurso'
        Width = 67
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'QUIEBRA'
        Title.Alignment = taCenter
        Title.Caption = 'Quiebra'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALDO_TOTAL'
        Title.Alignment = taCenter
        Title.Caption = 'Saldo Total'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMISION'
        Title.Alignment = taCenter
        Title.Caption = 'Comisiones x Primas a Cobrar'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALDO_NO_SUJ_PREV'
        Title.Alignment = taCenter
        Title.Caption = 'Saldo NO Sujeto Prev.'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALDO_SUJ_PREV'
        Title.Alignment = taCenter
        Title.Caption = 'Saldo Sujeto Prev.'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMISION_SUJ_PREV'
        Title.Alignment = taCenter
        Title.Caption = 'Comisiones Sujetas Prev.'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TASASSN'
        Title.Alignment = taCenter
        Title.Caption = 'Tasa Uniforme'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PREVISION'
        Title.Alignment = taCenter
        Title.Caption = 'Previsi'#243'n'
        Width = 74
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 92
    Top = 288
  end
  inherited sdqConsulta: TSDQuery
    Left = 8
    Top = 276
  end
  inherited dsConsulta: TDataSource
    Left = 36
    Top = 276
  end
  inherited SortDialog: TSortDialog
    Left = 8
    Top = 304
  end
  inherited ExportDialog: TExportDialog
    Left = 36
    Top = 304
  end
  inherited QueryPrint: TQueryPrint
    Left = 36
    Top = 332
  end
  inherited Seguridad: TSeguridad
    Left = 8
    Top = 248
  end
  inherited FormStorage: TFormStorage
    Left = 36
    Top = 248
  end
  inherited PrintDialog: TPrintDialog
    Left = 8
    Top = 332
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
        Key = 16464
        LinkControl = tbImprimir2
      end>
    Left = 64
    Top = 248
  end
  inherited FieldHider: TFieldHider
    Left = 64
    Top = 276
  end
end
