inherited frmSeleccionTurnosTraslados: TfrmSeleccionTurnosTraslados
  Left = 343
  Top = 160
  Width = 228
  Height = 407
  BorderIcons = []
  Caption = 'Impresi'#243'n de Traslados'
  Constraints.MaxWidth = 228
  Constraints.MinHeight = 200
  Constraints.MinWidth = 228
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbSeleccion: TLabel [0]
    Left = 8
    Top = 53
    Width = 192
    Height = 13
    Caption = 'Seleccione los turnos que desea imprimir'
  end
  object ARTCheckListBox: TARTCheckListBox [1]
    Left = 8
    Top = 71
    Width = 202
    Height = 276
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    PopupMenu = pmuSeleccion
    TabOrder = 1
    AutoAjustarColumnas = True
    Locked = False
  end
  object btnAceptar: TButton [2]
    Left = 53
    Top = 353
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Aceptar'
    TabOrder = 2
    OnClick = btnAceptarClick
  end
  object gbTurnos: TGroupBox [3]
    Left = 8
    Top = 6
    Width = 202
    Height = 40
    Caption = ' Turnos '
    TabOrder = 0
    object rbActivos: TRadioButton
      Left = 20
      Top = 17
      Width = 61
      Height = 17
      Caption = 'Activos'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = rbActivosClick
    end
    object rbAnulados: TRadioButton
      Left = 103
      Top = 17
      Width = 65
      Height = 17
      Caption = 'Anulados'
      TabOrder = 1
      OnClick = rbAnuladosClick
    end
  end
  object btnCancelar: TButton [4]
    Left = 137
    Top = 353
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 3
  end
  inherited FormStorage: TFormStorage
    Active = False
    Left = 12
    Top = 96
  end
  inherited XPMenu: TXPMenu
    Left = 100
    Top = 100
  end
  inherited ilByN: TImageList
    Left = 68
    Top = 100
  end
  inherited ilColor: TImageList
    Left = 40
    Top = 100
  end
  inherited IconosXP: TImageList
    Left = 12
    Top = 124
  end
  object pmuSeleccion: TPopupMenu
    OwnerDraw = True
    Left = 40
    Top = 128
    object Marcartodos1: TMenuItem
      Caption = 'Seleccionar todos'
      OnClick = Marcartodos1Click
    end
    object Desmarcartodos1: TMenuItem
      Caption = 'No seleccionar ninguno'
      OnClick = Desmarcartodos1Click
    end
  end
end
