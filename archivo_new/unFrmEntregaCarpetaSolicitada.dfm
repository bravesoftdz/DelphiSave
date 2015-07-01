object FrmEntregaCarpetaSolicitada: TFrmEntregaCarpetaSolicitada
  Left = 211
  Top = 149
  Width = 511
  Height = 393
  Caption = 'Entrega de Carpeta Solicitada'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    503
    366)
  PixelsPerInch = 96
  TextHeight = 13
  object BevelAbm: TBevel
    Left = 8
    Top = 333
    Width = 491
    Height = 2
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
  end
  inline fraDetalleArchivoEntregaCarpeta: TfraDetalleArchivo
    Left = 5
    Top = 2
    Width = 496
    Height = 325
    TabOrder = 0
  end
  object btnEnviarCarpeta: TButton
    Left = 339
    Top = 339
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Enviar'
    Default = True
    TabOrder = 1
    OnClick = btnEnviarCarpetaClick
  end
  object btnMailOmitir: TButton
    Left = 417
    Top = 339
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 2
  end
end
