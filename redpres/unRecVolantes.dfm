object frmRecVolantes: TfrmRecVolantes
  Left = 187
  Top = 154
  Caption = 'Recepci'#243'n de Volantes'
  ClientHeight = 162
  ClientWidth = 708
  Color = clBtnFace
  Constraints.MinHeight = 179
  Constraints.MinWidth = 624
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    708
    162)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 4
    Top = 145
    Width = 55
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Procesados'
  end
  object Panel1: TPanel
    Left = 4
    Top = 4
    Width = 699
    Height = 130
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      699
      130)
    object lblFRec: TLabel
      Left = 4
      Top = 12
      Width = 102
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Fecha Recep. Liquid.'
    end
    object edRecepcion: TDateComboBox
      Left = 108
      Top = 8
      Width = 88
      Height = 21
      TabOrder = 0
      OnExit = edRecepcionExit
    end
    object edFechaText: TEdit
      Left = 200
      Top = 8
      Width = 493
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    inline fraVolantes: TfraVolantes
      Left = 3
      Top = 32
      Width = 691
      Height = 96
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      ExplicitLeft = 3
      ExplicitTop = 32
      ExplicitWidth = 691
      ExplicitHeight = 96
      inherited Label7: TLabel
        Left = 305
        ExplicitLeft = 305
      end
      inherited Label10: TLabel
        Left = 459
        ExplicitLeft = 459
      end
      inherited Label11: TLabel
        Left = 574
        ExplicitLeft = 574
      end
      inherited Label13: TLabel
        Left = 518
        ExplicitLeft = 518
      end
      inherited Label14: TLabel
        Left = 591
        ExplicitLeft = 591
      end
      inherited Label15: TLabel
        Left = 663
        ExplicitLeft = 663
      end
      inherited edEstado: TEdit
        Width = 437
        ExplicitWidth = 437
      end
      inherited edPrestRSocial: TEdit
        Width = 248
        ExplicitWidth = 248
      end
      inherited edObservaciones: TMemo
        Width = 625
        ExplicitWidth = 625
      end
      inherited edTotFact: TCurrencyEdit
        Left = 384
        Margins.Left = 4
        Margins.Top = 1
        ExplicitLeft = 384
      end
      inherited edVO_MONTOPERCEPCION: TCurrencyEdit
        Left = 513
        Margins.Left = 4
        Margins.Top = 1
        ExplicitLeft = 513
      end
      inherited edVO_MONTODEBITO: TCurrencyEdit
        Left = 634
        Margins.Left = 4
        Margins.Top = 1
        ExplicitLeft = 634
      end
      inherited edVO_OBSERVACIONDEBITO: TMemo
        Width = 625
        ExplicitWidth = 625
      end
      inherited chContratoART: TCheckBox
        Left = 503
        ExplicitLeft = 503
      end
      inherited chContratoMutual: TCheckBox
        Left = 576
        ExplicitLeft = 576
      end
      inherited chMixto: TCheckBox
        Left = 648
        ExplicitLeft = 648
      end
    end
  end
  object btnSalir: TButton
    Left = 628
    Top = 138
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Salir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnSalirClick
  end
  object chkSvoTemp: TCheckBox
    Left = 112
    Top = 144
    Width = 81
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Temporarios'
    TabOrder = 2
    Visible = False
    OnClick = chkSvoTempClick
  end
  object edCount: TIntEdit
    Left = 64
    Top = 145
    Width = 41
    Height = 13
    TabStop = False
    Anchors = [akLeft, akBottom]
    BorderStyle = bsNone
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 3
  end
  object Seguridad: TSeguridad
    AfterExecute = SeguridadAfterExecute
    AutoEjecutar = True
    Claves = <>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = True
    Left = 256
    Top = 8
  end
end
