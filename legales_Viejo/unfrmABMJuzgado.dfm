inherited frmABMJuzgado: TfrmABMJuzgado
  Left = 202
  Top = 110
  Width = 566
  Height = 374
  Caption = 'ABM de Juzgados'
  Constraints.MinHeight = 0
  Constraints.MinWidth = 0
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 558
    Height = 66
    Visible = True
    object Label4: TLabel
      Left = 14
      Top = 13
      Width = 58
      Height = 13
      Caption = 'Jurisdicci'#243'n:'
    end
    object Label5: TLabel
      Left = 14
      Top = 40
      Width = 30
      Height = 13
      Caption = 'Fuero:'
    end
    inline frafilterJurisdiccion: TfraCodigoDescripcionExt
      Left = 78
      Top = 7
      Width = 468
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Width = 403
      end
    end
    inline fraFilterFuero: TfraCodigoDescripcionExt
      Left = 78
      Top = 35
      Width = 468
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Width = 405
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 66
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
        Hint = 'Ver Secretar'#237'as'
        Caption = 'Ver Secretar'#237'as'
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 95
    Width = 558
    Height = 252
    Columns = <
      item
        Expanded = False
        FieldName = 'ju_descripcion'
        Title.Caption = 'Jurisdicci'#243'n'
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FU_DESCRIPCION'
        Title.Caption = 'Fuero'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JZ_ID'
        Title.Caption = 'Nro.'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'JZ_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 371
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JZ_DIRECCION'
        Title.Caption = 'Domicilio'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IN_DESCRIPCION'
        Title.Caption = 'Instancia'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 120
    Top = 108
    Width = 377
    Height = 198
    DesignSize = (
      377
      198)
    inherited BevelAbm: TBevel
      Top = 162
      Width = 369
    end
    object Label18: TLabel [1]
      Left = 17
      Top = 12
      Width = 66
      Height = 13
      Caption = 'Nro. Juzgado:'
    end
    object Label19: TLabel [2]
      Left = 17
      Top = 36
      Width = 59
      Height = 13
      Caption = 'Descripci'#243'n:'
    end
    object Label1: TLabel [3]
      Left = 17
      Top = 60
      Width = 58
      Height = 13
      Caption = 'Jurisdicci'#243'n:'
    end
    object Label2: TLabel [4]
      Left = 17
      Top = 84
      Width = 30
      Height = 13
      Caption = 'Fuero:'
    end
    object Label3: TLabel [5]
      Left = 17
      Top = 109
      Width = 46
      Height = 13
      Caption = 'Instancia:'
    end
    object Domicilio: TLabel [6]
      Left = 17
      Top = 132
      Width = 48
      Height = 13
      Caption = 'Direcci'#243'n:'
    end
    inherited btnAceptar: TButton
      Left = 219
      Top = 168
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Left = 297
      Top = 168
      TabOrder = 3
    end
    object edNroJuzgado: TPatternEdit
      Left = 94
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
    object edDescripcionJuzgado: TEdit
      Left = 94
      Top = 33
      Width = 248
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 250
      TabOrder = 1
    end
    inline fraJurisdiccion: TfraCodigoDescripcionExt
      Left = 93
      Top = 56
      Width = 254
      Height = 23
      TabOrder = 4
      inherited cmbDescripcion: TArtComboBox
        Width = 186
      end
    end
    inline fraFuero: TfraCodigoDescripcionExt
      Left = 93
      Top = 80
      Width = 252
      Height = 23
      TabOrder = 5
      inherited cmbDescripcion: TArtComboBox
        Width = 186
      end
    end
    inline fraInstancia: TfraCodigoDescripcionExt
      Left = 93
      Top = 104
      Width = 252
      Height = 23
      TabOrder = 6
      inherited cmbDescripcion: TArtComboBox
        Width = 187
      end
    end
    object edDomicilio: TEdit
      Left = 94
      Top = 129
      Width = 248
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 250
      TabOrder = 7
    end
  end
  inherited sdqConsulta: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      
        'select JZ_ID, JZ_DESCRIPCION, JZ_FECHABAJA, JZ_DIRECCION, FU_DES' +
        'CRIPCION, ju_descripcion, IN_DESCRIPCION, JZ_IDFUERO, JZ_IDJURIS' +
        'DICCION, JZ_IDINSTANCIA, JZ_FECHABAJA'
      
        'from legales.ljz_juzgado, legales.lfu_fuero, legales.lin_instanc' +
        'ia, legales.lju_jurisdiccion'
      
        'where JZ_IDFUERO = fu_id and JZ_IDINSTANCIA = in_id and ju_id = ' +
        'jz_idjurisdiccion')
  end
end
