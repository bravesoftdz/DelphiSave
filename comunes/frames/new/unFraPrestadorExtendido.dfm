inherited fraPrestadorExtendido: TfraPrestadorExtendido
  Width = 694
  Height = 56
  Font.Name = 'Tahoma'
  ParentFont = False
  DesignSize = (
    694
    56)
  inherited lbCUIT: TLabel
    Width = 24
  end
  inherited lbSec: TLabel
    Width = 21
  end
  inherited lbIdentif: TLabel
    Left = 200
    Width = 36
    Caption = 'Identif.'
  end
  inherited lbRSocial: TLabel
    Left = 292
    Width = 38
  end
  inherited lbDomicilio: TLabel
    Top = 36
    Width = 40
  end
  inherited lbLocalidad: TLabel
    Left = 256
    Top = 36
    Width = 44
  end
  inherited lbCPostal: TLabel
    Left = 531
    Top = 36
    Width = 21
    Caption = 'C.P.'
  end
  object lbExterno: TLabel [7]
    Left = 619
    Top = 36
    Width = 52
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Es externo'
  end
  inherited mskCA_CLAVE: TMaskEdit
    Top = 4
  end
  inherited cmbCA_DESCRIPCION: TArtComboBox
    Left = 336
    Top = 4
    Width = 249
  end
  inherited edCA_DOMICILIO: TEdit
    Top = 32
    Width = 197
  end
  inherited edCA_LOCALIDAD: TEdit
    Left = 308
    Top = 32
    Width = 216
  end
  inherited edCA_CODPOSTAL: TEdit
    Left = 555
    Top = 32
  end
  inherited edCA_IDENTIFICADOR: TIntEdit
    Left = 240
    Top = 4
  end
  inherited edCA_SECUENCIA: TIntEdit
    Top = 4
  end
  object btnNuevo: TJvXPButton [15]
    Left = 591
    Top = 4
    Width = 49
    Hint = 
      'Alta de un prestador externo a la ART (Utilice primero la b'#250'sque' +
      'da antes de dar de alta un prestador externo)'
    Caption = '&Nuevo'
    TabOrder = 7
    Anchors = [akTop, akRight]
    ParentShowHint = False
    ShowHint = True
    OnClick = btnNuevoClick
  end
  object fpAltaPrestadorExterno: TFormPanel [16]
    Left = 84
    Top = 92
    Width = 373
    Height = 241
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsNone
    Position = poOwnerFormCenter
    DesignSize = (
      373
      241)
    object btnGuardarAlta: TJvXPButton
      Left = 240
      Top = 212
      Width = 61
      Caption = '&Guardar'
      TabOrder = 0
      Anchors = [akTop, akRight]
      OnClick = btnGuardarAltaClick
    end
    object btnCancelarAlta: TJvXPButton
      Left = 304
      Top = 212
      Width = 61
      Caption = '&Cancelar'
      TabOrder = 1
      ModalResult = 2
      Anchors = [akTop, akRight]
    end
  end
  object btnBuscar: TJvXPButton [17]
    Left = 643
    Top = 4
    Width = 49
    Caption = '&Buscar'
    TabOrder = 10
    Anchors = [akTop, akRight]
    OnClick = btnBuscarClick
  end
  object chkExterno: TJvXPCheckbox [18]
    Left = 675
    Top = 34
    Width = 17
    Height = 17
    Enabled = False
    TabOrder = 9
    Spacing = 0
    Anchors = [akTop, akRight]
  end
  object fpBusqueda: TFormPanel [19]
    Left = 468
    Top = 92
    Width = 373
    Height = 241
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsNone
    Position = poOwnerFormCenter
    DesignSize = (
      373
      241)
    object btnAceptarBusqueda: TJvXPButton
      Left = 240
      Top = 212
      Width = 61
      Caption = '&Aceptar'
      TabOrder = 0
      Anchors = [akTop, akRight]
      OnClick = btnAceptarBusquedaClick
    end
    object btnCancelarBusqueda: TJvXPButton
      Left = 304
      Top = 212
      Width = 61
      Caption = '&Cancelar'
      TabOrder = 1
      ModalResult = 2
      Anchors = [akTop, akRight]
    end
  end
  inherited sdqDatos: TSDQuery
    SQL.Strings = ()
    Left = 12
    Top = 80
  end
  inherited dsDatos: TDataSource
    Left = 40
    Top = 80
  end
end
