inherited frmErroresUbicCarpetas: TfrmErroresUbicCarpetas
  Left = 125
  Top = 214
  Width = 740
  Height = 400
  Caption = 'Errores de Carga de Ubicaci'#243'n de Carpetas'
  Constraints.MinHeight = 400
  Constraints.MinWidth = 740
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 732
    Height = 75
    object GroupBox1: TGroupBox
      Left = 4
      Top = 3
      Width = 278
      Height = 70
      Caption = 'Fechas de Procesamiento'
      TabOrder = 0
      object Label2: TLabel
        Left = 6
        Top = 18
        Width = 178
        Height = 13
        AutoSize = False
        Caption = 'Ultima Fecha Carga Ubicaciones:'
      end
      object Label3: TLabel
        Left = 6
        Top = 46
        Width = 178
        Height = 13
        AutoSize = False
        Caption = 'Ultima Fecha Generaci'#243'n de Errores:'
      end
      object edFechaUbic: TDateComboBox
        Left = 183
        Top = 15
        Width = 88
        Height = 21
        TabStop = False
        TabOrder = 0
      end
      object edFechaError: TDateComboBox
        Left = 183
        Top = 43
        Width = 88
        Height = 21
        TabStop = False
        TabOrder = 1
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 75
    Width = 732
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 728
      end>
    inherited ToolBar: TToolBar
      Width = 715
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbSumatoria: TToolButton
        Left = 370
        Top = 0
        Hint = 'Sumatoria'
        ImageIndex = 48
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton1: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 401
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
      object pnlSeleccionados: TPanel
        Left = 424
        Top = 0
        Width = 287
        Height = 22
        Alignment = taLeftJustify
        Anchors = [akTop, akRight]
        BevelOuter = bvNone
        Caption = ' Cant. Errores: '
        TabOrder = 0
        object Label1: TLabel
          Left = 126
          Top = 4
          Width = 104
          Height = 13
          AutoSize = False
          Caption = 'Cant. Ubic. Cargadas:'
        end
        object edTotalRegistros: TCardinalEdit
          Left = 68
          Top = 0
          Width = 55
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clSilver
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
        object edCantUbic: TCardinalEdit
          Left = 232
          Top = 0
          Width = 55
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clSilver
          Enabled = False
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 104
    Width = 732
    Height = 268
    Columns = <
      item
        Expanded = False
        FieldName = 'UC_CODARCHIVO'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Archivo'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UC_CLAVE'
        Title.Caption = 'Clave'
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UC_CODUBICACION_ADMIN'
        Title.Caption = 'Ubic. en Administradora'
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UC_ERRORES'
        Title.Caption = 'Errores'
        Width = 357
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT UC_CODARCHIVO, UC_CLAVE, UC_CODUBICACION_ADMIN, UC_ERRORE' +
        'S'
      ' FROM TUC_UBICACIONCARPETAS'
      ' WHERE 1 = 2'
      ' ')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxPortrait
    PageSize = psLetter
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end>
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
        LinkControl = tbSalir2
      end>
    Left = 110
    Top = 200
  end
end
