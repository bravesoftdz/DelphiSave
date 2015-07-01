inherited frmExencionIB: TfrmExencionIB
  Left = 277
  Top = 119
  BorderIcons = [biSystemMenu]
  Caption = 'Formulario de Exenci'#243'n de Ingresos Brutos'
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Height = 0
  end
  inherited CoolBar: TCoolBar
    Top = 0
    inherited ToolBar: TToolBar
      inherited tbRefrescar: TToolButton
        Visible = False
      end
      inherited ToolButton5: TToolButton
        Visible = False
      end
      inherited tbModificar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 29
    Height = 410
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'PV_CODIGO'
        Title.Caption = 'Cod. Provincia'
        Width = 133
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_DESCRIPCION'
        Title.Caption = 'Provincia'
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRTIPO'
        Title.Caption = 'Tipo'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALICUOTA'
        Title.Alignment = taCenter
        Title.Caption = 'Al'#237'cuota'
        Width = 69
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EI_FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Baja'
        Width = 71
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 154
    Top = 186
    Width = 288
    Height = 140
    Caption = 'Ingrese la provincia'
    BorderStyle = bsDialog
    DesignSize = (
      288
      140)
    inherited BevelAbm: TBevel
      Top = 104
      Width = 280
    end
    object Label1: TLabel [1]
      Left = 7
      Top = 10
      Width = 45
      Height = 13
      AutoSize = False
      Caption = 'Provincia'
    end
    object Label2: TLabel [2]
      Left = 7
      Top = 83
      Width = 45
      Height = 13
      AutoSize = False
      Caption = 'Al'#237'cuota'
    end
    inherited btnAceptar: TButton
      Left = 133
      Top = 110
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    inherited btnCancelar: TButton
      Left = 208
      Top = 110
      TabOrder = 4
    end
    object cmbProvincias: TComboBox
      Left = 54
      Top = 6
      Width = 226
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 13
      TabOrder = 0
    end
    object edAlicuota: TCurrencyEdit
      Left = 54
      Top = 79
      Width = 53
      Height = 21
      AutoSize = False
      DecimalPlaces = 3
      DisplayFormat = '0.000;-0.000'
      MaxLength = 10
      MaxValue = 100.000000000000000000
      TabOrder = 2
      ZeroEmpty = False
    end
    object rgTipo: TRadioGroup
      Left = 55
      Top = 31
      Width = 224
      Height = 41
      Caption = 'Tipo'
      Columns = 2
      Items.Strings = (
        'Exento'
        'Al'#237'cuota Especial')
      TabOrder = 1
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
