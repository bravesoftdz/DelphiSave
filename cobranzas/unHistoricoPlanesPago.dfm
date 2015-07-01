inherited frmHistoricoPlanesPago: TfrmHistoricoPlanesPago
  Left = 32
  Top = 109
  Width = 730
  Height = 460
  Caption = 'Consulta de Hist'#243'rico'
  Constraints.MinHeight = 460
  Constraints.MinWidth = 730
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 722
    Height = 114
    DesignSize = (
      722
      114)
    object gbSectorOrigen: TGroupBox
      Left = 143
      Top = 43
      Width = 138
      Height = 68
      Caption = 'Sector Origen'
      TabOrder = 2
      object rbSectorLeg: TRadioButton
        Left = 7
        Top = 18
        Width = 69
        Height = 17
        Caption = '&Legales'
        TabOrder = 0
      end
      object rbSectorTodos: TRadioButton
        Left = 79
        Top = 18
        Width = 55
        Height = 17
        Caption = '&Todos'
        Checked = True
        TabOrder = 2
        TabStop = True
      end
      object rbSectorCob: TRadioButton
        Left = 7
        Top = 42
        Width = 74
        Height = 17
        Caption = '&Cobranzas'
        TabOrder = 1
      end
    end
    object gbEmpresa: TGroupBox
      Left = 2
      Top = -1
      Width = 718
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Empresa'
      TabOrder = 0
      DesignSize = (
        718
        44)
      object Label1: TLabel
        Left = 6
        Top = 20
        Width = 25
        Height = 13
        Caption = 'CUIT'
      end
      inline fraContrato: TfraEmpresa
        Left = 36
        Top = 16
        Width = 675
        Height = 23
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
          675
          23)
        inherited lbRSocial: TLabel
          Left = 88
        end
        inherited lbContrato: TLabel
          Left = 571
        end
        inherited edContrato: TIntEdit
          Left = 618
        end
        inherited cmbRSocial: TArtComboBox
          Width = 436
        end
      end
    end
    object gbFechaAlta: TGroupBox
      Left = 2
      Top = 43
      Width = 138
      Height = 68
      Caption = 'Fecha Estado'
      TabOrder = 1
      object Label3: TLabel
        Left = 6
        Top = 19
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object Label4: TLabel
        Left = 7
        Top = 45
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object edFAltaDesde: TDateComboBox
        Left = 39
        Top = 14
        Width = 88
        Height = 23
        MaxDateCombo = edFAltaHasta
        TabOrder = 0
      end
      object edFAltaHasta: TDateComboBox
        Left = 39
        Top = 40
        Width = 88
        Height = 23
        MinDateCombo = edFAltaDesde
        TabOrder = 1
      end
    end
    object gbNroPlan: TGroupBox
      Left = 284
      Top = 43
      Width = 138
      Height = 68
      Caption = 'Plan'
      TabOrder = 3
      object Label2: TLabel
        Left = 6
        Top = 19
        Width = 47
        Height = 13
        Caption = 'Nro. Plan:'
      end
      object edNroPlan: TIntEdit
        Left = 57
        Top = 16
        Width = 73
        Height = 21
        TabOrder = 0
        Text = '0'
        MaxLength = 10
      end
    end
    object rgTipoPlan: TRadioGroup
      Left = 425
      Top = 43
      Width = 229
      Height = 68
      Caption = 'Tipo de Plan'
      Columns = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemIndex = 0
      Items.Strings = (
        '&Saldados'
        '&No Cumplidos')
      ParentFont = False
      TabOrder = 4
      OnClick = rgTipoPlanClick
    end
  end
  inherited CoolBar: TCoolBar
    Top = 114
    Width = 722
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 718
      end>
    inherited ToolBar: TToolBar
      Width = 705
      inherited ToolButton8: TToolButton
        Visible = False
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 143
    Width = 722
    Height = 290
    Columns = <
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 146
        Visible = True
      end
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
        FieldName = 'CONTRATO'
        Title.Alignment = taCenter
        Title.Caption = 'Contrato'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PLAN'
        Title.Alignment = taCenter
        Title.Caption = 'Plan'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Width = 116
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAESTADO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Estado'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GCIDGESTOR'
        Title.Alignment = taCenter
        Title.Caption = 'Gestor'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GCNOMBREGESTOR'
        Title.Caption = 'Nombre Gestor'
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GCIDESTUDIO'
        Title.Alignment = taCenter
        Title.Caption = 'Estudio'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GCNOMBREESTUDIO'
        Title.Caption = 'Nombre Estudio'
        Width = 132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALORES'
        Title.Alignment = taCenter
        Title.Caption = 'Valores'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALORESRECH'
        Title.Alignment = taCenter
        Title.Caption = 'Valores Rech.'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALDO'
        Title.Alignment = taCenter
        Title.Caption = 'Saldo'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BIBLIORATO'
        Title.Caption = 'Bibliorato'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PP_SECTOR'
        Title.Caption = 'Sector'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOBIBLIORATO'
        Title.Caption = 'Tipo Bibliorato'
        Width = 106
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT EM_NOMBRE NOMBRE, EM_CUIT CUIT, PP_ID PLAN, ESPLA.TB_DESC' +
        'RIPCION ESTADO, '
      '         PP_CONTRATO CONTRATO, HP_FECHAALTA FECHAESTADO, '
      
        #9'   AGCGESTOR.GC_ID GCIDGESTOR, AGCGESTOR.GC_NOMBRE GCNOMBREGEST' +
        'OR, AGCESTUDIO.GC_ID GCIDESTUDIO,'
      '         AGCESTUDIO.GC_NOMBRE GCNOMBREESTUDIO, '
      
        #9'   DEUDA.GET_VALORESPLAN(PP_ID) VALORES, DEUDA.GET_VALORESRECHA' +
        'ZADOSPLAN(PP_ID) VALORESRECH,'
      '         DEUDA.GET_VALORESSALDOIMPUTARPLAN(PP_ID) SALDO,'
      
        #9'   PP_BIBLIORATO BIBLIORATO, PP_SECTOR, PP_TIPOBIBLIORATO TIPOB' +
        'IBLIORATO'
      
        '    FROM ACO_CONTRATO, AEM_EMPRESA, ZPP_PLANPAGO, CTB_TABLAS ESP' +
        'LA, '
      
        '         AGC_GESTORCUENTA AGCESTUDIO, AGC_GESTORCUENTA AGCGESTOR' +
        ', ZHP_HISTORICOPLAN'
      '   WHERE PP_ID = HP_IDPLAN'
      '     AND ESPLA.TB_CLAVE = '#39'ESPLA'#39
      '     AND ESPLA.TB_CODIGO = PP_ESTADO'
      '     AND PP_CONTRATO = CO_CONTRATO'
      '     AND CO_IDEMPRESA = EM_ID'
      '     AND PP_IDGESTOR = AGCGESTOR.GC_ID(+)'
      '     AND PP_IDESTUDIO = AGCESTUDIO.GC_ID(+)'
      '     AND PP_FECHABAJA IS NULL'
      '     AND ESPLA.TB_ESPECIAL1 = '#39'N'#39
      '     AND 1 = 2'
      '     ')
    Top = 259
  end
  inherited dsConsulta: TDataSource
    Top = 259
  end
  inherited SortDialog: TSortDialog
    Top = 287
  end
  inherited ExportDialog: TExportDialog
    Top = 287
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
    Zoom = 85
    Options = [qoZoomPrint, qoZoomCalcFontSize]
    Top = 315
  end
  inherited Seguridad: TSeguridad
    Top = 231
  end
  inherited FormStorage: TFormStorage
    Top = 231
  end
  inherited PrintDialog: TPrintDialog
    Top = 315
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
    Top = 231
  end
  inherited FieldHider: TFieldHider
    Top = 259
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
    Left = 108
    Top = 231
  end
end
