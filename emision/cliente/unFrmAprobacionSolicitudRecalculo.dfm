object FrmAprobacionSolicitudRecalculo: TFrmAprobacionSolicitudRecalculo
  Left = 340
  Top = 398
  Width = 504
  Height = 273
  Caption = 'Aprobaci'#243'n de Autorizaci'#243'n'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    496
    246)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 6
    Top = 208
    Width = 485
    Height = 2
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
  end
  object btnNoAutorizar: TButton
    Left = 338
    Top = 215
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&No Autorizar'
    TabOrder = 0
  end
  object btnCancelar: TButton
    Left = 417
    Top = 215
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 1
  end
  object btnAutorizar: TButton
    Left = 260
    Top = 215
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Autorizar'
    TabOrder = 2
  end
  object gbDatosSolicitudAutorizacion: TGroupBox
    Left = 6
    Top = 5
    Width = 484
    Height = 86
    TabOrder = 3
    object Label5: TLabel
      Left = 8
      Top = 256
      Width = 63
      Height = 13
      Caption = 'Observaci'#243'n:'
    end
    object lblMotivo: TLabel
      Left = 8
      Top = 13
      Width = 35
      Height = 13
      Caption = 'Motivo:'
    end
    object Label8: TLabel
      Left = 8
      Top = 36
      Width = 43
      Height = 13
      Caption = 'Contrato:'
    end
    object lblPeriodos: TLabel
      Left = 7
      Top = 59
      Width = 46
      Height = 13
      Caption = 'Per'#237'odos:'
    end
    object edtMotivo: TEdit
      Left = 62
      Top = 12
      Width = 414
      Height = 21
      TabStop = False
      Color = 14795201
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object edtContrato: TEdit
      Left = 62
      Top = 35
      Width = 80
      Height = 21
      TabStop = False
      Color = 14795201
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object edtRazonSocial: TEdit
      Left = 145
      Top = 35
      Width = 332
      Height = 21
      TabStop = False
      Color = 14795201
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object edtPeriodoDesde: TEdit
      Left = 62
      Top = 58
      Width = 80
      Height = 21
      TabStop = False
      Color = 14795201
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object edtPeriodoHasta: TEdit
      Left = 145
      Top = 58
      Width = 80
      Height = 21
      TabStop = False
      Color = 14795201
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
  end
  object gbObservacionesAutorizacion: TGroupBox
    Left = 6
    Top = 92
    Width = 484
    Height = 110
    TabOrder = 4
    DesignSize = (
      484
      110)
    object Label7: TLabel
      Left = 8
      Top = 256
      Width = 63
      Height = 13
      Caption = 'Observaci'#243'n:'
    end
    object Label4: TLabel
      Left = 9
      Top = 44
      Width = 74
      Height = 13
      Caption = 'Observaciones:'
    end
    object Label3: TLabel
      Left = 9
      Top = 16
      Width = 33
      Height = 13
      Caption = 'Fecha:'
    end
    object edtFechaAutorizacion: TDateComboBox
      Left = 99
      Top = 14
      Width = 98
      Height = 21
      TabOrder = 0
    end
    object mObservacionAutorizacion: TMemo
      Left = 99
      Top = 40
      Width = 376
      Height = 63
      Anchors = [akLeft, akTop, akBottom]
      MaxLength = 2040
      TabOrder = 1
    end
  end
end
