inherited frmABMSecretaria: TfrmABMSecretaria
  Left = 229
  Top = 110
  Width = 566
  Height = 374
  Caption = 'ABM de Secretar'#237'as'
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
        FieldName = 'SC_ID'
        Title.Caption = 'Nro.'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'SC_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 151
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JU_DESCRIPCION'
        Title.Caption = 'Jurisdicci'#243'n'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FU_DESCRIPCION'
        Title.Caption = 'Fuero'
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JZ_DESCRIPCION'
        Title.Caption = 'Juzgado'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IN_DESCRIPCION'
        Title.Caption = 'Instancia'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_CODIGOSRT'
        Title.Caption = 'Codigo SRT'
        Width = 76
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 104
    Top = 116
    Width = 377
    Height = 128
    DesignSize = (
      377
      128)
    inherited BevelAbm: TBevel
      Top = 92
      Width = 369
    end
    object Label18: TLabel [1]
      Left = 22
      Top = 12
      Width = 76
      Height = 13
      Caption = 'Nro. Secretar'#237'a:'
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
      Top = 64
      Width = 61
      Height = 13
      Caption = 'Codigo SRT:'
    end
    inherited btnAceptar: TButton
      Left = 219
      Top = 98
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Left = 297
      Top = 98
      TabOrder = 3
    end
    object edNroSec: TPatternEdit
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
    object edDescripcionSec: TEdit
      Left = 105
      Top = 33
      Width = 248
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 250
      TabOrder = 1
    end
    object edCodigoSrt: TEdit
      Left = 105
      Top = 61
      Width = 248
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 8
      TabOrder = 4
    end
  end
  inherited sdqConsulta: TSDQuery
    DatabaseName = 'dbprincipal'
    BeforeOpen = sdqConsultaBeforeOpen
    SQL.Strings = (
      
        'SELECT sc_id, sc_descripcion, sc_codigosrt, sc_fechabaja, jz_des' +
        'cripcion, fu_descripcion, ju_descripcion, in_descripcion,'
      
        '       jz_idfuero, jz_idjurisdiccion, jz_idinstancia, jz_fechaba' +
        'ja'
      
        '  FROM legales.ljz_juzgado, legales.lfu_fuero, legales.lin_insta' +
        'ncia, legales.lju_jurisdiccion, legales.lsc_secretaria'
      ' WHERE jz_idfuero = fu_id'
      '   AND jz_idinstancia = in_id'
      '   AND ju_id = jz_idjurisdiccion'
      '   AND sc_idjuzgado = jz_id'
      '   AND sc_idjuzgado = :sc_idjuzgado')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sc_idjuzgado'
        ParamType = ptInput
      end>
  end
end
