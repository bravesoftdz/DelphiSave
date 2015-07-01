inherited frmDatosLesion: TfrmDatosLesion
  Left = 175
  Top = 165
  Width = 570
  Height = 280
  BorderIcons = []
  Caption = 'Datos de la lesi'#243'n'
  Constraints.MaxHeight = 280
  Constraints.MinHeight = 280
  Constraints.MinWidth = 570
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel [0]
    Left = 12
    Top = 88
    Width = 122
    Height = 13
    Caption = 'Agente Material Asociado'
  end
  object lbForma: TLabel [1]
    Left = 296
    Top = 88
    Width = 97
    Height = 13
    Caption = 'Forma del Accidente'
  end
  object Label6: TLabel [2]
    Left = 296
    Top = 136
    Width = 24
    Height = 13
    Hint = 'Zona del cuerpo afectada'
    Caption = 'Zona'
    ParentShowHint = False
    ShowHint = True
  end
  object Label5: TLabel [3]
    Left = 12
    Top = 136
    Width = 52
    Height = 13
    Hint = 'Naturaleza de la lesi'#243'n'
    Caption = 'Naturaleza'
    ParentShowHint = False
    ShowHint = True
  end
  object Label1: TLabel [4]
    Left = 12
    Top = 184
    Width = 84
    Height = 13
    Hint = 'Naturaleza de la lesi'#243'n'
    Caption = 'Agente Causante'
    ParentShowHint = False
    ShowHint = True
  end
  object btnAceptar: TButton [5]
    Left = 402
    Top = 211
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Aceptar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = btnAceptarClick
  end
  object btnCancelar: TButton [6]
    Left = 477
    Top = 211
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 6
  end
  inline fraDL_IDLESIONFORMA: TfraSLF_LESIONFORMA [7]
    Left = 292
    Top = 104
    Width = 261
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    DesignSize = (
      261
      23)
    inherited cmbDescripcion: TComboGrid
      Width = 198
      Cells = (
        'C'#243'digo'
        'Descripci'#243'n'
        'Id'
        'Fecha de Baja'
        'SubTitulo')
      ColWidths = (
        40
        300
        -1
        -1
        -1)
    end
    inherited Propiedades: TPropiedadesFrame
      ShowBajas = True
    end
  end
  inline fraDL_IDLESIONAGENTEMATERIAL: TfraSLM_LESIONAGENTEMATERIAL [8]
    Left = 8
    Top = 104
    Width = 280
    Height = 23
    TabOrder = 0
    inherited cmbDescripcion: TComboGrid
      Width = 217
      Cells = (
        'C'#243'digo'
        'Descripci'#243'n'
        'Id'
        'Fecha de Baja'
        'SubTitulo'
        'Titulo')
      ColWidths = (
        50
        320
        -1
        -1
        -1
        -1)
    end
    inherited Propiedades: TPropiedadesFrame
      ShowBajas = True
    end
  end
  inline fraDL_IDLESIONNATURALEZA: TfraSLN_LESIONNATURALEZA [9]
    Left = 8
    Top = 152
    Width = 280
    Height = 23
    TabOrder = 2
    DesignSize = (
      280
      23)
    inherited cmbDescripcion: TComboGrid
      Width = 217
      Cells = (
        'C'#243'digo'
        'Descripci'#243'n'
        'Id'
        'Fecha de Baja')
      ColWidths = (
        40
        300
        -1
        -1)
    end
    inherited Propiedades: TPropiedadesFrame
      ShowBajas = True
    end
  end
  inline fraDL_IDLESIONZONA: TfraSLZ_LESIONZONA [10]
    Left = 292
    Top = 152
    Width = 261
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    DesignSize = (
      261
      23)
    inherited cmbDescripcion: TComboGrid
      Width = 198
      Cells = (
        'C'#243'digo'
        'Descripci'#243'n'
        'Id'
        'Fecha de Baja')
      ColWidths = (
        40
        300
        -1
        -1)
    end
    inherited Propiedades: TPropiedadesFrame
      ShowBajas = True
    end
  end
  inline fraDL_IDLESIONAGENTECAUSANTE: TfraSLA_LESIONAGENTE [11]
    Left = 8
    Top = 203
    Width = 280
    Height = 23
    TabOrder = 4
    inherited cmbDescripcion: TComboGrid
      Width = 217
      Cells = (
        'C'#243'digo'
        'Descripci'#243'n'
        'Id'
        'Fecha de Baja')
      ColWidths = (
        40
        300
        -1
        -1)
    end
  end
  object pnlFiltros: TPanel
    Left = 0
    Top = 0
    Width = 562
    Height = 73
    Hint = 'pnlFiltros'
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 7
    object lbTitulo: TLabel
      Left = 16
      Top = 12
      Width = 287
      Height = 13
      Caption = 'Datos de la lesi'#243'n deducidos en base al diagn'#243'stico'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbSubtitulo: TLabel
      Left = 40
      Top = 32
      Width = 467
      Height = 32
      AutoSize = False
      Caption = 
        'Estos datos se informar'#225'n a la SRT, en caso de no haber sido inf' +
        'ormados en la denuncia o el parte de ingreso por parte de la emp' +
        'resa.'
      WordWrap = True
    end
  end
  inherited FormStorage: TFormStorage
    Left = 8
    Top = 256
  end
  inherited XPMenu: TXPMenu
    Left = 36
    Top = 256
  end
  inherited ilByN: TImageList
    Left = 8
    Top = 248
  end
  inherited ilColor: TImageList
    Left = 36
    Top = 248
  end
  inherited IconosXP: TImageList
    Left = 64
    Top = 248
  end
  object sduDatos: TSDUpdateSQL
    ModifySQL.Strings = (
      'update SIN.SDL_DATOSLESION'
      'set'
      '  DL_ID = :DL_ID,'
      '  DL_IDEXPEDIENTE = :DL_IDEXPEDIENTE,'
      
        '  DL_IDLESIONFORMA = DECODE(:DL_IDLESIONFORMA, 0, NULL, :DL_IDLE' +
        'SIONFORMA),'
      
        '  DL_IDLESIONAGENTEMATERIAL = DECODE(:DL_IDLESIONAGENTEMATERIAL,' +
        ' 0, NULL, :DL_IDLESIONAGENTEMATERIAL),'
      
        '  DL_IDLESIONNATURALEZA = DECODE(:DL_IDLESIONNATURALEZA, 0, NULL' +
        ', :DL_IDLESIONNATURALEZA),'
      
        '  DL_IDLESIONZONA = DECODE(:DL_IDLESIONZONA, 0, NULL, :DL_IDLESI' +
        'ONZONA),'
      
        '  DL_IDAGENTECAUSANTE = DECODE(:DL_IDAGENTECAUSANTE, 0, NULL, :D' +
        'L_IDAGENTECAUSANTE),'
      '  DL_USUALTA = :DL_USUALTA,'
      '  DL_FECHAALTA = :DL_FECHAALTA,'
      '  DL_USUMODIF = :DL_USUMODIF,'
      '  DL_FECHAMODIF = :DL_FECHAMODIF'
      'where'
      '  DL_ID = :OLD_DL_ID')
    InsertSQL.Strings = (
      'insert into SIN.SDL_DATOSLESION'
      '  (DL_ID, DL_IDEXPEDIENTE,'
      '   DL_IDLESIONFORMA,'
      '   DL_IDLESIONAGENTEMATERIAL,'
      '   DL_IDLESIONNATURALEZA,'
      '   DL_IDLESIONZONA,'
      '   DL_IDAGENTECAUSANTE,'
      '   DL_USUALTA, DL_FECHAALTA, DL_USUMODIF, DL_FECHAMODIF)'
      'values'
      '  (:DL_ID, :DL_IDEXPEDIENTE,'
      '   DECODE(:DL_IDLESIONFORMA, 0, NULL, :DL_IDLESIONFORMA),'
      
        '   DECODE(:DL_IDLESIONAGENTEMATERIAL, 0, NULL, :DL_IDLESIONAGENT' +
        'EMATERIAL),'
      
        '   DECODE(:DL_IDLESIONNATURALEZA, 0, NULL, :DL_IDLESIONNATURALEZ' +
        'A),'
      '   DECODE(:DL_IDLESIONZONA, 0, NULL, :DL_IDLESIONZONA),'
      '   DECODE(:DL_IDAGENTECAUSANTE, 0, NULL, :DL_IDAGENTECAUSANTE),'
      '   :DL_USUALTA, :DL_FECHAALTA, :DL_USUMODIF, :DL_FECHAMODIF)')
    DeleteSQL.Strings = (
      'delete from SIN.SDL_DATOSLESION'
      'where'
      '  DL_ID = :OLD_DL_ID')
    Left = 524
    Top = 72
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    OnUpdateData = dsDatosUpdateData
    Left = 496
    Top = 72
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqDatosAfterOpen
    SQL.Strings = (
      'SELECT *'
      '  FROM SIN.SDL_DATOSLESION'
      ' WHERE DL_IDEXPEDIENTE = :DL_IDEXPEDIENTE')
    UpdateObject = sduDatos
    Left = 468
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DL_IDEXPEDIENTE'
        ParamType = ptInput
      end>
    object sdqDatosDL_ID: TFloatField
      FieldName = 'DL_ID'
      Required = True
    end
    object sdqDatosDL_IDEXPEDIENTE: TFloatField
      FieldName = 'DL_IDEXPEDIENTE'
      Required = True
    end
    object sdqDatosDL_IDLESIONFORMA: TFloatField
      FieldName = 'DL_IDLESIONFORMA'
    end
    object sdqDatosDL_IDLESIONAGENTEMATERIAL: TFloatField
      FieldName = 'DL_IDLESIONAGENTEMATERIAL'
    end
    object sdqDatosDL_IDLESIONNATURALEZA: TFloatField
      FieldName = 'DL_IDLESIONNATURALEZA'
    end
    object sdqDatosDL_IDLESIONZONA: TFloatField
      FieldName = 'DL_IDLESIONZONA'
    end
    object sdqDatosDL_USUALTA: TStringField
      FieldName = 'DL_USUALTA'
      Required = True
    end
    object sdqDatosDL_FECHAALTA: TDateTimeField
      FieldName = 'DL_FECHAALTA'
      Required = True
    end
    object sdqDatosDL_USUMODIF: TStringField
      FieldName = 'DL_USUMODIF'
    end
    object sdqDatosDL_FECHAMODIF: TDateTimeField
      FieldName = 'DL_FECHAMODIF'
    end
    object sdqDatosDL_IDAGENTECAUSANTE: TFloatField
      FieldName = 'DL_IDAGENTECAUSANTE'
    end
  end
end
