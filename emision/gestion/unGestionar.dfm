object frmGestionar: TfrmGestionar
  Left = 210
  Top = 184
  Width = 753
  Height = 479
  Caption = 'Gestionar'
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
  DesignSize = (
    745
    452)
  PixelsPerInch = 96
  TextHeight = 13
  object pcGestionar: TPageControl
    Left = 0
    Top = 0
    Width = 745
    Height = 452
    ActivePage = tsSIC
    Align = alClient
    TabHeight = 31
    TabOrder = 0
    object tbGestion: TTabSheet
      Caption = 'Gesti'#243'n'
    end
    object tsSIC: TTabSheet
      Caption = 'SIC'
      ImageIndex = 4
    end
    object tbEventosSGC: TTabSheet
      Caption = 'Eventos S.G.C.'
      ImageIndex = 1
      TabVisible = False
    end
    object tbNotas: TTabSheet
      Caption = 'Notas'
      ImageIndex = 2
    end
    object tbNominas: TTabSheet
      Caption = 'N'#243'minas'
      ImageIndex = 3
    end
  end
  object Panel1: TPanel
    Left = 472
    Top = 1
    Width = 271
    Height = 31
    Anchors = [akTop, akRight]
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      271
      31)
    object Label1: TLabel
      Left = 7
      Top = 2
      Width = 32
      Height = 13
      Caption = 'Alertas'
    end
    object lblInformacion: TListBox
      Left = 42
      Top = 0
      Width = 228
      Height = 31
      Anchors = [akLeft, akTop, akBottom]
      Color = 14548991
      ExtendedSelect = False
      ItemHeight = 13
      TabOrder = 0
    end
  end
end
