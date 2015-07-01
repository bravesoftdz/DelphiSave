object frmCustomDlgRichEdit: TfrmCustomDlgRichEdit
  Left = 206
  Top = 107
  Width = 696
  Height = 480
  ActiveControl = edTexto
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    688
    453)
  PixelsPerInch = 96
  TextHeight = 13
  object edTexto: TRxRichEdit
    Left = 4
    Top = 36
    Width = 677
    Height = 383
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
  end
  object btnAceptar: TButton
    Left = 528
    Top = 424
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Aceptar'
    ModalResult = 1
    TabOrder = 2
  end
  object btnCancelar: TButton
    Left = 608
    Top = 424
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 1
  end
  inline fraToolbarRTF: TfraToolbarRTF
    Left = 4
    Top = 4
    Width = 677
    Height = 31
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    inherited tBarRTF: TToolBar
      Width = 677
    end
  end
end
