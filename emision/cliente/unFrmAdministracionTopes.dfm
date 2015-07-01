inherited FrmAdministracionTopes: TFrmAdministracionTopes
  Left = 170
  Top = 158
  Caption = ' Administraci'#243'n de Topes '
  Font.Charset = ANSI_CHARSET
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Height = 1
  end
  inherited CoolBar: TCoolBar
    Top = 1
    inherited ToolBar: TToolBar
      inherited tbEliminar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 30
    Height = 409
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Name = 'Tahoma'
    TitleHeight = 30
    Columns = <
      item
        Expanded = False
        FieldName = 'TM_ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TM_CODIGO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TM_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 262
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TM_PERIODOVIGENCIADESDE'
        Title.Caption = 'F. Vigencia Desde'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TM_PERIODOVIGENCIAHASTA'
        Title.Caption = 'F. Vigencia Hasta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TM_TOPEMINIMO'
        Title.Caption = 'Topea M'#237'nimo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TM_PERIODOVIGMINIMODESDE'
        Title.Caption = 'Vig. Desde M'#237'nimo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TM_PERIODOVIGMINIMOHASTA'
        Title.Caption = 'Vig. Hasta M'#237'nimo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TM_TOPEMAXIMO'
        Title.Caption = 'Topea M'#225'ximo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TM_PERIODOVIGMAXIMODESDE'
        Title.Caption = 'Vig. Desde M'#225'ximo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TM_PERIODOVIGMAXIMOHASTA'
        Title.Caption = 'Vig. Hasta M'#225'ximo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROCEDENCIADESC'
        Title.Caption = 'Procedencia'
        Width = 150
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 68
    Top = 92
    Width = 509
    Height = 217
    inherited BevelAbm: TBevel
      Top = 181
      Width = 501
    end
    object lblDescripcion: TLabel [1]
      Left = 18
      Top = 36
      Width = 54
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object lblCodigo: TLabel [2]
      Left = 19
      Top = 12
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object lblVencimientoEvento: TLabel [3]
      Left = 239
      Top = 60
      Width = 75
      Height = 13
      Caption = 'Fin de Vigencia:'
    end
    object lblFechaEvento: TLabel [4]
      Left = 16
      Top = 60
      Width = 86
      Height = 13
      Caption = 'Inicio de Vigencia:'
    end
    object lblPerVigenciaMinDesde: TLabel [5]
      Left = 17
      Top = 108
      Width = 94
      Height = 13
      Caption = 'Per'#237'odo Vig. Desde:'
    end
    object lblPerVigenciaMinHasta: TLabel [6]
      Left = 16
      Top = 131
      Width = 92
      Height = 13
      Caption = 'Per'#237'odo Vig. Hasta:'
    end
    object Label5: TLabel [7]
      Left = 238
      Top = 108
      Width = 94
      Height = 13
      Caption = 'Per'#237'odo Vig. Desde:'
    end
    object Label1: TLabel [8]
      Left = 238
      Top = 134
      Width = 92
      Height = 13
      Caption = 'Per'#237'odo Vig. Hasta:'
    end
    object Bevel1: TBevel [9]
      Left = 4
      Top = 83
      Width = 501
      Height = 2
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label2: TLabel [10]
      Left = 16
      Top = 155
      Width = 62
      Height = 13
      Caption = 'Procedencia:'
    end
    inherited btnAceptar: TButton
      Left = 351
      Top = 187
      TabOrder = 6
    end
    inherited btnCancelar: TButton
      Left = 429
      Top = 187
      TabOrder = 7
    end
    object edtCodigo: TPatternEdit
      Left = 105
      Top = 8
      Width = 55
      Height = 21
      TabOrder = 0
      Alignment = taRightJustify
      Pattern = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890_'
    end
    object edtDescripcion: TEdit
      Left = 105
      Top = 32
      Width = 317
      Height = 21
      TabOrder = 1
    end
    object chkTopeAlMinimo: TCheckBox
      Left = 14
      Top = 87
      Width = 117
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Topea el M'#237'nimo   '
      TabOrder = 4
    end
    object chkTopeAlMaximo: TCheckBox
      Left = 236
      Top = 87
      Width = 118
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Topea el M'#225'ximo'
      TabOrder = 5
    end
    object edPeriodoDesde: TPeriodoPicker
      Left = 105
      Top = 56
      Width = 49
      Height = 21
      TabOrder = 2
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = '/'
      Periodo.Mes = 0
      Periodo.Ano = 0
      Periodo.MaxPeriodo = '2055/08'
      Periodo.MinPeriodo = '1955/09'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = False
      Enabled = True
      Fuente.Charset = DEFAULT_CHARSET
      Fuente.Color = clWindowText
      Fuente.Height = -11
      Fuente.Name = 'MS Sans Serif'
      Fuente.Style = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NullDropDown = SetMax
    end
    object edPeriodoHasta: TPeriodoPicker
      Left = 320
      Top = 56
      Width = 49
      Height = 21
      TabOrder = 3
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = '/'
      Periodo.Mes = 0
      Periodo.Ano = 0
      Periodo.MaxPeriodo = '2055/08'
      Periodo.MinPeriodo = '1955/09'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = False
      Enabled = True
      Fuente.Charset = DEFAULT_CHARSET
      Fuente.Color = clWindowText
      Fuente.Height = -11
      Fuente.Name = 'MS Sans Serif'
      Fuente.Style = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NullDropDown = SetMax
    end
    object edPeriodoMinDesde: TPeriodoPicker
      Left = 118
      Top = 105
      Width = 49
      Height = 20
      TabOrder = 8
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 12
      Periodo.Ano = 2005
      Periodo.Valor = '200512'
      Periodo.MaxPeriodo = '205512'
      Periodo.MinPeriodo = '195512'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = False
      Enabled = True
      Fuente.Charset = DEFAULT_CHARSET
      Fuente.Color = clWindowText
      Fuente.Height = -11
      Fuente.Name = 'MS Sans Serif'
      Fuente.Style = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NullDropDown = SetMax
    end
    object edPeriodoMinHasta: TPeriodoPicker
      Left = 118
      Top = 128
      Width = 49
      Height = 20
      TabOrder = 9
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 12
      Periodo.Ano = 2005
      Periodo.Valor = '200512'
      Periodo.MaxPeriodo = '205512'
      Periodo.MinPeriodo = '195512'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = False
      Enabled = True
      Fuente.Charset = DEFAULT_CHARSET
      Fuente.Color = clWindowText
      Fuente.Height = -11
      Fuente.Name = 'MS Sans Serif'
      Fuente.Style = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NullDropDown = SetMax
    end
    object edPeriodoMaxDesde: TPeriodoPicker
      Left = 341
      Top = 105
      Width = 49
      Height = 20
      TabOrder = 10
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 12
      Periodo.Ano = 2005
      Periodo.Valor = '200512'
      Periodo.MaxPeriodo = '205511'
      Periodo.MinPeriodo = '195512'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = False
      Enabled = True
      Fuente.Charset = DEFAULT_CHARSET
      Fuente.Color = clWindowText
      Fuente.Height = -11
      Fuente.Name = 'MS Sans Serif'
      Fuente.Style = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NullDropDown = SetMax
    end
    object edPeriodoMaxHasta: TPeriodoPicker
      Left = 341
      Top = 128
      Width = 49
      Height = 20
      TabOrder = 11
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 12
      Periodo.Ano = 2005
      Periodo.Valor = '200512'
      Periodo.MaxPeriodo = '205512'
      Periodo.MinPeriodo = '195512'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = False
      Enabled = True
      Fuente.Charset = DEFAULT_CHARSET
      Fuente.Color = clWindowText
      Fuente.Height = -11
      Fuente.Name = 'MS Sans Serif'
      Fuente.Style = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NullDropDown = SetMax
    end
    object cmbProcedencia: TExComboBox
      Left = 117
      Top = 152
      Width = 274
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 12
      Items.Strings = (
        'T=Todas'
        'D=DDJJ'
        'S=Mi Simplificaci'#243'n')
      ItemIndex = -1
      Options = []
      ValueWidth = 64
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT '
      
        '       ITM.TM_ID, ITM.TM_DESCRIPCION, ITM.TM_PERIODOVIGENCIAHAST' +
        'A,'
      
        '       ITM.TM_PERIODOVIGENCIADESDE, ITM.TM_CODIGO, ITM.TM_TOPEMA' +
        'XIMO,'
      
        '       ITM.TM_TOPEMINIMO, TM_PERIODOVIGMINIMODESDE, TM_PERIODOVI' +
        'GMINIMOHASTA,'
      
        '       TM_PERIODOVIGMAXIMODESDE, TM_PERIODOVIGMAXIMOHASTA, TM_PR' +
        'OCEDENCIA,'
      
        '       DECODE(TM_PROCEDENCIA, '#39'T'#39', '#39'Todas'#39', '#39'S'#39', '#39'Mi Simplificac' +
        'i'#243'n'#39', '#39'D'#39', '#39'DDJJ'#39') PROCEDENCIADESC'
      '  FROM EMI.ITM_TOPEMASAS ITM'
      '')
  end
end
