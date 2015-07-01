object frmOpcionesImpresion: TfrmOpcionesImpresion
  Left = 134
  Top = 114
  BorderStyle = bsDialog
  Caption = 'Opciones de Impresi'#243'n'
  ClientHeight = 132
  ClientWidth = 253
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
    253
    132)
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel
    Left = 30
    Top = 50
    Width = 92
    Height = 13
    Caption = 'Cantidad de Copias'
  end
  object Label8: TLabel
    Left = 12
    Top = 74
    Width = 46
    Height = 13
    Caption = 'Impresora'
  end
  object Bevel2: TBevel
    Left = 1
    Top = 96
    Width = 253
    Height = 2
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
  end
  object rbPreview: TRadioButton
    Left = 6
    Top = 6
    Width = 113
    Height = 17
    Caption = 'Mostrar el Preview'
    TabOrder = 0
  end
  object rbImprimir: TRadioButton
    Left = 6
    Top = 28
    Width = 131
    Height = 17
    Caption = 'Imprimir Directamente'
    Checked = True
    TabOrder = 1
    TabStop = True
  end
  object edCantCopias: TIntEdit
    Left = 128
    Top = 46
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '1'
    MinValue = 1
    Value = 1
  end
  object cmbImpresoras: TComboBox
    Left = 62
    Top = 70
    Width = 188
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 3
  end
  object btnAceptarImpresion: TButton
    Left = 100
    Top = 104
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Aceptar'
    ModalResult = 1
    TabOrder = 4
  end
  object btnCancelarImpresion: TButton
    Left = 176
    Top = 104
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 5
  end
end
