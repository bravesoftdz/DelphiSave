inherited frmManCRR_RESPUESTA: TfrmManCRR_RESPUESTA
  Left = 257
  Top = 107
  Width = 640
  Caption = 'Mantenimiento | Respuestas para la agenda'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 632
    Height = 57
    Visible = True
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 31
      Height = 13
      Caption = 'Sector'
    end
    inline fraRR_SECTOR: TfraCodDesc
      Left = 7
      Top = 24
      Width = 478
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Width = 413
        Height = 22
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'SC_FECHABAJA'
        FieldCodigo = 'SC_CODIGO'
        FieldDesc = 'SC_DESCRIPCION'
        FieldID = 'SC_CODIGO'
        OrderBy = 'SC_DESCRIPCION'
        ShowBajas = True
        TableName = 'USC_SECTORES'
      end
    end
    object chkBajas: TCheckBox
      Left = 492
      Top = 28
      Width = 129
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'No ver dadas de baja'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
  end
  inherited CoolBar: TCoolBar
    Top = 57
    Width = 632
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 628
      end>
    inherited ToolBar: TToolBar
      Width = 615
    end
  end
  inherited Grid: TArtDBGrid
    Top = 86
    Width = 632
    Height = 353
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleHeight = 34
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'RR_ID'
        Title.Caption = 'ID'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RR_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 126
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RR_SECTOR'
        Title.Caption = 'Sector'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RR_USUALTA'
        Title.Caption = 'Usuario de alta'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RR_FECHAALTA'
        Title.Caption = 'Fecha de alta'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RR_USUMODIF'
        Title.Caption = 'Usuario de modificaci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RR_FECHAMODIF'
        Title.Caption = 'Fecha de modificaci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RR_USUBAJA'
        Title.Caption = 'Usuario de baja'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RR_FECHABAJA'
        Title.Caption = 'Fecha de baja'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 116
    Top = 228
    Width = 317
    Height = 145
    Constraints.MaxHeight = 145
    Constraints.MaxWidth = 317
    Constraints.MinHeight = 145
    Constraints.MinWidth = 317
    inherited BevelAbm: TBevel
      Top = 109
      Width = 309
    end
    object Label2: TLabel [1]
      Left = 16
      Top = 12
      Width = 31
      Height = 13
      Caption = 'Sector'
    end
    object Label3: TLabel [2]
      Left = 16
      Top = 56
      Width = 51
      Height = 13
      Caption = 'Respuesta'
    end
    inherited btnAceptar: TButton
      Left = 159
      Top = 115
    end
    inherited btnCancelar: TButton
      Left = 237
      Top = 115
    end
    inline fraSectorRespuesta: TfraCodDesc
      Left = 15
      Top = 26
      Width = 292
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Width = 227
        Height = 22
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'SC_FECHABAJA'
        FieldCodigo = 'SC_CODIGO'
        FieldDesc = 'SC_DESCRIPCION'
        FieldID = 'SC_CODIGO'
        OrderBy = 'SC_DESCRIPCION'
        ShowBajas = True
        TableName = 'USC_SECTORES'
      end
    end
    object edRR_DESCRIPCION: TEdit
      Left = 16
      Top = 72
      Width = 289
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      'FROM CRR_RESPUESTA'
      'WHERE 1=1')
  end
  inherited ShortCutControl: TShortCutControl
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
  end
end
