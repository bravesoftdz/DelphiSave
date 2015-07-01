inherited fraContactoAgenda: TfraContactoAgenda
  Height = 125
  DesignSize = (
    480
    125)
  inherited lbContacto: TLabel
    Top = 31
  end
  inherited lbCargo: TLabel
    Top = 53
  end
  inherited lbArea: TLabel
    Top = 53
  end
  inherited lbeMail: TLabel
    Top = 100
  end
  inherited lbCAFAX: TLabel
    Top = 78
  end
  inherited lbFAX: TLabel
    Top = 77
  end
  object lbFraContacto: TLabel [6]
    Left = 8
    Top = 6
    Width = 51
    Height = 13
    Caption = 'Contacto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited CheckBox1: TCheckBox
    Top = 99
  end
  inherited edContacto: TEdit
    Top = 28
  end
  inherited edAreaFax: TPatternEdit
    Top = 75
  end
  inherited edFax: TPatternEdit
    Top = 74
  end
  inherited edEmail: TEdit
    Top = 97
    Height = 24
  end
  inherited fraArea: TfraStaticCTB_TABLAS
    Top = 50
    inherited cmbDescripcion: TComboGrid
      Cells = (
        'C'#243'digo'
        'Descripci'#243'n'
        'Id'
        'Fecha de Baja'
        'TB_CLAVE'
        'TB_ESPECIAL1')
      ColWidths = (
        40
        300
        -1
        -1
        -1
        -1)
    end
  end
  inherited fraCargo: TfraStaticCTB_TABLAS
    Top = 49
    inherited cmbDescripcion: TComboGrid
      Cells = (
        'C'#243'digo'
        'Descripci'#243'n'
        'Id'
        'Fecha de Baja'
        'TB_CLAVE'
        'TB_ESPECIAL1')
      ColWidths = (
        40
        300
        -1
        -1
        -1
        -1)
    end
  end
  inherited fraTelefonos: TfraTelefono
    Top = 74
    inherited cmbTelefonos: TComboGrid
      Cells = ()
      ColWidths = (
        64
        64)
    end
  end
  inherited chkRemitenteCarta: TCheckBox
    Top = 99
  end
  object ToolBarContacto: TToolBar [16]
    Left = 60
    Top = -1
    Width = 73
    Height = 26
    Align = alNone
    BorderWidth = 1
    EdgeBorders = []
    Flat = True
    HotImages = frmPrincipal.ilColor
    Images = frmPrincipal.ilByN
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    Transparent = True
    object tbContacto: TToolButton
      Left = 0
      Top = 0
      Hint = 'Asignar Responsable HYS'
      Caption = 'tbDiagRefrescar'
      ImageIndex = 14
      OnClick = tbContactoClick
    end
    object tbBuscarResponsableExistente: TToolButton
      Left = 23
      Top = 0
      Hint = 'Busca el responsable existente (HyS)'
      Caption = 'tbBuscarResponsableExistente'
      ImageIndex = 26
      OnClick = tbBuscarResponsableExistenteClick
    end
    object tbResposablesHys: TToolButton
      Left = 46
      Top = 0
      Hint = 'Resposables de HYS'
      Caption = 'tbResposablesHys'
      ImageIndex = 43
      OnClick = tbResposablesHysClick
    end
  end
end
