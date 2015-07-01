object FrmUbicacionActual: TFrmUbicacionActual
  Left = 309
  Top = 293
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Ubicaci'#243'n Actual'
  ClientHeight = 123
  ClientWidth = 430
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    430
    123)
  PixelsPerInch = 96
  TextHeight = 13
  object gbUbicacion: TGroupBox
    Left = 3
    Top = 1
    Width = 423
    Height = 80
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    DesignSize = (
      423
      80)
    object lblUbicacion: TLabel
      Left = 12
      Top = 47
      Width = 48
      Height = 13
      Caption = 'Ubicaci'#243'n'
    end
    object lblTipoUbicacion: TLabel
      Left = 12
      Top = 20
      Width = 21
      Height = 13
      Caption = 'Tipo'
    end
    inline fraUbicacion: TfraCodigoDescripcion
      Left = 72
      Top = 42
      Width = 343
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Width = 278
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 300
            Visible = True
          end>
      end
    end
    object cmbTipoUbicacion: TComboBox
      Left = 72
      Top = 16
      Width = 343
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = cmbTipoUbicacionChange
      Items.Strings = (
        'Delegaci'#243'n'
        'Lugar'
        'Sector'
        'Usuario')
    end
  end
  object btnAceptar: TButton
    Left = 256
    Top = 91
    Width = 75
    Height = 25
    Caption = '&Aceptar'
    Default = True
    TabOrder = 1
    OnClick = btnAceptarClick
  end
  object btnCancelar: TButton
    Left = 336
    Top = 91
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 2
    OnClick = btnCancelarClick
  end
end
