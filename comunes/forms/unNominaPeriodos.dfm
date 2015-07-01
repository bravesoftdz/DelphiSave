inherited frmNominaPeriodos: TfrmNominaPeriodos
  Left = 178
  Top = 159
  Width = 666
  Height = 381
  BorderIcons = [biSystemMenu]
  Caption = 'N'#243'mina por per'#237'odos - NOMBRE DE LA EMPRESA'
  Constraints.MinHeight = 344
  Constraints.MinWidth = 300
  Font.Name = 'Tahoma'
  FormStyle = fsNormal
  KeyPreview = True
  OldCreateOrder = True
  Position = poOwnerFormCenter
  Visible = False
  OnKeyDown = FSFormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 658
    Height = 6
    Visible = False
  end
  inherited CoolBar: TCoolBar
    Top = 6
    Width = 658
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 654
      end>
    inherited ToolBar: TToolBar
      Width = 641
      inherited tbRefrescar: TToolButton
        Visible = False
      end
      inherited tbModificar: TToolButton
        Enabled = True
      end
      inherited tbEliminar: TToolButton
        Enabled = True
      end
      inherited ToolButton3: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = False
      end
      inherited tbImprimir: TToolButton
        Enabled = True
      end
      inherited tbExportar: TToolButton
        Enabled = True
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbSumatoria: TToolButton
        Left = 370
        Top = 0
        Hint = 'Sumatoria'
        Caption = 'tbSumatoria'
        ImageIndex = 37
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton1: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 8
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 401
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        Caption = 'tbSalir2'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
      object tbAnterior: TToolButton
        Left = 424
        Top = 0
        Hint = 'Per'#237'odo anterior (Ctrl -)'
        Caption = 'tbAnterior'
        ImageIndex = 34
        OnClick = tbAnteriorClick
      end
      object edPeriodo: TPeriodoPicker
        Left = 447
        Top = 0
        Width = 72
        Height = 22
        OnExit = edPeriodoExit
        TabOrder = 0
        Color = clWindow
        Periodo.AllowNull = False
        Periodo.Orden = poAnoMes
        Periodo.Separador = #0
        Periodo.Mes = 3
        Periodo.Ano = 1958
        Periodo.Valor = '195803'
        Periodo.MaxPeriodo = '205310'
        Periodo.MinPeriodo = '195310'
        WidthMes = 19
        Separation = 0
        ShowButton = True
        ShowOrder = poAnoMes
        ReadOnly = False
        Enabled = True
        Fuente.Charset = DEFAULT_CHARSET
        Fuente.Color = clWindowText
        Fuente.Height = -11
        Fuente.Name = 'Tahoma'
        Fuente.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        NullDropDown = SetMax
        AutoExit = True
      end
      object tbSiguiente: TToolButton
        Left = 519
        Top = 0
        Hint = 'Per'#237'odo siguiente (Ctrl +)'
        Caption = 'tbSiguiente'
        ImageIndex = 35
        OnClick = tbSiguienteClick
      end
      object pnlOrigen: TPanel
        Left = 542
        Top = 0
        Width = 52
        Height = 22
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'Diskette'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 35
    Width = 658
    Height = 298
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    AutoTitleHeight = True
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NR_CUIL'
        Title.Alignment = taCenter
        Title.Caption = 'C.U.I.L.'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_NOMBRE'
        Title.Caption = 'Apellido | Nombre'
        Width = 359
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_REMIMSS'
        Title.Alignment = taCenter
        Title.Caption = 'Base'
        Width = 72
        Visible = True
      end>
  end
  object pnlBottom: TPanel [3]
    Left = 0
    Top = 333
    Width = 658
    Height = 21
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 3
    object pnlTotalRegistros: TPanel
      Left = 1
      Top = 1
      Width = 182
      Height = 19
      Align = alLeft
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = '     Cantidad de Registros'
      TabOrder = 0
      Visible = False
      DesignSize = (
        182
        19)
      object edTotalRegistros: TCardinalEdit
        Left = 126
        Top = 0
        Width = 53
        Height = 19
        TabStop = False
        Anchors = [akTop, akRight]
        BorderStyle = bsNone
        Color = clBtnFace
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    Left = 20
    Top = 112
  end
  inherited dsConsulta: TDataSource
    Left = 48
    Top = 112
  end
  inherited SortDialog: TSortDialog
    SortFields = <
      item
        Title = 'C.U.I.L.'
        DataField = 'NR_CUIL'
        FieldIndex = 0
      end
      item
        Title = 'Apellido | Nombre'
        DataField = 'TJ_NOMBRE'
        FieldIndex = 0
      end
      item
        Title = 'Base'
        DataField = 'NR_REMIMSS'
        FieldIndex = 0
      end>
    Left = 20
    Top = 140
  end
  inherited ExportDialog: TExportDialog
    Left = 48
    Top = 140
  end
  inherited QueryPrint: TQueryPrint
    Left = 48
    Top = 168
  end
  inherited Seguridad: TSeguridad
    AutoEjecutar = True
    DBLogin = frmPrincipal.DBLogin
    Left = 20
    Top = 84
  end
  inherited FormStorage: TFormStorage
    Left = 48
    Top = 84
  end
  inherited PrintDialog: TPrintDialog
    Left = 20
    Top = 168
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
        LinkControl = tbSalir2
      end>
    Left = 76
    Top = 84
  end
  inherited FieldHider: TFieldHider
    Left = 76
    Top = 112
  end
end
