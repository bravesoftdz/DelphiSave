object frmAltaNotaSRT: TfrmAltaNotaSRT
  Left = 259
  Top = 207
  Width = 669
  Height = 400
  Caption = 'Alta de Nota a la SRT'
  Color = clBtnFace
  Constraints.MinHeight = 400
  Constraints.MinWidth = 600
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 661
    Height = 30
    Caption = 'ToolBar1'
    HotImages = frmPrincipal.ilColor
    Images = frmPrincipal.ilByN
    TabOrder = 0
    object tbfpLimpiar: TToolButton
      Left = 0
      Top = 2
      Hint = 'Limpiar (Ctrl-L)'
      Caption = 'tbfpLimpiar'
      ImageIndex = 1
      OnClick = tbfpLimpiarClick
    end
    object tbfpGrabar: TToolButton
      Left = 23
      Top = 2
      Hint = 'Grabar (Ctrl-G)'
      Caption = 'tbfpGrabar'
      ImageIndex = 3
      OnClick = tbfpGrabarClick
    end
    object tbfpSalir: TToolButton
      Left = 46
      Top = 2
      Hint = 'Salir (Ctrl-S)'
      Caption = 'tbfpSalir'
      ImageIndex = 5
      OnClick = tbfpSalirClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 30
    Width = 661
    Height = 147
    Align = alTop
    BevelInner = bvLowered
    Constraints.MinHeight = 84
    TabOrder = 1
    DesignSize = (
      661
      147)
    object Label9: TLabel
      Left = 38
      Top = 12
      Width = 21
      Height = 13
      Caption = 'Cuit:'
    end
    object Label11: TLabel
      Left = 13
      Top = 37
      Width = 47
      Height = 13
      Caption = 'Tipo Nota'
    end
    object Label12: TLabel
      Left = 32
      Top = 61
      Width = 26
      Height = 13
      Caption = 'Nota:'
    end
    object lbContrato: TLabel
      Left = 553
      Top = 36
      Width = 40
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Nro.Ref.'
      FocusControl = fraEmpresa.edContrato
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    inline fraTipoNota: TfraCtbTablas
      Left = 62
      Top = 32
      Width = 484
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Width = 431
      end
    end
    inline fraEmpresa: TfraEmpresa
      Left = 63
      Top = 6
      Width = 590
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      inherited lbContrato: TLabel
        Left = 488
      end
      inherited edContrato: TIntEdit
        Left = 533
      end
      inherited cmbRSocial: TArtComboBox
        Width = 351
      end
    end
    object edNota: TMemo
      Left = 63
      Top = 58
      Width = 590
      Height = 84
      Anchors = [akLeft, akTop, akRight, akBottom]
      MaxLength = 750
      TabOrder = 3
    end
    object edNroReferencia: TIntEdit
      Left = 596
      Top = 32
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 2
      MaxLength = 8
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 177
    Width = 661
    Height = 196
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 2
    DesignSize = (
      661
      196)
    object Label13: TLabel
      Left = 12
      Top = 35
      Width = 53
      Height = 13
      Caption = 'Resp. SRT'
    end
    object Label14: TLabel
      Left = 4
      Top = 11
      Width = 63
      Height = 13
      Caption = 'F. Respuesta'
    end
    object Label1: TLabel
      Left = 168
      Top = 11
      Width = 64
      Height = 13
      Caption = 'F. Recepci'#243'n'
    end
    object Label2: TLabel
      Left = 342
      Top = 10
      Width = 74
      Height = 13
      Caption = 'Nro. de entrada'
    end
    object edRespuestaSRT: TMemo
      Left = 68
      Top = 32
      Width = 588
      Height = 158
      Anchors = [akLeft, akTop, akRight, akBottom]
      MaxLength = 750
      TabOrder = 1
    end
    object cmbFechaRespuesta: TDateComboBox
      Left = 68
      Top = 7
      Width = 88
      Height = 21
      TabOrder = 0
    end
    object cmbFechaRecepcion: TDateComboBox
      Left = 236
      Top = 7
      Width = 88
      Height = 21
      TabOrder = 2
    end
    object edNroEntradaSRT: TIntEdit
      Left = 421
      Top = 7
      Width = 121
      Height = 21
      TabOrder = 3
      MaxLength = 10
    end
  end
end
