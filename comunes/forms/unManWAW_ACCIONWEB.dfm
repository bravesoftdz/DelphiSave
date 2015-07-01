inherited frmManWAW_ACCIONWEB: TfrmManWAW_ACCIONWEB
  Left = 175
  Top = 168
  Width = 534
  Caption = 'Mantenimiento de Acciones WEB'
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 526
    Height = 57
  end
  inherited CoolBar: TCoolBar
    Top = 57
    Width = 526
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 522
      end>
    inherited ToolBar: TToolBar
      Width = 509
    end
  end
  inherited Grid: TArtDBGrid
    Top = 86
    Width = 526
    Height = 346
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'AW_ID'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AW_DESCRIPCION'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AW_MOTIVOMAIL'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AW_ARCHIVO'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AW_HTMLMAIL'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AW_HTMLNOTIFICACION'
        Width = 92
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 92
    Top = 116
    Width = 417
    Height = 293
    OnShow = fpAbmShow
    inherited BevelAbm: TBevel
      Top = 257
      Width = 409
    end
    object Label3: TLabel [1]
      Left = 12
      Top = 12
      Width = 54
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object Label4: TLabel [2]
      Left = 12
      Top = 56
      Width = 72
      Height = 13
      Caption = 'Asunto del mail'
    end
    object Label5: TLabel [3]
      Left = 12
      Top = 104
      Width = 220
      Height = 13
      Caption = 'Acci'#243'n del form (link a un PHP probablemente)'
    end
    object Label1: TLabel [4]
      Left = 12
      Top = 152
      Width = 47
      Height = 13
      Caption = 'HTML Mail'
    end
    object Label2: TLabel [5]
      Left = 12
      Top = 204
      Width = 163
      Height = 13
      Caption = 'Ruta del HTML para la Notificaci'#243'n'
    end
    inherited btnAceptar: TButton
      Left = 262
      Top = 263
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    inherited btnCancelar: TButton
      Left = 337
      Top = 263
      TabOrder = 6
    end
    object edAW_DESCRIPCION: TEdit
      Left = 8
      Top = 32
      Width = 397
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
    object edAW_MOTIVOMAIL: TEdit
      Left = 8
      Top = 76
      Width = 397
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
    object edAW_ARCHIVO: TEdit
      Left = 8
      Top = 124
      Width = 397
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
    object edAW_HTMLMAIL: TEdit
      Left = 8
      Top = 172
      Width = 397
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
    end
    object edAW_HTMLNOTIFICACION: TEdit
      Left = 8
      Top = 224
      Width = 397
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
    end
    object btnParametros: TButton
      Left = 10
      Top = 263
      Width = 115
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Ver par'#225'metros'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = btnParametrosClick
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      'FROM WEB.WAW_ACCIONWEB'
      'WHERE 1=1')
    object sdqConsultaAW_ID: TFloatField
      DisplayLabel = 'Id'
      FieldName = 'AW_ID'
      Required = True
    end
    object sdqConsultaAW_DESCRIPCION: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'AW_DESCRIPCION'
      Size = 255
    end
    object sdqConsultaAW_MOTIVOMAIL: TStringField
      DisplayLabel = 'Asunto del mail'
      FieldName = 'AW_MOTIVOMAIL'
      Size = 255
    end
    object sdqConsultaAW_ARCHIVO: TStringField
      DisplayLabel = 'Acci'#243'n PHP'
      FieldName = 'AW_ARCHIVO'
      Size = 255
    end
    object sdqConsultaAW_HTMLMAIL: TStringField
      DisplayLabel = 'HTML Mail'
      FieldName = 'AW_HTMLMAIL'
      Size = 255
    end
    object sdqConsultaAW_HTMLNOTIFICACION: TStringField
      DisplayLabel = 'HTML Notificaci'#243'n'
      FieldName = 'AW_HTMLNOTIFICACION'
      Size = 255
    end
    object sdqConsultaAW_USUALTA: TStringField
      FieldName = 'AW_USUALTA'
    end
    object sdqConsultaAW_FECHAALTA: TDateTimeField
      FieldName = 'AW_FECHAALTA'
    end
    object sdqConsultaAW_USUMODIF: TStringField
      FieldName = 'AW_USUMODIF'
    end
    object sdqConsultaAW_FECHAMODIF: TDateTimeField
      FieldName = 'AW_FECHAMODIF'
    end
    object sdqConsultaAW_USUBAJA: TStringField
      FieldName = 'AW_USUBAJA'
    end
    object sdqConsultaAW_FECHABAJA: TDateTimeField
      FieldName = 'AW_FECHABAJA'
    end
  end
  object ShortCutControlHijo: TShortCutControl
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
    Left = 80
    Top = 200
  end
end
