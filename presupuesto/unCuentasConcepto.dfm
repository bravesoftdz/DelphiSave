inherited frmCuentasConcepto: TfrmCuentasConcepto
  Left = 80
  Top = 75
  Width = 630
  Height = 400
  Caption = 'Cuentas por Concepto'
  Constraints.MinHeight = 400
  Constraints.MinWidth = 630
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 622
    Height = 4
  end
  inherited CoolBar: TCoolBar
    Top = 4
    Width = 622
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 618
      end>
    inherited ToolBar: TToolBar
      Width = 605
      inherited tbModificar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 33
    Width = 622
    Height = 340
    Columns = <
      item
        Expanded = False
        FieldName = 'PE_CIADESDE'
        Title.Alignment = taCenter
        Title.Caption = 'Compa'#241#237'a Desde'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PE_CTADESDE'
        Title.Alignment = taCenter
        Title.Caption = 'Cuenta Desde'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PE_CCDESDE'
        Title.Alignment = taCenter
        Title.Caption = 'Centro Costo Desde'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PE_PCIADESDE'
        Title.Alignment = taCenter
        Title.Caption = 'Prov. Desde'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PE_PRESTDESDE'
        Title.Alignment = taCenter
        Title.Caption = 'Prestaci'#243'n Desde'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PE_SUBPRESTDESDE'
        Title.Alignment = taCenter
        Title.Caption = 'SubPrestaci'#243'n Desde'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PE_CIAHASTA'
        Title.Alignment = taCenter
        Title.Caption = 'Compa'#241#237'a Hasta'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PE_CTAHASTA'
        Title.Alignment = taCenter
        Title.Caption = 'Cuenta Hasta'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PE_CCHASTA'
        Title.Alignment = taCenter
        Title.Caption = 'Centro Costo Hasta'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PE_PCIAHASTA'
        Title.Alignment = taCenter
        Title.Caption = 'Prov. Hasta'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PE_PRESTHASTA'
        Title.Alignment = taCenter
        Title.Caption = 'Prestaci'#243'n Hasta'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PE_SUBPRESTHASTA'
        Title.Alignment = taCenter
        Title.Caption = 'SubPrestaci'#243'n Hasta'
        Width = 110
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 76
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 120
    Top = 131
    Width = 307
    Height = 207
    BorderStyle = bsDialog
    DesignSize = (
      307
      207)
    inherited BevelAbm: TBevel
      Top = 171
      Width = 299
    end
    object Label1: TLabel [1]
      Left = 111
      Top = 7
      Width = 85
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Desde'
    end
    object Label2: TLabel [2]
      Left = 210
      Top = 7
      Width = 85
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Hasta'
    end
    object Label3: TLabel [3]
      Left = 12
      Top = 29
      Width = 83
      Height = 13
      AutoSize = False
      Caption = 'Compa'#241#237'a'
    end
    object Label4: TLabel [4]
      Left = 12
      Top = 53
      Width = 83
      Height = 13
      AutoSize = False
      Caption = 'Cuenta'
    end
    object Label5: TLabel [5]
      Left = 12
      Top = 78
      Width = 83
      Height = 13
      AutoSize = False
      Caption = 'Centro de Costo'
    end
    object Label6: TLabel [6]
      Left = 12
      Top = 101
      Width = 83
      Height = 13
      AutoSize = False
      Caption = 'Provincia'
    end
    object Label7: TLabel [7]
      Left = 12
      Top = 125
      Width = 83
      Height = 13
      AutoSize = False
      Caption = 'Prestaci'#243'n'
    end
    object Label8: TLabel [8]
      Left = 12
      Top = 148
      Width = 83
      Height = 13
      AutoSize = False
      Caption = 'SubPrestaci'#243'n'
    end
    inherited btnAceptar: TButton
      Left = 149
      Top = 177
      TabOrder = 12
    end
    inherited btnCancelar: TButton
      Left = 227
      Top = 177
      TabOrder = 13
    end
    object edCiaDesde: TPatternEdit
      Left = 111
      Top = 25
      Width = 85
      Height = 21
      MaxLength = 2
      TabOrder = 0
      Pattern = '0123456789'
    end
    object edCiaHasta: TPatternEdit
      Left = 210
      Top = 25
      Width = 85
      Height = 21
      MaxLength = 2
      TabOrder = 1
      Pattern = '0123456789'
    end
    object edCtaDesde: TPatternEdit
      Left = 111
      Top = 49
      Width = 85
      Height = 21
      MaxLength = 6
      TabOrder = 2
      Pattern = '0123456789'
    end
    object edCtaHasta: TPatternEdit
      Left = 210
      Top = 49
      Width = 85
      Height = 21
      MaxLength = 6
      TabOrder = 3
      Pattern = '0123456789'
    end
    object edCCDesde: TPatternEdit
      Left = 111
      Top = 73
      Width = 85
      Height = 21
      MaxLength = 3
      TabOrder = 4
      Pattern = '0123456789'
    end
    object edCCHasta: TPatternEdit
      Left = 210
      Top = 73
      Width = 85
      Height = 21
      MaxLength = 3
      TabOrder = 5
      Pattern = '0123456789'
    end
    object edPciaDesde: TPatternEdit
      Left = 111
      Top = 97
      Width = 85
      Height = 21
      MaxLength = 2
      TabOrder = 6
      Pattern = '0123456789'
    end
    object edSubPrestDesde: TPatternEdit
      Left = 111
      Top = 145
      Width = 85
      Height = 21
      MaxLength = 4
      TabOrder = 10
      Pattern = '0123456789'
    end
    object edPciaHasta: TPatternEdit
      Left = 210
      Top = 97
      Width = 85
      Height = 21
      MaxLength = 2
      TabOrder = 7
      Pattern = '0123456789'
    end
    object edSubPrestHasta: TPatternEdit
      Left = 210
      Top = 145
      Width = 85
      Height = 21
      MaxLength = 4
      TabOrder = 11
      Pattern = '0123456789'
    end
    object edPrestDesde: TPatternEdit
      Left = 111
      Top = 121
      Width = 85
      Height = 21
      MaxLength = 4
      TabOrder = 8
      Pattern = '0123456789'
    end
    object edPrestHasta: TPatternEdit
      Left = 210
      Top = 121
      Width = 85
      Height = 21
      MaxLength = 4
      TabOrder = 9
      Pattern = '0123456789'
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
    PageOrientation = pxLandscape
    PageSize = psLegal
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
