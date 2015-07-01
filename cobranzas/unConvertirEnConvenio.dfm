object frmConvertirEnConvenio: TfrmConvertirEnConvenio
  Left = 239
  Top = 106
  Width = 431
  Height = 259
  Caption = 'Convertir a Convenio'
  Color = clBtnFace
  Constraints.MaxHeight = 259
  Constraints.MinHeight = 259
  Constraints.MinWidth = 431
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    423
    232)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 3
    Top = 183
    Width = 416
    Height = 11
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsBottomLine
  end
  object btnAceptar: TButton
    Left = 269
    Top = 202
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Aceptar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnAceptarClick
  end
  object btnCancelar: TButton
    Left = 344
    Top = 202
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 3
    OnClick = btnCancelarClick
  end
  object GroupBox1: TGroupBox
    Left = 4
    Top = 2
    Width = 416
    Height = 90
    Anchors = [akLeft, akTop, akRight]
    Caption = 'ART'
    TabOrder = 0
    DesignSize = (
      416
      90)
    object Label8: TLabel
      Left = 19
      Top = 17
      Width = 42
      Height = 13
      Caption = 'Firmante'
    end
    object Label9: TLabel
      Left = 7
      Top = 41
      Width = 54
      Height = 13
      Caption = 'Documento'
    end
    object Label10: TLabel
      Left = 19
      Top = 66
      Width = 42
      Height = 13
      Caption = 'Car'#225'cter'
    end
    inline fraPP_ARTFIRMANTE: TfraStaticCodigoDescripcion
      Left = 63
      Top = 12
      Width = 346
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited cmbDescripcion: TComboGrid
        Width = 283
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
    object edPP_ARTDOCUMENTO: TEdit
      Left = 65
      Top = 37
      Width = 343
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 1
      Text = 'D.N.I. N'#186' '
    end
    object edPP_ARTCARACTER: TEdit
      Left = 65
      Top = 62
      Width = 343
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 2
    end
  end
  object GroupBox4: TGroupBox
    Left = 4
    Top = 93
    Width = 416
    Height = 90
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Cliente'
    TabOrder = 1
    DesignSize = (
      416
      90)
    object Label11: TLabel
      Left = 20
      Top = 17
      Width = 42
      Height = 13
      Caption = 'Firmante'
    end
    object Label12: TLabel
      Left = 8
      Top = 41
      Width = 54
      Height = 13
      Caption = 'Documento'
    end
    object Label13: TLabel
      Left = 20
      Top = 65
      Width = 42
      Height = 13
      Caption = 'Car'#225'cter'
    end
    object edPP_EMPDOCUMENTO: TEdit
      Left = 65
      Top = 37
      Width = 343
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 1
      Text = 'D.N.I. N'#186' '
    end
    object edPP_EMPCARACTER: TEdit
      Left = 65
      Top = 61
      Width = 343
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 2
    end
    object edPP_EMPFIRMANTE: TEdit
      Left = 65
      Top = 13
      Width = 343
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 0
    end
  end
end
