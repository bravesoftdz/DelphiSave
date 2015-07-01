object frmObservacion: TfrmObservacion
  Left = 231
  Top = 174
  Width = 440
  Height = 234
  BorderIcons = [biSystemMenu]
  Caption = 'Observaci'#243'n'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object edObservacion: TMemo
    Left = 0
    Top = 66
    Width = 432
    Height = 141
    Align = alClient
    Color = 14548991
    TabOrder = 2
  end
  object tbComandosDetalle: TToolBar
    Left = 0
    Top = 0
    Width = 432
    Height = 27
    BorderWidth = 1
    Caption = 'ToolBar'
    EdgeBorders = []
    HotImages = DmEmision.ilByN
    Images = DmEmision.ilColor
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object btnAceptar: TToolButton
      Left = 0
      Top = 2
      Hint = 'Aceptar'
      ImageIndex = 13
      OnClick = btnAceptarClick
    end
    object btnCancelar: TToolButton
      Left = 23
      Top = 2
      Hint = 'Cancelar'
      Caption = 'btnCancelar'
      ImageIndex = 5
      OnClick = btnCancelarClick
    end
    object ToolButton2: TToolButton
      Left = 46
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      Enabled = False
      ImageIndex = 2
      Style = tbsSeparator
    end
    object tbLimpiar: TToolButton
      Left = 54
      Top = 2
      Hint = 'Limpiar'
      ImageIndex = 1
      OnClick = tbLimpiarClick
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 27
    Width = 432
    Height = 39
    Align = alTop
    TabOrder = 1
    DesignSize = (
      432
      39)
    object lblObs: TLabel
      Left = 6
      Top = 12
      Width = 27
      Height = 13
      Caption = 'Obs.:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    inline fraObservacion: TfraStaticCodigoDescripcion
      Left = 35
      Top = 8
      Width = 390
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        390
        23)
      inherited cmbDescripcion: TComboGrid
        Left = 64
        Width = 327
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
end
