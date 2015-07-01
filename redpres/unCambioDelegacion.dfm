inherited frmCambioDelegacion: TfrmCambioDelegacion
  Top = 219
  Width = 380
  Height = 225
  BorderIcons = []
  Caption = 'Reasignaci'#243'n de la Delegaci'#243'n'
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  Position = poOwnerFormCenter
  DesignSize = (
    370
    196)
  PixelsPerInch = 96
  TextHeight = 13
  object BevelAbm: TBevel [0]
    Left = 0
    Top = 157
    Width = 370
    Height = 39
    Align = alBottom
    Shape = bsTopLine
  end
  object Label1: TLabel [1]
    Left = 8
    Top = 52
    Width = 52
    Height = 13
    Caption = 'Delegaci'#243'n'
  end
  object Label2: TLabel [2]
    Left = 8
    Top = 8
    Width = 41
    Height = 13
    Caption = 'Siniestro'
  end
  object Label3: TLabel [3]
    Left = 112
    Top = 8
    Width = 31
    Height = 13
    Caption = 'Sector'
  end
  object Label4: TLabel [4]
    Left = 8
    Top = 104
    Width = 85
    Height = 13
    Caption = 'Nueva delegaci'#243'n'
  end
  inline fraEX_DELEGACION: TfraDelegacion [5]
    Left = 8
    Top = 72
    Width = 357
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    inherited cmbDescripcion: TArtComboBox
      Width = 289
    end
  end
  object btnAceptar: TButton [6]
    Left = 215
    Top = 168
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
    TabOrder = 1
    OnClick = btnAceptarClick
  end
  object btnCancelar: TButton [7]
    Left = 291
    Top = 168
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 2
  end
  object edSiniestro: TSinEdit [8]
    Left = 8
    Top = 24
    Width = 100
    Height = 21
    TabOrder = 3
  end
  inline fraEX_SECTOR: TfraSectores [9]
    Left = 112
    Top = 24
    Width = 249
    Height = 24
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 4
    inherited cmbDescripcion: TArtComboBox
      Width = 164
      Columns = <
        item
          Expanded = False
          FieldName = 'SC_CODIGO'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SC_DESCRIPCION'
          Title.Caption = 'Descripci'#243'n'
          Width = 200
          Visible = True
        end>
    end
  end
  inline fraNuevaDelegacion: TfraDelegacion [10]
    Left = 8
    Top = 124
    Width = 357
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 5
    inherited cmbDescripcion: TArtComboBox
      Width = 289
    end
  end
  inherited FormStorage: TFormStorage [11]
    Left = 316
  end
  inherited XPMenu: TXPMenu [12]
    Left = 344
  end
  inherited ilByN: TImageList
    Left = 232
    Top = 0
  end
  inherited ilColor: TImageList
    Left = 260
    Top = 0
  end
  inherited IconosXP: TImageList
    Left = 288
    Top = 0
  end
end
