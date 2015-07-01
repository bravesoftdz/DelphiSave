object frmAltaEmbargos: TfrmAltaEmbargos
  Left = 170
  Top = 85
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Alta de Embargos'
  ClientHeight = 414
  ClientWidth = 475
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  DesignSize = (
    475
    414)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel3: TBevel
    Left = -1
    Top = 381
    Width = 478
    Height = 2
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
  end
  object Label12: TLabel
    Left = 47
    Top = 46
    Width = 31
    Height = 13
    Alignment = taRightJustify
    Caption = 'Banco'
  end
  object Label13: TLabel
    Left = 44
    Top = 70
    Width = 34
    Height = 13
    Alignment = taRightJustify
    Caption = 'Cuenta'
  end
  object Label14: TLabel
    Left = 34
    Top = 88
    Width = 43
    Height = 26
    Alignment = taRightJustify
    Caption = 'Importe Retenido'
    WordWrap = True
  end
  object Label15: TLabel
    Left = 48
    Top = 115
    Width = 30
    Height = 13
    Alignment = taRightJustify
    Caption = 'Fecha'
  end
  object Label16: TLabel
    Left = 35
    Top = 134
    Width = 42
    Height = 26
    Alignment = taRightJustify
    Caption = 'Fecha Contable'
    WordWrap = True
  end
  object Label17: TLabel
    Left = 39
    Top = 261
    Width = 39
    Height = 13
    Alignment = taRightJustify
    Caption = 'Car'#225'tula'
  end
  object Label18: TLabel
    Left = 51
    Top = 188
    Width = 27
    Height = 13
    Alignment = taRightJustify
    Caption = 'Fuero'
  end
  object Label19: TLabel
    Left = 38
    Top = 210
    Width = 40
    Height = 13
    Alignment = taRightJustify
    Caption = 'Juzgado'
  end
  object Label20: TLabel
    Left = 28
    Top = 236
    Width = 50
    Height = 13
    Alignment = taRightJustify
    Caption = 'Secretar'#237'a'
  end
  object Label22: TLabel
    Left = 50
    Top = 285
    Width = 27
    Height = 13
    Alignment = taRightJustify
    Caption = 'Oficio'
  end
  object Label23: TLabel
    Left = 5
    Top = 305
    Width = 71
    Height = 13
    Alignment = taRightJustify
    Caption = 'Observaciones'
  end
  object lbJurisdiccion: TLabel
    Left = 23
    Top = 166
    Width = 55
    Height = 13
    Alignment = taRightJustify
    Caption = 'Jurisdicci'#243'n'
  end
  object Label1: TLabel
    Left = 256
    Top = 93
    Width = 87
    Height = 13
    Alignment = taRightJustify
    Caption = 'Monto Embargado'
    WordWrap = True
  end
  object btnAceptarEmbargo: TButton
    Left = 322
    Top = 388
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Aceptar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 14
    OnClick = btnAceptarEmbargoClick
  end
  object btnCancelarEmbargo: TButton
    Left = 397
    Top = 388
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 15
    OnClick = btnCancelarEmbargoClick
  end
  inline fraCuentaBancariaEmbargo: TfraStaticCodigoDescripcion
    Left = 80
    Top = 64
    Width = 389
    Height = 23
    TabOrder = 2
    DesignSize = (
      389
      23)
    inherited cmbDescripcion: TComboGrid
      Width = 326
      Cells = (
        'C'#243'digo'
        'Descripci'#243'n'
        'Id'
        'Fecha de Baja')
      ColWidths = (
        40
        300
        -1
        -1)
    end
  end
  inline fraBancoEmbargo: TfraStaticCodigoDescripcion
    Left = 80
    Top = 40
    Width = 389
    Height = 23
    TabOrder = 1
    DesignSize = (
      389
      23)
    inherited cmbDescripcion: TComboGrid
      Width = 326
      Cells = (
        'C'#243'digo'
        'Descripci'#243'n'
        'Id'
        'Fecha de Baja')
      ColWidths = (
        40
        300
        -1
        -1)
    end
  end
  object edImporteEmbargo: TCurrencyEdit
    Left = 81
    Top = 89
    Width = 121
    Height = 21
    TabStop = False
    AutoSize = False
    TabOrder = 3
  end
  object edFechaEmbargo: TDateComboBox
    Left = 81
    Top = 113
    Width = 88
    Height = 21
    TabOrder = 5
  end
  object edFContableEmbargo: TDateComboBox
    Left = 81
    Top = 137
    Width = 88
    Height = 21
    TabOrder = 6
  end
  object edOficioEmbargo: TIntEdit
    Left = 81
    Top = 281
    Width = 121
    Height = 21
    TabOrder = 12
    MaxLength = 8
    MaxValue = 99999999
  end
  object edObservacEmbargo: TMemo
    Left = 81
    Top = 305
    Width = 389
    Height = 71
    MaxLength = 400
    TabOrder = 13
  end
  object edCaratulaEmbargo: TEdit
    Left = 81
    Top = 257
    Width = 389
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 11
  end
  inline fraJuzgadoEmbargo: TfraCodigoDescripcion
    Left = 81
    Top = 208
    Width = 390
    Height = 23
    TabOrder = 9
    DesignSize = (
      390
      23)
    inherited cmbDescripcion: TArtComboBox
      Width = 325
    end
  end
  inline fraFueroEmbargo: TfraCodigoDescripcion
    Left = 81
    Top = 184
    Width = 390
    Height = 23
    TabOrder = 8
    DesignSize = (
      390
      23)
    inherited cmbDescripcion: TArtComboBox
      Width = 325
    end
  end
  inline fraSecretariaEmbargo: TfraCodigoDescripcion
    Left = 81
    Top = 232
    Width = 390
    Height = 23
    TabOrder = 10
    DesignSize = (
      390
      23)
    inherited cmbDescripcion: TArtComboBox
      Width = 325
    end
  end
  inline fraJurisdiccionEmbargo: TfraCodigoDescripcion
    Left = 81
    Top = 160
    Width = 390
    Height = 23
    TabOrder = 7
    DesignSize = (
      390
      23)
    inherited cmbDescripcion: TArtComboBox
      Width = 325
    end
  end
  object edMontoEmbargado: TCurrencyEdit
    Left = 347
    Top = 89
    Width = 121
    Height = 21
    TabStop = False
    AutoSize = False
    TabOrder = 4
  end
  object rgTipo: TRadioGroup
    Left = 81
    Top = 0
    Width = 387
    Height = 38
    Caption = 'Tipo'
    Columns = 3
    Items.Strings = (
      'Inversiones'
      'Otros Rubros'
      'Bancos')
    TabOrder = 0
    OnClick = rgTipoClick
  end
end
