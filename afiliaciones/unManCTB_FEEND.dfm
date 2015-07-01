inherited frmManCTB_FEEND: TfrmManCTB_FEEND
  Left = 197
  Top = 108
  Caption = 'Mantenimiento de Tipo de Endosos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpAbm: TFormPanel
    Left = 156
    Top = 148
    Width = 344
    Height = 120
    Constraints.MaxHeight = 120
    Constraints.MinHeight = 120
    inherited BevelAbm: TBevel
      Top = 84
      Width = 336
    end
    inherited lbCodigo: TLabel
      Left = 51
    end
    inherited lbDescripcion: TLabel
      Left = 28
    end
    inherited lbEspecial: TLabel
      Left = 12
      Top = 100
      Visible = False
    end
    object Label1: TLabel [4]
      Left = 12
      Top = 62
      Width = 69
      Height = 13
      Caption = 'Tipo de Acci'#243'n'
    end
    inherited edEspecial2: TEdit [6]
      Width = 260
      TabOrder = 7
    end
    inherited btnAceptar: TButton [7]
      Left = 184
      Top = 90
      Width = 72
    end
    inherited btnCancelar: TButton [8]
      Left = 264
      Top = 90
      Width = 72
    end
    inherited edCodigo: TPatternEdit [9]
    end
    inherited edDescripcion: TEdit [10]
      Width = 260
    end
    inherited edEspecial: TEdit [11]
      Left = 62
      Top = 96
      Width = 58
      TabOrder = 6
      Visible = False
    end
    object rbEndoso: TRadioButton
      Left = 88
      Top = 61
      Width = 61
      Height = 17
      Caption = 'Endoso'
      TabOrder = 2
    end
    object rbMovimiento: TRadioButton
      Left = 150
      Top = 61
      Width = 77
      Height = 17
      Caption = 'Movimiento'
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT TB_CODIGO, TB_DESCRIPCION, TB_MODULO, '
      
        'IIF_CHAR(TB_ESPECIAL1,'#39'1'#39','#39'Endoso'#39','#39'Movimiento'#39') TB_ESPECIAL1, T' +
        'B_BAJA'
      'FROM CTB_TABLAS'
      'WHERE TB_CLAVE = :pClave'
      'AND (TB_MODULO = :pModulo OR :pModulo IS NULL)'
      'AND TB_CODIGO <> '#39'0'#39' ')
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
