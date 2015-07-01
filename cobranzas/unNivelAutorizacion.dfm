inherited frmNivelAutorizacion: TfrmNivelAutorizacion
  Left = 24
  Top = 72
  Width = 761
  Height = 500
  Caption = 'Nivel de Autorizaci'#243'n - Plan de Pago'
  Constraints.MinHeight = 500
  Constraints.MinWidth = 730
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 753
    Height = 13
  end
  inherited CoolBar: TCoolBar
    Top = 13
    Width = 753
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 749
      end>
    inherited ToolBar: TToolBar
      Width = 736
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
    Width = 753
    Height = 431
    Columns = <
      item
        Expanded = False
        FieldName = 'CATEGORIA'
        Title.Caption = 'Categor'#237'a'
        Width = 132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTODEUDA'
        Title.Alignment = taCenter
        Title.Caption = 'Deuda Nominal Hasta'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUOTADEUDA'
        Title.Alignment = taCenter
        Title.Caption = 'Cantidad Cuotas Adeudadas'
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUOTAFINANC'
        Title.Alignment = taCenter
        Title.Caption = 'Cantidad Cuotas a Financiar'
        Width = 139
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUITAINTMORAFINANC'
        Title.Alignment = taCenter
        Title.Caption = 'Quita Inter'#233's Mora si Financia'
        Width = 146
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUITAINTMORACONT'
        Title.Alignment = taCenter
        Title.Caption = 'Quita Inter'#233's Mora Pago Contado'
        Width = 164
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUITAINTFINANC'
        Title.Alignment = taCenter
        Title.Caption = 'Quita Inter'#233's Financiaci'#243'n'
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANTICIPO'
        Title.Alignment = taCenter
        Title.Caption = 'Anticipo M'#237'nimo'
        Width = 90
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
    Height = 223
    BorderStyle = bsDialog
    DesignSize = (
      487
      223)
    inherited BevelAbm: TBevel
      Top = 187
      Width = 479
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 10
      Width = 198
      Height = 13
      AutoSize = False
      Caption = 'Categor'#237'a'
    end
    object Label3: TLabel [2]
      Left = 8
      Top = 33
      Width = 198
      Height = 13
      AutoSize = False
      Caption = 'Deuda Nominal Hasta'
    end
    object Label2: TLabel [3]
      Left = 8
      Top = 55
      Width = 198
      Height = 13
      AutoSize = False
      Caption = 'Cantidad de Cuotas Adeudadas'
    end
    object Label4: TLabel [4]
      Left = 8
      Top = 78
      Width = 198
      Height = 13
      AutoSize = False
      Caption = 'Cantidad de Cuotas a Financiar'
    end
    object Label5: TLabel [5]
      Left = 8
      Top = 99
      Width = 198
      Height = 13
      AutoSize = False
      Caption = 'Quita Inter'#233's por Mora si Financia'
    end
    object Label6: TLabel [6]
      Left = 8
      Top = 121
      Width = 198
      Height = 13
      AutoSize = False
      Caption = 'Quita Inter'#233's por Mora en Pago Contado'
    end
    object Label7: TLabel [7]
      Left = 8
      Top = 143
      Width = 198
      Height = 13
      AutoSize = False
      Caption = 'Quita Inter'#233's por Financiaci'#243'n'
    end
    object Label8: TLabel [8]
      Left = 8
      Top = 165
      Width = 198
      Height = 13
      AutoSize = False
      Caption = 'Anticipo M'#237'nimo'
    end
    inherited btnAceptar: TButton
      Left = 329
      Top = 193
      TabOrder = 8
    end
    inherited btnCancelar: TButton
      Left = 407
      Top = 193
      TabOrder = 9
    end
    inline fraCategoria: TfraStaticCodigoDescripcion
      Left = 204
      Top = 6
      Width = 277
      Height = 23
      TabOrder = 0
      DesignSize = (
        277
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 214
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
    object edDeudaNominalHasta: TCurrencyEdit
      Left = 205
      Top = 30
      Width = 92
      Height = 21
      AutoSize = False
      MaxLength = 12
      MaxValue = 9999999999.000000000000000000
      TabOrder = 1
    end
    object edCantCuotasAdeudadas: TIntEdit
      Left = 205
      Top = 52
      Width = 54
      Height = 21
      TabOrder = 2
      Text = '0'
      MaxLength = 8
    end
    object edCantCuotasFinanciar: TIntEdit
      Left = 205
      Top = 74
      Width = 54
      Height = 21
      TabOrder = 3
      Text = '0'
      MaxLength = 8
    end
    object edPorcQuitaIntMoraFinancia: TCurrencyEdit
      Left = 205
      Top = 96
      Width = 54
      Height = 21
      AutoSize = False
      DisplayFormat = '% ,0.00;-% ,0.00'
      MaxValue = 100.000000000000000000
      TabOrder = 4
    end
    object edPorcQuitaIntMoraContado: TCurrencyEdit
      Left = 205
      Top = 118
      Width = 54
      Height = 21
      AutoSize = False
      DisplayFormat = '% ,0.00;-% ,0.00'
      MaxValue = 100.000000000000000000
      TabOrder = 5
    end
    object edPorcQuitaIntFinanciacion: TCurrencyEdit
      Left = 205
      Top = 140
      Width = 54
      Height = 21
      AutoSize = False
      DisplayFormat = '% ,0.00;-% ,0.00'
      MaxValue = 100.000000000000000000
      TabOrder = 6
    end
    object edPorcAnticipoMin: TCurrencyEdit
      Left = 205
      Top = 162
      Width = 54
      Height = 21
      AutoSize = False
      DisplayFormat = '% ,0.00;-% ,0.00'
      MaxValue = 100.000000000000000000
      TabOrder = 7
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
    PageOrientation = pxLandscape
    PageSize = psLegal
    Zoom = 90
    Options = [qoZoomPrint, qoZoomCalcFontSize]
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
