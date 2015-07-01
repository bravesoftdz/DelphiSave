inherited frmSituacionDocumental: TfrmSituacionDocumental
  Left = 262
  Top = 194
  BorderIcons = [biSystemMenu]
  Caption = 'Documentaci'#243'n'
  Font.Name = 'Tahoma'
  FormStyle = fsNormal
  Visible = False
  ExplicitLeft = 262
  ExplicitTop = 194
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Height = 60
    Color = clWhite
    Visible = True
    ExplicitHeight = 60
    DesignSize = (
      621
      60)
    object lbTitulo: TLabel
      Left = 16
      Top = 12
      Width = 209
      Height = 13
      Caption = 'Situaci'#243'n documental del expediente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbSubtitulo: TLabel
      Left = 28
      Top = 32
      Width = 257
      Height = 13
      Caption = 'Estos son los documentos que posee este expediente'
    end
    object lbLiquidaciones: TLabel
      Left = 486
      Top = 32
      Width = 116
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = '...texto de liquidaciones'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
  end
  inherited CoolBar: TCoolBar
    Top = 60
    ExplicitTop = 60
    inherited ToolBar: TToolBar
      inherited tbRefrescar: TToolButton
        Visible = False
      end
      inherited ToolButton5: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 89
    Height = 317
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    TitleHeight = 34
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'DO_OBLIGADO'
        Title.Caption = 'Obligatorio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DO_CODIGO'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TD_DESCRIPCION'
        Width = 213
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DO_MARCARE'
        Width = 22
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DO_RECIENVI'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DO_RECLAM1'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DO_RECLAM2'
        Width = 63
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 168
    Top = 152
    Width = 349
    Height = 217
    BorderStyle = bsSingle
    OnShow = fpAbmShow
    Constraints.MaxWidth = 349
    Constraints.MinHeight = 181
    Constraints.MinWidth = 349
    ExplicitLeft = 168
    ExplicitTop = 152
    ExplicitWidth = 349
    ExplicitHeight = 217
    DesignSize = (
      349
      217)
    inherited BevelAbm: TBevel
      Top = 181
      Width = 341
      ExplicitTop = 181
      ExplicitWidth = 341
    end
    object Label1: TLabel [1]
      Left = 12
      Top = 16
      Width = 54
      Height = 13
      Caption = 'Documento'
    end
    object Label2: TLabel [2]
      Left = 248
      Top = 40
      Width = 29
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Fecha'
    end
    object Label3: TLabel [3]
      Left = 84
      Top = 92
      Width = 156
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'Fecha reclamado / reenviado (1)'
    end
    object Label4: TLabel [4]
      Left = 226
      Top = 116
      Width = 14
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = '(2)'
    end
    inherited btnAceptar: TButton
      Left = 194
      Top = 187
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      ExplicitLeft = 194
      ExplicitTop = 187
    end
    inherited btnCancelar: TButton
      Left = 269
      Top = 187
      ModalResult = 0
      TabOrder = 7
      OnClick = btnCancelarClick
      ExplicitLeft = 269
      ExplicitTop = 187
    end
    inline fraDO_CODIGO: TfraRTD_TIPODOCUMENTO
      Left = 72
      Top = 12
      Width = 265
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 72
      ExplicitTop = 12
      ExplicitWidth = 265
      DesignSize = (
        265
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 200
        ExplicitWidth = 200
      end
    end
    object rgDO_MARCARE: TRadioGroup
      Left = 72
      Top = 40
      Width = 165
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Estado '
      Columns = 2
      Items.Strings = (
        'Enviado'
        'Recibido')
      TabOrder = 1
    end
    object edDO_RECIENVI: TDateEdit
      Left = 248
      Top = 56
      Width = 89
      Height = 21
      Anchors = [akTop, akRight]
      NumGlyphs = 2
      TabOrder = 2
    end
    object edDO_RECLAM1: TDateEdit
      Left = 248
      Top = 88
      Width = 89
      Height = 21
      Anchors = [akTop, akRight]
      NumGlyphs = 2
      TabOrder = 3
    end
    object edDO_RECLAM2: TDateEdit
      Left = 248
      Top = 112
      Width = 89
      Height = 21
      Anchors = [akTop, akRight]
      NumGlyphs = 2
      TabOrder = 4
    end
    inline fraSDA_DETALLEARCHIVO: TfraSDA_DETALLEARCHIVO
      Left = 8
      Top = 152
      Width = 329
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      ExplicitLeft = 8
      ExplicitTop = 152
      ExplicitWidth = 329
      ExplicitHeight = 25
      inherited Label2: TLabel
        Left = 182
        ExplicitLeft = 182
      end
      inherited cmbDA_OPCION: TComboBox
        Width = 103
        ExplicitWidth = 103
      end
      inherited edDA_HOJAS: TIntEdit
        Left = 274
        ExplicitLeft = 274
      end
    end
  end
  object pnlBottom: TPanel [4]
    Left = 0
    Top = 406
    Width = 621
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    DesignSize = (
      621
      30)
    object btnSalir: TButton
      Left = 543
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Salir'
      TabOrder = 0
      OnClick = tbSalirClick
    end
    object btnAlta: TButton
      Left = 2
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Alta'
      TabOrder = 1
      OnClick = tbNuevoClick
    end
    object btnModificacion: TButton
      Left = 77
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Modificaci'#243'n'
      TabOrder = 2
      OnClick = tbModificarClick
    end
    object btnBaja: TButton
      Left = 152
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Baja'
      TabOrder = 3
      OnClick = tbEliminarClick
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        '  SELECT DO_OBLIGADO, DO_CODIGO, TD_DESCRIPCION, DO_MARCARE, DO_' +
        'RECIENVI,'
      
        '         DO_RECLAM1, DO_RECLAM2, DECODE(DO_MARCARE, '#39'E'#39', 0, 1) E' +
        'NVIADORECIBIDO'
      
        '    FROM ART.SEX_EXPEDIENTES, ART.SDO_DOCUEXPESIN, ARCHIVO.RTD_T' +
        'IPODOCUMENTO'
      '   WHERE DO_SINIESTRO = EX_SINIESTRO'
      '     AND DO_ORDEN = EX_ORDEN'
      '     AND DO_RECAIDA = EX_RECAIDA'
      '     AND EX_ID = :ID'
      '     AND TD_SECTOR IN ('#39'MUTUAL'#39', '#39'ARCHSIN'#39')'
      '     AND TD_CODIGO = DO_CODIGO')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end>
    object sdqConsultaDO_OBLIGADO: TStringField
      DisplayLabel = 'Obligado'
      FieldName = 'DO_OBLIGADO'
      Size = 1
    end
    object sdqConsultaDO_CODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'DO_CODIGO'
      Required = True
      Size = 10
    end
    object sdqConsultaTD_DESCRIPCION: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'TD_DESCRIPCION'
      Required = True
      Size = 150
    end
    object sdqConsultaDO_MARCARE: TStringField
      DisplayLabel = 'R/E'
      FieldName = 'DO_MARCARE'
      Size = 1
    end
    object sdqConsultaDO_RECIENVI: TDateTimeField
      DisplayLabel = 'Recibido / Enviado'
      FieldName = 'DO_RECIENVI'
    end
    object sdqConsultaDO_RECLAM1: TDateTimeField
      DisplayLabel = '1'#176' Reclamo'
      FieldName = 'DO_RECLAM1'
    end
    object sdqConsultaDO_RECLAM2: TDateTimeField
      DisplayLabel = '2'#176' Reclamo'
      FieldName = 'DO_RECLAM2'
    end
    object sdqConsultaENVIADORECIBIDO: TFloatField
      FieldName = 'ENVIADORECIBIDO'
    end
  end
  object ShortCutControlDuplicated: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16462
        LinkControl = tbNuevo
      end
      item
        Key = 16461
        LinkControl = tbModificar
      end
      item
        Key = 16430
        LinkControl = tbEliminar
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16463
        LinkControl = tbOrdenar
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end>
    Left = 108
    Top = 200
  end
end
