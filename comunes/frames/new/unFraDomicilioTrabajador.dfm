inherited fraDomicilioTrabajador: TfraDomicilioTrabajador
  Height = 70
  ExplicitHeight = 70
  DesignSize = (
    589
    70)
  inherited lbCPostal: TLabel
    Top = 28
    ExplicitTop = 28
  end
  inherited lbCPA: TLabel
    Left = 106
    Top = 28
    ExplicitLeft = 106
    ExplicitTop = 28
  end
  inherited lbLocalidad: TLabel
    Left = 214
    Top = 28
    ExplicitLeft = 214
    ExplicitTop = 28
  end
  inherited lbProvincia: TLabel
    Top = 28
    ExplicitTop = 28
  end
  object lbTelefonos: TLabel [8]
    Left = 0
    Top = 52
    Width = 47
    Height = 13
    Caption = 'Tel'#233'fonos'
  end
  inherited cmbCalle: TArtComboBox
    Left = 50
    ExplicitLeft = 50
  end
  inherited edDto: TEdit
    Width = 44
    ExplicitWidth = 44
  end
  inherited edCPostal: TIntEdit
    Left = 50
    Top = 24
    ExplicitLeft = 50
    ExplicitTop = 24
  end
  inherited cmbLocalidad: TArtComboBox
    Left = 266
    Top = 24
    Width = 156
    TabOrder = 8
    ExplicitLeft = 266
    ExplicitTop = 24
    ExplicitWidth = 156
  end
  inherited edProvincia: TEdit
    Top = 24
    Width = 112
    TabOrder = 7
    ExplicitTop = 24
    ExplicitWidth = 112
  end
  inherited edCPA: TPatternEdit
    Left = 132
    Top = 24
    ExplicitLeft = 132
    ExplicitTop = 24
  end
  object edTelefonos: TEdit [17]
    Left = 50
    Top = 48
    Width = 538
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 1
  end
  inherited btnBuscar: TButton
    Left = 343
    Width = 24
    TabOrder = 9
    ExplicitLeft = 343
    ExplicitWidth = 24
  end
  inherited sdqLocalidad: TSDQuery
    Left = 188
    Top = 12
  end
  inherited dsLocalidad: TDataSource
    Left = 216
    Top = 12
  end
end
