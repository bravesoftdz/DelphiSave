inherited frmAdministracionPresupuestos: TfrmAdministracionPresupuestos
  Left = 127
  Top = 72
  Width = 550
  Height = 450
  Caption = 'Administraci'#243'n de Presupuestos'
  Constraints.MinHeight = 450
  Constraints.MinWidth = 550
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 542
    Height = 29
    Visible = True
    object Label1: TLabel
      Left = 12
      Top = 8
      Width = 24
      Height = 13
      AutoSize = False
      Caption = 'A'#241'o'
    end
    object edAnio: TIntEdit
      Left = 37
      Top = 4
      Width = 57
      Height = 21
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      MaxLength = 4
    end
    object chkNoMostrarBajas: TCheckBox
      Left = 110
      Top = 6
      Width = 105
      Height = 17
      Caption = 'No Mostrar Bajas'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
  end
  inherited CoolBar: TCoolBar
    Top = 29
    Width = 542
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 538
      end>
    inherited ToolBar: TToolBar
      Width = 525
      inherited tbModificar: TToolButton
        Hint = 'Ultimo Mes (Ctrl+M)'
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbCongelar: TToolButton
        Left = 370
        Top = 0
        Hint = 'Congelar'
        ImageIndex = 29
        OnClick = tbCongelarClick
      end
      object tbMarcarActual: TToolButton
        Left = 393
        Top = 0
        Hint = 'Marcar como Actual'
        ImageIndex = 27
        OnClick = tbMarcarActualClick
      end
      object ToolButton1: TToolButton
        Left = 416
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 424
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 58
    Width = 542
    Columns = <
      item
        Expanded = False
        FieldName = 'A'#209'O'
        Title.Alignment = taCenter
        Title.Caption = 'A'#241'o'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VERSION'
        Title.Alignment = taCenter
        Title.Caption = 'Versi'#243'n'
        Width = 61
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_CONGELADO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Congelado'
        Width = 78
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ACTUAL_GRILLA'
        Font.Charset = SYMBOL_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Wingdings'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'Actual'
        Width = 52
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_BAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ULTMES'
        Title.Alignment = taCenter
        Title.Caption = 'Ultimo Mes'
        Width = 58
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 144
    Top = 176
    Width = 164
    Height = 117
    BorderStyle = bsDialog
    DesignSize = (
      164
      117)
    inherited BevelAbm: TBevel
      Top = 81
      Width = 156
    end
    object Label2: TLabel [1]
      Left = 14
      Top = 12
      Width = 43
      Height = 13
      AutoSize = False
      Caption = 'A'#241'o'
    end
    object Label3: TLabel [2]
      Left = 14
      Top = 35
      Width = 43
      Height = 13
      AutoSize = False
      Caption = 'Versi'#243'n'
    end
    object Label4: TLabel [3]
      Left = 14
      Top = 60
      Width = 43
      Height = 13
      AutoSize = False
      Caption = 'Ult. Mes'
    end
    inherited btnAceptar: TButton
      Left = 6
      Top = 87
      TabOrder = 3
    end
    inherited btnCancelar: TButton
      Left = 84
      Top = 87
      TabOrder = 4
    end
    object edAnioAlta: TIntEdit
      Left = 58
      Top = 8
      Width = 57
      Height = 21
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnExit = edAnioAltaExit
      MaxLength = 4
    end
    object edVersionAlta: TIntEdit
      Left = 58
      Top = 32
      Width = 57
      Height = 21
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      MaxLength = 4
    end
    object edUltMesAltaModif: TIntEdit
      Left = 58
      Top = 56
      Width = 57
      Height = 21
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Text = '1'
      OnExit = edAnioAltaExit
      MaxLength = 2
      MaxValue = 12
      MinValue = 1
      Value = 1
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT PR_A'#209'O A'#209'O, PR_VERSION VERSION, PR_FECHACONGELADO FECHA_C' +
        'ONGELADO, PR_ACTUAL ACTUAL,'
      
        '       PR_FECHABAJA FECHA_BAJA, NULL ACTUAL_GRILLA, PR_ULTIMOMES' +
        ' ULTMES'
      '  FROM OPR_PRESUPUESTO'
      ' WHERE 1 = 2')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxPortrait
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
        LinkControl = tbSalir2
      end>
    Left = 110
    Top = 200
  end
end
