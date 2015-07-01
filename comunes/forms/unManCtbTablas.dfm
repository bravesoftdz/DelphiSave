inherited frmManCtbTablas: TfrmManCtbTablas
  Left = 195
  Top = 106
  Width = 808
  Height = 608
  Font.Name = 'Tahoma'
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 800
    Height = 5
    TabOrder = 3
  end
  inherited CoolBar: TCoolBar
    Top = 5
    Width = 800
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 796
      end>
    inherited ToolBar: TToolBar
      Width = 783
      inherited tbModificar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 34
    Width = 800
    Height = 546
    TabOrder = 0
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'TB_CODIGO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TB_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 405
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TB_ESPECIAL1'
        Title.Caption = 'Especial'
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TB_ESPECIAL2'
        Title.Caption = 'Especial2'
        Width = 118
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Top = 100
    Width = 341
    Height = 152
    Constraints.MaxHeight = 152
    Constraints.MinHeight = 152
    Constraints.MinWidth = 341
    DesignSize = (
      341
      152)
    inherited BevelAbm: TBevel
      Top = 116
      Width = 333
    end
    object lbCodigo: TLabel [1]
      Left = 8
      Top = 12
      Width = 33
      Height = 13
      Caption = 'C'#243'&digo'
      FocusControl = edCodigo
    end
    object lbDescripcion: TLabel [2]
      Left = 8
      Top = 40
      Width = 54
      Height = 13
      Caption = 'De&scripci'#243'n'
      FocusControl = edDescripcion
    end
    object lbEspecial: TLabel [3]
      Left = 8
      Top = 68
      Width = 38
      Height = 13
      Caption = '&Especial'
      FocusControl = edEspecial
      OnClick = btnAceptarClick
    end
    object lbEspecial2: TLabel [4]
      Left = 7
      Top = 95
      Width = 44
      Height = 13
      Caption = 'Espec&ial2'
      FocusControl = edEspecial2
      OnClick = btnAceptarClick
    end
    inherited btnAceptar: TButton
      Left = 186
      Top = 122
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    inherited btnCancelar: TButton
      Left = 261
      Top = 122
      TabOrder = 5
    end
    object edCodigo: TPatternEdit
      Left = 72
      Top = 8
      Width = 89
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 0
      Pattern = 'ABCDEFGHIJKLMN'#209'OPQRSTUVWXYZ0123456789_.'
    end
    object edDescripcion: TEdit
      Left = 72
      Top = 36
      Width = 257
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 150
      TabOrder = 1
    end
    object edEspecial: TEdit
      Left = 72
      Top = 64
      Width = 257
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
    object edEspecial2: TEdit
      Left = 72
      Top = 91
      Width = 257
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT TB_CODIGO, TB_DESCRIPCION, TB_MODULO, TB_ESPECIAL1, TB_BA' +
        'JA'
      'FROM CTB_TABLAS'
      'WHERE TB_CLAVE = :pClave'
      'AND (TB_MODULO = :pModulo OR :pModulo IS NULL)'
      'AND TB_CODIGO <> '#39'0'#39' ')
    ParamData = <
      item
        DataType = ftString
        Name = 'pClave'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pModulo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pModulo'
        ParamType = ptInput
      end>
  end
  inherited SortDialog: TSortDialog
    SortFields = <
      item
        Title = 'C'#243'digo'
        DataField = 'TB_CODIGO'
        FieldIndex = 0
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'TB_DESCRIPCION'
        Order = otAscending
        FieldIndex = 0
      end
      item
        Title = 'Especial'
        DataField = 'TB_ESPECIAL1'
        FieldIndex = 0
      end>
  end
  inherited ExportDialog: TExportDialog
    Fields = <
      item
        DataField = 'TB_CODIGO'
        Title = 'C'#243'digo'
      end
      item
        DataField = 'TB_DESCRIPCION'
        Title = 'Descripci'#243'n'
      end
      item
        DataField = 'TB_ESPECIAL1'
        Title = 'Especial'
      end>
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
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
  inherited FieldHider: TFieldHider
    OnlyCommonFields = False
  end
end
