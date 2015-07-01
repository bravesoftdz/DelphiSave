object frmSeleccionarFechaFinTrat: TfrmSeleccionarFechaFinTrat
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Seleccionar fecha de Fin de Tratamiento'
  ClientHeight = 142
  ClientWidth = 341
  Color = clBtnFace
  Constraints.MaxHeight = 170
  Constraints.MaxWidth = 347
  Constraints.MinHeight = 170
  Constraints.MinWidth = 347
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  DesignSize = (
    341
    142)
  PixelsPerInch = 96
  TextHeight = 13
  object BevelAbm: TBevel
    Left = 4
    Top = 104
    Width = 332
    Height = 2
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
    ExplicitTop = 125
    ExplicitWidth = 382
  end
  object rbPAOdontologico: TRadioButton
    Left = 16
    Top = 16
    Width = 312
    Height = 17
    Caption = 'Post Alta Odontol'#243'gico'
    TabOrder = 0
  end
  object rbPADermatologico: TRadioButton
    Left = 16
    Top = 44
    Width = 312
    Height = 17
    Caption = 'Post Alta Dermatol'#243'gico'
    TabOrder = 1
  end
  object rbPAPsicologico: TRadioButton
    Left = 16
    Top = 72
    Width = 312
    Height = 17
    Caption = 'Post Alta Psicol'#243'gico'
    TabOrder = 2
  end
  object btnAceptar: TButton
    Left = 179
    Top = 113
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Aceptar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnAceptarClick
  end
  object btnCancelar: TButton
    Left = 258
    Top = 113
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 4
  end
end
