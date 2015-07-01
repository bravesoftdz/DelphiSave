inherited frmManTipoValor: TfrmManTipoValor
  Left = 87
  Top = 112
  Caption = 'Mantenimiento de Tipos de Valores'
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CoolBar: TCoolBar
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 617
      end>
    inherited ToolBar: TToolBar
      Caption = ''
      inherited tbModificar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    OnDblClick = nil
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TB_CODIGO'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Title.Caption = 'Código'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TB_DESCRIPCION'
        PickList.Strings = ()
        Title.Caption = 'Descripción'
        Width = 208
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TB_ESPECIAL1'
        PickList.Strings = ()
        Title.Caption = 'Especial'
        Visible = False
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ESPECIAL1'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Title.Caption = 'Rech./Modif./Pago Terc.'
        Width = 127
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ESPECIAL2'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Title.Caption = 'Boleta Depós.'
        Width = 76
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHABAJA'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 76
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Height = 157
    Constraints.MaxHeight = 157
    Constraints.MinHeight = 157
    inherited BevelAbm: TBevel
      Top = 121
    end
    inherited lbCodigo: TLabel
      Left = 10
      Top = 16
    end
    inherited lbDescripcion: TLabel
      Left = 10
      Top = 44
    end
    inherited lbEspecial: TLabel
      Width = 3
      Caption = ''
      FocusControl = chkEspecial1
    end
    inherited btnAceptar: TButton
      Top = 127
      TabOrder = 4
    end
    inherited btnCancelar: TButton
      Top = 127
      TabOrder = 5
    end
    inherited edCodigo: TPatternEdit
      Top = 12
    end
    inherited edDescripcion: TEdit
      Top = 40
      Width = 241
    end
    inherited edEspecial: TEdit
      Left = 316
      Width = 21
      TabOrder = 6
      Visible = False
    end
    object chkEspecial1: TCheckBox
      Left = 8
      Top = 70
      Width = 229
      Height = 17
      Alignment = taLeftJustify
      Caption = '&Rechazo / Modificación / Pago a Terceros'
      TabOrder = 2
    end
    object chkEspecial2: TCheckBox
      Left = 8
      Top = 98
      Width = 229
      Height = 17
      Alignment = taLeftJustify
      Caption = '&Genera Boleta de Depósito'
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT TB_CODIGO, TB_DESCRIPCION, TB_MODULO, TB_ESPECIAL1, TB_ES' +
        'PECIAL2, TB_BAJA,'
      '               DECODE(TB_ESPECIAL1, '#39'S'#39', '#39'Si'#39', '#39'No'#39') ESPECIAL1,'
      '               DECODE(TB_ESPECIAL2, '#39'S'#39', '#39'Si'#39', '#39'No'#39') ESPECIAL2,'
      '               TRUNC(TB_FECHABAJA) FECHABAJA'
      'FROM CTB_TABLAS'
      'WHERE TB_CLAVE = :pClave'
      'AND (TB_MODULO = :pModulo OR :pModulo IS NULL)'
      'AND TB_CODIGO <> '#39'0'#39' ')
  end
  inherited SortDialog: TSortDialog
    SortFields = <
      item
        Title = 'Código'
        DataField = 'TB_CODIGO'
        FieldIndex = 0
      end
      item
        Title = 'Descripción'
        DataField = 'TB_DESCRIPCION'
        FieldIndex = 0
      end
      item
        Title = 'Rech./Modif./Pago Terc.'
        DataField = 'ESPECIAL1'
        FieldIndex = 0
      end
      item
        Title = 'Boleta Depós.'
        DataField = 'ESPECIAL2'
        FieldIndex = 0
      end
      item
        Title = 'F. Baja'
        DataField = 'FECHABAJA'
        FieldIndex = 0
      end>
  end
  inherited ExportDialog: TExportDialog
    Fields = <
      item
        DataField = 'TB_CODIGO'
        Title = 'Código'
      end
      item
        DataField = 'TB_DESCRIPCION'
        Title = 'Descripción'
      end
      item
        DataField = 'ESPECIAL1'
        Title = 'Rech./Modif./Pago Terc.'
      end
      item
        DataField = 'ESPECIAL2'
        Title = 'Boleta Depós.'
      end
      item
        DataField = 'FECHABAJA'
        Title = 'F. Baja'
      end>
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        MaxLength = 0
      end
      item
        MaxLength = 0
      end
      item
        MaxLength = 0
      end>
    LastColType = lcFill
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
