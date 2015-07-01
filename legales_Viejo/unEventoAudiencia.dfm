inherited frmEventoAudiencia: TfrmEventoAudiencia
  Left = 513
  Top = 234
  BorderStyle = bsSingle
  Caption = 'Evento Audiencia'
  ClientHeight = 573
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object BevelAbm: TBevel [0]
    Left = 3
    Top = 538
    Width = 487
    Height = 2
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
  end
  object btnAceptar: TButton [1]
    Left = 333
    Top = 545
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Aceptar'
    TabOrder = 0
    OnClick = btnAceptarClick
  end
  object btnCancelar: TButton [2]
    Left = 413
    Top = 544
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 1
  end
  object pnEvento: TPanel [3]
    Left = 0
    Top = 0
    Width = 496
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      496
      57)
    object lbTipo: TLabel
      Left = 8
      Top = 14
      Width = 21
      Height = 13
      Caption = 'Tipo'
    end
    object lbFecha: TLabel
      Left = 8
      Top = 37
      Width = 30
      Height = 13
      Caption = 'Fecha'
    end
    inline FraTipoEvento: TfraCodigoDescripcion
      Left = 48
      Top = 8
      Width = 367
      Height = 23
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Width = 302
      end
    end
    object edFechaAudiencia: TDateComboBox
      Left = 49
      Top = 33
      Width = 88
      Height = 21
      Weekends = [Sun, Sat]
      TabOrder = 1
    end
    object tbVisualizarMail: TToolBar
      Left = 152
      Top = 32
      Width = 29
      Height = 26
      Align = alNone
      Anchors = [akTop, akRight]
      BorderWidth = 1
      ButtonWidth = 25
      Caption = 'ToolBar'
      EdgeBorders = []
      Flat = True
      HotImages = dmLegales.ilByN
      Images = dmLegales.ilColor
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      object tbMail: TToolButton
        Left = 0
        Top = 0
        Hint = 'Visualizar Mail'
        ImageIndex = 14
        OnClick = tbMailClick
      end
    end
  end
  object pnInstruccion: TPanel [4]
    Left = 0
    Top = 57
    Width = 496
    Height = 135
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    object lbInstruccion: TLabel
      Left = 8
      Top = 2
      Width = 52
      Height = 13
      Caption = 'Instrucci'#243'n'
    end
    object edInstruccion: TMemo
      Left = 10
      Top = 19
      Width = 477
      Height = 110
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object pnRespuesta: TPanel [5]
    Left = 0
    Top = 192
    Width = 496
    Height = 134
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    object lbRespuesta: TLabel
      Left = 8
      Top = 2
      Width = 51
      Height = 13
      Caption = 'Respuesta'
    end
    object edRespuesta: TMemo
      Left = 9
      Top = 18
      Width = 477
      Height = 110
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object pnEventoPie: TPanel [6]
    Left = 0
    Top = 460
    Width = 496
    Height = 82
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 5
    object lbMontoaNegociar: TLabel
      Left = 8
      Top = 6
      Width = 85
      Height = 13
      Caption = 'Monto a Negociar'
    end
    object Label2: TLabel
      Left = 8
      Top = 32
      Width = 91
      Height = 13
      Caption = 'Fecha Autorizaci'#243'n'
    end
    object lbUsuarioAutorizacion: TLabel
      Left = 8
      Top = 58
      Width = 97
      Height = 13
      Caption = 'Usuario Autorizaci'#243'n'
    end
    object edMontoANegociar: TCurrencyEdit
      Left = 115
      Top = 2
      Width = 92
      Height = 21
      AutoSize = False
      DisplayFormat = '$,0.00;-$,0.00'
      TabOrder = 0
    end
    object edFechaAutorizacion: TDateComboBox
      Left = 115
      Top = 28
      Width = 93
      Height = 21
      Weekends = [Sun, Sat]
      TabOrder = 1
    end
    inline fraUsuarioAutorizacion: TfraCodigoDescripcion
      Left = 115
      Top = 52
      Width = 367
      Height = 23
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Width = 302
      end
    end
  end
  object pnObservacion: TPanel [7]
    Left = 0
    Top = 326
    Width = 496
    Height = 134
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 6
    Visible = False
    object Label1: TLabel
      Left = 8
      Top = 2
      Width = 60
      Height = 13
      Caption = 'Observaci'#243'n'
    end
    object edObservaciones: TMemo
      Left = 9
      Top = 18
      Width = 477
      Height = 110
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  inherited FormStorage: TFormStorage
    Left = 432
    Top = 8
  end
  inherited XPMenu: TXPMenu
    Left = 460
    Top = 8
  end
  inherited ilByN: TImageList
    Left = 432
    Top = 36
  end
  inherited ilColor: TImageList
    Left = 460
    Top = 36
  end
  inherited IconosXP: TImageList
    Left = 488
    Top = 36
  end
end
