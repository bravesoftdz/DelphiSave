inherited frmAdministracionObservaciones: TfrmAdministracionObservaciones
  Left = 75
  Top = 119
  Width = 602
  Height = 367
  Caption = 'Administraci'#243'n de Observaciones'
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
    Height = 292
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    Columns = <
      item
        Expanded = False
        FieldName = 'OB_ID'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OB_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Title.Caption = 'Tipo'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RECHAZO'
        Title.Caption = 'Tipo Rechazo'
        Width = 189
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OB_APROBACION'
        Title.Caption = 'Req. Aprobaci'#243'n'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OB_MANUAL'
        Title.Caption = 'Manual'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 92
    Top = 72
    Width = 429
    Height = 173
    OnShow = fpAbmShow
    inherited BevelAbm: TBevel
      Top = 137
      Width = 421
    end
    object Label18: TLabel [1]
      Left = 7
      Top = 12
      Width = 63
      Height = 13
      Caption = 'Nro. Observ.:'
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
      Width = 24
      Height = 13
      Caption = 'Tipo:'
    end
    object Label2: TLabel [4]
      Left = 7
      Top = 88
      Width = 70
      Height = 13
      Caption = 'Tipo Rechazo:'
    end
    inherited btnAceptar: TButton
      Left = 271
      Top = 143
      TabOrder = 5
    end
    inherited btnCancelar: TButton
      Left = 349
      Top = 143
      TabOrder = 6
    end
    object edNroObs: TPatternEdit
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
    object edDescripcionObs: TEdit
      Left = 82
      Top = 35
      Width = 331
      Height = 21
      MaxLength = 250
      TabOrder = 1
    end
    object cmbTipoObs: TExComboBox
      Left = 82
      Top = 59
      Width = 331
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 2
      Items.Strings = (
        'D=Declaraci'#243'n Jurada'
        'T=Trabajador')
      ItemIndex = -1
      Options = []
      ValueWidth = 64
    end
    object cmbTipoRechazo: TExComboBox
      Left = 82
      Top = 84
      Width = 331
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 3
      Items.Strings = (
        'S=Rechazar y Gestionar'
        'N=Aceptar'
        'G=Aceptar y Gestionar'
        'I=Aceptar e Informar'
        'X=Rechazar')
      ItemIndex = -1
      Options = []
      ValueWidth = 64
    end
    object chkManual: TCheckBox
      Left = 7
      Top = 115
      Width = 196
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Aceptada en Operaciones Manuales'
      TabOrder = 4
    end
  end
  object StatusBar1: TStatusBar [4]
    Left = 0
    Top = 321
    Width = 594
    Height = 19
    Panels = <>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT OB_ID, '
      '        OB_DESCRIPCION, '
      '        DECODE (OB_TIPO,    '#39'D'#39', '#39'Declaraci'#243'n Jurada'#39', '
      '                            '#39'T'#39', '#39'Trabajador'#39', '
      '                                 '#39#39') AS TIPO,'
      '        OB_TIPO,'
      '        DECODE (OB_RECHAZO,    '
      '                            '#39'S'#39', '#39'Rechazar y Gestionar'#39', '
      '                            '#39'N'#39', '#39'Aceptar'#39', '
      '                            '#39'G'#39', '#39'Aceptar y Gestionar'#39', '
      '                            '#39'I'#39', '#39'Aceptar e Informar'#39', '
      '                            '#39'X'#39', '#39'Rechazar'#39','
      '                                 '#39#39') AS RECHAZO,'
      '        OB_RECHAZO, '
      '        OB_APROBACION,'
      '        OB_MANUAL,'
      '        OB_FECHABAJA'
      'FROM EMI.IOB_OBSERVACION'
      'WHERE 1=1'
      '')
  end
end
