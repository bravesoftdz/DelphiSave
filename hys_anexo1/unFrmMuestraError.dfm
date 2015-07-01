inherited frmMuestraError: TfrmMuestraError
  Left = 336
  Top = 184
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 340
  ClientWidth = 599
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object lbArchivoOrigen: TLabel [0]
    Left = 8
    Top = 7
    Width = 72
    Height = 13
    Caption = 'Log de Errores:'
  end
  object editor: TMemo [1]
    Left = 8
    Top = 28
    Width = 585
    Height = 279
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    OnChange = editorChange
  end
  object btnCerrar: TButton [2]
    Left = 519
    Top = 312
    Width = 75
    Height = 25
    Anchors = [akBottom]
    Caption = '&Cerrar'
    ModalResult = 1
    TabOrder = 2
  end
  object btnSave: TButton [3]
    Left = 439
    Top = 312
    Width = 75
    Height = 25
    Anchors = [akBottom]
    Caption = '&Guardar'
    Enabled = False
    TabOrder = 1
    OnClick = btnSaveClick
  end
  inherited FormStorage: TFormStorage
    Top = 58
  end
  inherited XPMenu: TXPMenu
    Top = 58
  end
  inherited ilByN: TImageList
    Top = 86
  end
  inherited ilColor: TImageList
    Top = 86
  end
  inherited IconosXP: TImageList
    Top = 86
  end
end
