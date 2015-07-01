inherited frmMovimientosCUILAFIP: TfrmMovimientosCUILAFIP
  Caption = 'Ajustes PCP'
  ClientHeight = 390
  ClientWidth = 667
  Constraints.MinHeight = 420
  Constraints.MinWidth = 675
  ExplicitWidth = 675
  ExplicitHeight = 420
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 667
    Height = 53
    Visible = True
    ExplicitWidth = 667
    ExplicitHeight = 53
    DesignSize = (
      667
      53)
    object gbEmpresa: TGroupBox
      Left = 7
      Top = 0
      Width = 583
      Height = 49
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Empresa '
      TabOrder = 0
      DesignSize = (
        583
        49)
      object Label1: TLabel
        Left = 8
        Top = 22
        Width = 25
        Height = 13
        Caption = 'CUIT'
      end
      inline fraEmpresaBusq: TfraEmpresa
        Left = 36
        Top = 18
        Width = 537
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
        ExplicitLeft = 36
        ExplicitTop = 18
        ExplicitWidth = 537
        ExplicitHeight = 21
        DesignSize = (
          537
          21)
        inherited lbRSocial: TLabel
          Left = 88
          ExplicitLeft = 88
        end
        inherited lbContrato: TLabel
          Left = 433
          ExplicitLeft = 302
        end
        inherited edContrato: TIntEdit
          Left = 480
          ExplicitLeft = 480
        end
        inherited cmbRSocial: TArtComboBox
          Width = 298
          ExplicitWidth = 298
        end
      end
    end
    object gbPeriod: TGroupBox
      Left = 594
      Top = 0
      Width = 68
      Height = 49
      Anchors = [akTop, akRight]
      Caption = 'Periodo'
      TabOrder = 1
      object edPeriodoBusq: TPeriodoPicker
        Left = 8
        Top = 18
        Width = 49
        Height = 21
        TabOrder = 0
        Color = clWindow
        Periodo.AllowNull = True
        Periodo.Orden = poAnoMes
        Periodo.Separador = #0
        Periodo.Mes = 0
        Periodo.Ano = 0
        Periodo.MaxPeriodo = '205511'
        Periodo.MinPeriodo = '195512'
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
    Top = 53
    Width = 667
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 661
      end>
    ExplicitTop = 53
    ExplicitWidth = 667
    inherited ToolBar: TToolBar
      Width = 652
      ExplicitWidth = 652
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 82
    Width = 667
    Height = 308
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIT'
        Title.Alignment = taCenter
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RSOCIAL'
        Title.Caption = 'Raz'#243'n Social'
        Width = 238
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRATO'
        Title.Alignment = taCenter
        Title.Caption = 'Contrato'
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PERIODO'
        Title.Alignment = taCenter
        Title.Caption = 'Periodo'
        Width = 49
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIL'
        Title.Alignment = taCenter
        Width = 105
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'IMPORTE'
        Title.Alignment = taCenter
        Title.Caption = 'Importe'
        Width = 83
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECARECAUDACION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Recaudaci'#243'n'
        Width = 83
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 241
    Top = 121
    Width = 166
    Height = 96
    BorderStyle = bsDialog
    ExplicitLeft = 241
    ExplicitTop = 121
    ExplicitWidth = 166
    ExplicitHeight = 96
    DesignSize = (
      166
      96)
    inherited BevelAbm: TBevel
      Top = 60
      Width = 158
      ExplicitTop = 60
      ExplicitWidth = 158
    end
    object Label2: TLabel [1]
      Left = 10
      Top = 10
      Width = 36
      Height = 13
      Caption = 'Periodo'
    end
    object Label3: TLabel [2]
      Left = 10
      Top = 37
      Width = 24
      Height = 13
      Caption = 'CUIL'
    end
    inherited btnAceptar: TButton
      Left = 8
      Top = 66
      TabOrder = 2
      ExplicitLeft = 8
      ExplicitTop = 66
    end
    inherited btnCancelar: TButton
      Left = 86
      Top = 66
      TabOrder = 3
      ExplicitLeft = 86
      ExplicitTop = 66
    end
    object edPeriodoAltaModif: TPeriodoPicker
      Left = 57
      Top = 7
      Width = 49
      Height = 21
      TabOrder = 0
      Color = clWindow
      Periodo.AllowNull = False
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 7
      Periodo.Ano = 2005
      Periodo.Valor = '200507'
      Periodo.MaxPeriodo = '205507'
      Periodo.MinPeriodo = '199606'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poMesAno
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
      AutoExit = True
    end
    object edCUILAltaModif: TMaskEdit
      Left = 57
      Top = 34
      Width = 81
      Height = 21
      Hint = 'CUIL del Trabajador'
      EditMask = '99-99999999-c;0;'
      MaxLength = 13
      TabOrder = 1
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT MC_CUITCONT CUIT, MC_PERIODO PERIODO, MC_CUIL CUIL, ART.A' +
        'FILIACION.GET_CONTRATOVIGENTE(MC_CUITCONT, MC_PERIODO) CONTRATO,'
      
        '       EM_NOMBRE RSOCIAL, NVL(ROUND(DECODE(MC_INDDBCR, '#39'C'#39', 1, -' +
        '1) * MC_IMPORTE / 100 / (1 - 8 / 1000), 2), 0) IMPORTE'
      '  FROM ZMC_MOVIMIENTOCUILAFIP, AEM_EMPRESA'
      ' WHERE MC_CUITCONT = EM_CUIT'
      '   AND 1 = 2')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLetter
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
    Left = 113
    Top = 200
  end
end
