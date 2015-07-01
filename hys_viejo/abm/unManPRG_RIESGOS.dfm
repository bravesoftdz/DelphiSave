inherited frmManPRG_RIESGOS: TfrmManPRG_RIESGOS
  Left = 265
  Top = 108
  Caption = 'Mantenimiento de Riesgos'
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Height = 22
    Visible = True
    object dbiBusqueda: TDBIncrementalSearch
      Left = 0
      Top = 0
      Width = 620
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 0
      MinSearchLength = 1
      KeyField = 'RG_CODIGO'
      ListField = 'RG_DESCRIPCION'
      ListSource = dsConsulta
    end
  end
  inherited CoolBar: TCoolBar
    Top = 22
  end
  inherited Grid: TArtDBGrid
    Top = 51
    Height = 388
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'RG_CODIGO'
        Title.Caption = 'C'#243'digo Viejo'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RG_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 300
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RG_ESOP'
        Title.Alignment = taCenter
        Title.Caption = 'ESOP'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RG_SufijoESOP'
        Title.Caption = 'Sufijo'
        Width = 35
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CANCERIGENO'
        Title.Alignment = taCenter
        Title.Caption = 'Cancer'#237'geno'
        Width = 73
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 117
    Top = 108
    Width = 440
    Height = 160
    Constraints.MaxHeight = 160
    Constraints.MinHeight = 160
    Constraints.MinWidth = 205
    inherited BevelAbm: TBevel
      Top = 124
      Width = 432
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 16
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel [2]
      Left = 8
      Top = 44
      Width = 54
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object Label3: TLabel [3]
      Left = 8
      Top = 72
      Width = 26
      Height = 13
      Caption = 'ESOP'
    end
    object Label4: TLabel [4]
      Left = 173
      Top = 72
      Width = 56
      Height = 13
      Caption = 'Sufijo ESOP'
    end
    inherited btnAceptar: TButton
      Left = 282
      Top = 130
      TabOrder = 4
    end
    inherited btnCancelar: TButton
      Left = 360
      Top = 130
      TabOrder = 5
    end
    object edRG_CODIGO: TPatternEdit
      Left = 76
      Top = 12
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 15
      TabOrder = 0
    end
    object edRG_DESCRIPCION: TEdit
      Left = 76
      Top = 40
      Width = 356
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object chkRG_CANCERIGENO: TCheckBox
      Left = 76
      Top = 100
      Width = 97
      Height = 17
      Caption = 'Cancer'#237'geno'
      TabOrder = 3
    end
    object edRG_ESOP: TPatternEdit
      Left = 76
      Top = 68
      Width = 77
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 15
      TabOrder = 2
      Pattern = '0123456789'
    end
    object edRG_SufijoESOP: TPatternEdit
      Left = 235
      Top = 68
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 15
      TabOrder = 6
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT RG_CODIGO, RG_DESCRIPCION, RG_ESOP,'
      
        '       RG_CANCERIGENO, DECODE(RG_CANCERIGENO, '#39'S'#39', '#39'S'#237#39', '#39'N'#39', '#39'N' +
        'o'#39') CANCERIGENO,'
      '       RG_FECHABAJA, RG_SufijoESOP, RG_ID'
      'FROM PRG_RIESGOS')
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
end
