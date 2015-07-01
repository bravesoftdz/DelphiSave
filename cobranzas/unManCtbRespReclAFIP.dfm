inherited frmManCtbRespReclAFIP: TfrmManCtbRespReclAFIP
  Left = 199
  Top = 105
  Caption = 'Respuesta del Reclamo a la AFIP'
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
        Alignment = taCenter
        Expanded = False
        FieldName = 'TB_ESPECIAL1'
        Title.Alignment = taCenter
        Title.Caption = 'Aceptado por AFIP'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TB_USUALTA'
        Title.Caption = 'Usuario Alta'
        Width = 111
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TB_FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Alta'
        Width = 61
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 172
    inherited lbEspecial: TLabel
      Top = 61
      Width = 49
      Height = 26
      Caption = 'Ac&eptado por AFIP'
      WordWrap = True
    end
    inherited edEspecial: TEdit
      Width = 25
      CharCase = ecUpperCase
      MaxLength = 1
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT TB_CODIGO, TB_DESCRIPCION, TB_MODULO, TB_ESPECIAL1, TB_BA' +
        'JA,'
      '       TB_USUALTA, TRUNC(TB_FECHAALTA) TB_FECHAALTA'
      'FROM CTB_TABLAS'
      'WHERE TB_CLAVE = :pClave'
      'AND (TB_MODULO = :pModulo OR :pModulo IS NULL)'
      'AND TB_CODIGO <> '#39'0'#39' '
      ' '
      ' ')
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
