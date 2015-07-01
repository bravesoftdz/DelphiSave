inherited frmConsultaLicitacion: TfrmConsultaLicitacion
  Left = 211
  Top = 185
  Width = 800
  Height = 466
  Caption = 'Consulta de Licitaci'#243'n'
  Constraints.MinHeight = 466
  Constraints.MinWidth = 798
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 792
    Height = 112
    object Label7: TLabel
      Left = 8
      Top = 13
      Width = 67
      Height = 13
      Caption = 'Nro. Licitaci'#243'n'
    end
    object lbRSocial: TLabel
      Left = 162
      Top = 13
      Width = 60
      Height = 13
      Caption = 'Raz'#243'n Social'
    end
    object lbCUIT: TLabel
      Left = 665
      Top = 13
      Width = 24
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'CUIT'
    end
    object GroupBox1: TGroupBox
      Left = 11
      Top = 40
      Width = 214
      Height = 52
      Caption = ' Fecha de Notificaci'#243'n '
      TabOrder = 3
      object Label2: TLabel
        Left = 103
        Top = 24
        Width = 12
        Height = 10
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edFechaNotificacionDesde: TDateComboBox
        Left = 12
        Top = 20
        Width = 88
        Height = 21
        MaxDateCombo = edFechaNotificacionHasta
        TabOrder = 0
      end
      object edFechaNotificacionHasta: TDateComboBox
        Left = 118
        Top = 20
        Width = 88
        Height = 21
        MinDateCombo = edFechaNotificacionDesde
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 243
      Top = 40
      Width = 214
      Height = 52
      Caption = ' Fecha de Apertura '
      TabOrder = 4
      object Label1: TLabel
        Left = 103
        Top = 24
        Width = 12
        Height = 10
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edFechaAperturaDesde: TDateComboBox
        Left = 12
        Top = 20
        Width = 88
        Height = 21
        MaxDateCombo = edFechaAperturaHasta
        TabOrder = 0
      end
      object edFechaAperturaHasta: TDateComboBox
        Left = 118
        Top = 20
        Width = 88
        Height = 21
        MinDateCombo = edFechaAperturaDesde
        TabOrder = 1
      end
    end
    object edNumeroLicitacion: TCardinalEdit
      Left = 81
      Top = 8
      Width = 73
      Height = 21
      TabOrder = 0
    end
    object edRazonSocial: TEdit
      Left = 228
      Top = 8
      Width = 421
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 1
      Text = 'EDRAZONSOCIAL'
    end
    object mskCUIT: TMaskEdit
      Left = 696
      Top = 8
      Width = 81
      Height = 21
      Hint = 'CUIT de la Empresa'
      Anchors = [akTop, akRight]
      EditMask = '99-99999999-9;0;'
      MaxLength = 13
      TabOrder = 2
    end
  end
  inherited CoolBar: TCoolBar
    Top = 112
    Width = 792
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 788
      end>
    inherited ToolBar: TToolBar
      Width = 775
      inherited tbNuevo: TToolButton
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbModificar: TToolButton
        Enabled = True
        OnClick = tbModificarClick
      end
      inherited tbEliminar: TToolButton
        Enabled = True
        OnClick = tbEliminarClick
      end
      inherited tbPropiedades: TToolButton
        Enabled = False
      end
      inherited tbImprimir: TToolButton
        Hint = 'Imprimir'
        DropdownMenu = popupImprimir
        Style = tbsDropDown
      end
      inherited tbExportar: TToolButton
        Left = 254
      end
      inherited tbEnviarMail: TToolButton
        Left = 277
      end
      inherited ToolButton8: TToolButton
        Left = 300
        Visible = False
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 308
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Left = 331
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Left = 354
        Visible = False
      end
      inherited tbSalir: TToolButton
        Left = 362
        Visible = False
      end
      object ToolButton1: TToolButton
        Left = 385
        Top = 0
        Width = 8
        ImageIndex = 0
        ParentShowHint = False
        ShowHint = False
        Style = tbsSeparator
      end
      object tbAgenda: TToolButton
        Left = 393
        Top = 0
        Hint = 'Agenda'
        Caption = 'tbAgenda'
        ImageIndex = 26
        Visible = False
      end
      object ToolButton2: TToolButton
        Left = 416
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tblSALIR: TToolButton
        Left = 424
        Top = 0
        Hint = 'Salir'
        Caption = 'tblSALIR'
        ImageIndex = 5
        OnClick = tblSALIRClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 141
    Width = 792
    Height = 298
    TitleFont.Name = 'Tahoma'
    MultiSelect = True
    OnGetCellParams = GridGetCellParams
    TitleHeight = 34
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'LI_FECHANOTIFICACION'
        Title.Caption = 'Fecha Notificaci'#243'n'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LI_FECHAAPERTURA'
        Title.Caption = 'Fecha Apertura'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIT'
        Title.Caption = 'C.U.I.T.'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LI_RAZONSOCIAL'
        Title.Caption = 'Raz'#243'n Social'
        Width = 145
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LI_NROLICITACION'
        Title.Caption = 'N'#186' Licitaci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LI_CAPITAS'
        Title.Caption = 'Cantidad Capitas'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LI_MASA'
        Title.Caption = 'Masa Salarial'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EL_NOMBRE'
        Title.Caption = 'Delegaci'#243'n'
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTIVOALTA'
        Title.Caption = 'Motivo Alta'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'SA_TOTEMPLEADOS'
        Title.Caption = 'Total Empleados'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'SA_MASATOTAL'
        Title.Caption = 'Masa Salarial'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'AFILIACION.GET_CAMPOSFALTANTES(SA_ID)'
        Title.Caption = 'Faltan'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CA_CODIGO'
        Title.Caption = 'C'#243'digo Canal'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CA_DESCRIPCION'
        Title.Caption = 'Canal'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EN_CODBANCO'
        Title.Caption = 'C'#243'digo Entidad'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EN_NOMBRE'
        Title.Caption = 'Entidad'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'VE_VENDEDOR'
        Title.Caption = 'C'#243'digo Vendedor'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'VE_NOMBRE'
        Title.Caption = 'Vendedor'
        Visible = False
      end>
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      '')
    Left = 36
    Top = 314
  end
  inherited dsConsulta: TDataSource
    Left = 64
    Top = 314
  end
  inherited SortDialog: TSortDialog
    Left = 36
    Top = 342
  end
  inherited ExportDialog: TExportDialog
    Left = 64
    Top = 342
  end
  inherited QueryPrint: TQueryPrint
    Title.Text = 'Listado de Licitaciones'
    PageOrientation = pxLandscape
    PageSize = psLegal
    Left = 64
    Top = 370
  end
  inherited Seguridad: TSeguridad
    Left = 36
    Top = 286
  end
  inherited FormStorage: TFormStorage
    Left = 64
    Top = 286
  end
  inherited PrintDialog: TPrintDialog
    Left = 36
    Top = 370
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
      end
      item
        Key = 119
      end
      item
        Key = 116
        LinkControl = tbRefrescar
      end>
    Left = 92
    Top = 286
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
    Left = 92
    Top = 314
  end
  object popupImprimir: TPopupMenu
    Left = 92
    Top = 342
    object mnuImprimirListado: TMenuItem
      Caption = 'Listado'
      OnClick = mnuImprimirListadoClick
    end
    object mnuImprimirLicitacion: TMenuItem
      Caption = 'Licitaci'#243'n'
      OnClick = mnuImprimirLicitacionClick
    end
  end
end
