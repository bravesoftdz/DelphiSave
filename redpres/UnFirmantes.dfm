object frmFirmantes: TfrmFirmantes
  Left = 303
  Top = 229
  Width = 584
  Height = 364
  BorderIcons = [biSystemMenu]
  Caption = 'Selecci'#243'n del Firmante'
  Color = clBtnFace
  Constraints.MaxWidth = 584
  Constraints.MinWidth = 584
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 7
    Top = 9
    Width = 46
    Height = 13
    Caption = 'Firmante:'
  end
  object dbgDatos: TArtDBGrid
    Left = 0
    Top = 32
    Width = 576
    Height = 276
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsFirmas
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyPress = dbgDatosKeyPress
    FooterBand = False
    TitleHeight = 17
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CODFIRMA'
        Title.Alignment = taCenter
        Title.Caption = 'Codigo'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUARIO'
        Title.Caption = 'Firmante'
        Width = 260
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CARACTER'
        Title.Caption = 'Caracter'
        Width = 250
        Visible = True
      end>
  end
  object pnlbtnAceptar: TPanel
    Left = 0
    Top = 308
    Width = 576
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object btnAceptar: TButton
      Left = 415
      Top = 2
      Width = 80
      Height = 26
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
    end
    object btnCancelar: TButton
      Left = 495
      Top = 2
      Width = 80
      Height = 26
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
  end
  inline fraFirmante: TfraFirmantes
    Left = 57
    Top = 6
    Width = 381
    Height = 21
    TabOrder = 0
    OnExit = fraFirmanteExit
    inherited cmbDescripcion: TArtComboBox
      Left = 52
      Width = 329
    end
    inherited edCodigo: TIntEdit
      Width = 49
    end
  end
  object sdqFirmas: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqFirmasAfterScroll
    SQL.Strings = (
      'SELECT   DISTINCT fi_id codfirma, INITCAP(fi_firmante) usuario,'
      '                 INITCAP(fi_caracter) caracter, fi_codusuario'
      '    FROM cfi_firma, cfa_firmantearea, cat_areatexto'
      '   WHERE fi_id = fa_idfirmante'
      '     AND fa_idareatexto = at_id'
      '     AND fi_fechabaja IS NULL'
      '     AND fa_fechabaja IS NULL'
      '     AND at_fechabaja IS NULL'
      '     AND at_area = :area'
      'ORDER BY usuario')
    Left = 100
    Top = 98
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'area'
        ParamType = ptInput
      end>
    object sdqFirmasUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 50
    end
    object sdqFirmasCARACTER: TStringField
      FieldName = 'CARACTER'
      Size = 60
    end
    object sdqFirmasCODFIRMA: TFloatField
      FieldName = 'CODFIRMA'
      Required = True
    end
    object sdqFirmasfi_codusuario: TStringField
      FieldName = 'fi_codusuario'
    end
  end
  object dsFirmas: TDataSource
    DataSet = sdqFirmas
    Left = 128
    Top = 98
  end
end
