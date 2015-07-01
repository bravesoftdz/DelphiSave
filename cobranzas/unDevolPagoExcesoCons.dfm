inherited frmDevolPagoExcesoCons: TfrmDevolPagoExcesoCons
  Left = 35
  Top = 49
  Caption = 'Consulta de Devoluci'#243'n de Pago en Exceso'
  ClientHeight = 494
  ClientWidth = 723
  Constraints.MinHeight = 450
  Constraints.MinWidth = 630
  ExplicitLeft = 35
  ExplicitTop = 49
  ExplicitWidth = 731
  ExplicitHeight = 524
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 723
    Height = 102
    Visible = True
    ExplicitWidth = 723
    ExplicitHeight = 102
    DesignSize = (
      723
      102)
    object gbEmpresa: TGroupBox
      Left = 2
      Top = 1
      Width = 587
      Height = 49
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Empresa '
      TabOrder = 0
      DesignSize = (
        587
        49)
      object Label1: TLabel
        Left = 8
        Top = 22
        Width = 25
        Height = 13
        Caption = 'CUIT'
      end
      inline fraDevContrato: TfraEmpresa
        Left = 36
        Top = 18
        Width = 541
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
        ExplicitWidth = 541
        ExplicitHeight = 21
        DesignSize = (
          541
          21)
        inherited lbRSocial: TLabel
          Left = 88
          ExplicitLeft = 88
        end
        inherited lbContrato: TLabel
          Left = 437
          ExplicitLeft = 437
        end
        inherited edContrato: TIntEdit
          Left = 484
          ExplicitLeft = 484
        end
        inherited cmbRSocial: TArtComboBox
          Width = 302
          ExplicitWidth = 302
        end
      end
    end
    object gbPeriodo: TGroupBox
      Left = 592
      Top = 1
      Width = 129
      Height = 49
      Anchors = [akTop, akRight]
      Caption = ' Per'#237'odo '
      TabOrder = 1
      object Label3: TLabel
        Left = 60
        Top = 22
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edDevPerDesde: TPeriodoPicker
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
      object edDevPerHasta: TPeriodoPicker
        Left = 74
        Top = 18
        Width = 49
        Height = 21
        TabOrder = 1
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
    object GroupBox1: TGroupBox
      Left = 2
      Top = 50
      Width = 720
      Height = 49
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Datos de la Empresa '
      TabOrder = 2
      DesignSize = (
        720
        49)
      object Label2: TLabel
        Left = 8
        Top = 23
        Width = 36
        Height = 13
        Caption = 'Estado:'
      end
      object Label4: TLabel
        Left = 389
        Top = 23
        Width = 36
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'F. Baja:'
      end
      object Label5: TLabel
        Left = 523
        Top = 23
        Width = 34
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Sector:'
      end
      object edContrEstado: TEdit
        Left = 48
        Top = 20
        Width = 331
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object edContrFBaja: TDateComboBox
        Left = 428
        Top = 20
        Width = 88
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 1
      end
      object edContrSector: TEdit
        Left = 561
        Top = 20
        Width = 153
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 2
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 102
    Width = 723
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 717
      end>
    ExplicitTop = 102
    ExplicitWidth = 723
    inherited ToolBar: TToolBar
      Width = 708
      ExplicitWidth = 708
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbModificar: TToolButton
        Hint = 'Modificar Devoluci'#243'n (Ctrl+M)'
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbSumatoria: TToolButton
        Left = 370
        Top = 0
        Hint = 'Sumatoria'
        Caption = 'tbSumatoria'
        ImageIndex = 37
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton1: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbGenerarPago: TToolButton
        Left = 401
        Top = 0
        Hint = 'Generar Pago (Ctrl+G)'
        ImageIndex = 23
        OnClick = tbGenerarPagoClick
      end
      object ToolButton7: TToolButton
        Left = 424
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 7
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
    Top = 131
    Width = 723
    Height = 363
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Expanded = False
        FieldName = 'CODREG'
        Title.Alignment = taCenter
        Title.Caption = 'R'#233'g.'
        Width = 46
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PERIODO'
        Title.Alignment = taCenter
        Title.Caption = 'Periodo'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMITIDO'
        Title.Alignment = taCenter
        Title.Caption = 'Emitido'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAGADO'
        Title.Alignment = taCenter
        Title.Caption = 'Pagado'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RECLAMO_AFIP'
        Title.Alignment = taCenter
        Title.Caption = 'Reclamo AFIP'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AJUSTE_SALDO_ACREEDOR'
        Title.Alignment = taCenter
        Title.Caption = 'Ajuste Sdo. Acreedor'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEVOLUCION'
        Title.Alignment = taCenter
        Title.Caption = 'Devoluci'#243'n'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BENEFICIARIO'
        Title.Caption = 'Beneficiario'
        Width = 254
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 164
    Top = 188
    Width = 457
    Height = 101
    BorderStyle = bsDialog
    ActiveControl = edPE_DEVOLUCION
    ExplicitLeft = 164
    ExplicitTop = 188
    ExplicitWidth = 457
    ExplicitHeight = 101
    inherited BevelAbm: TBevel
      Top = 65
      Width = 449
      ExplicitTop = 39
      ExplicitWidth = 187
    end
    object Label6: TLabel [1]
      Left = 12
      Top = 14
      Width = 65
      Height = 13
      AutoSize = False
      Caption = 'Devoluci'#243'n:'
    end
    object Label7: TLabel [2]
      Left = 12
      Top = 43
      Width = 65
      Height = 13
      AutoSize = False
      Caption = 'Beneficiario:'
    end
    inherited btnAceptar: TButton
      Left = 299
      Top = 71
      TabOrder = 2
      ExplicitLeft = 299
      ExplicitTop = 71
    end
    inherited btnCancelar: TButton
      Left = 377
      Top = 71
      TabOrder = 3
      ExplicitLeft = 377
      ExplicitTop = 71
    end
    object edPE_DEVOLUCION: TCurrencyEdit
      Left = 74
      Top = 11
      Width = 100
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      MaxLength = 12
      TabOrder = 0
      ZeroEmpty = False
    end
    object edPE_BENEFICIARIO: TEdit
      Left = 74
      Top = 41
      Width = 372
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 240
      TabOrder = 1
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT PE_PERIODO PERIODO, PE_EMITIDO EMITIDO, PE_PAGADO PAGADO,' +
        ' PE_RECLAMOAFIP RECLAMO_AFIP,'
      
        '       PE_AJUSTESALDOACREEDOR AJUSTE_SALDO_ACREEDOR, PE_DEVOLUCI' +
        'ON DEVOLUCION'
      '  FROM TPE_DEVOLUCIONPAGOEXCESO'
      ' WHERE 1 = 2'
      '')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxPortrait
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
        LinkControl = tbSalir2
      end
      item
        Key = 16455
        LinkControl = tbGenerarPago
      end>
    Left = 109
    Top = 200
  end
end
