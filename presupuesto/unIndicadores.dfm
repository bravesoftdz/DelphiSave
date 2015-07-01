inherited frmIndicadores: TfrmIndicadores
  Left = 86
  Top = 93
  Width = 630
  Height = 440
  Caption = 'Administraci'#243'n de Indicadores'
  Constraints.MinHeight = 440
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
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      object pnlBajas: TPanel
        Left = 370
        Top = 0
        Width = 121
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object chkNoMostrarBajas: TCheckBox
          Left = 12
          Top = 3
          Width = 103
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
    Top = 33
    Width = 622
    Height = 380
    Columns = <
      item
        Expanded = False
        FieldName = 'INDICADOR'
        Title.Caption = 'Indicador'
        Width = 177
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SECTOR'
        Title.Caption = 'Sector'
        Width = 179
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MODULO'
        Title.Caption = 'M'#243'dulo'
        Width = 176
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_BAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 69
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 140
    Top = 76
    Width = 436
    Height = 130
    BorderStyle = bsDialog
    inherited BevelAbm: TBevel
      Top = 94
      Width = 428
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 10
      Width = 45
      Height = 13
      AutoSize = False
      Caption = 'Indicador'
    end
    object Label2: TLabel [2]
      Left = 8
      Top = 39
      Width = 45
      Height = 13
      AutoSize = False
      Caption = 'Sector'
    end
    object Label3: TLabel [3]
      Left = 8
      Top = 69
      Width = 45
      Height = 13
      AutoSize = False
      Caption = 'M'#243'dulo'
    end
    inherited btnAceptar: TButton
      Left = 278
      Top = 100
      TabOrder = 3
    end
    inherited btnCancelar: TButton
      Left = 356
      Top = 100
      TabOrder = 4
    end
    object edPN_DESCRIPCION: TEdit
      Left = 58
      Top = 8
      Width = 369
      Height = 21
      MaxLength = 120
      TabOrder = 0
    end
    inline fraPN_SECTOR: TfraCodigoDescripcion
      Left = 58
      Top = 36
      Width = 373
      Height = 23
      TabOrder = 1
      DesignSize = (
        373
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 51
        Width = 319
      end
      inherited edCodigo: TPatternEdit
        Width = 48
      end
    end
    inline fraPN_MODULO: TfraCtbTablas
      Left = 58
      Top = 65
      Width = 371
      Height = 23
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Width = 318
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT PN_DESCRIPCION INDICADOR, SC_DESCRIPCION SECTOR, TRUNC(PN' +
        '_FECHABAJA) FECHA_BAJA, '
      
        '       SC_ID, PN_ID ID, TB_DESCRIPCION MODULO, PN_SECTOR CODSECT' +
        'OR, PN_MODULO CODMODULO'
      '  FROM CTB_TABLAS, USC_SECTORES, OPN_PRESUPUESTOCONCINDICADOR'
      ' WHERE SC_CODIGO(+) = PN_SECTOR'
      '   AND TB_CODIGO = PN_MODULO'
      '   AND TB_CLAVE = '#39'MCIPR'#39
      '   AND PN_FECHABAJA IS NULL'
      '   AND 1 = 2')
    Left = 12
    Top = 134
  end
  inherited dsConsulta: TDataSource
    Left = 40
    Top = 134
  end
  inherited SortDialog: TSortDialog
    Left = 12
    Top = 162
  end
  inherited ExportDialog: TExportDialog
    Left = 40
    Top = 162
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxPortrait
    PageSize = psLetter
    Left = 40
    Top = 190
  end
  inherited Seguridad: TSeguridad
    Left = 12
    Top = 106
  end
  inherited FormStorage: TFormStorage
    Left = 40
    Top = 106
  end
  inherited PrintDialog: TPrintDialog
    Left = 12
    Top = 190
  end
  inherited ShortCutControl: TShortCutControl
    Left = 68
    Top = 106
  end
  inherited FieldHider: TFieldHider
    Left = 68
    Top = 134
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
    Left = 97
    Top = 106
  end
end
