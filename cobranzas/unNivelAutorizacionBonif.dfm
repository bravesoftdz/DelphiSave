inherited frmNivelAutorizacionBonif: TfrmNivelAutorizacionBonif
  Left = 24
  Top = 72
  Width = 730
  Height = 500
  Caption = 'Nivel de Autorizaci'#243'n - Bonificaci'#243'n'
  Constraints.MinHeight = 500
  Constraints.MinWidth = 730
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 722
    Height = 13
  end
  inherited CoolBar: TCoolBar
    Top = 13
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
      inherited tbModificar: TToolButton
        Visible = False
      end
      object ToolButton1: TToolButton
        Left = 370
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object pnlBusqueda: TPanel
        Left = 378
        Top = 0
        Width = 91
        Height = 22
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object chkSoloActivos: TCheckBox
          Left = 4
          Top = 2
          Width = 83
          Height = 17
          Caption = 'Solo Activos'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 42
    Width = 722
    Height = 431
    Columns = <
      item
        Expanded = False
        FieldName = 'CATEGORIA'
        Title.Caption = 'Categor'#237'a'
        Width = 272
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTOHASTA'
        Title.Alignment = taCenter
        Title.Caption = 'Monto Hasta'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCHASTA'
        Title.Alignment = taCenter
        Title.Caption = 'Porc. Cuota Promedio'
        Width = 112
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Baja'
        Width = 70
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 164
    Top = 136
    Width = 487
    Height = 115
    BorderStyle = bsDialog
    DesignSize = (
      487
      115)
    inherited BevelAbm: TBevel
      Top = 79
      Width = 479
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 10
      Width = 108
      Height = 13
      AutoSize = False
      Caption = 'Categor'#237'a'
    end
    object Label3: TLabel [2]
      Left = 8
      Top = 56
      Width = 108
      Height = 13
      AutoSize = False
      Caption = 'Monto Hasta'
    end
    object Label5: TLabel [3]
      Left = 8
      Top = 33
      Width = 108
      Height = 13
      AutoSize = False
      Caption = 'Porc. Cuota Promedio'
    end
    inherited btnAceptar: TButton
      Left = 329
      Top = 85
      TabOrder = 3
    end
    inherited btnCancelar: TButton
      Left = 407
      Top = 85
      TabOrder = 4
    end
    inline fraCategoria: TfraStaticCodigoDescripcion
      Left = 116
      Top = 6
      Width = 365
      Height = 23
      TabOrder = 0
      DesignSize = (
        365
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 302
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
    object edMontoHasta: TCurrencyEdit
      Left = 117
      Top = 53
      Width = 92
      Height = 21
      AutoSize = False
      MaxLength = 12
      MaxValue = 9999999999.000000000000000000
      TabOrder = 2
    end
    object edPorcCuotaProm: TCurrencyEdit
      Left = 117
      Top = 30
      Width = 60
      Height = 21
      AutoSize = False
      DisplayFormat = '% ,0.00;-% ,0.00'
      MaxValue = 100.000000000000000000
      TabOrder = 1
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT NA_DESCRIPCION CATEGORIA, CC_MONTODEUDA MONTODEUDA, CC_CU' +
        'OTADEUDA CUOTADEUDA,'
      
        '  '#9'   CC_CUOTAFINANC CUOTAFINANC, CC_QUITAINTMORAFINANC QUITAINT' +
        'MORAFINANC,'
      
        #9'     CC_QUITAINTMORACONT QUITAINTMORACONT, CC_QUITAINTFINANC QU' +
        'ITAINTFINANC,'
      '  '#9'   CC_ANTICIPO ANTICIPO, CC_FECHABAJA FECHABAJA, CC_ID'
      '  FROM ZNA_NIVELAUTORIZACION, ZCC_CONTROLCOBRANZA'
      ' WHERE NA_ID = CC_IDNIVELAUTORIZA'
      '')
    Left = 8
    Top = 128
  end
  inherited dsConsulta: TDataSource
    Left = 36
    Top = 128
  end
  inherited SortDialog: TSortDialog
    Left = 8
    Top = 156
  end
  inherited ExportDialog: TExportDialog
    Left = 36
    Top = 156
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxPortrait
    PageSize = psLetter
    Left = 36
    Top = 184
  end
  inherited Seguridad: TSeguridad
    Left = 8
    Top = 100
  end
  inherited FormStorage: TFormStorage
    Left = 36
    Top = 100
  end
  inherited PrintDialog: TPrintDialog
    Left = 8
    Top = 184
  end
  inherited ShortCutControl: TShortCutControl
    Left = 64
    Top = 100
  end
  inherited FieldHider: TFieldHider
    Left = 64
    Top = 128
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
    Left = 95
    Top = 100
  end
end
