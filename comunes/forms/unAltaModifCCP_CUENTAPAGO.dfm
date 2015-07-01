object frmAltaModifCCP_CUENTAPAGO: TfrmAltaModifCCP_CUENTAPAGO
  Left = 386
  Top = 125
  Width = 530
  Height = 322
  BorderIcons = [biSystemMenu]
  Color = clBtnFace
  Constraints.MaxHeight = 322
  Constraints.MinHeight = 322
  Constraints.MinWidth = 530
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    522
    294)
  PixelsPerInch = 96
  TextHeight = 13
  object lblBanco: TLabel
    Left = 4
    Top = 100
    Width = 83
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Banco'
  end
  object lblTipoCuenta: TLabel
    Left = 4
    Top = 155
    Width = 83
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Tipo de Cuenta'
  end
  object lblNroCuenta: TLabel
    Left = 4
    Top = 182
    Width = 83
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Nro. Cuenta'
  end
  object lblCBU: TLabel
    Left = 4
    Top = 210
    Width = 83
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'CBU'
  end
  object lblSeparador: TLabel
    Left = 153
    Top = 210
    Width = 9
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = '-'
  end
  object BevelAbm: TBevel
    Left = -37
    Top = 260
    Width = 578
    Height = 2
    Anchors = [akLeft, akTop, akRight]
    Shape = bsTopLine
  end
  object lblTipoAcreedor: TLabel
    Left = 4
    Top = 10
    Width = 83
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Tipo de Acreedor'
  end
  object lblCuitCuil: TLabel
    Left = 0
    Top = 37
    Width = 83
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'CUIT/CUIL'
    Visible = False
  end
  object lblSucursal: TLabel
    Left = 4
    Top = 127
    Width = 83
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Sucursal'
  end
  object Label1: TLabel
    Left = 4
    Top = 236
    Width = 83
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Propietario Cta.'
  end
  inline fraBancos: TfraCodigoDescripcion
    Left = 90
    Top = 95
    Width = 428
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 4
    DesignSize = (
      428
      23)
    inherited cmbDescripcion: TArtComboBox
      Width = 364
    end
  end
  inline fraStaticCTB_TiposCuentas: TfraStaticCTB_TABLAS
    Left = 90
    Top = 151
    Width = 429
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 6
    DesignSize = (
      429
      23)
    inherited cmbDescripcion: TComboGrid
      Width = 365
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
  object edCBU1: TPatternEdit
    Left = 91
    Top = 206
    Width = 61
    Height = 21
    MaxLength = 8
    TabOrder = 8
    OnChange = edCBU1Change
    Pattern = '0123456789'
  end
  object edCBU2: TPatternEdit
    Left = 162
    Top = 206
    Width = 95
    Height = 21
    MaxLength = 14
    TabOrder = 9
    Pattern = '0123456789'
  end
  object btnAceptar: TButton
    Left = 361
    Top = 266
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = '&Aceptar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    OnClick = btnAceptarClick
  end
  object btnCancelar: TButton
    Left = 440
    Top = 266
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 12
  end
  inline fraStaticCTB_TiposAcreedores: TfraStaticCTB_TABLAS
    Left = 91
    Top = 6
    Width = 428
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    DesignSize = (
      428
      23)
    inherited cmbDescripcion: TComboGrid
      Width = 364
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
  object edCuitCuil: TMaskEdit
    Left = 91
    Top = 33
    Width = 84
    Height = 21
    EditMask = '99-99999999-c;0;'
    MaxLength = 13
    TabOrder = 1
    OnChange = edCuitCuilChange
  end
  inline fraVendedoresCUITAcre: TfraVendedoresCUIT
    Left = 55
    Top = 31
    Width = 477
    Height = 24
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 13
    DesignSize = (
      477
      24)
    inherited lbRSocial: TLabel
      Left = 4
      Width = 24
      Caption = 'CUIT'
    end
    inherited Label1: TLabel
      Left = 122
    end
    inherited cmbDescripcion: TArtComboBox
      Left = 274
      Width = 185
    end
    inherited edCodigo: TPatternEdit
      Left = 158
    end
    inherited mskCuit: TMaskEdit
      Left = 36
    end
  end
  inline fraPrestadorAcre: TfraCPR_PRESTADOR
    Left = 55
    Top = 31
    Width = 462
    Height = 24
    VertScrollBar.Range = 49
    VertScrollBar.Visible = False
    Anchors = [akLeft, akTop, akRight]
    AutoScroll = False
    TabOrder = 2
    Visible = False
    DesignSize = (
      462
      24)
    inherited lbCUIT: TLabel
      Top = 6
      Width = 24
    end
    inherited lbSec: TLabel
      Top = 6
      Width = 21
    end
    inherited lbIdentif: TLabel
      Top = 6
      Width = 40
    end
    inherited lbRSocial: TLabel
      Top = 6
      Width = 38
    end
    inherited lbDomicilio: TLabel
      Width = 40
    end
    inherited lbLocalidad: TLabel
      Width = 44
    end
    inherited lbCPostal: TLabel
      Left = 614
      Width = 21
    end
    inherited cmbCA_DESCRIPCION: TArtComboBox
      Width = 135
    end
    inherited edCA_LOCALIDAD: TEdit
      Width = 239
    end
    inherited edCA_CODPOSTAL: TEdit
      Left = 638
    end
  end
  inline fraSucursales: TfraCodigoDescripcion
    Left = 90
    Top = 121
    Width = 427
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 5
    DesignSize = (
      427
      23)
    inherited cmbDescripcion: TArtComboBox
      Width = 364
    end
  end
  object edNroCuenta: TEdit
    Left = 91
    Top = 180
    Width = 61
    Height = 21
    MaxLength = 17
    TabOrder = 7
  end
  inline fraStaticCTB_PropiedadCta: TfraStaticCTB_TABLAS
    Left = 90
    Top = 232
    Width = 291
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 10
    DesignSize = (
      291
      23)
    inherited cmbDescripcion: TComboGrid
      Width = 227
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
  object rgTipoDatoBanco: TRadioGroup
    Left = 90
    Top = 57
    Width = 161
    Height = 33
    Columns = 2
    Items.Strings = (
      'Cuenta'
      'CBU')
    TabOrder = 3
    OnClick = rgTipoDatoBancoClick
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <
      item
        Name = 'VerTodosBancos'
      end>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = False
    Left = 4
    Top = 267
  end
end
