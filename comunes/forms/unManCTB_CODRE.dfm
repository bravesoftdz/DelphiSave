inherited frmManCTB_CODRE: TfrmManCTB_CODRE
  Left = 199
  Top = 115
  Caption = 'Mantenimiento de C'#243'digos de Recepci'#243'n de Cartas Documento'
  PixelsPerInch = 96
  TextHeight = 13
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
        Width = 275
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CORREO'
        Title.Caption = 'Correo'
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TB_ESPECIAL2'
        Title.Caption = 'Endoso Aut.'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 124
    Top = 106
    Height = 145
    Constraints.MaxHeight = 145
    Constraints.MaxWidth = 341
    Constraints.MinHeight = 145
    inherited BevelAbm: TBevel
      Top = 109
    end
    inherited lbCodigo: TLabel
      Left = 26
    end
    inherited lbDescripcion: TLabel
      Left = 3
    end
    inherited lbEspecial: TLabel
      Left = 29
      Width = 33
      Caption = 'C&orreo'
    end
    inherited btnAceptar: TButton
      Top = 115
    end
    inherited btnCancelar: TButton
      Top = 115
    end
    inherited edCodigo: TPatternEdit
      Left = 63
    end
    inherited edDescripcion: TEdit
      Left = 63
      Width = 272
    end
    inherited edEspecial: TEdit
      Left = 63
      Width = 272
      TabOrder = 6
    end
    inherited edEspecial2: TEdit
      TabOrder = 7
    end
    inline fraTB_ESPECIAL1: TfraCtbTablas
      Left = 63
      Top = 64
      Width = 274
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Width = 221
      end
    end
    object chkEndoso: TCheckBox
      Left = 65
      Top = 90
      Width = 135
      Height = 17
      Caption = 'Endoso Autom'#225'tico'
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT CODRE.TB_CODIGO, CODRE.TB_DESCRIPCION, CODRE.TB_MODULO,'
      
        '       CODRE.TB_ESPECIAL1, CODRE.TB_ESPECIAL2, CORRE.TB_DESCRIPC' +
        'ION CORREO, CODRE.TB_BAJA'
      '  FROM CTB_TABLAS CODRE, CTB_TABLAS CORRE'
      ' WHERE CODRE.TB_CLAVE = :pClave'
      '   AND (CODRE.TB_MODULO = :pModulo OR :pModulo IS NULL)'
      '   AND CODRE.TB_CODIGO <> '#39'0'#39
      '   AND CORRE.TB_CLAVE = '#39'CORRE'#39
      '   AND CODRE.TB_ESPECIAL1 = CORRE.TB_ESPECIAL2')
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
        DataField = 'CORREO'
        Title = 'Correo'
      end
      item
        DataField = 'TB_ESPECIAL2'
        Title = 'Endoso Aut.'
      end>
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'C'#243'digo'
        TitleAlignment = taCenter
        DataField = 'TB_CODIGO'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'TB_DESCRIPCION'
        MaxLength = 65
      end
      item
        Title = 'Correo'
        DataField = 'CORREO'
        MaxLength = 30
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
