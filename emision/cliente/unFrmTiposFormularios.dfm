inherited frmTiposFormularios: TfrmTiposFormularios
  Left = 332
  Top = 156
  Width = 602
  Caption = 'Administraci'#243'n de Tipos de Formularios'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 594
    Height = 0
  end
  inherited CoolBar: TCoolBar
    Top = 0
    Width = 594
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 590
      end>
    inherited ToolBar: TToolBar
      Width = 577
      HotImages = DmEmision.ilColor
      Images = DmEmision.ilByN
    end
  end
  inherited Grid: TArtDBGrid
    Top = 29
    Width = 594
    Height = 410
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    Columns = <
      item
        Expanded = False
        FieldName = 'TF_ID'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TF_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TF_HEADER'
        Title.Caption = 'C'#243'digo Archivo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TF_TRABAJADORES_DECODE'
        Title.Caption = 'Detalla Trabajadores'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TF_NOMINA_DECODE'
        Title.Caption = 'Contiene N'#243'mina'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TF_SINPERSONAL_DECODE'
        Title.Caption = 'No Tiene Tbj.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TF_MULTIPERIODO_DECODE'
        Title.Caption = 'Per'#237'odos M'#250'ltiples'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TF_PRESENTACIONMANUAL_DECODE'
        Title.Caption = 'Carga Manual'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TF_MODO_DECODE'
        Title.Caption = 'Modo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TF_FORMATO_DECODE'
        Title.Caption = 'Fomato'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 136
    Width = 429
    Height = 241
    inherited BevelAbm: TBevel
      Top = 205
      Width = 421
    end
    object Label18: TLabel [1]
      Left = 7
      Top = 12
      Width = 71
      Height = 13
      Caption = 'Nro.Formulario:'
    end
    object Label19: TLabel [2]
      Left = 7
      Top = 38
      Width = 59
      Height = 13
      Caption = 'Descripci'#243'n:'
    end
    object Label1: TLabel [3]
      Left = 7
      Top = 64
      Width = 64
      Height = 13
      Caption = 'C'#243'd. Archivo:'
    end
    object Label2: TLabel [4]
      Left = 7
      Top = 88
      Width = 30
      Height = 13
      Caption = 'Modo:'
    end
    object Label3: TLabel [5]
      Left = 7
      Top = 112
      Width = 41
      Height = 13
      Caption = 'Formato:'
    end
    inherited btnAceptar: TButton
      Left = 271
      Top = 211
      TabOrder = 8
    end
    inherited btnCancelar: TButton
      Left = 349
      Top = 211
      TabOrder = 9
    end
    object chkDetallaTrabajadores: TCheckBox
      Left = 53
      Top = 135
      Width = 145
      Height = 17
      Caption = 'Detalla Trabajadores'
      TabOrder = 3
    end
    object chkContieneNomina: TCheckBox
      Left = 53
      Top = 159
      Width = 121
      Height = 17
      Caption = 'Contiene N'#243'mina'
      TabOrder = 4
    end
    object chkCantTrabajadores: TCheckBox
      Left = 53
      Top = 183
      Width = 140
      Height = 17
      Caption = 'Sin Trabajadores'
      TabOrder = 5
    end
    object chkDetallaEspecificaPeriodosMultiples: TCheckBox
      Left = 197
      Top = 135
      Width = 129
      Height = 17
      Caption = 'Per'#237'odos M'#250'ltiples'
      TabOrder = 6
    end
    object chkPermiteCargaManual: TCheckBox
      Left = 197
      Top = 159
      Width = 129
      Height = 17
      Caption = 'Carga Manual'
      TabOrder = 7
    end
    object edNroFormulario: TPatternEdit
      Left = 83
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
    object edDescripcionFormulario: TEdit
      Left = 82
      Top = 35
      Width = 331
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 250
      TabOrder = 2
    end
    object edCodigoArchivo: TEdit
      Left = 82
      Top = 60
      Width = 331
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 20
      TabOrder = 1
    end
    object rbModoLocal: TRadioButton
      Left = 156
      Top = 88
      Width = 61
      Height = 17
      Caption = 'Local'
      TabOrder = 10
    end
    object cmbFormato: TComboBox
      Left = 84
      Top = 108
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 11
    end
    object rbModoServidor: TRadioButton
      Left = 84
      Top = 88
      Width = 61
      Height = 17
      Caption = 'Servidor'
      Checked = True
      TabOrder = 12
      TabStop = True
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'select EMI.*,'
      
        '       DECODE(TF_NOMINA, '#39'S'#39', '#39'Si'#39', '#39'N'#39', '#39'No'#39') AS TF_NOMINA_DECO' +
        'DE,'
      
        '       DECODE(TF_TRABAJADORES, '#39'S'#39', '#39'Si'#39', '#39'N'#39', '#39'No'#39') AS TF_TRABA' +
        'JADORES_DECODE,'
      
        '       DECODE(TF_SINPERSONAL, '#39'S'#39', '#39'Si'#39', '#39'N'#39', '#39'No'#39') AS TF_SINPER' +
        'SONAL_DECODE,'
      
        '       DECODE(TF_MULTIPERIODO, '#39'S'#39', '#39'Si'#39', '#39'N'#39', '#39'No'#39') AS TF_MULTI' +
        'PERIODO_DECODE,'
      
        '       DECODE(TF_PRESENTACIONMANUAL, '#39'S'#39', '#39'Si'#39', '#39'N'#39', '#39'No'#39') AS TF' +
        '_PRESENTACIONMANUAL_DECODE,'
      
        '       DECODE(TF_MODO, '#39'S'#39', '#39'Servidor'#39', '#39'L'#39', '#39'Local'#39') AS TF_MODO' +
        '_DECODE,'
      '       DECODE(TF_FORMATO, '
      '              1, '#39'SUSS'#39', '
      '              2, '#39'Monotributista'#39', '
      '              3, '#39'Sin Personal'#39', '
      '              4, '#39'Detalle Nomina'#39', '
      '              5, '#39'Resumen Nominas'#39') AS TF_FORMATO_DECODE'
      'from EMI.ITF_TIPOFORMULARIO  EMI')
  end
end
