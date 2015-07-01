inherited frmManParametros: TfrmManParametros
  Left = 119
  Top = 142
  Caption = 'Par'#225'metros'
  ClientHeight = 320
  ClientWidth = 592
  Constraints.MinHeight = 350
  Constraints.MinWidth = 600
  ExplicitLeft = 119
  ExplicitTop = 142
  ExplicitWidth = 602
  ExplicitHeight = 352
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 592
    Height = 2
    ExplicitWidth = 399
    ExplicitHeight = 2
  end
  inherited CoolBar: TCoolBar
    Top = 2
    Width = 592
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 588
      end>
    ExplicitTop = 2
    ExplicitWidth = 399
    inherited ToolBar: TToolBar
      Width = 579
      ExplicitWidth = 579
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      object pnlBajas: TPanel
        Left = 370
        Top = 0
        Width = 111
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object chkNoMostrarBajas: TCheckBox
          Left = 4
          Top = 3
          Width = 105
          Height = 17
          Caption = 'No Mostrar Bajas'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 31
    Width = 592
    Height = 289
    TitleHeight = 34
    AutoTitleHeight = True
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA'
        Title.Alignment = taCenter
        Title.Caption = 'Vigencia'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MINIMOGESTION'
        Title.Alignment = taCenter
        Title.Caption = 'M'#237'nimo Gesti'#243'n'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GASTOSINTIMACION'
        Title.Alignment = taCenter
        Title.Caption = 'Gastos Intimaci'#243'n'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GASTOSBANCARIOS'
        Title.Alignment = taCenter
        Title.Caption = 'Gastos Bancarios'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MINIMODEUDANOMINAL_PLANES'
        Title.Alignment = taCenter
        Title.Caption = 'M'#237'nimo Deuda Nominal Pl. Pago'
        Width = 126
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MINIMODEVENGADO_INT'
        Title.Alignment = taCenter
        Title.Caption = 'M'#237'nimo Devengado Intereses'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MINIMODEUDA_RESCINDIDAS'
        Title.Alignment = taCenter
        Title.Caption = 'M'#237'nimo Deuida Empr. Rescindidas'
        Width = 104
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 221
    Top = 72
    Width = 246
    Height = 244
    BorderStyle = bsDialog
    ExplicitLeft = 221
    ExplicitTop = 72
    ExplicitWidth = 246
    ExplicitHeight = 244
    DesignSize = (
      246
      244)
    inherited BevelAbm: TBevel
      Top = 208
      Width = 238
      ExplicitTop = 110
      ExplicitWidth = 226
    end
    object Label8: TLabel [1]
      Left = 8
      Top = 40
      Width = 101
      Height = 13
      AutoSize = False
      Caption = 'M'#237'nimo Gesti'#243'n'
    end
    object Label15: TLabel [2]
      Left = 8
      Top = 13
      Width = 101
      Height = 13
      AutoSize = False
      Caption = 'Vigencia'
    end
    object Label1: TLabel [3]
      Left = 8
      Top = 67
      Width = 101
      Height = 13
      AutoSize = False
      Caption = 'Gastos Intimaci'#243'n'
    end
    object Label2: TLabel [4]
      Left = 8
      Top = 95
      Width = 101
      Height = 13
      AutoSize = False
      Caption = 'Gastos Bancarios'
    end
    object Label3: TLabel [5]
      Left = 8
      Top = 119
      Width = 101
      Height = 26
      AutoSize = False
      Caption = 'M'#237'nimo Deuda Nom. Planes Pago'
      WordWrap = True
    end
    object Label4: TLabel [6]
      Left = 8
      Top = 148
      Width = 101
      Height = 26
      AutoSize = False
      Caption = 'M'#237'nimo Devengado Intereses'
      WordWrap = True
    end
    object Label5: TLabel [7]
      Left = 8
      Top = 176
      Width = 101
      Height = 26
      AutoSize = False
      Caption = 'M'#237'nimo Deuda Empr. Rescindidas'
      WordWrap = True
    end
    inherited btnAceptar: TButton
      Left = 88
      Top = 214
      TabOrder = 7
      ExplicitLeft = 76
      ExplicitTop = 116
    end
    inherited btnCancelar: TButton
      Left = 166
      Top = 214
      TabOrder = 8
      ExplicitLeft = 154
      ExplicitTop = 116
    end
    object edMinGestionAltaModif: TCurrencyEdit
      Left = 117
      Top = 36
      Width = 121
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      MaxLength = 15
      TabOrder = 1
    end
    object edFechaAltaModif: TDateComboBox
      Left = 117
      Top = 8
      Width = 92
      Height = 21
      TabOrder = 0
    end
    object edGastosIntimacAltaModif: TCurrencyEdit
      Left = 117
      Top = 64
      Width = 121
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      MaxLength = 15
      TabOrder = 2
    end
    object edGastosBancAltaModif: TCurrencyEdit
      Left = 117
      Top = 92
      Width = 121
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      MaxLength = 15
      TabOrder = 3
    end
    object edMinDeudaNomAltaModif: TCurrencyEdit
      Left = 117
      Top = 121
      Width = 121
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      MaxLength = 15
      TabOrder = 4
    end
    object edMinDevengaIntAltaModif: TCurrencyEdit
      Left = 117
      Top = 151
      Width = 121
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      CheckOnExit = True
      MaxLength = 15
      TabOrder = 5
    end
    object edMinRescindidasAltaModif: TCurrencyEdit
      Left = 117
      Top = 179
      Width = 121
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      MaxLength = 15
      TabOrder = 6
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT PZ_FECHA, PZ_MINIMOGESTION, PZ_GASTOSINTIMACION,'
      '       PZ_GASTOSBANCARIOS'
      '  FROM COB.ZPZ_PARAMETROCOBRANZA'
      'ORDER BY PZ_FECHA')
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
    Left = 112
    Top = 200
  end
end
