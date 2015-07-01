inherited frmSemaforosConcepto: TfrmSemaforosConcepto
  Left = 80
  Top = 75
  Width = 559
  Height = 400
  Caption = 'Sem'#225'foros por Concepto'
  Constraints.MinHeight = 400
  Constraints.MinWidth = 342
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 551
    Height = 4
  end
  inherited CoolBar: TCoolBar
    Top = 4
    Width = 551
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 547
      end>
    inherited ToolBar: TToolBar
      Width = 534
      inherited tbModificar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 33
    Width = 551
    Height = 340
    Columns = <
      item
        Expanded = False
        FieldName = 'PS_MES'
        Title.Alignment = taCenter
        Title.Caption = 'Mes'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PS_LIMITEINFERIOR'
        Title.Alignment = taCenter
        Title.Caption = 'L'#237'mite Inferior'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PS_LIMITESUPERIOR'
        Title.Alignment = taCenter
        Title.Caption = 'L'#237'mite Superior'
        Width = 95
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 84
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 120
    Top = 131
    Width = 191
    Height = 124
    BorderStyle = bsDialog
    DesignSize = (
      191
      124)
    inherited BevelAbm: TBevel
      Top = 88
      Width = 183
    end
    object Label1: TLabel [1]
      Left = 9
      Top = 14
      Width = 75
      Height = 13
      AutoSize = False
      Caption = 'Mes'
    end
    object Label2: TLabel [2]
      Left = 9
      Top = 41
      Width = 75
      Height = 13
      AutoSize = False
      Caption = 'L'#237'mite Inferior'
    end
    object Label3: TLabel [3]
      Left = 9
      Top = 66
      Width = 75
      Height = 13
      AutoSize = False
      Caption = 'L'#237'mite Superior'
    end
    inherited btnAceptar: TButton
      Left = 33
      Top = 94
      TabOrder = 3
    end
    inherited btnCancelar: TButton
      Left = 111
      Top = 94
      TabOrder = 4
    end
    object edMes: TIntEdit
      Left = 89
      Top = 10
      Width = 46
      Height = 21
      TabOrder = 0
      Text = '1'
      MaxLength = 2
      MaxValue = 12
      MinValue = 1
      Value = 1
    end
    object edLimiteInferior: TCurrencyEdit
      Left = 89
      Top = 37
      Width = 88
      Height = 21
      AutoSize = False
      DecimalPlaces = 3
      DisplayFormat = '$ ,0.000;-$ ,0.000'
      MaxValue = 999.999000000000000000
      MinValue = -999.999000000000000000
      TabOrder = 1
    end
    object edLimiteSuperior: TCurrencyEdit
      Left = 89
      Top = 63
      Width = 88
      Height = 21
      AutoSize = False
      DecimalPlaces = 3
      DisplayFormat = '$ ,0.000;-$ ,0.000'
      MaxValue = 999.999000000000000000
      MinValue = -999.999000000000000000
      TabOrder = 2
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT PE_ID, PE_CIADESDE, PE_CTADESDE,'
      '       PE_CCDESDE, PE_PCIADESDE, PE_PRESTDESDE,'
      '       PE_SUBPRESTDESDE, PE_CIAHASTA, PE_CTAHASTA, PE_CCHASTA,'
      '       PE_PCIAHASTA, PE_PRESTHASTA, PE_SUBPRESTHASTA,'
      '       PE_FECHABAJA'
      '  FROM CONT.OPE_PRESUPUESTOCONCCUENTA'
      ' WHERE 1 = 2'
      '')
    Left = 16
    Top = 104
  end
  inherited dsConsulta: TDataSource
    Left = 44
    Top = 104
  end
  inherited SortDialog: TSortDialog
    Left = 16
    Top = 132
  end
  inherited ExportDialog: TExportDialog
    Left = 44
    Top = 132
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxPortrait
    PageSize = psLetter
    Left = 44
    Top = 160
  end
  inherited Seguridad: TSeguridad
    Left = 16
    Top = 76
  end
  inherited FormStorage: TFormStorage
    Left = 44
    Top = 76
  end
  inherited PrintDialog: TPrintDialog
    Left = 16
    Top = 160
  end
  inherited ShortCutControl: TShortCutControl
    Left = 72
    Top = 76
  end
  inherited FieldHider: TFieldHider
    Left = 72
    Top = 104
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
    Left = 102
    Top = 76
  end
end
