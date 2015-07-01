object frmTelefonosCargaRapida: TfrmTelefonosCargaRapida
  Left = 375
  Top = 234
  BorderStyle = bsNone
  Caption = 'frmTelefonosCargaRapida'
  ClientHeight = 112
  ClientWidth = 432
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 13
  object sgTelefonos: TStringGrid
    Left = 0
    Top = 0
    Width = 432
    Height = 112
    Align = alClient
    ColCount = 4
    DefaultRowHeight = 17
    FixedCols = 0
    RowCount = 6
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing, goTabs]
    ScrollBars = ssNone
    TabOrder = 0
    OnKeyPress = sgTelefonosKeyPress
    OnKeyUp = sgTelefonosKeyUp
    OnMouseMove = sgTelefonosMouseMove
  end
end
