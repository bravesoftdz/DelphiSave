inherited frmFirmanteReporte: TfrmFirmanteReporte
  Left = 311
  Top = 214
  Width = 416
  Height = 232
  ActiveControl = fraFirmante
  Caption = 'Firmante de '
  Constraints.MinHeight = 232
  Constraints.MinWidth = 416
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox [0]
    Left = 8
    Top = 8
    Width = 392
    Height = 56
    Anchors = [akLeft, akTop, akRight]
    Caption = ' Firmante '
    TabOrder = 0
    DesignSize = (
      392
      56)
    inline fraFirmante: TfraStaticCodigoDescripcion
      Left = 16
      Top = 22
      Width = 360
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      OnExit = CargarFirma
      inherited edCodigo: TPatternEdit
        OnExit = CargarFirma
      end
      inherited cmbDescripcion: TComboGrid
        Width = 297
        CharCase = ecUpperCase
        OnExit = CargarFirma
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
  object btnAceptar: TButton [1]
    Left = 252
    Top = 176
    Width = 72
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Aceptar'
    TabOrder = 1
    OnClick = btnAceptarClick
  end
  object btnCancelar: TButton [2]
    Left = 332
    Top = 176
    Width = 72
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = btnCancelarClick
  end
  object GroupBox2: TGroupBox [3]
    Left = 8
    Top = 72
    Width = 216
    Height = 128
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = ' Vista Previa '
    TabOrder = 3
    DesignSize = (
      216
      128)
    object imgFirma: TImage
      Left = 8
      Top = 16
      Width = 88
      Height = 105
      Anchors = [akLeft, akTop, akRight]
      AutoSize = True
      Transparent = True
    end
  end
  inherited FormStorage: TFormStorage
    Left = 328
    Top = 96
  end
  inherited XPMenu: TXPMenu
    Left = 356
    Top = 96
  end
  inherited ilByN: TImageList
    Left = 328
    Top = 124
  end
  inherited ilColor: TImageList
    Left = 356
    Top = 124
  end
  inherited IconosXP: TImageList
    Left = 384
    Top = 124
  end
end
