object frmCuotasNoPagadas: TfrmCuotasNoPagadas
  Left = 137
  Top = 205
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Cuotas No Pagadas'
  ClientHeight = 153
  ClientWidth = 582
  Color = clBtnFace
  Constraints.MaxHeight = 181
  Constraints.MaxWidth = 590
  Constraints.MinHeight = 180
  Constraints.MinWidth = 590
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  DesignSize = (
    582
    153)
  PixelsPerInch = 96
  TextHeight = 13
  object BevelAbm: TBevel
    Left = -62
    Top = 120
    Width = 644
    Height = 2
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
  end
  object btnAceptar: TButton
    Left = 429
    Top = 126
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
    TabOrder = 0
    OnClick = btnAceptarClick
  end
  object btnCancelar: TButton
    Left = 504
    Top = 126
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 1
    OnClick = btnCancelarClick
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 8
    Width = 577
    Height = 49
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Entidad'
    TabOrder = 2
    DesignSize = (
      577
      49)
    inline fraEntidad: TfraEntidadCUIT
      Left = 8
      Top = 16
      Width = 561
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      OnExit = fraEntidadExit
      inherited Label1: TLabel
        Left = 123
      end
      inherited lbRSocial: TLabel
        Width = 24
        Caption = 'CUIT'
        Font.Name = 'Tahoma'
      end
      inherited Label3: TLabel
        Width = 59
      end
      inherited cmbDescripcion: TArtComboBox
        Width = 303
      end
      inherited mskCuit: TMaskEdit
        Left = 35
      end
      inherited edEN_CODBANCO: TPatternEdit
        Left = 162
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 64
    Width = 578
    Height = 49
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Vendedor'
    TabOrder = 3
    DesignSize = (
      578
      49)
    inline fraVendedor: TfraVendedoresCUIT
      Left = 8
      Top = 16
      Width = 561
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited lbRSocial: TLabel
        Width = 24
        Caption = 'CUIT'
      end
      inherited Label1: TLabel
        Left = 123
      end
      inherited cmbDescripcion: TArtComboBox
        Width = 288
      end
      inherited edCodigo: TPatternEdit
        Left = 159
      end
      inherited mskCuit: TMaskEdit
        Left = 35
      end
    end
  end
end
