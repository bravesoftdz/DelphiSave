inherited frmPonderadoresTipoSiniestro: TfrmPonderadoresTipoSiniestro
  Left = 456
  Top = 182
  Caption = 'Ponderadores por Tipo de Siniestro'
  ClientWidth = 752
  Position = poOwnerFormCenter
  ExplicitWidth = 760
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 752
    ExplicitWidth = 752
  end
  inherited CoolBar: TCoolBar
    Width = 752
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 746
      end>
    ExplicitWidth = 752
    inherited ToolBar: TToolBar
      Width = 739
      ExplicitWidth = 739
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
      inherited ToolButton3: TToolButton
        Visible = False
      end
      inherited tbOrdenar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 752
    Columns = <
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'pt_capitasdesde'
        Title.Alignment = taRightJustify
        Title.Caption = 'C'#225'pitas Desde'
        Width = 93
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'pt_capitashasta'
        Title.Alignment = taRightJustify
        Title.Caption = 'C'#225'pitas Hasta'
        Width = 85
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PT_ILTREFCARTERA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Ponderador ILT - Valor Referencia Cartera'
        Width = 216
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PT_ILTREFCUIT'
        Title.Alignment = taRightJustify
        Title.Caption = 'Ponderador ILT - Valor Referencia CUIT'
        Width = 208
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PT_INCAP050REFCARTERA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Ponderador INCAP 0-50 - Valor Referencia Cartera'
        Width = 251
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PT_INCAP050REFCUIT'
        Title.Alignment = taRightJustify
        Title.Caption = 'Ponderador INCAP 0-50 - Valor Referencia CUIT'
        Width = 237
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PT_INCAP5066REFCARTERA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Ponderador INCAP 50-66 - Valor Referencia Cartera'
        Width = 267
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PT_INCAP5066REFCUIT'
        Title.Alignment = taRightJustify
        Title.Caption = 'Ponderador INCAP 50-66 - Valor Referencia CUIT'
        Width = 253
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PT_INCAP66100REFCARTERA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Ponderador INCAP 66-100 - Valor Referencia Cartera'
        Width = 267
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PT_INCAP66100REFCUIT'
        Title.Alignment = taRightJustify
        Title.Caption = 'Ponderador INCAP 66-100 - Valor Referencia CUIT'
        Width = 253
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PT_MUERTEREFCARTERA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Ponderador Muerte - Valor Referencia Cartera'
        Width = 234
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PT_MUERTEREFCUIT'
        Title.Alignment = taRightJustify
        Title.Caption = 'Ponderador Muerte - Valor Referencia CUIT'
        Width = 222
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PT_ILTMINIMOFREC'
        Title.Alignment = taRightJustify
        Title.Caption = 'Frecuencia M'#237'nima ILT'
        Width = 125
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PT_ILTMAXIMOFREC'
        Title.Alignment = taRightJustify
        Title.Caption = 'Frecuencia M'#225'xima ILT'
        Width = 130
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PT_INCAP050MINIMOFREC'
        Title.Alignment = taRightJustify
        Title.Caption = 'Frecuencia M'#237'nima INCAP 0-50'
        Width = 164
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PT_INCAP050MAXIMOFREC'
        Title.Alignment = taRightJustify
        Title.Caption = 'Frecuencia M'#225'xima INCAP 0-50'
        Width = 154
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PT_INCAP050MINIMOINCAP'
        Title.Alignment = taRightJustify
        Title.Caption = 'Incapacidad M'#237'nima INCAP 0-50'
        Width = 174
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PT_INCAP050MAXIMOINCAP'
        Title.Alignment = taRightJustify
        Title.Caption = 'Incapacidad M'#225'xima INCAP 0-50'
        Width = 174
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PT_INCAP5066MINIMOFREC'
        Title.Alignment = taRightJustify
        Title.Caption = 'Frecuencia M'#237'nima INCAP 50-66'
        Width = 166
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PT_INCAP5066MAXIMOFREC'
        Title.Alignment = taRightJustify
        Title.Caption = 'Frecuencia M'#225'xima INCAP 50-66'
        Width = 172
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PT_INCAP5066MINIMOINCAP'
        Title.Alignment = taRightJustify
        Title.Caption = 'Incapacidad M'#237'nima INCAP 50-66'
        Width = 178
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PT_INCAP5066MAXIMOINCAP'
        Title.Alignment = taRightJustify
        Title.Caption = 'Incapacidad M'#225'xima INCAP 50-66'
        Width = 183
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PT_INCAP66100MINIMOFREC'
        Title.Alignment = taRightJustify
        Title.Caption = 'Frecuencia M'#237'nima INCAP 66-100'
        Width = 175
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PT_INCAP66100MAXIMOFREC'
        Title.Alignment = taRightJustify
        Title.Caption = 'Frecuencia M'#225'xima INCAP 66-100'
        Width = 181
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PT_INCAP66100MINIMOINCAP'
        Title.Alignment = taRightJustify
        Title.Caption = 'Incapacidad M'#237'nima INCAP 66-100'
        Width = 180
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PT_INCAP66100MAXIMOINCAP'
        Title.Alignment = taRightJustify
        Title.Caption = 'Incapacidad M'#225'xima INCAP 66-100'
        Width = 188
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PT_MUERTEMINIMOFREC'
        Title.Alignment = taRightJustify
        Title.Caption = 'Frecuencia M'#237'nima Muerte'
        Width = 137
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PT_MUERTEMAXIMOFREC'
        Title.Alignment = taRightJustify
        Title.Caption = 'Frecuencia M'#225'xima Muerte'
        Width = 143
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PT_FECHAMODIF'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha '#218'ltima Modificaci'#243'n'
        Width = 149
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PT_USUMODIF'
        Title.Caption = 'Usuario '#218'ltima Modificaci'#243'n'
        Width = 149
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 36
    Top = 120
    Width = 704
    Height = 256
    Caption = 'Ponderadores'
    BorderStyle = bsDialog
    ActiveControl = edPT_ILTREFCARTERA
    ExplicitLeft = 36
    ExplicitTop = 120
    ExplicitWidth = 704
    ExplicitHeight = 256
    DesignSize = (
      704
      256)
    inherited BevelAbm: TBevel
      Top = 220
      Width = 696
      ExplicitTop = 180
      ExplicitWidth = 696
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 72
      Width = 31
      Height = 13
      Caption = 'Sector'
    end
    object Label2: TLabel [2]
      Left = 196
      Top = 48
      Width = 80
      Height = 40
      Alignment = taCenter
      AutoSize = False
      Caption = 'Ponderador Valor Referencia Cartera'
      WordWrap = True
    end
    object Label3: TLabel [3]
      Left = 280
      Top = 48
      Width = 80
      Height = 40
      Alignment = taCenter
      AutoSize = False
      Caption = 'Ponderador Valor Referencia CUIT'
      WordWrap = True
    end
    object Label4: TLabel [4]
      Left = 364
      Top = 56
      Width = 80
      Height = 32
      Alignment = taCenter
      AutoSize = False
      Caption = 'Frecuencia M'#237'nima'
      WordWrap = True
    end
    object Label5: TLabel [5]
      Left = 448
      Top = 56
      Width = 80
      Height = 32
      Alignment = taCenter
      AutoSize = False
      Caption = 'Frecuencia M'#225'xima'
      WordWrap = True
    end
    object Label6: TLabel [6]
      Left = 532
      Top = 56
      Width = 80
      Height = 32
      Alignment = taCenter
      AutoSize = False
      Caption = 'Incapacidad M'#237'nima'
      WordWrap = True
    end
    object Label7: TLabel [7]
      Left = 616
      Top = 56
      Width = 80
      Height = 32
      Alignment = taCenter
      AutoSize = False
      Caption = 'Incapacidad M'#225'xima'
      WordWrap = True
    end
    object Label8: TLabel [8]
      Left = 536
      Top = 92
      Width = 80
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '-'
    end
    object Label9: TLabel [9]
      Left = 616
      Top = 92
      Width = 80
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '-'
    end
    object Label10: TLabel [10]
      Left = 532
      Top = 188
      Width = 80
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '-'
    end
    object Label11: TLabel [11]
      Left = 616
      Top = 188
      Width = 80
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '-'
    end
    object Label12: TLabel [12]
      Left = 450
      Top = 187
      Width = 80
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '-'
    end
    object Label13: TLabel [13]
      Left = 450
      Top = 163
      Width = 80
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '-'
    end
    object Label14: TLabel [14]
      Left = 450
      Top = 139
      Width = 80
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '-'
    end
    object Label15: TLabel [15]
      Left = 366
      Top = 139
      Width = 80
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'V. Cartera'
    end
    object Label16: TLabel [16]
      Left = 366
      Top = 163
      Width = 80
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'V. Cartera'
    end
    object Label17: TLabel [17]
      Left = 366
      Top = 187
      Width = 80
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'V. Cartera'
    end
    object Label18: TLabel [18]
      Left = 8
      Top = 28
      Width = 80
      Height = 13
      Caption = 'Cantidad C'#225'pitas'
    end
    object Label19: TLabel [19]
      Left = 219
      Top = 5
      Width = 31
      Height = 13
      Caption = 'Desde'
    end
    object Label20: TLabel [20]
      Left = 307
      Top = 5
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    inherited btnAceptar: TButton
      Left = 544
      Top = 226
      Width = 72
      TabOrder = 25
      ExplicitLeft = 544
      ExplicitTop = 186
      ExplicitWidth = 72
    end
    inherited btnCancelar: TButton
      Left = 624
      Top = 226
      Width = 72
      TabOrder = 26
      ExplicitLeft = 624
      ExplicitTop = 186
      ExplicitWidth = 72
    end
    object edIlt: TEdit
      Left = 8
      Top = 88
      Width = 184
      Height = 21
      TabStop = False
      TabOrder = 0
      Text = 'ILT'
    end
    object edIncap050: TEdit
      Left = 8
      Top = 112
      Width = 184
      Height = 21
      TabStop = False
      TabOrder = 5
      Text = 'INCAP 0-50'
    end
    object edIncap5066: TEdit
      Left = 8
      Top = 136
      Width = 184
      Height = 21
      TabStop = False
      TabOrder = 12
      Text = 'INCAP 50-66'
    end
    object edIncap66100: TEdit
      Left = 8
      Top = 160
      Width = 184
      Height = 21
      TabStop = False
      TabOrder = 17
      Text = 'INCAP 66-100 Y GRAN INVALIDEZ'
    end
    object edMuerte: TEdit
      Left = 8
      Top = 184
      Width = 184
      Height = 21
      TabStop = False
      TabOrder = 22
      Text = 'MUERTE'
    end
    object edPT_ILTREFCARTERA: TCurrencyEdit
      Left = 196
      Top = 87
      Width = 80
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DisplayFormat = ',0.00;-,0.00'
      TabOrder = 1
    end
    object edPT_INCAP050REFCARTERA: TCurrencyEdit
      Left = 196
      Top = 112
      Width = 80
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DisplayFormat = ',0.00;-,0.00'
      TabOrder = 6
    end
    object edPT_INCAP5066REFCARTERA: TCurrencyEdit
      Left = 196
      Top = 136
      Width = 80
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DisplayFormat = ',0.00;-,0.00'
      TabOrder = 13
    end
    object edPT_INCAP66100REFCARTERA: TCurrencyEdit
      Left = 196
      Top = 160
      Width = 80
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DisplayFormat = ',0.00;-,0.00'
      TabOrder = 18
    end
    object edPT_MUERTEREFCARTERA: TCurrencyEdit
      Left = 196
      Top = 184
      Width = 80
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DisplayFormat = ',0.00;-,0.00'
      TabOrder = 23
    end
    object edPT_ILTREFCUIT: TCurrencyEdit
      Left = 280
      Top = 88
      Width = 80
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DisplayFormat = ',0.00;-,0.00'
      TabOrder = 2
    end
    object edPT_INCAP050REFCUIT: TCurrencyEdit
      Left = 280
      Top = 112
      Width = 80
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DisplayFormat = ',0.00;-,0.00'
      TabOrder = 7
    end
    object edPT_INCAP5066REFCUIT: TCurrencyEdit
      Left = 280
      Top = 136
      Width = 80
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DisplayFormat = ',0.00;-,0.00'
      TabOrder = 14
    end
    object edPT_INCAP66100REFCUIT: TCurrencyEdit
      Left = 280
      Top = 160
      Width = 80
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DisplayFormat = ',0.00;-,0.00'
      TabOrder = 19
    end
    object edPT_MUERTEREFCUIT: TCurrencyEdit
      Left = 280
      Top = 184
      Width = 80
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DisplayFormat = ',0.00;-,0.00'
      TabOrder = 24
    end
    object edPT_ILTMINIMOFREC: TCurrencyEdit
      Left = 364
      Top = 88
      Width = 80
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DisplayFormat = ',0.00;-,0.00'
      TabOrder = 3
    end
    object edPT_INCAP050MINIMOFREC: TCurrencyEdit
      Left = 364
      Top = 112
      Width = 80
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DisplayFormat = ',0.00;-,0.00'
      TabOrder = 8
    end
    object edPT_ILTMAXIMOFREC: TCurrencyEdit
      Left = 448
      Top = 88
      Width = 80
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DisplayFormat = ',0.00;-,0.00'
      TabOrder = 4
    end
    object edPT_INCAP050MAXIMOFREC: TCurrencyEdit
      Left = 448
      Top = 112
      Width = 80
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DisplayFormat = ',0.00;-,0.00'
      TabOrder = 9
    end
    object edPT_INCAP050MINIMOINCAP: TCurrencyEdit
      Left = 532
      Top = 112
      Width = 80
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DisplayFormat = ',0.00;-,0.00'
      TabOrder = 10
    end
    object edPT_INCAP5066MINIMOINCAP: TCurrencyEdit
      Left = 532
      Top = 136
      Width = 80
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DisplayFormat = ',0.00;-,0.00'
      TabOrder = 15
    end
    object edPT_INCAP66100MINIMOINCAP: TCurrencyEdit
      Left = 532
      Top = 160
      Width = 80
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DisplayFormat = ',0.00;-,0.00'
      TabOrder = 20
    end
    object edPT_INCAP050MAXIMOINCAP: TCurrencyEdit
      Left = 616
      Top = 112
      Width = 80
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DisplayFormat = ',0.00;-,0.00'
      TabOrder = 11
    end
    object edPT_INCAP5066MAXIMOINCAP: TCurrencyEdit
      Left = 616
      Top = 136
      Width = 80
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DisplayFormat = ',0.00;-,0.00'
      TabOrder = 16
    end
    object edPT_INCAP66100MAXIMOINCAP: TCurrencyEdit
      Left = 616
      Top = 160
      Width = 80
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DisplayFormat = ',0.00;-,0.00'
      TabOrder = 21
    end
    object edDesde: TIntEdit
      Left = 196
      Top = 24
      Width = 80
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 27
      Text = 'edDesde'
    end
    object edHasta: TIntEdit
      Left = 280
      Top = 24
      Width = 80
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 28
      Text = 'edHasta'
    end
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
