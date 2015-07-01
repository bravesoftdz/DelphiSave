inherited frmRecepcionVentanillaElectronica: TfrmRecepcionVentanillaElectronica
  Left = 255
  Top = 186
  Width = 590
  Height = 320
  Caption = 'Recepci'#243'n Anexo (Ventanilla Electr'#243'nica)'
  Constraints.MinHeight = 320
  Constraints.MinWidth = 560
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 20
    Width = 24
    Height = 13
    Caption = 'CUIT'
  end
  object Label2: TLabel [1]
    Left = 8
    Top = 48
    Width = 85
    Height = 13
    Caption = 'C'#243'digo Recepci'#243'n'
  end
  object Label4: TLabel [2]
    Left = 398
    Top = 48
    Width = 81
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Fecha Recepci'#243'n'
  end
  object Label3: TLabel [3]
    Left = 8
    Top = 76
    Width = 96
    Height = 13
    Caption = 'Personer'#237'a Firmante'
  end
  inline fraEmpresa: TfraEmpresa [4]
    Left = 40
    Top = 16
    Width = 533
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    inherited lbContrato: TLabel
      Left = 429
    end
    inherited edContrato: TIntEdit
      Left = 476
    end
    inherited cmbRSocial: TArtComboBox
      Width = 294
    end
  end
  object grid: TArtDBGrid [5]
    Left = 8
    Top = 104
    Width = 564
    Height = 140
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsConsulta
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    IniStorage = FormStorage
    FooterBand = False
    TitleHeight = 17
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CA_FECHAIMPRESION'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Impresi'#243'n'
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RECEPCIONOK'
        Title.Caption = 'Recepci'#243'n Ok'
        Width = 79
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CA_FECHARECEPCION'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Recepci'#243'n'
        Width = 132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_OBSERVRECEPCION'
        Title.Caption = 'Observaci'#243'n'
        Width = 148
        Visible = True
      end>
  end
  object btnRecepcionar: TBitBtn [6]
    Left = 486
    Top = 254
    Width = 88
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Recepcionar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = btnRecepcionarClick
  end
  object edFechaRecepcion: TDateComboBox [7]
    Left = 486
    Top = 44
    Width = 88
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 2
  end
  inline fraCodigoRecepcion: TfraCodDesc [8]
    Left = 107
    Top = 44
    Width = 278
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    inherited cmbDescripcion: TArtComboBox
      Width = 213
    end
    inherited Propiedades: TPropiedadesFrame
      CodigoType = ctInteger
      FieldBaja = 'oa_fechabaja'
      FieldCodigo = 'oa_id'
      FieldDesc = 'oa_detalle'
      FieldID = 'oa_id'
      IdType = ctInteger
      TableName = 'afi.aoa_origenanexo365'
    end
  end
  object chkPersoneriaFirmante: TDBCheckCombo [9]
    Left = 108
    Top = 72
    Width = 465
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    DataSource = dsPersoneriaFirmante
    KeyField = 'PF_ID'
    ListField = 'PF_DETALLE'
  end
  object btnLimpiar: TButton [10]
    Left = 8
    Top = 255
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Limpiar'
    TabOrder = 6
    OnClick = btnLimpiarClick
  end
  inherited FormStorage: TFormStorage [11]
    Left = 84
    Top = 152
  end
  inherited XPMenu: TXPMenu [12]
    Left = 112
    Top = 152
  end
  inherited ilByN: TImageList [13]
    Left = 84
    Top = 180
  end
  inherited ilColor: TImageList
    Left = 112
    Top = 180
  end
  inherited IconosXP: TImageList
    Left = 140
    Top = 180
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    Left = 168
    Top = 180
  end
  object dsConsulta: TDataSource
    DataSet = sdqConsulta
    Left = 196
    Top = 180
  end
  object sdqPersoneriaFirmante: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT *'
      '  FROM afi.apf_personeriafirmante'
      ' WHERE pf_fechabaja IS NULL'
      '')
    Left = 240
    Top = 76
  end
  object dsPersoneriaFirmante: TDataSource
    DataSet = sdqPersoneriaFirmante
    Left = 268
    Top = 76
  end
end
