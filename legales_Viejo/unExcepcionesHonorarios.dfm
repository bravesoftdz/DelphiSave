inherited frmExcepcionesHonorarios: TfrmExcepcionesHonorarios
  Left = 48
  Top = 122
  Caption = 'Excepciones de Honorarios'
  ClientWidth = 648
  OldCreateOrder = True
  ExplicitLeft = 48
  ExplicitTop = 122
  ExplicitWidth = 656
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 648
    Height = 92
    ExplicitWidth = 648
    ExplicitHeight = 92
    DesignSize = (
      648
      92)
    object gbEstudio: TGroupBox
      Left = 1
      Top = 0
      Width = 647
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Estudio'
      TabOrder = 0
      DesignSize = (
        647
        44)
      inline fraEstudio: TfraStaticCodigoDescripcion
        Left = 8
        Top = 14
        Width = 634
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 14
        ExplicitWidth = 634
        DesignSize = (
          634
          23)
        inherited edCodigo: TPatternEdit
          Left = 2
          Width = 48
          ExplicitLeft = 2
          ExplicitWidth = 48
        end
        inherited cmbDescripcion: TComboGrid
          Left = 52
          Width = 579
          ExplicitLeft = 52
          ExplicitWidth = 579
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja')
          ColWidths = (
            40
            300
            -1
            -1)
        end
      end
    end
    object gbEmpresa: TGroupBox
      Left = 1
      Top = 44
      Width = 444
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Empresa'
      TabOrder = 1
      DesignSize = (
        444
        44)
      object Label19: TLabel
        Left = 7
        Top = 20
        Width = 25
        Height = 13
        Caption = 'CUIT'
      end
      inline fraEmpresa: TfraEmpresa
        Left = 37
        Top = 16
        Width = 400
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
        ExplicitLeft = 37
        ExplicitTop = 16
        ExplicitWidth = 400
        ExplicitHeight = 21
        DesignSize = (
          400
          21)
        inherited lbContrato: TLabel
          Left = 296
          ExplicitLeft = 296
        end
        inherited edContrato: TIntEdit
          Left = 343
          ExplicitLeft = 343
        end
        inherited cmbRSocial: TArtComboBox
          Width = 161
          ExplicitWidth = 161
        end
      end
    end
    object gbPeriodo: TGroupBox
      Left = 449
      Top = 44
      Width = 199
      Height = 44
      Anchors = [akTop, akRight]
      Caption = 'Periodo'
      TabOrder = 2
      object lblPerDesde: TLabel
        Left = 6
        Top = 18
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object lblPerHasta: TLabel
        Left = 102
        Top = 18
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object edPeriodoDesde: TPeriodoPicker
        Left = 42
        Top = 15
        Width = 53
        Height = 21
        TabOrder = 0
        TabStop = True
        Color = clWindow
        Periodo.AllowNull = True
        Periodo.Orden = poAnoMes
        Periodo.Separador = #0
        Periodo.Mes = 0
        Periodo.Ano = 0
        Periodo.MaxPeriodo = '205303'
        Periodo.MinPeriodo = '195304'
        WidthMes = 19
        Separation = 0
        ShowButton = False
        ShowOrder = poAnoMes
        ReadOnly = False
        Enabled = True
        Fuente.Charset = DEFAULT_CHARSET
        Fuente.Color = clWindowText
        Fuente.Height = -11
        Fuente.Name = 'Tahoma'
        Fuente.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        NullDropDown = SetMax
      end
      object edPeriodoHasta: TPeriodoPicker
        Left = 139
        Top = 15
        Width = 53
        Height = 21
        TabOrder = 1
        TabStop = True
        Color = clWindow
        Periodo.AllowNull = True
        Periodo.Orden = poAnoMes
        Periodo.Separador = #0
        Periodo.Mes = 0
        Periodo.Ano = 0
        Periodo.MaxPeriodo = '205303'
        Periodo.MinPeriodo = '195304'
        WidthMes = 19
        Separation = 0
        ShowButton = False
        ShowOrder = poAnoMes
        ReadOnly = False
        Enabled = True
        Fuente.Charset = DEFAULT_CHARSET
        Fuente.Color = clWindowText
        Fuente.Height = -11
        Fuente.Name = 'Tahoma'
        Fuente.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        NullDropDown = SetMax
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 92
    Width = 648
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 642
      end>
    ExplicitTop = 92
    ExplicitWidth = 648
    inherited ToolBar: TToolBar
      Width = 633
      ExplicitWidth = 633
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbSumatoria: TToolButton
        Left = 370
        Top = 0
        Hint = 'Sumatoria'
        ImageIndex = 21
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton2: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 19
        Style = tbsSeparator
      end
      object tbIncluirHonorarios: TToolButton
        Left = 401
        Top = 0
        Hint = 'Incluir en Honorarios (Ctrl+H)'
        ImageIndex = 18
        OnClick = tbIncluirHonorariosClick
      end
      object ToolButton1: TToolButton
        Left = 424
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 22
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 432
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 121
    Width = 648
    Height = 185
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    MultiSelect = True
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Expanded = False
        FieldName = 'ESTUDIO'
        Title.Caption = 'C'#243'd. Gestor'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE_ESTUDIO'
        Title.Caption = 'Nombre Gestor'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRATO'
        Title.Alignment = taCenter
        Title.Caption = 'Contrato'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE_EMPRESA'
        Title.Caption = 'Raz'#243'n Social'
        Width = 138
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIT'
        Title.Alignment = taCenter
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONCEPTO'
        Title.Caption = 'Concepto'
        Width = 139
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
        Expanded = False
        FieldName = 'TIPO'
        Title.Caption = 'Tipo Recepc.'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPORTE'
        Title.Alignment = taCenter
        Title.Caption = 'Importe'
        Width = 71
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_RECAUDACION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Recaudaci'#243'n'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BANCO'
        Title.Caption = 'Banco'
        Width = 146
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTA'
        Title.Caption = 'Cuenta'
        Width = 96
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT GC_ID ESTUDIO, GC_NOMBRE NOMBRE_ESTUDIO, CO_CONTRATO CONT' +
        'RATO, EM_NOMBRE NOMBRE_EMPRESA,'
      
        '       EM_CUIT CUIT, CM_DESCRIPCION CONCEPTO, MO_PERIODO PERIODO' +
        ','
      
        '       DECODE(MO_CODIGORECEPCION,'#39'1'#39','#39'DGI'#39','#39'2'#39','#39'Manual'#39','#39'Autom'#225't' +
        'ico'#39') TIPO,'
      
        '       MO_IMPORTE IMPORTE, MO_FECHARECA FECHA_RECAUDACION, BA_NO' +
        'MBRE BANCO, CB_NUMERO CUENTA'
      
        '  FROM ZBA_BANCO, ZCB_CUENTABANCARIA, RRM_REMESA, AGC_GESTORCUEN' +
        'TA, ZCM_CODIGOMOVIMIENTO, ZMO_MOVIMIENTO,'
      '       AEM_EMPRESA, ACO_CONTRATO'
      ' WHERE CM_ID = MO_IDCODIGOMOVIMIENTO'
      '   AND EM_ID = CO_IDEMPRESA'
      '   AND GC_ID = CO_IDESTUDIO'
      '   AND MO_CONTRATO = CO_CONTRATO'
      '   AND RM_ID (+) = MO_IDREMESA'
      '   AND CB_ID (+) = RM_IDCUENTABANCARIA'
      '   AND BA_ID (+) = CB_IDBANCO'
      '   AND CM_OPERACION = '#39'R'#39
      '   AND CM_CONCEPTO = '#39'C'#39
      '   AND MO_IDVALOR IS NULL'
      '   AND MO_IDCIERREHONORARIO IS NULL'
      '   AND 1 = 2'
      ''
      '   ')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
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
        Key = 16456
        LinkControl = tbIncluirHonorarios
      end>
    Left = 124
    Top = 200
  end
end
