inherited frmManPIT_FIRMANTES: TfrmManPIT_FIRMANTES
  Left = 304
  Top = 101
  Caption = 'Mantenimiento de Profesionales Firmantes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'IT_CODIGO'
        Title.Caption = 'C'#243'digo'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IT_NOMBRE'
        Title.Caption = 'Nombre'
        Width = 198
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IT_MATRICULA'
        Title.Caption = 'Matr'#237'cula'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_MATRICULA'
        Title.Caption = 'Tipo'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IT_INSTITUCION_OTORGANTE'
        Title.Caption = 'Intituci'#243'n Otorgante'
        Width = 241
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IT_TITULO'
        Title.Caption = 'T'#237'tulo'
        Width = 196
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 120
    Top = 188
    Width = 481
    Height = 227
    Constraints.MaxHeight = 227
    Constraints.MinHeight = 227
    Constraints.MinWidth = 292
    inherited BevelAbm: TBevel
      Top = 191
      Width = 473
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 15
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel [2]
      Left = 8
      Top = 41
      Width = 85
      Height = 13
      Caption = 'Apellido y Nombre'
    end
    object Bevel1: TBevel [3]
      Left = 4
      Top = 66
      Width = 473
      Height = 2
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label3: TLabel [4]
      Left = 8
      Top = 83
      Width = 45
      Height = 13
      Caption = 'Matr'#237'cula'
    end
    object Label4: TLabel [5]
      Left = 8
      Top = 111
      Width = 21
      Height = 13
      Caption = 'Tipo'
    end
    object Label5: TLabel [6]
      Left = 8
      Top = 138
      Width = 98
      Height = 13
      Caption = 'Instituci'#243'n Otorgante'
    end
    object Label6: TLabel [7]
      Left = 8
      Top = 166
      Width = 28
      Height = 13
      Caption = 'T'#237'tulo'
    end
    inherited btnAceptar: TButton
      Left = 323
      Top = 197
      TabOrder = 6
    end
    inherited btnCancelar: TButton
      Left = 401
      Top = 197
      TabOrder = 7
    end
    object edIT_CODIGO: TPatternEdit
      Left = 111
      Top = 9
      Width = 121
      Height = 21
      MaxLength = 12
      TabOrder = 0
    end
    object edIT_NOMBRE: TPatternEdit
      Left = 111
      Top = 37
      Width = 362
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 35
      TabOrder = 1
      Pattern = ' abcdefghijklmn'#241'opqrstuvwxyz'#225#233#237#243#250#252#39#180'.'
    end
    object edIT_MATRICULA: TPatternEdit
      Left = 111
      Top = 77
      Width = 121
      Height = 21
      MaxLength = 15
      TabOrder = 2
      Pattern = '0123456789'
    end
    object cmbIT_TIPO_MATRICULA: TExComboBox
      Left = 111
      Top = 105
      Width = 174
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 3
      OnKeyPress = cmbIT_TIPO_MATRICULAKeyPress
      Items.Strings = (
        '1=RUGU'
        '2=RUTH'
        '3=Matr'#237'cula Profesional')
      ItemIndex = -1
      Options = [coShowValues, coGridLines]
      ValueWidth = 12
    end
    object edIT_INSTITUCION_OTORGANTE: TPatternEdit
      Left = 111
      Top = 134
      Width = 362
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 60
      TabOrder = 4
      Pattern = ' abcdefghijklmn'#241'opqrstuvwxyz'#225#233#237#243#250#252#39#180'0123456789.'
    end
    object edIT_TITULO: TPatternEdit
      Left = 111
      Top = 162
      Width = 274
      Height = 21
      MaxLength = 30
      TabOrder = 5
      Pattern = ' abcdefghijklmn'#241'opqrstuvwxyz'#225#233#237#243#250#252#39#180'.'
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT IT_CODIGO, IT_NOMBRE,'
      '       IT_MATRICULA, IT_TIPO_MATRICULA,'
      
        '       DECODE(IT_TIPO_MATRICULA, '#39'1'#39', '#39'RUGU'#39', '#39'2'#39', '#39'RUTH'#39', '#39'3'#39', ' +
        #39'Matr'#237'cula Profesional'#39') TIPO_MATRICULA,'
      '       IT_INSTITUCION_OTORGANTE, IT_TITULO,'
      '       IT_FECHABAJA'
      '  FROM ART.PIT_FIRMANTES'
      ' '
      ' ')
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
