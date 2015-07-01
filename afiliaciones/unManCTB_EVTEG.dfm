inherited frmManCTB_EVTEG: TfrmManCTB_EVTEG
  Left = 198
  Caption = 'Mantenimiento de Eventos de Traspaso Egreso'
  PixelsPerInch = 96
  TextHeight = 13
  inherited CoolBar: TCoolBar
    inherited ToolBar: TToolBar
      inherited tbModificar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
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
        FieldName = 'TEXTO'
        Title.Caption = 'Texto'
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Title.Caption = 'Tipo Evento'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 172
    Top = 108
    Width = 344
    Height = 160
    Constraints.MaxHeight = 160
    Constraints.MaxWidth = 344
    Constraints.MinWidth = 344
    inherited BevelAbm: TBevel
      Top = 124
      Width = 336
    end
    inherited lbCodigo: TLabel
      Left = 12
    end
    inherited lbDescripcion: TLabel
      Left = 12
    end
    inherited lbEspecial: TLabel
      Left = 10
      Top = 69
      Width = 74
      Caption = 'Texto Asociado'
    end
    object Label1: TLabel [4]
      Left = 11
      Top = 98
      Width = 72
      Height = 13
      Caption = 'Tipo de Evento'
      FocusControl = edEspecial
      OnClick = btnAceptarClick
    end
    inherited btnAceptar: TButton
      Left = 184
      Top = 130
      Width = 72
    end
    inherited btnCancelar: TButton
      Left = 264
      Top = 130
      Width = 72
    end
    inherited edDescripcion: TEdit
      Width = 260
    end
    inherited edEspecial: TEdit
      Top = 65
      Width = 260
      TabOrder = 6
    end
    inherited edEspecial2: TEdit
      Width = 260
      TabOrder = 7
    end
    inline fraTB_ESPECIAL1: TfraStaticCodigoDescripcion
      Left = 87
      Top = 64
      Width = 250
      Height = 22
      TabOrder = 2
      inherited cmbDescripcion: TComboGrid
        Width = 186
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
    inline fraTB_ESPECIAL2: TfraStaticCTB_TABLAS
      Left = 87
      Top = 93
      Width = 250
      Height = 25
      TabOrder = 3
      inherited cmbDescripcion: TComboGrid
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'TB_CLAVE'
          'TB_ESPECIAL1')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          -1)
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT CTB1.TB_CODIGO, CTB1.TB_DESCRIPCION, CTB1.TB_MODULO, CTB1' +
        '.TB_ESPECIAL1, CTB1.TB_ESPECIAL2, CTB1.TB_BAJA, TC_NOMBRE TEXTO,' +
        ' CTB2.TB_DESCRIPCION TIPO'
      'FROM CTB_TABLAS CTB1, CTC_TEXTOCARTA, CTB_TABLAS CTB2'
      'WHERE CTB1.TB_CLAVE = :pClave'
      'AND (CTB1.TB_MODULO = :pModulo OR :pModulo IS NULL)'
      'AND CTB1.TB_CODIGO <> '#39'0'#39' '
      'AND TC_ID (+)= CTB1.TB_ESPECIAL1'
      'AND CTB2.TB_CODIGO (+)= CTB1.TB_ESPECIAL2'
      'AND CTB2.TB_CLAVE (+)='#39'TEVTE'#39)
  end
  inherited ExportDialog: TExportDialog
    Fields = <
      item
        DataField = 'TB_CODIGO'
      end
      item
        DataField = 'TB_DESCRIPCION'
      end
      item
        DataField = 'TB_ESPECIAL1'
      end>
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
end
