inherited TesterUIF: TTesterUIF
  Left = 288
  Top = 124
  Width = 820
  Height = 625
  Caption = 'TesterUIF'
  OldCreateOrder = True
  Position = poDefault
  Visible = True
  DesignSize = (
    812
    591)
  PixelsPerInch = 96
  TextHeight = 13
  object btnRelev: TButton [0]
    Left = 8
    Top = 8
    Width = 113
    Height = 25
    Caption = 'Relevar'
    TabOrder = 0
    OnClick = btnRelevClick
  end
  object DBGrid1: TDBGrid [1]
    Left = 0
    Top = 40
    Width = 812
    Height = 558
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Width = 445
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIRECCION'
        Width = 231
        Visible = True
      end>
  end
  object btnCopiar: TButton [2]
    Left = 140
    Top = 8
    Width = 113
    Height = 25
    Caption = 'copiar a tabla'
    TabOrder = 2
    OnClick = btnCopiarClick
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 60
    Top = 116
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'ClientDataSet1Index2'
        Fields = 'nombre'
        Options = [ixPrimary, ixUnique]
      end>
    IndexName = 'ClientDataSet1Index2'
    Params = <>
    ReadOnly = True
    StoreDefs = True
    Left = 16
    Top = 116
    object ClientDataSet1NOMBRE: TStringField
      FieldName = 'NOMBRE'
      ProviderFlags = [pfInKey]
      Required = True
      Size = 255
    end
    object ClientDataSet1DIRECCION: TStringField
      FieldName = 'DIRECCION'
      ProviderFlags = [pfInKey]
      Size = 255
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.*'
    Filter = 'Procesados|_Procesado_*.xml|XML|*.xml|TXT|*.txt|*.*|*.*'
    FilterIndex = 4
    InitialDir = 'E:\ART\UIF\Logs'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofPathMustExist, ofEnableSizing]
    Left = 112
    Top = 116
  end
end
