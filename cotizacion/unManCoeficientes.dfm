inherited frmManCoeficientes: TfrmManCoeficientes
  Left = 380
  Top = 115
  Width = 609
  Height = 460
  Caption = 'Mantenimiento de Coeficientes'
  Constraints.MinHeight = 457
  Constraints.MinWidth = 609
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 601
    Height = 48
    Visible = True
    object GroupBox8: TGroupBox
      Left = 376
      Top = 0
      Width = 224
      Height = 44
      Anchors = [akTop, akRight]
      Caption = 'Vigencia'
      TabOrder = 1
      object Label12: TLabel
        Left = 98
        Top = 18
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object edFechaDesdeBusqueda: TDateComboBox
        Left = 6
        Top = 14
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object edFechaHastaBusqueda: TDateComboBox
        Left = 130
        Top = 14
        Width = 88
        Height = 21
        TabOrder = 1
      end
    end
    object GroupBox1: TGroupBox
      Left = 4
      Top = 0
      Width = 368
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Nombre '
      TabOrder = 0
      object edNombreBusqueda: TEdit
        Left = 12
        Top = 16
        Width = 344
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 48
    Width = 601
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 597
      end>
    inherited ToolBar: TToolBar
      Width = 584
      ButtonHeight = 104
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 77
    Width = 601
    Height = 356
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'ct_nombre'
        Title.Caption = 'Nombre'
        Width = 149
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'ct_coeficiente'
        Title.Alignment = taRightJustify
        Title.Caption = 'Coeficiente'
        Width = 94
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ct_fechadesde'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Desde'
        Width = 97
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ct_fechahasta'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Hasta'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ct_observacion'
        Title.Caption = 'Observaciones'
        Width = 438
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ct_usualta'
        Title.Caption = 'Usuario Alta'
        Width = 148
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ct_fechaalta'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Alta'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ct_usumodif'
        Title.Caption = 'Usuario Modificaci'#243'n'
        Width = 137
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ct_fechamodif'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Modificaci'#243'n'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ct_usubaja'
        Title.Caption = 'Usuario Baja'
        Width = 132
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ct_fechabaja'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Baja'
        Width = 86
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 58
    Top = 118
    Width = 520
    Height = 224
    BorderStyle = bsDialog
    ActiveControl = edNombre
    inherited BevelAbm: TBevel
      Top = 188
      Width = 512
    end
    object Label2: TLabel [1]
      Left = 8
      Top = 36
      Width = 54
      Height = 13
      Caption = 'Coeficiente'
    end
    object Label1: TLabel [2]
      Left = 8
      Top = 60
      Width = 62
      Height = 13
      Caption = 'Fecha Desde'
    end
    object Label6: TLabel [3]
      Left = 8
      Top = 84
      Width = 60
      Height = 13
      Caption = 'Fecha Hasta'
    end
    object Label3: TLabel [4]
      Left = 8
      Top = 12
      Width = 37
      Height = 13
      Caption = 'Nombre'
    end
    object Label4: TLabel [5]
      Left = 8
      Top = 104
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    inherited btnAceptar: TButton
      Left = 360
      Top = 194
      Width = 72
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    inherited btnCancelar: TButton
      Left = 440
      Top = 194
      Width = 72
      TabOrder = 6
    end
    object edCoeficiente: TCurrencyEdit
      Left = 88
      Top = 32
      Width = 88
      Height = 21
      AutoSize = False
      DisplayFormat = '% ,0.00;-% ,0.00'
      MaxValue = 100.000000000000000000
      TabOrder = 1
    end
    object edFechaDesde: TDateComboBox
      Left = 88
      Top = 56
      Width = 88
      Height = 21
      MaxDateCombo = edFechaHasta
      TabOrder = 2
    end
    object edFechaHasta: TDateComboBox
      Left = 88
      Top = 80
      Width = 88
      Height = 21
      MinDateCombo = edFechaDesde
      TabOrder = 3
    end
    object edNombre: TEdit
      Left = 88
      Top = 8
      Width = 424
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 0
      Text = 'EDNOMBRE'
    end
    object memoObservaciones: TMemo
      Left = 88
      Top = 104
      Width = 424
      Height = 72
      Lines.Strings = (
        '111111'
        '22222'
        '33333'
        '44444'
        '5555')
      MaxLength = 2000
      TabOrder = 4
    end
  end
  inherited sdqConsulta: TSDQuery
    Left = 20
    Top = 298
  end
  inherited dsConsulta: TDataSource
    Left = 48
    Top = 298
  end
  inherited SortDialog: TSortDialog
    Left = 20
    Top = 326
  end
  inherited ExportDialog: TExportDialog
    Left = 48
    Top = 326
  end
  inherited QueryPrint: TQueryPrint
    Left = 48
    Top = 354
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
    Left = 19
    Top = 270
  end
  inherited FormStorage: TFormStorage
    Version = 1
    Left = 48
    Top = 270
  end
  inherited PrintDialog: TPrintDialog
    Left = 20
    Top = 354
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
    Left = 76
    Top = 270
  end
  inherited FieldHider: TFieldHider
    Left = 76
    Top = 298
  end
end
