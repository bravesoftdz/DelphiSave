inherited frmABMJurisdiccion: TfrmABMJurisdiccion
  Top = 107
  Width = 566
  Height = 374
  Caption = 'ABM de Jurisdicciones'
  Constraints.MinHeight = 0
  Constraints.MinWidth = 0
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 558
    Height = 1
  end
  inherited CoolBar: TCoolBar
    Top = 1
    Width = 558
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 554
      end>
    inherited ToolBar: TToolBar
      Width = 541
      inherited tbPropiedades: TToolButton
        Hint = 'Ver Juzgados'
        Caption = 'Ver Juzgados'
        Visible = True
        OnClick = tbPropiedadesClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 30
    Width = 558
    Height = 317
    Columns = <
      item
        Expanded = False
        FieldName = 'JU_ID'
        Title.Caption = 'Nro.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JU_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 371
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JURISDICCION'
        Title.Caption = 'T. Jurisdicci'#243'n'
        Width = 105
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 104
    Top = 116
    Width = 377
    Height = 157
    DesignSize = (
      377
      157)
    inherited BevelAbm: TBevel
      Top = 121
      Width = 369
    end
    object Label18: TLabel [1]
      Left = 22
      Top = 12
      Width = 81
      Height = 13
      Caption = 'Nro. Jurisdicci'#243'n:'
    end
    object Label19: TLabel [2]
      Left = 22
      Top = 36
      Width = 59
      Height = 13
      Caption = 'Descripci'#243'n:'
    end
    object Label1: TLabel [3]
      Left = 22
      Top = 85
      Width = 66
      Height = 13
      Caption = 'Tipo de Juris.:'
    end
    object Label2: TLabel [4]
      Left = 22
      Top = 61
      Width = 52
      Height = 13
      Caption = 'Provincias:'
    end
    inherited btnAceptar: TButton
      Left = 219
      Top = 127
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Left = 297
      Top = 127
      TabOrder = 3
    end
    object edNroJurisdiccion: TPatternEdit
      Left = 105
      Top = 9
      Width = 60
      Height = 21
      CharCase = ecUpperCase
      Color = clInactiveCaptionText
      MaxLength = 10
      ReadOnly = True
      TabOrder = 0
      Alignment = taRightJustify
      Pattern = '0123456789'
    end
    object edDescripcionJuris: TEdit
      Left = 105
      Top = 33
      Width = 248
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 250
      TabOrder = 1
    end
    object cbTipoJurisdiccion: TExComboBox
      Left = 105
      Top = 80
      Width = 249
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 5
      Items.Strings = (
        'P=Provincial'
        'F=Federal')
      ItemIndex = -1
      Options = []
      ValueWidth = 64
    end
    inline fraProvincias: TfraCodigoDescripcionExt
      Left = 104
      Top = 55
      Width = 251
      Height = 23
      TabOrder = 4
      inherited cmbDescripcion: TArtComboBox
        Left = 38
        Width = 212
      end
      inherited edCodigo: TPatternEdit
        Width = 33
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      'SELECT JU_ID, JU_DESCRIPCION,      '
      '    DECODE (JU_JURISDICCION, '
      #9#39'P'#39', '#39'PROVINCIAL'#39','
      #9#39'F'#39', '#39'FEDERAL'#39')AS JURISDICCION,'
      '                JU_FECHABAJA,'
      '                JU_JURISDICCION,'
      '      JU_IDPROVINCIA'
      'FROM legales.lju_jurisdiccion'
      '')
  end
end
