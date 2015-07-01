inherited frmVisualizarArchivos: TfrmVisualizarArchivos
  Left = 197
  Top = 116
  Width = 609
  Height = 403
  HelpContext = 19
  Caption = 'Visualizar Archivos'
  Font.Name = 'Tahoma'
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Position = poDefaultPosOnly
  Visible = True
  DesignSize = (
    601
    369)
  PixelsPerInch = 96
  TextHeight = 13
  object pnlArchivo: TPanel [0]
    Left = 0
    Top = 1
    Width = 457
    Height = 31
    Alignment = taLeftJustify
    Anchors = [akLeft, akTop, akRight]
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = '  Archivo'
    TabOrder = 0
    DesignSize = (
      457
      31)
    inline fraArchivo: TfraCodigoDescripcion
      Left = 52
      Top = 4
      Width = 402
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Width = 337
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AR_ARCHIVONOMBRE'
            Title.Caption = 'Archivo'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 300
            Visible = True
          end>
      end
      inherited edCodigo: TPatternEdit
        Pattern = '0123456789'
      end
    end
  end
  object Grid: TStringGrid [1]
    Left = 0
    Top = 36
    Width = 601
    Height = 340
    Anchors = [akLeft, akTop, akRight, akBottom]
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
    TabOrder = 1
  end
  object CoolBar: TCoolBar [2]
    Left = 460
    Top = 1
    Width = 138
    Height = 32
    Align = alNone
    Anchors = [akTop, akRight]
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 134
      end>
    object ToolBar: TToolBar
      Left = 9
      Top = 0
      Width = 121
      Height = 27
      Align = alClient
      BorderWidth = 1
      Caption = 'ToolBar'
      EdgeBorders = []
      Flat = True
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object tbAbrir: TToolButton
        Left = 0
        Top = 0
        Hint = 'Abrir Archivo (Ctrl+A)'
        ImageIndex = 17
        OnClick = tbAbrirClick
      end
      object ToolButton4: TToolButton
        Left = 23
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object tbLimpiar: TToolButton
        Left = 31
        Top = 0
        Hint = 'Limpiar (Ctrl+L)'
        ImageIndex = 1
        OnClick = tbLimpiarClick
      end
      object ToolButton11: TToolButton
        Left = 54
        Top = 0
        Width = 8
        Caption = 'ToolButton11'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbLimites: TToolButton
        Left = 62
        Top = 0
        ImageIndex = 18
        Style = tbsCheck
      end
      object ToolButton2: TToolButton
        Left = 85
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir: TToolButton
        Left = 93
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  object fpProgreso: TFormPanel [3]
    Left = 132
    Top = 184
    Width = 421
    Height = 118
    Caption = 'Cargando...'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    BorderStyle = bsSingle
    Position = poScreenCenter
    DesignSize = (
      421
      118)
    object lbArchivo: TLabel
      Left = 12
      Top = 10
      Width = 349
      Height = 13
      AutoSize = False
      Caption = 'Cargando Archivo'
    end
    object lbProgreso: TLabel
      Left = 12
      Top = 50
      Width = 397
      Height = 13
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = '0 de 0 Bytes'
    end
    object btnCancelar: TButton
      Left = 175
      Top = 88
      Width = 75
      Height = 25
      Anchors = [akBottom]
      Cancel = True
      Caption = '&Cancelar'
      TabOrder = 0
      OnClick = btnCancelarClick
    end
    object ProgressBar: TProgressBar
      Left = 12
      Top = 65
      Width = 397
      Height = 16
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 1
    end
    object pnlBuffer: TPanel
      Left = 12
      Top = 28
      Width = 397
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvLowered
      TabOrder = 2
    end
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16449
        LinkControl = tbAbrir
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end>
    Left = 500
    Top = 36
  end
  object OpenDialog: TOpenDialog
    Filter = '%s|%s|Todos los Archivos|*.*'
    Left = 528
    Top = 36
  end
  object FileReader: TFileReader
    OnReadLine = FileReaderReadLine
    OnReadField = FileReaderReadField
    OnStreamRead = FileReaderStreamRead
    Fields = <>
    Left = 556
    Top = 36
  end
end
