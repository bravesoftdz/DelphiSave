object frmDataEdit: TfrmDataEdit
  Left = 287
  Top = 339
  Width = 588
  Height = 298
  Caption = 'Editor de Datos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Tbar_BarraDeHerramientas: TToolBar
    Left = 0
    Top = 0
    Width = 580
    Height = 30
    BorderWidth = 1
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    HotImages = Principal.ilColor
    Images = Principal.ilByN
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object tbRefrescar: TToolButton
      Left = 0
      Top = 0
      Caption = 'Refrescar (F5)'
      ImageIndex = 0
      OnClick = tbRefrescarClick
    end
    object ToolButton2: TToolButton
      Left = 23
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object tbCommit: TToolButton
      Left = 31
      Top = 0
      Hint = 'Commit'
      Caption = 'tbCommit'
      ImageIndex = 13
      OnClick = tbCommitClick
    end
    object tbRollback: TToolButton
      Left = 54
      Top = 0
      Hint = 'Rollback'
      Caption = 'tbRollback'
      ImageIndex = 14
      OnClick = tbRollbackClick
    end
    object ToolButton6: TToolButton
      Left = 77
      Top = 0
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object tbSalir: TToolButton
      Left = 85
      Top = 0
      Hint = 'Salir (Ctrl+S)'
      ImageIndex = 5
      OnClick = tbSalirClick
    end
  end
  object Grid: TRxDBGrid
    Left = 0
    Top = 30
    Width = 580
    Height = 241
    Align = alClient
    DataSource = dsConsulta
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'basededatos'
    Options = []
    UpdateObject = sduConsulta
    Left = 164
    Top = 4
  end
  object sduConsulta: TSDUpdateSQL
    Left = 192
    Top = 4
  end
  object dsConsulta: TDataSource
    DataSet = sdqConsulta
    Left = 220
    Top = 4
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end>
    Left = 248
    Top = 4
  end
end
