inherited frmGastosEstructura: TfrmGastosEstructura
  Left = 383
  Top = 112
  Width = 648
  Caption = 'Gastos Estructura'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 640
  end
  inherited CoolBar: TCoolBar
    Width = 640
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 636
      end>
    inherited ToolBar: TToolBar
      Width = 623
    end
  end
  inherited Grid: TArtDBGrid
    Width = 640
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    Columns = <
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'GS_SECTOR'
        Title.Alignment = taRightJustify
        Title.Caption = 'Sector'
        Width = 40
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'GS_RANGOCIIU'
        Title.Alignment = taRightJustify
        Title.Caption = 'Rango CIIU'
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'GS_PORCENTAJE'
        Title.Alignment = taRightJustify
        Title.Caption = 'Porcentaje'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GS_USUALTA'
        Title.Caption = 'Usuario Alta'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'GS_FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GS_USUMODIF'
        Title.Caption = 'Usu. Modificaci'#243'n'
        Width = 90
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'GS_FECHAMODIF'
        Title.Alignment = taCenter
        Title.Caption = 'F. Modificaci'#243'n'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GS_USUBAJA'
        Title.Caption = 'Usuario Baja'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'GS_FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Baja'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 188
    Width = 232
    Height = 160
    Caption = 'Gasto'
    inherited BevelAbm: TBevel
      Top = 124
      Width = 224
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 21
      Width = 34
      Height = 13
      Caption = 'Sector:'
    end
    object Label2: TLabel [2]
      Left = 8
      Top = 53
      Width = 129
      Height = 13
      Caption = 'Combinaci'#243'n Rango - CIIU:'
    end
    object Label3: TLabel [3]
      Left = 8
      Top = 85
      Width = 54
      Height = 13
      Caption = 'Porcentaje:'
    end
    inherited btnAceptar: TButton
      Left = 88
      Top = 130
      Width = 64
      Default = True
      TabOrder = 3
    end
    inherited btnCancelar: TButton
      Left = 160
      Top = 130
      Width = 64
      TabOrder = 4
    end
    object edSector: TIntEdit
      Left = 144
      Top = 16
      Width = 80
      Height = 21
      Color = clBtnFace
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object edRangoCIIU: TIntEdit
      Left = 144
      Top = 48
      Width = 80
      Height = 21
      TabOrder = 1
    end
    object edPorcentaje: TCurrencyEdit
      Left = 144
      Top = 80
      Width = 80
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.00%;-,0.00%'
      TabOrder = 2
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      '  FROM AGS_GASTOESTRUCTURA'
      'ORDER BY GS_SECTOR, GS_RANGOCIIU')
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
