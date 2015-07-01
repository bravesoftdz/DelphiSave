object fraNormaLegal: TfraNormaLegal
  Left = 0
  Top = 0
  Width = 535
  Height = 109
  TabOrder = 0
  DesignSize = (
    535
    109)
  object lblDescripcionSentencia: TLabel
    Left = 9
    Top = 11
    Width = 34
    Height = 13
    Caption = 'Norma:'
  end
  object lblNombre: TLabel
    Left = 9
    Top = 35
    Width = 40
    Height = 13
    Caption = 'Nombre:'
  end
  object lblArticulo: TLabel
    Left = 9
    Top = 83
    Width = 40
    Height = 13
    Caption = 'Art'#237'culo:'
  end
  object lblNro: TLabel
    Left = 302
    Top = 36
    Width = 59
    Height = 13
    Caption = 'Descripci'#243'n:'
  end
  object lblInciso: TLabel
    Left = 140
    Top = 83
    Width = 31
    Height = 13
    Caption = 'Inciso:'
  end
  object lblFechaNorma: TLabel
    Left = 9
    Top = 59
    Width = 33
    Height = 13
    Caption = 'Fecha:'
  end
  object lblFechaPublicacion: TLabel
    Left = 181
    Top = 59
    Width = 67
    Height = 13
    Caption = 'F.Publicaci'#243'n:'
  end
  object lblFechaDerogacion: TLabel
    Left = 361
    Top = 59
    Width = 67
    Height = 13
    Alignment = taRightJustify
    Caption = 'F.Derogaci'#243'n:'
  end
  object Label1: TLabel
    Left = 314
    Top = 83
    Width = 46
    Height = 13
    Caption = 'Apartado:'
  end
  object Label2: TLabel
    Left = 430
    Top = 83
    Width = 33
    Height = 13
    Caption = 'Anexo:'
  end
  inline fraNorma: TfraCodigoDescripcionExt
    Left = 75
    Top = 7
    Width = 448
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    inherited cmbDescripcion: TArtComboBox
      Left = 66
      Width = 383
      Color = clWhite
    end
    inherited edCodigo: TPatternEdit
      Width = 61
      Color = clWhite
    end
  end
  inline fraNombreNorma: TfraCodigoDescripcionExt
    Left = 75
    Top = 31
    Width = 190
    Height = 23
    TabOrder = 1
    inherited cmbDescripcion: TArtComboBox
      Left = 66
      Width = 125
      Color = clWhite
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO'
          Title.Caption = 'C'#243'digo'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPCION'
          Title.Caption = 'Descripci'#243'n'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NO_DESCRIPCION'
          ReadOnly = True
          Title.Caption = 'N'#250'mero'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NO_CANTIDADARTICULOS'
          Title.Caption = 'Cant.Art.'
          Visible = True
        end>
    end
    inherited edCodigo: TPatternEdit
      Width = 61
      Color = clWhite
    end
  end
  object edInciso: TPatternEdit
    Left = 186
    Top = 80
    Width = 119
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 20
    TabOrder = 4
  end
  object edDescripcion: TPatternEdit
    Left = 368
    Top = 32
    Width = 153
    Height = 21
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    CharCase = ecUpperCase
    Color = 16776176
    MaxLength = 10
    ReadOnly = True
    TabOrder = 2
  end
  object fpTexto: TFormPanel
    Left = 8
    Top = 120
    Width = 508
    Height = 153
    Caption = 'Texto del Art'#237'culo de la Norma'
    FormWidth = 0
    FormHeigth = 0
    object mTexto: TMemo
      Left = 0
      Top = 0
      Width = 508
      Height = 153
      Align = alClient
      Lines.Strings = (
        '')
      TabOrder = 0
    end
  end
  object tbExporarTextoNorma: TToolBar
    Left = 268
    Top = 30
    Width = 31
    Height = 26
    Align = alNone
    BorderWidth = 1
    ButtonWidth = 25
    Caption = 'ToolBar de Texto Norma'
    EdgeBorders = []
    Flat = True
    HotImages = dmLegales.ilByN
    Images = dmLegales.ilColor
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    object tbHistoricoEstados: TToolButton
      Left = 0
      Top = 0
      Hint = 'Nuevo'
      ImageIndex = 14
      OnClick = tbHistoricoEstadosClick
    end
  end
  object edFechaNorma: TDateComboBox
    Left = 76
    Top = 56
    Width = 90
    Height = 21
    TabStop = False
    MinDate = 35431.000000000000000000
    Color = 16776176
    ReadOnly = True
    TabOrder = 6
  end
  object edFechaPublicacion: TDateComboBox
    Left = 252
    Top = 56
    Width = 90
    Height = 21
    TabStop = False
    MinDate = 35431.000000000000000000
    Color = 16776176
    ReadOnly = True
    TabOrder = 7
  end
  object edFechaDerogacion: TDateComboBox
    Left = 433
    Top = 56
    Width = 90
    Height = 21
    TabStop = False
    MinDate = 35431.000000000000000000
    Color = 16776176
    ReadOnly = True
    TabOrder = 8
  end
  object edArticulo: TIntEdit
    Left = 76
    Top = 80
    Width = 45
    Height = 21
    TabOrder = 3
    MaxLength = 2
  end
  object edApartado: TPatternEdit
    Left = 366
    Top = 80
    Width = 54
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 5
    TabOrder = 10
  end
  object edanexo: TPatternEdit
    Left = 467
    Top = 80
    Width = 54
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 5
    TabOrder = 11
  end
end
