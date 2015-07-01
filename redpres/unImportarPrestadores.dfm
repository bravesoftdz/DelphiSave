object frmImportarPrestadores: TfrmImportarPrestadores
  Left = 197
  Top = 106
  BorderStyle = bsToolWindow
  Caption = 'Procesamienteo de Padr'#243'n de Prestadores Asociados'
  ClientHeight = 699
  ClientWidth = 1024
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  DesignSize = (
    1024
    699)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 6
    Top = 6
    Width = 106
    Height = 13
    Caption = 'Raz'#243'n Social Principal'
  end
  object Label2: TLabel
    Left = 6
    Top = 48
    Width = 122
    Height = 13
    Caption = 'An'#225'lisis de Redundancias'
  end
  object edtRazonSocial: TEdit
    Left = 6
    Top = 21
    Width = 1010
    Height = 21
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 0
  end
  object btnGuardar: TButton
    Left = 845
    Top = 668
    Width = 92
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Guardar An'#225'lisis'
    TabOrder = 1
    OnClick = btnGuardarClick
  end
  object btnSalir: TButton
    Left = 943
    Top = 668
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Salir'
    TabOrder = 2
    OnClick = btnSalirClick
  end
  object Panel1: TPanel
    Left = 8
    Top = 656
    Width = 1009
    Height = 3
    Anchors = [akLeft, akRight, akBottom]
    BevelInner = bvLowered
    BevelOuter = bvLowered
    TabOrder = 3
  end
  object Memo: TMemo
    Left = 6
    Top = 63
    Width = 520
    Height = 322
    Lines.Strings = (
      '')
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 4
    WordWrap = False
  end
  object FormStorage1: TFormStorage
    StoredValues = <>
    Left = 300
    Top = 6
  end
  object DataSource1: TDataSource
    DataSet = sdqPadron
    Left = 168
    Top = 177
  end
  object sdqPadron: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'SELECT *'
      '  FROM tmp.tmp_padronfarma'
      ' WHERE UPPER (pf_usuario) = UPPER (:usuario)'
      ' ')
    Left = 197
    Top = 178
    ParamData = <
      item
        DataType = ftString
        Name = 'usuario'
        ParamType = ptInput
        Value = ''
      end>
  end
  object sdqRedundancia: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      ''
      ' ')
    Left = 197
    Top = 208
  end
  object sdgGuardar: TSaveDialog
    DefaultExt = 'txt'
    Filter = 'Redundancias|REDUND_*.txt'
    Left = 330
    Top = 6
  end
end
