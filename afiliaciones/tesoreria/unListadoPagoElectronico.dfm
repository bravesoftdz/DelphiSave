inherited frmListadoPagoElectronico: TfrmListadoPagoElectronico
  Width = 435
  Height = 148
  BorderIcons = [biSystemMenu]
  Caption = 'Pagos Electr'#243'nicos'
  Constraints.MaxHeight = 148
  Constraints.MinHeight = 148
  Constraints.MinWidth = 435
  OldCreateOrder = True
  DesignSize = (
    427
    121)
  PixelsPerInch = 96
  TextHeight = 13
  object gbFecha: TGroupBox [0]
    Left = 203
    Top = 47
    Width = 104
    Height = 42
    Caption = 'Fecha'
    TabOrder = 2
    object edFecha: TDateComboBox
      Left = 8
      Top = 14
      Width = 88
      Height = 21
      TabOrder = 0
    end
  end
  object grpNumCheque: TGroupBox [1]
    Left = 4
    Top = 47
    Width = 193
    Height = 42
    Caption = 'N'#250'mero de Cheque '
    TabOrder = 1
    object Label1: TLabel
      Left = 90
      Top = 18
      Width = 12
      Height = 13
      Caption = '>>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edChequeDesde: TPatternEdit
      Left = 8
      Top = 14
      Width = 79
      Height = 21
      MaxLength = 20
      TabOrder = 0
      Pattern = '0123456789'
    end
    object edChequeHasta: TPatternEdit
      Left = 106
      Top = 14
      Width = 79
      Height = 21
      MaxLength = 20
      TabOrder = 1
      Pattern = '0123456789'
    end
  end
  object gbOrigen: TGroupBox [2]
    Left = 4
    Top = 4
    Width = 419
    Height = 42
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Banco'
    TabOrder = 0
    DesignSize = (
      419
      42)
    inline fraBanco: TfraStaticCodigoDescripcion
      Left = 8
      Top = 13
      Width = 403
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        403
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 340
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja')
        ColWidths = (
          40
          300
          -1
          -1)
      end
    end
  end
  object btnAceptar: TButton [3]
    Left = 5
    Top = 95
    Width = 75
    Height = 25
    Caption = '&Aceptar'
    TabOrder = 3
    OnClick = btnAceptarClick
  end
  object btnCancelar: TButton [4]
    Left = 82
    Top = 95
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 4
  end
  inherited FormStorage: TFormStorage
    Left = 44
    Top = 188
  end
  inherited XPMenu: TXPMenu
    Left = 72
    Top = 188
  end
  inherited ilByN: TImageList
    Left = 44
    Top = 216
  end
  inherited ilColor: TImageList
    Left = 72
    Top = 216
  end
  inherited IconosXP: TImageList
    Left = 100
    Top = 216
  end
end
