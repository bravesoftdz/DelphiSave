inherited frmManEmpresasBloqueoILT: TfrmManEmpresasBloqueoILT
  Left = 609
  Top = 224
  Width = 574
  Height = 433
  Caption = 'Empresas con Bloqueo de ILT'
  Constraints.MinHeight = 433
  Constraints.MinWidth = 574
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 566
    Height = 14
  end
  inherited CoolBar: TCoolBar
    Top = 14
    Width = 566
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 562
      end>
    inherited ToolBar: TToolBar
      Width = 549
    end
  end
  inherited Grid: TArtDBGrid
    Top = 43
    Width = 566
    Height = 363
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'BI_CUIT'
        Title.Alignment = taCenter
        Title.Caption = 'CUIT'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 142
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'BI_FECHABASE'
        Title.Alignment = taCenter
        Title.Caption = 'F. Bloqueo Desde'
        Width = 93
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'BI_FECHATOPE'
        Title.Alignment = taCenter
        Title.Caption = 'F. Bloqueo Hasta'
        Width = 94
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'BI_VIGENTE'
        Title.Alignment = taCenter
        Title.Caption = 'Vigente'
        Width = 46
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'BI_FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 71
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 20
    Top = 88
    Width = 533
    Height = 151
    Constraints.MaxHeight = 151
    Constraints.MinHeight = 151
    Constraints.MinWidth = 533
    inherited BevelAbm: TBevel
      Top = 115
      Width = 525
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 14
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    inherited btnAceptar: TButton
      Left = 375
      Top = 121
      TabOrder = 3
    end
    inherited btnCancelar: TButton
      Left = 453
      Top = 121
      TabOrder = 4
    end
    inline fraEmpresaBloqueo: TfraEmpresa
      Left = 40
      Top = 10
      Width = 485
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
      inherited lbContrato: TLabel
        Left = 381
      end
      inherited edContrato: TIntEdit
        Left = 426
      end
      inherited cmbRSocial: TArtComboBox
        Width = 244
      end
    end
    object gbRangoBloqueoFechas: TGroupBox
      Left = 39
      Top = 38
      Width = 189
      Height = 72
      Caption = ' Rango de Fechas de Bloqueo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object lbDesde: TLabel
        Left = 25
        Top = 21
        Width = 34
        Height = 13
        Caption = 'Desde:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbHasta: TLabel
        Left = 25
        Top = 47
        Width = 31
        Height = 13
        Caption = 'Hasta:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edFBloqueoDesde: TDateComboBox
        Left = 74
        Top = 16
        Width = 91
        Height = 21
        MaxDateCombo = edFBloqueoHasta
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object edFBloqueoHasta: TDateComboBox
        Left = 74
        Top = 43
        Width = 90
        Height = 21
        MinDateCombo = edFBloqueoDesde
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
    object chkBloqueoVigente: TCheckBox
      Left = 426
      Top = 92
      Width = 97
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'Bloqueo Vigente'
      TabOrder = 2
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT BI_CUIT, EM_NOMBRE, BI_ID, BI_FECHATOPE, BI_FECHABASE, BI' +
        '_VIGENTE,'
      '       BI_FECHABAJA'
      '  FROM AEM_EMPRESA, SBI_BLOQUEO_ILT'
      ' WHERE BI_CUIT=EM_CUIT'
      '')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxPortrait
    PageSize = psLetter
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
        LinkControl = tbSalir
      end>
  end
end
