inherited frmManValorReferenciaCartera: TfrmManValorReferenciaCartera
  Left = 484
  Top = 91
  ActiveControl = fraActividad.edCodigo
  Caption = 'Valor Referencia Cartera'
  ClientHeight = 538
  ClientWidth = 666
  Constraints.MinHeight = 568
  Constraints.MinWidth = 512
  KeyPreview = True
  Position = poOwnerFormCenter
  ExplicitLeft = 484
  ExplicitTop = 91
  ExplicitWidth = 674
  ExplicitHeight = 568
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 666
    Height = 52
    Visible = True
    ExplicitWidth = 666
    ExplicitHeight = 52
    object GroupBox8: TGroupBox
      Left = 441
      Top = 4
      Width = 224
      Height = 44
      Anchors = [akTop, akRight]
      Caption = ' Vigencia Desde '
      TabOrder = 1
      object Label16: TLabel
        Left = 12
        Top = 20
        Width = 72
        Height = 13
        Caption = 'Mayor o igual a'
      end
      object edVigenciaDesdeBusqueda: TDateComboBox
        Left = 96
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox9: TGroupBox
      Left = 4
      Top = 4
      Width = 433
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Actividad '
      TabOrder = 0
      DesignSize = (
        433
        44)
      object Label21: TLabel
        Left = 8
        Top = 18
        Width = 21
        Height = 13
        Caption = 'CIIU'
      end
      inline fraActividad: TfraStaticActividad
        Left = 36
        Top = 13
        Width = 387
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 36
        ExplicitTop = 13
        ExplicitWidth = 387
        inherited cmbDescripcion: TComboGrid
          Width = 324
          ExplicitWidth = 324
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
  end
  inherited CoolBar: TCoolBar
    Top = 52
    Width = 666
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 660
      end>
    ExplicitTop = 52
    ExplicitWidth = 666
    inherited ToolBar: TToolBar
      Width = 651
      ExplicitWidth = 651
      inherited tbNuevo: TToolButton
        Enabled = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbImprimir: TToolButton
        Visible = False
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = True
      end
      object tbBuscar: TToolButton
        Left = 370
        Top = 0
        Hint = 'Buscar'
        Caption = 'tbBuscar'
        ImageIndex = 14
      end
      object tbImpoExpo: TToolButton
        Left = 393
        Top = 0
        Hint = 'Impo Expo'
        Caption = 'tbImpoExpo'
        ImageIndex = 32
        OnClick = tbImpoExpoClick
      end
      object tbAyudaImpoExpo: TToolButton
        Left = 416
        Top = 0
        Hint = 'Ayuda Impo Expo'
        Caption = 'tbAyudaImpoExpo'
        ImageIndex = 55
        OnClick = tbAyudaImpoExpoClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 81
    Width = 666
    Height = 457
    Columns = <
      item
        Expanded = False
        FieldName = 'AC_CODIGO'
        Title.Caption = 'CIIU'
        Width = 166
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n CIIU'
        Width = 176
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PA_ESPECIESFRECVALORCARTERA'
        Title.Alignment = taCenter
        Title.Caption = 'Especies - Frecuencia'
        Width = 132
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PA_ESPECIESESPVALORCARTERA'
        Title.Alignment = taCenter
        Title.Caption = 'Especies - Prest. Especie'
        Width = 155
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PA_ILTFRECVALORCARTERA'
        Title.Alignment = taCenter
        Title.Caption = 'ILT - Frecuencia'
        Width = 112
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PA_ILTESPVALORCARTERA'
        Title.Alignment = taCenter
        Title.Caption = 'ILT - Prest. Especie'
        Width = 126
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PA_ILTPRESTVALORCARTERA'
        Title.Alignment = taCenter
        Title.Caption = 'ILT - Prest. ILT'
        Width = 97
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PA_INCAP050FRECVALORCARTERA'
        Title.Alignment = taCenter
        Title.Caption = 'Incap 0-50 - Frecuencia'
        Width = 131
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PA_INCAP050ESPVALORCARTERA'
        Title.Alignment = taCenter
        Title.Caption = 'Incap 0-50 - Prest. Especie'
        Width = 152
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PA_INCAP050ILTVALORCARTERA'
        Title.Alignment = taCenter
        Title.Caption = 'Incap 0-50 - Prest. ILT'
        Width = 132
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PA_INCAP050INCAPVALORCARTERA'
        Title.Alignment = taCenter
        Title.Caption = 'Incap 0-50 - Incapacidad'
        Width = 145
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PA_INCAP5066FRECVALORCARTERA'
        Title.Alignment = taCenter
        Title.Caption = 'Incap 50-66 - Frecuencia'
        Width = 141
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PA_INCAP5066ESPVALORCARTERA'
        Title.Alignment = taCenter
        Title.Caption = 'Incap 50-66 - Prest. Especie'
        Width = 153
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PA_INCAP5066ILTVALORCARTERA'
        Title.Alignment = taCenter
        Title.Caption = 'Incap 50-66 - Prest. ILT'
        Width = 140
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PA_INCAP5066INCAPVALORCARTERA'
        Title.Alignment = taCenter
        Title.Caption = 'Incap 50-66 - Incapacidad'
        Width = 147
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PA_INCAP66100FRECVALORCARTERA'
        Title.Alignment = taCenter
        Title.Caption = 'Incap 66-100 - Frecuencia'
        Width = 159
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PA_INCAP66100ESPVALORCARTERA'
        Title.Alignment = taCenter
        Title.Caption = 'Incap 66-100 - Prest. Especie'
        Width = 180
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PA_INCAP66100ILTVALORCARTERA'
        Title.Alignment = taCenter
        Title.Caption = 'Incap 66-100 - Prest. ILT'
        Width = 154
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PA_INCAP66100INCAPVALORCARTERA'
        Title.Alignment = taCenter
        Title.Caption = 'Incap 66-100 - Incapacidad'
        Width = 155
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PA_MUERTEFRECVALORCARTERA'
        Title.Alignment = taCenter
        Title.Caption = 'Muerte - Frecuencia'
        Width = 128
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PA_MUERTEESPVALORCARTERA'
        Title.Alignment = taCenter
        Title.Caption = 'Muerte - Prest. Especie'
        Width = 136
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PA_MUERTEILTVALORCARTERA'
        Title.Alignment = taCenter
        Title.Caption = 'Muerte - Prest. ILT'
        Width = 118
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PA_MUERTEINCAPVALORCARTERA'
        Title.Alignment = taCenter
        Title.Caption = 'Muerte - Incapacidad'
        Width = 128
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PA_JUICIOSFRECVALORCARTERA'
        Title.Alignment = taCenter
        Title.Caption = 'Juicios - Frecuencia'
        Width = 109
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'pa_fechadesde'
        Title.Alignment = taCenter
        Title.Caption = 'Vigencia Desde'
        Width = 104
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'pa_fechahasta'
        Title.Alignment = taCenter
        Title.Caption = 'Vigencia Hasta'
        Width = 98
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 92
    Top = 46
    Width = 560
    Height = 432
    Caption = 'Configuraci'#243'n de Par'#225'metros'
    BorderStyle = bsDialog
    ExplicitLeft = 92
    ExplicitTop = 46
    ExplicitWidth = 560
    ExplicitHeight = 432
    inherited BevelAbm: TBevel
      Top = 396
      Width = 552
      ExplicitTop = 396
      ExplicitWidth = 552
    end
    inherited btnAceptar: TButton
      Left = 400
      Top = 402
      Width = 72
      TabOrder = 8
      ExplicitLeft = 400
      ExplicitTop = 402
      ExplicitWidth = 72
    end
    inherited btnCancelar: TButton
      Left = 480
      Top = 402
      Width = 72
      TabOrder = 9
      ExplicitLeft = 480
      ExplicitTop = 402
      ExplicitWidth = 72
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 544
      Height = 44
      Caption = ' PRESTACIONES EN ESPECIES '
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 20
        Width = 53
        Height = 13
        Caption = 'Frecuencia'
      end
      object Label12: TLabel
        Left = 140
        Top = 20
        Width = 68
        Height = 13
        Caption = 'Prest. Especie'
      end
      object edPA_ESPECIESFRECVALORCARTERA: TCurrencyEdit
        Left = 68
        Top = 16
        Width = 56
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 3
        DisplayFormat = ',0.000%'
        TabOrder = 0
      end
      object edPA_ESPECIESESPVALORCARTERA: TCurrencyEdit
        Left = 216
        Top = 16
        Width = 56
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DisplayFormat = '$ ,0.00'
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 56
      Width = 544
      Height = 44
      Caption = ' ILT '
      TabOrder = 1
      object Label3: TLabel
        Left = 8
        Top = 20
        Width = 53
        Height = 13
        Caption = 'Frecuencia'
      end
      object Label4: TLabel
        Left = 288
        Top = 20
        Width = 46
        Height = 13
        Caption = 'Prest. ILT'
      end
      object Label14: TLabel
        Left = 140
        Top = 20
        Width = 68
        Height = 13
        Caption = 'Prest. Especie'
      end
      object edPA_ILTFRECVALORCARTERA: TCurrencyEdit
        Left = 68
        Top = 16
        Width = 56
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 3
        DisplayFormat = ',0.000%'
        TabOrder = 0
      end
      object edPA_ILTPRESTVALORCARTERA: TCurrencyEdit
        Left = 340
        Top = 16
        Width = 56
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        TabOrder = 2
      end
      object edPA_ILTESPVALORCARTERA: TCurrencyEdit
        Left = 216
        Top = 16
        Width = 56
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DisplayFormat = '$ ,0.00'
        TabOrder = 1
      end
    end
    object GroupBox3: TGroupBox
      Left = 8
      Top = 104
      Width = 544
      Height = 44
      Caption = ' INCAP 0-50 '
      TabOrder = 2
      object Label6: TLabel
        Left = 8
        Top = 20
        Width = 53
        Height = 13
        Caption = 'Frecuencia'
      end
      object Label7: TLabel
        Left = 288
        Top = 20
        Width = 46
        Height = 13
        Caption = 'Prest. ILT'
      end
      object Label17: TLabel
        Left = 140
        Top = 20
        Width = 68
        Height = 13
        Caption = 'Prest. Especie'
      end
      object Label18: TLabel
        Left = 414
        Top = 20
        Width = 59
        Height = 13
        Caption = 'Incapacidad'
      end
      object edPA_INCAP050FRECVALORCARTERA: TCurrencyEdit
        Left = 68
        Top = 16
        Width = 56
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 3
        DisplayFormat = ',0.000%'
        TabOrder = 0
      end
      object edPA_INCAP050ILTVALORCARTERA: TCurrencyEdit
        Left = 340
        Top = 16
        Width = 56
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        TabOrder = 2
      end
      object edPA_INCAP050ESPVALORCARTERA: TCurrencyEdit
        Left = 216
        Top = 16
        Width = 56
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DisplayFormat = '$ ,0.00'
        TabOrder = 1
      end
      object edPA_INCAP050INCAPVALORCARTERA: TCurrencyEdit
        Left = 480
        Top = 16
        Width = 56
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 3
        DisplayFormat = ',0.000%'
        TabOrder = 3
      end
    end
    object GroupBox4: TGroupBox
      Left = 8
      Top = 152
      Width = 544
      Height = 44
      Caption = ' INCAP 50-66 '
      TabOrder = 3
      object Label23: TLabel
        Left = 8
        Top = 20
        Width = 53
        Height = 13
        Caption = 'Frecuencia'
      end
      object Label24: TLabel
        Left = 288
        Top = 20
        Width = 46
        Height = 13
        Caption = 'Prest. ILT'
      end
      object Label25: TLabel
        Left = 140
        Top = 20
        Width = 68
        Height = 13
        Caption = 'Prest. Especie'
      end
      object Label26: TLabel
        Left = 414
        Top = 20
        Width = 59
        Height = 13
        Caption = 'Incapacidad'
      end
      object edPA_INCAP5066FRECVALORCARTERA: TCurrencyEdit
        Left = 68
        Top = 16
        Width = 56
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 3
        DisplayFormat = ',0.000%'
        TabOrder = 0
      end
      object edPA_INCAP5066ILTVALORCARTERA: TCurrencyEdit
        Left = 340
        Top = 16
        Width = 56
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        TabOrder = 2
      end
      object edPA_INCAP5066ESPVALORCARTERA: TCurrencyEdit
        Left = 216
        Top = 16
        Width = 56
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DisplayFormat = '$ ,0.00'
        TabOrder = 1
      end
      object edPA_INCAP5066INCAPVALORCARTERA: TCurrencyEdit
        Left = 480
        Top = 16
        Width = 56
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 3
        DisplayFormat = ',0.000%'
        TabOrder = 3
      end
    end
    object GroupBox5: TGroupBox
      Left = 8
      Top = 200
      Width = 544
      Height = 44
      Caption = ' INCAP 66-100 Y GRAN INVALIDEZ '
      TabOrder = 4
      object Label8: TLabel
        Left = 8
        Top = 20
        Width = 53
        Height = 13
        Caption = 'Frecuencia'
      end
      object Label9: TLabel
        Left = 288
        Top = 20
        Width = 46
        Height = 13
        Caption = 'Prest. ILT'
      end
      object Label19: TLabel
        Left = 140
        Top = 20
        Width = 68
        Height = 13
        Caption = 'Prest. Especie'
      end
      object Label20: TLabel
        Left = 414
        Top = 20
        Width = 59
        Height = 13
        Caption = 'Incapacidad'
      end
      object edPA_INCAP66100FRECVALORCARTERA: TCurrencyEdit
        Left = 68
        Top = 16
        Width = 56
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 3
        DisplayFormat = ',0.000%'
        TabOrder = 0
      end
      object edPA_INCAP66100ILTVALORCARTERA: TCurrencyEdit
        Left = 340
        Top = 16
        Width = 56
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        TabOrder = 2
      end
      object edPA_INCAP66100ESPVALORCARTERA: TCurrencyEdit
        Left = 216
        Top = 16
        Width = 56
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DisplayFormat = '$ ,0.00'
        TabOrder = 1
      end
      object edPA_INCAP66100INCAPVALORCARTERA: TCurrencyEdit
        Left = 480
        Top = 16
        Width = 56
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 3
        DisplayFormat = ',0.000%'
        TabOrder = 3
      end
    end
    object GroupBox6: TGroupBox
      Left = 8
      Top = 248
      Width = 544
      Height = 44
      Caption = ' MUERTE '
      TabOrder = 5
      object Label2: TLabel
        Left = 8
        Top = 20
        Width = 53
        Height = 13
        Caption = 'Frecuencia'
      end
      object Label5: TLabel
        Left = 288
        Top = 20
        Width = 46
        Height = 13
        Caption = 'Prest. ILT'
      end
      object Label10: TLabel
        Left = 140
        Top = 20
        Width = 68
        Height = 13
        Caption = 'Prest. Especie'
      end
      object Label11: TLabel
        Left = 414
        Top = 20
        Width = 59
        Height = 13
        Caption = 'Incapacidad'
      end
      object edPA_MUERTEFRECVALORCARTERA: TCurrencyEdit
        Left = 68
        Top = 16
        Width = 56
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 3
        DisplayFormat = ',0.000%'
        TabOrder = 0
      end
      object edPA_MUERTEILTVALORCARTERA: TCurrencyEdit
        Left = 340
        Top = 16
        Width = 56
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        TabOrder = 2
      end
      object edPA_MUERTEESPVALORCARTERA: TCurrencyEdit
        Left = 216
        Top = 16
        Width = 56
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DisplayFormat = '$ ,0.00'
        TabOrder = 1
      end
      object edPA_MUERTEINCAPVALORCARTERA: TCurrencyEdit
        Left = 480
        Top = 16
        Width = 56
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 3
        DisplayFormat = ',0.000%'
        TabOrder = 3
      end
    end
    object GroupBox7: TGroupBox
      Left = 8
      Top = 296
      Width = 544
      Height = 44
      Caption = ' JUICIOS '
      TabOrder = 6
      object Label13: TLabel
        Left = 8
        Top = 20
        Width = 53
        Height = 13
        Caption = 'Frecuencia'
      end
      object edPA_JUICIOSFRECVALORCARTERA: TCurrencyEdit
        Left = 68
        Top = 16
        Width = 56
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DecimalPlaces = 3
        DisplayFormat = ',0.000%'
        TabOrder = 0
      end
    end
    object GroupBox10: TGroupBox
      Left = 8
      Top = 344
      Width = 544
      Height = 44
      Caption = ' VIGENCIA '
      TabOrder = 7
      object Label15: TLabel
        Left = 8
        Top = 20
        Width = 53
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Desde'
      end
      object Label22: TLabel
        Left = 140
        Top = 20
        Width = 68
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Hasta'
      end
      object edVigenciaDesde: TDateComboBox
        Left = 68
        Top = 14
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object edVigenciaHasta: TDateComboBox
        Left = 216
        Top = 14
        Width = 88
        Height = 21
        TabOrder = 1
      end
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
      end
      item
        Key = 114
        LinkControl = tbBuscar
      end>
  end
end
