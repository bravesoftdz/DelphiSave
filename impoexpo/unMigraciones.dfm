inherited frmMigraciones: TfrmMigraciones
  Left = 237
  Top = 174
  Width = 536
  Height = 128
  BorderIcons = [biSystemMenu]
  Caption = 'Migraciones | Producci'#243'n - Desarrollo'
  Constraints.MaxHeight = 128
  Constraints.MaxWidth = 536
  Constraints.MinHeight = 128
  Constraints.MinWidth = 536
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 84
    Top = 12
    Width = 38
    Height = 13
    Caption = 'Proceso'
  end
  object Label2: TLabel [1]
    Left = 12
    Top = 12
    Width = 32
    Height = 13
    Caption = 'Origen'
  end
  object Label3: TLabel [2]
    Left = 444
    Top = 12
    Width = 36
    Height = 13
    Caption = 'Destino'
  end
  object Bevel1: TBevel [3]
    Left = 12
    Top = 57
    Width = 512
    Height = 3
    Style = bsRaised
  end
  inline fraProceso: TfraCodigoDescripcion [4]
    Left = 83
    Top = 27
    Width = 357
    Height = 23
    TabOrder = 0
  end
  object cmbOrigen: TComboBox [5]
    Left = 12
    Top = 28
    Width = 69
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    OnChange = cmbOrigenChange
    Items.Strings = (
      'PART'
      'PARTDESA'
      'PARTPROD'
      'PARTTEST')
  end
  object cmbDestino: TComboBox [6]
    Left = 444
    Top = 28
    Width = 80
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
    Items.Strings = (
      'PART'
      'PARTDESA'
      'PARTPROD'
      'PARTTEST')
  end
  object btnAceptar: TButton [7]
    Left = 376
    Top = 68
    Width = 72
    Height = 25
    Caption = 'Aceptar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnAceptarClick
  end
  object btnCancelar: TButton [8]
    Left = 448
    Top = 68
    Width = 72
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 4
    OnClick = btnCancelarClick
  end
  inherited FormStorage: TFormStorage [9]
    PreventResize = True
    Left = 16
    Top = 64
  end
  inherited XPMenu: TXPMenu [10]
    Left = 44
    Top = 64
  end
  inherited ilByN: TImageList [11]
    Left = 72
    Top = 64
  end
  inherited ilColor: TImageList [12]
    Left = 100
    Top = 64
  end
  inherited IconosXP: TImageList
    Left = 128
    Top = 64
  end
end
