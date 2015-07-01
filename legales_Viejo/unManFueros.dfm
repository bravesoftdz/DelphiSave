inherited frmManFuero: TfrmManFuero
  Caption = 'Mantenimiento de Fueros'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'FU_ID'
        Title.Caption = 'ID'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FU_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FU_USUALTA'
        Title.Caption = 'Usuario Alta'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FU_FECHAALTA'
        Title.Caption = 'Fecha de Alta'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FU_USUMODIF'
        Title.Caption = 'Usuario Modificaci'#243'n'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FU_FECHAMODIF'
        Title.Caption = 'Fecha Modificaci'#243'n'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FU_USUBAJA'
        Title.Caption = 'Usuario Baja'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FU_FECHABAJA'
        Title.Caption = 'Fecha Baja'
        Width = 86
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Width = 334
    Height = 97
    inherited BevelAbm: TBevel
      Top = 61
      Width = 326
    end
    object Label1: TLabel [1]
      Left = 6
      Top = 12
      Width = 66
      Height = 13
      Caption = 'Nro. Juzgado:'
    end
    object Label2: TLabel [2]
      Left = 6
      Top = 36
      Width = 59
      Height = 13
      Caption = 'Descripci'#243'n:'
    end
    inherited btnAceptar: TButton
      Left = 176
      Top = 67
    end
    inherited btnCancelar: TButton
      Left = 254
      Top = 67
    end
    object edNroJuzgado: TPatternEdit
      Left = 77
      Top = 9
      Width = 60
      Height = 21
      CharCase = ecUpperCase
      Color = clInactiveCaptionText
      MaxLength = 10
      ReadOnly = True
      TabOrder = 2
      Alignment = taRightJustify
      Pattern = '0123456789'
    end
    object edDescripcion: TEdit
      Left = 78
      Top = 33
      Width = 248
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 250
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT fu_id, fu_descripcion, fu_fechaalta, fu_usualta,'
      '       fu_fechamodif, fu_usumodif, fu_fechabaja, fu_usubaja'
      '  FROM legales.lfu_fuero ')
  end
end
