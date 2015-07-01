object frmEnviarMail: TfrmEnviarMail
  Left = 301
  Top = 148
  Width = 576
  Height = 402
  Caption = 'Envío de Mail'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 29
    Top = 114
    Width = 39
    Height = 13
    Caption = 'Asunto::'
  end
  object Label1: TLabel
    Left = 304
    Top = 11
    Width = 44
    Height = 13
    Caption = 'Adjuntos:'
  end
  object Bevel1: TBevel
    Left = 10
    Top = 293
    Width = 551
    Height = 50
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsBottomLine
  end
  object Label2: TLabel
    Left = 40
    Top = 12
    Width = 28
    Height = 13
    Caption = 'Para: '
  end
  object lbDestinatarios: TListBox
    Left = 72
    Top = 32
    Width = 209
    Height = 73
    ItemHeight = 13
    TabOrder = 0
  end
  object lbAdjuntos: TListBox
    Left = 352
    Top = 8
    Width = 209
    Height = 97
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 13
    TabOrder = 1
  end
  object edAsunto: TEdit
    Left = 72
    Top = 110
    Width = 489
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
  end
  object reTextoCuerpo: TRichEdit
    Left = 8
    Top = 137
    Width = 553
    Height = 201
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      'Acá va el texto del cuerpo.')
    TabOrder = 3
  end
  object btEnviar: TButton
    Left = 410
    Top = 348
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Enviar'
    ModalResult = 1
    TabOrder = 4
    OnClick = btEnviarClick
  end
  object btCancelar: TButton
    Left = 488
    Top = 348
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 5
    OnClick = btCancelarClick
  end
  object btPara: TButton
    Left = 260
    Top = 8
    Width = 21
    Height = 21
    Caption = '...'
    TabOrder = 6
    OnClick = btParaClick
  end
  object edDestinatario: TEdit
    Left = 72
    Top = 8
    Width = 186
    Height = 21
    TabOrder = 8
  end
  object btQuitarDestinatario: TButton
    Left = 13
    Top = 72
    Width = 57
    Height = 25
    Caption = 'Quitar'
    TabOrder = 10
    OnClick = btQuitarDestinatarioClick
  end
  object btQuitarAdjunto: TButton
    Left = 293
    Top = 72
    Width = 57
    Height = 25
    Caption = 'Quitar'
    TabOrder = 11
    OnClick = btQuitarAdjuntoClick
  end
  object btAgregarDestinatario: TButton
    Left = 13
    Top = 47
    Width = 57
    Height = 25
    Caption = 'Agregar'
    TabOrder = 9
    OnClick = btAgregarDestinatarioClick
  end
  object btAgregarAdjunto: TButton
    Left = 293
    Top = 47
    Width = 57
    Height = 25
    Caption = 'Agregar...'
    TabOrder = 7
    OnClick = btAgregarAdjuntoClick
  end
  object OpenDialog: TOpenDialog
    Left = 356
    Top = 40
  end
end
