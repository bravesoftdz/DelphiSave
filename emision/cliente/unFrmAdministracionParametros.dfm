inherited frmAdministracionParametros: TfrmAdministracionParametros
  Left = 193
  Top = 153
  Width = 631
  Height = 500
  Caption = 'Administraci'#243'n de Par'#225'metros'
  Font.Charset = ANSI_CHARSET
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 623
    Height = 27
    Visible = True
    object lblTipoParametro: TLabel
      Left = 6
      Top = 6
      Width = 92
      Height = 13
      Caption = 'Tipo de Par'#225'metro:'
    end
    object cboClaseParametro: TComboBox
      Left = 103
      Top = 3
      Width = 220
      Height = 21
      Hint = 'Selecci'#243'n del tipo de par'#225'metro. Modo de Agrupaci'#243'n'
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = cboClaseParametroChange
    end
  end
  inherited CoolBar: TCoolBar
    Top = 27
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
      HotImages = DmEmision.ilByN
      Images = DmEmision.ilColor
      inherited ToolButton4: TToolButton
        Enabled = False
      end
      inherited tbPropiedades: TToolButton
        Enabled = False
      end
      inherited ToolButton3: TToolButton
        Enabled = False
      end
      inherited tbLimpiar: TToolButton
        Enabled = False
      end
      inherited tbOrdenar: TToolButton
        Enabled = False
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Enabled = False
      end
      inherited ToolButton6: TToolButton
        Enabled = False
      end
      inherited ToolButton8: TToolButton
        Enabled = False
      end
      inherited tbMostrarFiltros: TToolButton
        Enabled = False
      end
      inherited tbMaxRegistros: TToolButton
        Enabled = False
      end
      inherited ToolButton11: TToolButton
        Enabled = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 56
    Width = 623
    Height = 398
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Name = 'Tahoma'
    TitleHeight = 30
    Columns = <
      item
        Expanded = False
        FieldName = 'PA_ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PA_IDSETEO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PA_DESCRIPCION'
        Title.Caption = 'Descripcion'
        Width = 202
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PA_TIPOPARAMETRO'
        Title.Caption = 'Tipo.Parametro'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PA_VALOR'
        Title.Caption = 'Valor'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PA_CLAVE'
        Title.Caption = 'Clave'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PA_IDCLASEPARAMETRO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PA_FECHAVIGENCIADESDE'
        Title.Caption = 'F.Vigencia Desde'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PA_FECHAVIGENCIAHASTA'
        Title.Caption = 'F.Vigencia Hasta'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PA_VALORHASTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PA_OBLIGATORIO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PA_USUALTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PA_FECHAALTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PA_USUMODIF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PA_FECHAMODIF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PA_USUBAJA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PA_FECHABAJA'
        Visible = False
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 28
    Top = 104
    Width = 549
    Height = 175
    inherited BevelAbm: TBevel
      Top = 139
      Width = 541
    end
    object lblDescripcion: TLabel [1]
      Left = 6
      Top = 40
      Width = 58
      Height = 13
      Caption = 'Descripci'#243'n:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblCodigo: TLabel [2]
      Left = 6
      Top = 16
      Width = 37
      Height = 13
      Caption = 'C'#243'digo:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblFechaVigenciaDesde: TLabel [3]
      Left = 6
      Top = 115
      Width = 86
      Height = 13
      Caption = 'F.Vigencia Desde:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblVigenciaHasta: TLabel [4]
      Left = 332
      Top = 114
      Width = 84
      Height = 13
      Caption = 'F.Vigencia Hasta:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    inherited btnAceptar: TButton
      Left = 391
      Top = 145
      Default = True
      TabOrder = 6
    end
    inherited btnCancelar: TButton
      Left = 469
      Top = 145
      TabOrder = 7
    end
    object edtDescripcionParametro: TEdit
      Left = 100
      Top = 37
      Width = 409
      Height = 21
      Hint = 'Descripci'#243'n del Par'#225'metro'
      CharCase = ecUpperCase
      Color = clWhite
      TabOrder = 1
    end
    object edtCodigoParametro: TEdit
      Left = 100
      Top = 13
      Width = 105
      Height = 21
      Hint = 'C'#243'digo'
      CharCase = ecUpperCase
      Color = clWhite
      TabOrder = 0
    end
    object edFechaVigenciaDesde: TDateComboBox
      Left = 99
      Top = 112
      Width = 88
      Height = 21
      Hint = 'Fecha de Comienzo de Aplicaci'#243'n de Vigencia del Valor'
      Weekends = [Sun, Sat]
      TabOrder = 3
    end
    object edFechaVigenciaHasta: TDateComboBox
      Left = 421
      Top = 111
      Width = 88
      Height = 21
      Hint = 'Fecha Fin de Vigencia del Valor'
      Weekends = [Sun, Sat]
      TabOrder = 4
    end
    object chkParametroObligatorio: TCheckBox
      Left = 11
      Top = 150
      Width = 161
      Height = 17
      Caption = 'Par'#225'metro Obligatorio'
      TabOrder = 5
    end
    inline fraParametro: TfraParametroValor
      Left = 6
      Top = 60
      Width = 539
      Height = 48
      TabOrder = 2
      inherited fraTipoDatoParametro: TfraCodigoDescripcionExt
        Left = 93
        Width = 412
        inherited cmbDescripcion: TArtComboBox
          Width = 347
        end
      end
    end
  end
  object sb: TStatusBar [4]
    Left = 0
    Top = 454
    Width = 623
    Height = 19
    Panels = <>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT '
      
        '       IPA.PA_ID, IPA.PA_IDSETEO, IPA.PA_DESCRIPCION, IPA.PA_TIP' +
        'OPARAMETRO,'
      
        '       IPA.PA_VALOR, IPA.PA_CLAVE, IPA.PA_USUALTA, IPA.PA_FECHAA' +
        'LTA,'
      
        '       IPA.PA_USUMODIF, IPA.PA_FECHAMODIF, IPA.PA_USUBAJA, IPA.P' +
        'A_FECHABAJA,'
      '       IPA.PA_IDCLASEPARAMETRO, IPA.PA_FECHAVIGENCIADESDE,'
      
        '       IPA.PA_FECHAVIGENCIAHASTA, IPA.PA_VALORHASTA, IPA.PA_OBLI' +
        'GATORIO'
      '  FROM EMI.IPA_PARAMETRO IPA'
      ' WHERE PA_SISTEMA = '#39'S'#39' '
      '   AND PA_IDCLASEPARAMETRO = :CLASEPARAMETRO'
      '  AND  PA_IDSETEO = emi.utiles.get_seteoactivo'
      '')
    Top = 324
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CLASEPARAMETRO'
        ParamType = ptInput
        Value = 1
      end>
  end
  inherited dsConsulta: TDataSource
    Top = 324
  end
  inherited SortDialog: TSortDialog
    Top = 352
  end
  inherited ExportDialog: TExportDialog
    Top = 352
  end
  inherited QueryPrint: TQueryPrint
    Top = 380
  end
  inherited Seguridad: TSeguridad
    Top = 296
  end
  inherited FormStorage: TFormStorage
    Top = 296
  end
  inherited PrintDialog: TPrintDialog
    Top = 380
  end
  inherited ShortCutControl: TShortCutControl
    Top = 296
  end
  inherited FieldHider: TFieldHider
    Top = 324
  end
  object sdqClaseParametro: TSDQuery
    SQL.Strings = (
      'select * from emi.icp_claseparametro where cp_sistema = '#39'S'#39)
    Left = 131
    Top = 352
  end
  object dsClaseParametro: TDataSource
    DataSet = sdqClaseParametro
    Left = 132
    Top = 379
  end
end
