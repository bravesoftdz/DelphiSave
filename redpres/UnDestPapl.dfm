object FrmDestinoPapel: TFrmDestinoPapel
  Left = 229
  Top = 162
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Seleccione el destino para el papel'
  ClientHeight = 118
  ClientWidth = 244
  Color = clBtnFace
  Constraints.MaxHeight = 152
  Constraints.MaxWidth = 252
  Constraints.MinHeight = 145
  Constraints.MinWidth = 252
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 140
    Top = 36
    Width = 46
    Height = 26
    Caption = 'Cantidad '#13#10'de Hojas'
  end
  object TxtQHojas: TIntEdit
    Left = 192
    Top = 40
    Width = 41
    Height = 21
    TabOrder = 0
    Text = '1'
    Value = 1
  end
  object DestPapel: TRadioGroup
    Left = 12
    Top = 22
    Width = 113
    Height = 91
    Caption = ' Destino del Papel '
    ItemIndex = 0
    Items.Strings = (
      '&Digitalizaci'#243'n'
      '&Guarda'
      'A&rchivo ART'
      '&Sin Papel')
    TabOrder = 1
  end
  object LblCDoc: TPanel
    Left = 0
    Top = 0
    Width = 244
    Height = 19
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object btnAceptar: TAdvGlowButton
    Left = 140
    Top = 84
    Width = 97
    Height = 28
    Caption = '&Aceptar'
    Default = True
    NotesFont.Charset = DEFAULT_CHARSET
    NotesFont.Color = clWindowText
    NotesFont.Height = -11
    NotesFont.Name = 'Tahoma'
    NotesFont.Style = []
    WordWrap = False
    TabOrder = 2
    TabStop = True
    OnClick = btnAceptarClick
    Appearance.ColorChecked = 16111818
    Appearance.ColorCheckedTo = 16367008
    Appearance.ColorDisabled = 15921906
    Appearance.ColorDisabledTo = 15921906
    Appearance.ColorDown = 16111818
    Appearance.ColorDownTo = 16367008
    Appearance.ColorHot = 16117985
    Appearance.ColorHotTo = 16372402
    Appearance.ColorMirrorHot = 16107693
    Appearance.ColorMirrorHotTo = 16775412
    Appearance.ColorMirrorDown = 16102556
    Appearance.ColorMirrorDownTo = 16768988
    Appearance.ColorMirrorChecked = 16102556
    Appearance.ColorMirrorCheckedTo = 16768988
    Appearance.ColorMirrorDisabled = 11974326
    Appearance.ColorMirrorDisabledTo = 15921906
  end
end
