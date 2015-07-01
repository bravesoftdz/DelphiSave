object frmFirmantes: TfrmFirmantes
  Left = 357
  Top = 265
  Width = 584
  Height = 230
  Caption = 'Firmantes'
  Color = clBtnFace
  Constraints.MaxWidth = 584
  Constraints.MinWidth = 584
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  DesignSize = (
    576
    203)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 1
    Top = 6
    Width = 65
    Height = 13
    Caption = 'Cod.Firmante:'
  end
  object Label2: TLabel
    Left = 158
    Top = 7
    Width = 43
    Height = 13
    Caption = 'Firmante:'
  end
  object dbgDatos: TArtDBGrid
    Left = -1
    Top = 25
    Width = 577
    Height = 154
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsFirmas
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = dbgDatosCellClick
    OnDblClick = dbgDatosDblClick
    OnKeyUp = dbgDatosKeyUp
    FooterBand = False
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'FI_ID'
        Title.Caption = 'Cod.Firmante'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FI_FIRMANTE'
        Title.Caption = 'Firmante'
        Width = 277
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FI_CARACTER'
        Title.Caption = 'Car'#225'cter'
        Width = 191
        Visible = True
      end>
  end
  object isFirmante: TDBIncrementalSearch
    Left = 201
    Top = 2
    Width = 374
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    OnChange = isFirmanteChange
    MinSearchLength = 2
    KeyField = 'FI_FIRMANTE'
    ListField = 'FI_FIRMANTE'
    ListSource = dsFirmas
  end
  object pnlbtnAceptar: TPanel
    Left = 0
    Top = 180
    Width = 576
    Height = 23
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object btnAceptar: TButton
      Left = 495
      Top = 2
      Width = 80
      Height = 21
      Caption = '&Aceptar'
      ModalResult = 1
      TabOrder = 0
    end
  end
  object edFirmante: TEdit
    Left = 67
    Top = 2
    Width = 86
    Height = 21
    MaxLength = 3
    TabOrder = 3
    OnKeyUp = edFirmanteKeyUp
  end
  object sdqFirmas: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT FI_ID, FI_FIRMANTE, FI_CARACTER, FI_FIRMA'
      '  FROM CFI_FIRMA'
      ' WHERE FI_ID IN (SELECT FI_ID'
      
        '                   FROM CFI_FIRMA, CFA_FIRMANTEAREA, CAT_AREATEX' +
        'TO'
      '                  WHERE FI_ID = FA_IDFIRMANTE'
      '                    AND FA_IDAREATEXTO = AT_ID'
      '               GROUP BY FI_ID)'
      '')
    Left = 100
    Top = 98
  end
  object dsFirmas: TDataSource
    DataSet = sdqFirmas
    Left = 128
    Top = 98
  end
end
