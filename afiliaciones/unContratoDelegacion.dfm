inherited frmContratoDelegacion: TfrmContratoDelegacion
  Left = 272
  Top = 211
  Width = 631
  Height = 308
  BorderIcons = [biSystemMenu]
  Caption = 'Delegaci'#243'n por Contrato'
  Constraints.MinHeight = 300
  Constraints.MinWidth = 600
  Font.Name = 'Tahoma'
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 623
  end
  inherited CoolBar: TCoolBar
    Width = 623
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 619
      end>
    inherited ToolBar: TToolBar
      Width = 606
      inherited tbRefrescar: TToolButton
        Visible = False
      end
      inherited ToolButton5: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 623
    Height = 207
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'EL_NOMBRE'
        Title.Caption = 'Delegaci'#243'n'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DC_FECHA_DESDE'
        Title.Caption = 'Vigendia desde'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DC_FECHA_HASTA'
        Title.Caption = 'Vigencia hasta'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DC_USUALTA'
        Title.Caption = 'Usuario de alta'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DC_FECHAALTA'
        Title.Caption = 'Fecha de alta'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DC_USUMODIF'
        Title.Caption = 'Usuario de Modificaci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DC_FECHAMODIF'
        Title.Caption = 'Fecha de Modificaci'#243'n'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DC_USUBAJA'
        Title.Caption = 'Usuario de baja'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DC_FECHABAJA'
        Title.Caption = 'Fecha de baja'
        Width = 62
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 140
    Top = 116
    Height = 151
    inherited BevelAbm: TBevel
      Top = 115
    end
    object lbFD: TLabel [1]
      Left = 20
      Top = 64
      Width = 30
      Height = 13
      Caption = 'Desde'
    end
    object lbFH: TLabel [2]
      Left = 110
      Top = 64
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object Label1: TLabel [3]
      Left = 20
      Top = 16
      Width = 41
      Height = 13
      Caption = 'Empresa'
    end
    object Label2: TLabel [4]
      Left = 202
      Top = 64
      Width = 52
      Height = 13
      Caption = 'Delegaci'#243'n'
    end
    inherited btnAceptar: TButton
      Left = 306
      Top = 121
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited btnCancelar: TButton
      Top = 121
    end
    object edDC_FECHA_DESDE: TDateComboBox
      Left = 20
      Top = 80
      Width = 87
      Height = 21
      TabOrder = 2
    end
    object edDC_FECHA_HASTA: TDateComboBox
      Left = 110
      Top = 80
      Width = 87
      Height = 21
      TabOrder = 3
    end
    inline fraDC_CONTRATO: TfraEmpresa
      Left = 19
      Top = 32
      Width = 427
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      inherited lbRSocial: TLabel
        Left = 87
      end
      inherited lbContrato: TLabel
        Left = 324
      end
      inherited mskCUIT: TMaskEdit
        Color = clSilver
        ReadOnly = True
      end
      inherited edContrato: TIntEdit
        Left = 370
        Color = clSilver
        ReadOnly = True
      end
      inherited cmbRSocial: TArtComboBox
        Width = 188
        Color = clSilver
        ReadOnly = True
      end
    end
    inline fraDC_IDDELEGACION: TfraCodDesc
      Left = 200
      Top = 79
      Width = 249
      Height = 23
      TabOrder = 5
      inherited cmbDescripcion: TArtComboBox
        Width = 184
      end
      inherited Propiedades: TPropiedadesFrame
        CodigoType = ctInteger
        FieldBaja = 'EL_FECHABAJA'
        FieldCodigo = 'EL_ID'
        FieldDesc = 'EL_NOMBRE'
        FieldID = 'EL_ID'
        IdType = ctInteger
        OrderBy = 'EL_NOMBRE'
        ShowBajas = True
        TableName = 'DEL_DELEGACION'
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT EL_NOMBRE, DC_ID, DC_CONTRATO, DC_IDDELEGACION, DC_FECHA_' +
        'DESDE,'
      '       DC_FECHA_HASTA, DC_USUALTA, DC_FECHAALTA, DC_USUMODIF,'
      '       DC_FECHAMODIF, DC_USUBAJA, DC_FECHABAJA'
      '  FROM AFI.ADC_DELEGACIONCONTRATO, DEL_DELEGACION'
      ' WHERE DC_CONTRATO = :Contrato'
      '   AND DC_IDDELEGACION = EL_ID'
      ' ORDER BY DC_FECHA_DESDE DESC'
      ' ')
    Left = 20
    Top = 148
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Contrato'
        ParamType = ptInput
      end>
  end
  inherited dsConsulta: TDataSource
    Left = 48
    Top = 148
  end
  inherited SortDialog: TSortDialog
    Left = 20
    Top = 176
  end
  inherited ExportDialog: TExportDialog
    Left = 48
    Top = 176
  end
  inherited QueryPrint: TQueryPrint
    Left = 48
    Top = 204
  end
  inherited Seguridad: TSeguridad
    Left = 20
    Top = 120
  end
  inherited FormStorage: TFormStorage
    Left = 48
    Top = 120
  end
  inherited PrintDialog: TPrintDialog
    Left = 20
    Top = 204
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
    Left = 76
    Top = 120
  end
  inherited FieldHider: TFieldHider
    Left = 76
    Top = 148
  end
end
