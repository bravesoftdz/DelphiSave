object frmVerArchivoControlVersion: TfrmVerArchivoControlVersion
  Left = 236
  Top = 138
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Ver Archivo'
  ClientHeight = 453
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Verdana'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 16
  object meArchivo: TMemo
    Left = 0
    Top = 0
    Width = 688
    Height = 453
    Align = alClient
    Lines.Strings = (
      'meArchivo')
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object font: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 200
    Top = 104
  end
  object t1: TTimer
    Enabled = False
    Interval = 300
    OnTimer = t1Timer
    Left = 88
    Top = 72
  end
end
