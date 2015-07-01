inherited frmConsEstTipPeriodoClick: TfrmConsEstTipPeriodoClick
  Left = 228
  Top = 174
  Caption = 'Consulta de Estudios por Periodo y Tipo'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Height = 42
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 129
      Height = 40
      Caption = 'Periodo'
      TabOrder = 0
      object Label1: TLabel
        Left = 59
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edPeriodoDesde: TPeriodoPicker
        Left = 6
        Top = 14
        Width = 49
        Height = 21
        TabOrder = 0
        TabStop = True
        Color = clWindow
        Periodo.AllowNull = True
        Periodo.Orden = poAnoMes
        Periodo.Separador = '/'
        Periodo.Mes = 0
        Periodo.Ano = 0
        Periodo.MaxPeriodo = '2052/08'
        Periodo.MinPeriodo = '1996/01'
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
        Left = 74
        Top = 14
        Width = 49
        Height = 21
        TabOrder = 1
        TabStop = True
        Color = clWindow
        Periodo.AllowNull = True
        Periodo.Orden = poAnoMes
        Periodo.Separador = '/'
        Periodo.Mes = 0
        Periodo.Ano = 0
        Periodo.MaxPeriodo = '2052/08'
        Periodo.MinPeriodo = '1996/01'
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
    end
    object GroupBox2: TGroupBox
      Left = 132
      Top = 0
      Width = 310
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Tipo'
      TabOrder = 1
      DesignSize = (
        310
        41)
      object cmbTipos: TDBCheckCombo
        Left = 4
        Top = 14
        Width = 301
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DataSource = dsTipos
        KeyField = 'TB_CODIGO'
        ListField = 'TB_DESCRIPCION'
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 42
    inherited ToolBar: TToolBar
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      inherited tbRefrescar: TToolButton
        ImageIndex = 6
        Visible = False
      end
      inherited tbNuevo: TToolButton
        ImageIndex = 0
        Visible = True
      end
      inherited tbModificar: TToolButton
        ImageIndex = 1
        Visible = True
      end
      inherited tbEliminar: TToolButton
        ImageIndex = 2
        Visible = True
      end
      inherited tbPropiedades: TToolButton
        ImageIndex = 16
      end
      inherited tbLimpiar: TToolButton
        ImageIndex = 5
      end
      inherited tbOrdenar: TToolButton
        ImageIndex = 7
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        ImageIndex = 27
      end
      inherited tbImprimir: TToolButton
        ImageIndex = 9
      end
      inherited ToolButton8: TToolButton
        Visible = False
      end
      inherited tbMostrarFiltros: TToolButton
        ImageIndex = 18
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        ImageIndex = 20
        Visible = False
      end
      inherited tbSalir: TToolButton
        ImageIndex = 10
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 71
    Height = 246
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end>
  end
  object sdqTipos: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      'SELECT TB_CODIGO, TB_DESCRIPCION'
      ' FROM CTB_TABLAS'
      'WHERE TB_CLAVE = '#39'TAMP'#39
      '  AND TB_CLAVE <> '#39'0'#39
      '  AND TB_BAJA <> '#39'S'#39
      'ORDER BY TB_DESCRIPCION')
    Left = 208
    Top = 8
  end
  object dsTipos: TDataSource
    DataSet = sdqTipos
    Left = 236
    Top = 8
  end
end
