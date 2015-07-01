inherited frmZonasGeograficas: TfrmZonasGeograficas
  Top = 107
  Width = 792
  Height = 430
  Caption = 'Zonas Geogr'#225'ficas'
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 784
  end
  inherited CoolBar: TCoolBar
    Width = 784
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 780
      end>
    inherited ToolBar: TToolBar
      Width = 767
    end
  end
  inherited Grid: TArtDBGrid
    Width = 784
    Height = 329
    Columns = <
      item
        Expanded = False
        FieldName = 'ZG_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 206
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'ZG_VALORJUICIOSPRIVADOS'
        Title.Alignment = taRightJustify
        Title.Caption = 'Valor Porcentual Juicios Privados'
        Width = 165
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'ZG_VALORJUICIOSMUNICIPIO'
        Title.Alignment = taRightJustify
        Title.Caption = 'Valor Porcentual Juicios Municipios'
        Width = 176
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'ZG_VALORJUICIOSOTROS'
        Title.Alignment = taRightJustify
        Title.Caption = 'Valor Porcentual Juicios Resto Sector P'#250'blico'
        Width = 153
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'ZG_PONDERADORFACTORRIESGO'
        Title.Alignment = taRightJustify
        Title.Caption = 'Ponderador Factor Riesgo'
        Width = 135
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_DESCRIPCION'
        Title.Caption = 'Provincia Asociada'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZG_FRECUENCIAJUICIOS'
        Title.Caption = 'Juicio Frecuencia'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZG_VALOR_RC'
        Title.Caption = 'Factor R.C.'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 140
    Top = 112
    Width = 520
    Height = 245
    Caption = 'Zona Geogr'#225'fica'
    BorderStyle = bsDialog
    ActiveControl = edDescripcion
    inherited BevelAbm: TBevel
      Top = 209
      Width = 512
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 12
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object Label2: TLabel [2]
      Left = 8
      Top = 36
      Width = 157
      Height = 13
      Caption = 'Valor Porcentual Juicios Privados'
    end
    object Label3: TLabel [3]
      Left = 8
      Top = 60
      Width = 166
      Height = 13
      Caption = 'Valor Porcentual Juicios Municipios'
    end
    object Label4: TLabel [4]
      Left = 8
      Top = 84
      Width = 216
      Height = 13
      Caption = 'Valor Porcentual Juicios Resto Sector P'#250'blico'
    end
    object Label5: TLabel [5]
      Left = 8
      Top = 108
      Width = 124
      Height = 13
      Caption = 'Ponderador Factor Riesgo'
    end
    object Label6: TLabel [6]
      Left = 8
      Top = 132
      Width = 107
      Height = 13
      Caption = 'Provincia Relacionada'
    end
    object Label7: TLabel [7]
      Left = 8
      Top = 156
      Width = 83
      Height = 13
      Caption = 'Juicio Frecuencia'
    end
    object Label8: TLabel [8]
      Left = 8
      Top = 180
      Width = 133
      Height = 13
      Caption = 'Factor Responsabilidad Civil'
    end
    inherited btnAceptar: TButton
      Left = 360
      Top = 215
      Width = 72
    end
    inherited btnCancelar: TButton
      Left = 440
      Top = 215
      Width = 72
    end
    object edDescripcion: TEdit
      Left = 232
      Top = 8
      Width = 200
      Height = 21
      TabOrder = 2
      Text = 'edDescripcion'
    end
    object edValorPorcentualJuiciosPrivados: TCurrencyEdit
      Left = 232
      Top = 32
      Width = 80
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.00%'
      MaxValue = 100.000000000000000000
      TabOrder = 3
    end
    object edValorPorcentualJuiciosMunicipios: TCurrencyEdit
      Left = 232
      Top = 56
      Width = 80
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.00%'
      MaxValue = 100.000000000000000000
      TabOrder = 4
    end
    object edValorPorcentualJuiciosOtros: TCurrencyEdit
      Left = 232
      Top = 80
      Width = 80
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.00%'
      MaxValue = 100.000000000000000000
      TabOrder = 5
    end
    object edPonderadorFactorRiesgo: TCurrencyEdit
      Left = 232
      Top = 104
      Width = 80
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.00%'
      MaxValue = 100.000000000000000000
      TabOrder = 6
    end
    inline fraProvinciaRelacionada: TfraCodDesc
      Left = 232
      Top = 128
      Width = 280
      Height = 23
      TabOrder = 7
      inherited cmbDescripcion: TArtComboBox
        Width = 215
      end
      inherited edCodigo: TPatternEdit
        Left = 0
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'PV_FECHABAJA'
        FieldCodigo = 'PV_CODIGO'
        FieldDesc = 'PV_DESCRIPCION'
        FieldID = 'PV_CODIGO'
        TableName = 'CPV_PROVINCIAS'
      end
    end
    object edJuicioFrecuencia: TCurrencyEdit
      Left = 232
      Top = 152
      Width = 80
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.00%'
      MaxValue = 100.000000000000000000
      TabOrder = 8
    end
    object edRespCivil: TCurrencyEdit
      Left = 232
      Top = 176
      Width = 80
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.00'
      MaxValue = 100.000000000000000000
      TabOrder = 9
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
