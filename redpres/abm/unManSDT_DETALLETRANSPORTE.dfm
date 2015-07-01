inherited frmManSDT_DETALLETRANSPORTE: TfrmManSDT_DETALLETRANSPORTE
  Left = 175
  Top = 151
  Caption = 'Prestadores | Mantenimiento de medios de transporte'
  ClientWidth = 636
  Font.Name = 'Tahoma'
  FormStyle = fsNormal
  Visible = False
  ExplicitWidth = 644
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 636
    Height = 85
    Visible = True
    ExplicitWidth = 636
    ExplicitHeight = 85
    DesignSize = (
      636
      85)
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 56
      Height = 13
      Caption = 'Prestador'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inline fraCA_IDENTIFICADOR: TfraPrestador
      Left = 6
      Top = 27
      Width = 623
      Height = 50
      VertScrollBar.Range = 49
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 6
      ExplicitTop = 27
      ExplicitWidth = 623
      DesignSize = (
        623
        50)
      inherited lbCPostal: TLabel
        Left = 551
        ExplicitLeft = 551
      end
      inherited lbTelefono: TLabel
        Left = 463
        Visible = True
        ExplicitLeft = 463
      end
      inherited cmbPrestFantasia: TArtComboBox
        Width = 0
        ExplicitWidth = 0
      end
      inherited cmbPrestador: TArtComboBox
        Width = 293
        ExplicitWidth = 293
      end
      inherited edPresDomicilio: TEdit
        Width = 249
        ExplicitWidth = 249
      end
      inherited edPresLocalidad: TEdit
        Width = 105
        ExplicitWidth = 105
      end
      inherited edPresCPostal: TEdit
        Left = 568
        ExplicitLeft = 568
      end
      inherited edPresTelefono: TEdit
        Left = 483
        Visible = True
        ExplicitLeft = 483
      end
      inherited sdqDatos: TSDQuery
        Top = 52
      end
      inherited dsDatos: TDataSource
        Top = 52
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 85
    Width = 636
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 630
      end>
    ExplicitTop = 85
    ExplicitWidth = 636
    inherited ToolBar: TToolBar
      Left = 9
      Width = 623
      ExplicitLeft = 9
      ExplicitWidth = 623
      inherited tbPropiedades: TToolButton
        Hint = 'Ajustar columnas'
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 114
    Width = 636
    Height = 325
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    TitleHeight = 34
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'DT_IDPRESTADOR'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_DESCRIPCION'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_PATENTE'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_DESCRIPCION'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_CANTLUGARES'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_USUALTA'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_FECHAALTA'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_USUMODIF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DT_FECHAMODIF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DT_USUBAJA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DT_FECHABAJA'
        Visible = False
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 117
    Top = 172
    Width = 489
    Height = 169
    ExplicitLeft = 117
    ExplicitTop = 172
    ExplicitWidth = 489
    ExplicitHeight = 169
    DesignSize = (
      489
      169)
    inherited BevelAbm: TBevel
      Top = 133
      Width = 481
      ExplicitTop = 133
      ExplicitWidth = 481
    end
    object Label2: TLabel [1]
      Left = 12
      Top = 84
      Width = 65
      Height = 13
      Caption = 'Descripci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel [2]
      Left = 370
      Top = 84
      Width = 45
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Patente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel [3]
      Left = 424
      Top = 84
      Width = 45
      Height = 13
      Caption = 'Lugares'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel [4]
      Left = 8
      Top = 8
      Width = 56
      Height = 13
      Caption = 'Prestador'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited btnAceptar: TButton
      Left = 334
      Top = 139
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      ExplicitLeft = 334
      ExplicitTop = 139
    end
    inherited btnCancelar: TButton
      Left = 409
      Top = 139
      TabOrder = 5
      ExplicitLeft = 409
      ExplicitTop = 139
    end
    inline fraDT_IDPRESTADOR: TfraPrestador
      Left = 6
      Top = 27
      Width = 471
      Height = 50
      VertScrollBar.Range = 49
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 6
      ExplicitTop = 27
      ExplicitWidth = 471
      DesignSize = (
        471
        50)
      inherited lbLocalidad: TLabel
        Left = 206
        ExplicitLeft = 206
      end
      inherited lbCPostal: TLabel
        Left = 399
        ExplicitLeft = 399
      end
      inherited lbTelefono: TLabel
        Left = 311
        Visible = True
        ExplicitLeft = 311
      end
      inherited cmbPrestFantasia: TArtComboBox
        Width = 16
        ExplicitWidth = 16
      end
      inherited cmbPrestador: TArtComboBox
        Width = 141
        ExplicitWidth = 141
      end
      inherited edPresDomicilio: TEdit
        Width = 153
        ExplicitWidth = 153
      end
      inherited edPresLocalidad: TEdit
        Left = 256
        Width = 49
        ExplicitLeft = 256
        ExplicitWidth = 49
      end
      inherited edPresCPostal: TEdit
        Left = 416
        ExplicitLeft = 416
      end
      inherited edPresTelefono: TEdit
        Left = 331
        Visible = True
        ExplicitLeft = 331
      end
      inherited sdqDatos: TSDQuery
        Top = 52
      end
      inherited dsDatos: TDataSource
        Top = 52
      end
    end
    object edDT_DESCRIPCION: TEdit
      Left = 8
      Top = 100
      Width = 357
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object edDT_CANTLUGARES: TSpinEdit
      Left = 420
      Top = 100
      Width = 57
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 3
      Value = 0
    end
    object edDT_PATENTE: TMaskEdit
      Left = 368
      Top = 100
      Width = 49
      Height = 21
      Anchors = [akTop, akRight]
      CharCase = ecUpperCase
      EditMask = 'LLL->000;1;_'
      MaxLength = 7
      TabOrder = 2
      Text = '   -   '
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT dt_id, dt_idprestador, dt_patente, dt_descripcion, dt_usu' +
        'alta, dt_fechaalta, dt_usumodif,'
      
        '       dt_fechamodif, dt_usubaja, dt_fechabaja, dt_cantlugares, ' +
        'ca_descripcion'
      '  FROM art.cpr_prestador, SIN.sdt_detalletransporte'
      ' WHERE dt_idprestador = ca_identificador')
    Top = 340
    object sdqConsultaDT_ID: TFloatField
      DisplayLabel = 'Id'
      FieldName = 'DT_ID'
      Required = True
    end
    object sdqConsultaDT_IDPRESTADOR: TFloatField
      DisplayLabel = 'Identificador'
      FieldName = 'DT_IDPRESTADOR'
      Required = True
    end
    object sdqConsultaDT_PATENTE: TStringField
      DisplayLabel = 'Patente'
      FieldName = 'DT_PATENTE'
      Size = 10
    end
    object sdqConsultaDT_DESCRIPCION: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DT_DESCRIPCION'
      Size = 250
    end
    object sdqConsultaDT_USUALTA: TStringField
      DisplayLabel = 'Usuario de alta'
      FieldName = 'DT_USUALTA'
    end
    object sdqConsultaDT_FECHAALTA: TDateTimeField
      DisplayLabel = 'Fecha de alta'
      FieldName = 'DT_FECHAALTA'
    end
    object sdqConsultaDT_USUMODIF: TStringField
      DisplayLabel = 'Usuario de modificaci'#243'n'
      FieldName = 'DT_USUMODIF'
    end
    object sdqConsultaDT_FECHAMODIF: TDateTimeField
      DisplayLabel = 'Fecha de modificaci'#243'n'
      FieldName = 'DT_FECHAMODIF'
    end
    object sdqConsultaDT_USUBAJA: TStringField
      DisplayLabel = 'Usuario de baja'
      FieldName = 'DT_USUBAJA'
    end
    object sdqConsultaDT_FECHABAJA: TDateTimeField
      DisplayLabel = 'Fecha de baja'
      FieldName = 'DT_FECHABAJA'
    end
    object sdqConsultaDT_CANTLUGARES: TFloatField
      DisplayLabel = 'Lugares'
      FieldName = 'DT_CANTLUGARES'
    end
    object sdqConsultaCA_DESCRIPCION: TStringField
      DisplayLabel = 'Prestador'
      FieldName = 'CA_DESCRIPCION'
      Size = 150
    end
  end
  inherited dsConsulta: TDataSource
    Top = 340
  end
  inherited SortDialog: TSortDialog
    Top = 368
  end
  inherited ExportDialog: TExportDialog
    Top = 368
  end
  inherited QueryPrint: TQueryPrint
    Top = 396
  end
  inherited Seguridad: TSeguridad
    Top = 312
  end
  inherited FormStorage: TFormStorage
    Top = 312
  end
  inherited PrintDialog: TPrintDialog
    Top = 396
  end
  inherited ShortCutControl: TShortCutControl
    Top = 312
  end
  inherited FieldHider: TFieldHider
    Top = 340
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
    Top = 368
  end
end
