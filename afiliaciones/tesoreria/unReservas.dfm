inherited frmReservas: TfrmReservas
  Left = 234
  Top = 114
  Width = 714
  Height = 388
  ActiveControl = ppPeriodo
  Caption = 'Contadur'#237'a y Reservas'
  Constraints.MinHeight = 388
  Constraints.MinWidth = 714
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 706
    Height = 93
    DesignSize = (
      706
      93)
    object gbPeriodo: TGroupBox
      Left = 3
      Top = 0
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
    object gbEmpresa: TGroupBox
      Left = 79
      Top = 0
      Width = 625
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Empresa '
      TabOrder = 1
      DesignSize = (
        625
        44)
      inline fraEmpresa: TfraEmpresa
        Left = 8
        Top = 15
        Width = 607
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
          607
          21)
        inherited lbContrato: TLabel
          Left = 505
        end
        inherited edContrato: TIntEdit
          Left = 550
        end
        inherited cmbRSocial: TArtComboBox
          Width = 368
        end
      end
    end
    object gbSector: TGroupBox
      Left = 3
      Top = 44
      Width = 376
      Height = 44
      Caption = ' Sector '
      TabOrder = 2
      DesignSize = (
        376
        44)
      inline fraSector: TfraStaticCTB_TABLAS
        Left = 8
        Top = 14
        Width = 362
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          362
          23)
        inherited cmbDescripcion: TComboGrid
          Width = 298
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
    object gbHolding: TGroupBox
      Left = 383
      Top = 44
      Width = 321
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Holding'
      TabOrder = 3
      DesignSize = (
        321
        44)
      inline fraHolding: TfraCodDesc
        Left = 8
        Top = 14
        Width = 308
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          308
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 243
        end
        inherited Propiedades: TPropiedadesFrame
          FieldBaja = 'GE_FECHABAJA'
          FieldCodigo = 'GE_CODIGO'
          FieldDesc = 'GE_DESCRIPCION'
          FieldID = 'GE_ID'
          IdType = ctInteger
          ShowBajas = True
          TableName = 'AGE_GRUPOECONOMICO'
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 93
    Width = 706
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 702
      end>
    inherited ToolBar: TToolBar
      Width = 689
      inherited tbImprimir: TToolButton
        DropdownMenu = pmnuImprimir
        Style = tbsDropDown
      end
      inherited tbExportar: TToolButton
        Left = 252
      end
      inherited tbEnviarMail: TToolButton
        Left = 275
      end
      inherited ToolButton8: TToolButton
        Left = 298
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 306
      end
      inherited tbMaxRegistros: TToolButton
        Left = 329
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Left = 352
      end
      inherited tbSalir: TToolButton
        Left = 360
        Visible = False
      end
      object ToolButton2: TToolButton
        Left = 383
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbGenerarTabla: TToolButton
        Left = 391
        Top = 0
        Hint = 'Generar Tabla (Ctrl+G)'
        ImageIndex = 15
        OnClick = tbGenerarTablaClick
      end
      object tbTotalesRegGrilla: TToolButton
        Left = 414
        Top = 0
        ImageIndex = 23
      end
      object ToolButton1: TToolButton
        Left = 437
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 445
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        Caption = 'tbSalir2'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 122
    Width = 706
    Height = 239
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIT'
        Title.Alignment = taCenter
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 199
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
        Expanded = False
        FieldName = 'SECTOR'
        Title.Alignment = taCenter
        Title.Caption = 'Sector'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HOLDING'
        Title.Alignment = taCenter
        Title.Caption = 'Holding'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MASA_ILT'
        Title.Alignment = taCenter
        Title.Caption = 'Masa ILT'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MASA_PROM_ILT'
        Title.Alignment = taCenter
        Title.Caption = 'Masa Promedio ILT'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ILT'
        Title.Alignment = taCenter
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRIMA_IBNR'
        Title.Alignment = taCenter
        Title.Caption = 'Prima IBNR'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IBNR'
        Title.Alignment = taCenter
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRIMA_IBNER'
        Title.Alignment = taCenter
        Title.Caption = 'Prima IBNER'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IBNER'
        Title.Alignment = taCenter
        Width = 82
        Visible = True
      end>
  end
  object fpGenerarTabla: TFormPanel [3]
    Left = 256
    Top = 200
    Width = 160
    Height = 80
    Caption = 'Generar Tabla'
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    Constraints.MaxHeight = 80
    Constraints.MaxWidth = 160
    Constraints.MinHeight = 80
    Constraints.MinWidth = 160
    object Label1: TLabel
      Left = 11
      Top = 14
      Width = 39
      Height = 13
      Caption = 'Periodo:'
    end
    object btnAceptar: TButton
      Left = 10
      Top = 48
      Width = 64
      Height = 25
      Caption = '&Aceptar'
      TabOrder = 1
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 87
      Top = 48
      Width = 64
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 2
      OnClick = btnCancelarClick
    end
    object ppPeriodoReserva: TPeriodoPicker
      Left = 55
      Top = 10
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
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT em_cuit cuit, em_nombre nombre, afiliacion.get_ultcontrat' +
        'o(em_cuit) contrato, em_sector sector, ge_codigo holding,'
      
        '       rc_masailt masa_ilt, rc_masapromilt masa_prom_ilt, rc_ilt' +
        ' ilt, rc_primaibnr prima_ibnr, rc_ibnr ibnr,'
      '       rc_primaibner prima_ibner, rc_ibner ibner'
      '  FROM aem_empresa, orc_reservacuit, age_grupoeconomico'
      ' WHERE em_cuit = rc_cuit'
      '   AND em_idgrupoeconomico = ge_id(+)'
      '')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
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
        Key = 16455
        LinkControl = tbGenerarTabla
      end>
  end
  object pmnuImprimir: TPopupMenu
    Left = 144
    Top = 200
    object mnuImprimirResultados: TMenuItem
      Caption = 'Imprimir Resultados'
      OnClick = mnuImprimirResultadosClick
    end
    object mnuImprimirCalcReservas: TMenuItem
      Caption = 'C'#225'lculo de Reservas'
      OnClick = mnuImprimirCalcReservasClick
    end
  end
end
