object frmCuentasBancariasProveedores: TfrmCuentasBancariasProveedores
  Left = 287
  Top = 251
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cuentas Bancarias de Proveedores'
  ClientHeight = 101
  ClientWidth = 520
  Color = clBtnFace
  Constraints.MinHeight = 128
  Constraints.MinWidth = 528
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  object btnCargar: TBitBtn
    Left = 360
    Top = 72
    Width = 72
    Height = 25
    Anchors = [akTop, akRight]
    Caption = '&Cargar'
    TabOrder = 1
    OnClick = btnCargarClick
    Glyph.Data = {
      42020000424D4202000000000000420000002800000010000000100000000100
      1000030000000002000000000000000000000000000000000000007C0000E003
      00001F0000001F7C1F7C1F7C1F7C000000000000000000000000000000000000
      1F7C1F7C1F7C1F7C1F7C1F7CC618004200420042004200420042004200420042
      00001F7C1F7C1F7C1F7C1F7C2925B256B256B2569C7310029C73B256B256B256
      004200001F7C1F7C1F7C8410B25633679C73BD77100210021002FF7F18633367
      B25684101F7C1F7C0000004233673367DE7B1002FF7F1002FF7F10025A6B3367
      3367004200001F7C0000004233673367FE7FBD77FF7F10021002FF7FDE7B3367
      3367004200001F7C00000042336733679C73FF7F10021002FF7FFF7FBD773367
      3367004200001F7C1F7C2925B25633679C731002FF7F1002FF7F10029C733367
      B25629251F7C1F7C1F7C42080042B2561863BD77100210021002BD775A6BB256
      604E42081F7C1F7C1F7C1F7C0821B256B256B2569C7310029C735A6BB256B256
      08211F7C1F7C1F7C1F7C1F7C1F7C8410604E6C4E6C4E6C4E6C4E6C4E604E8410
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7CC618604E00420042C6181F7C1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C2925604EB256604E29251F7C1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C420820673367B256B256206742081F7C
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C604E604E33673367B256206729251F7C
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C604E8410604E0821604E8410604E1F7C
      1F7C1F7C1F7C}
  end
  object btnSalir: TBitBtn
    Left = 440
    Top = 72
    Width = 72
    Height = 25
    Anchors = [akTop, akRight]
    Cancel = True
    Caption = '&Salir'
    ModalResult = 2
    TabOrder = 2
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000C40E0000C40E00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00444444444444
      4444CCCCCCCC4ECCCCC4CCCCCCCC4EECCCC4CCCCCCCC4EEECCC4777777774EEE
      0777777774444EEE0777777478884EEE0777777468884E0E07777774E6884EFE
      07776666EE684EEE0777E77777E44EEE077744447E484EEE07777774E4884EEE
      07777774488887EE077777777888887E07777777788888870777}
  end
  object gpProveedor: TGroupBox
    Left = 8
    Top = 8
    Width = 504
    Height = 53
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Proveedor'
    TabOrder = 0
    object lblCuit: TLabel
      Left = 12
      Top = 23
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    inline fraProveedorCtaBanc: TfraOPV_PROVEEDOR
      Left = 42
      Top = 18
      Width = 451
      Anchors = [akLeft, akTop, akRight]
      inherited lbNumero: TLabel
        Left = 349
      end
      inherited cmbRSocial: TArtComboBox
        Width = 214
      end
      inherited edNumero: TIntEdit
        Left = 394
      end
    end
  end
end
