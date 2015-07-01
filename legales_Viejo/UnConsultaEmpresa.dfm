object frmConsultaEmpresa: TfrmConsultaEmpresa
  Left = 208
  Top = 111
  Width = 625
  Height = 350
  Caption = 'Consulta de Empresa'
  Color = clBtnFace
  Constraints.MinHeight = 350
  Constraints.MinWidth = 625
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    617
    323)
  PixelsPerInch = 96
  TextHeight = 13
  object btnSalir: TButton
    Left = 540
    Top = 296
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Salir'
    ModalResult = 2
    TabOrder = 0
  end
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 617
    Height = 293
    Alignment = taRightJustify
    Anchors = [akLeft, akTop, akRight, akBottom]
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    TabOrder = 1
    DesignSize = (
      617
      293)
    object lbCUIT: TLabel
      Left = 47
      Top = 13
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    object lbRazonSocial: TLabel
      Left = 9
      Top = 38
      Width = 63
      Height = 13
      Caption = 'RazonSocial:'
    end
    object lbContrato: TLabel
      Left = 459
      Top = 13
      Width = 43
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Contrato:'
    end
    object Label1: TLabel
      Left = 27
      Top = 63
      Width = 45
      Height = 13
      Caption = 'Domicilio:'
    end
    object lbNumero: TLabel
      Left = 32
      Top = 89
      Width = 40
      Height = 13
      Caption = 'N'#250'mero:'
    end
    object lbPiso: TLabel
      Left = 396
      Top = 89
      Width = 23
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Piso:'
    end
    object lbDepartamento: TLabel
      Left = 496
      Top = 89
      Width = 64
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Departameto:'
    end
    object lbLocalidad: TLabel
      Left = 22
      Top = 114
      Width = 49
      Height = 13
      Caption = 'Localidad:'
    end
    object lbCodigoPostal: TLabel
      Left = 493
      Top = 113
      Width = 68
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Codigo Postal:'
    end
    object lbDescripcion: TLabel
      Left = 13
      Top = 140
      Width = 59
      Height = 13
      Caption = 'Descripci'#243'n:'
    end
    object lbTelefono: TLabel
      Left = 22
      Top = 165
      Width = 50
      Height = 13
      Caption = 'Tel'#233'fonos:'
    end
    object lbContacto: TLabel
      Left = 26
      Top = 190
      Width = 46
      Height = 13
      Caption = 'Contacto:'
    end
    object lbFechaBaja: TLabel
      Left = 351
      Top = 244
      Width = 72
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Fecha de Baja:'
    end
    object lbPeriodo: TLabel
      Left = 387
      Top = 220
      Width = 36
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Estado:'
    end
    object LblBaja: TLabel
      Left = 389
      Top = 268
      Width = 24
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Baja:'
    end
    object edmp_cuit: TEdit
      Left = 75
      Top = 8
      Width = 104
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object edmp_nombre: TEdit
      Left = 75
      Top = 34
      Width = 535
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object edmp_contrato: TEdit
      Left = 506
      Top = 9
      Width = 104
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      BiDiMode = bdLeftToRight
      Color = clBtnFace
      ParentBiDiMode = False
      ReadOnly = True
      TabOrder = 2
    end
    object edmp_calle: TEdit
      Left = 75
      Top = 59
      Width = 535
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
    end
    object edmp_numero: TEdit
      Left = 75
      Top = 85
      Width = 119
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
    end
    object edmp_piso: TEdit
      Left = 423
      Top = 85
      Width = 48
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 5
    end
    object edmp_departamento: TEdit
      Left = 563
      Top = 85
      Width = 48
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 6
    end
    object edmp_localidad: TEdit
      Left = 75
      Top = 110
      Width = 395
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 7
    end
    object edmp_cpostal: TEdit
      Left = 563
      Top = 110
      Width = 48
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 8
    end
    object edpv_descripcion: TEdit
      Left = 75
      Top = 136
      Width = 536
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 9
    end
    object edmp_telefonos: TEdit
      Left = 75
      Top = 161
      Width = 536
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 10
    end
    object edmp_contacto: TEdit
      Left = 75
      Top = 186
      Width = 536
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 11
    end
    object edmp_fbaja: TDateComboBox
      Left = 425
      Top = 239
      Width = 88
      Height = 21
      TabStop = False
      Color = clBtnFace
      Anchors = [akTop, akRight]
      ReadOnly = True
      TabOrder = 12
    end
    object edEstado: TEdit
      Left = 424
      Top = 215
      Width = 187
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 13
    end
    object GroupBox1: TGroupBox
      Left = 73
      Top = 210
      Width = 154
      Height = 70
      Caption = 'Vigencia:'
      TabOrder = 14
      object lbVigDesde: TLabel
        Left = 10
        Top = 18
        Width = 34
        Height = 13
        Caption = 'Desde:'
      end
      object lbVigHasta: TLabel
        Left = 11
        Top = 43
        Width = 31
        Height = 13
        Caption = 'Hasta:'
      end
      object edmp_vigenciadesde: TDateComboBox
        Left = 52
        Top = 13
        Width = 88
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 0
      end
      object edmp_vigenciahasta: TDateComboBox
        Left = 51
        Top = 42
        Width = 88
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 1
      end
    end
    object edBaja: TEdit
      Left = 425
      Top = 263
      Width = 186
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 15
    end
  end
  object sdqConsultaEmpresa: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'Select mp_cuit, mp_nombre, mp_contrato, mp_calle, mp_numero,'
      'mp_piso, mp_departamento, mp_localidad, mp_cpostal,'
      
        'pv_descripcion, mp_telefonos, mp_contacto, mp_vigenciadesde,mp_m' +
        'otivobaja,'
      'mp_vigenciahasta, mp_fbaja, mp_Estado'
      'From Cpv_Provincias,Cmp_Empresas'
      'Where mp_provincia=pv_codigo'
      'And mp_cuit = :CUIT'
      ' ')
    Left = 185
    Top = 4
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CUIT'
        ParamType = ptInput
      end>
  end
end
