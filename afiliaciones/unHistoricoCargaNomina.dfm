inherited frmHistoricoCargaNomina: TfrmHistoricoCargaNomina
  Left = 254
  Top = 219
  Width = 696
  Height = 360
  Caption = 'Hist'#243'rico Carga N'#243'mina'
  Constraints.MinHeight = 280
  Constraints.MinWidth = 696
  OldCreateOrder = True
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 688
    Visible = False
  end
  inherited CoolBar: TCoolBar
    Width = 688
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 684
      end>
    inherited ToolBar: TToolBar
      Width = 671
      inherited ToolButton4: TToolButton
        Visible = True
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Agregar Observaci'#243'n'
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 688
    Height = 267
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DN_FECHARECEPCION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Recepci'#243'n'
        Width = 72
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'DN_CANTIDADREGISTROS'
        Title.Alignment = taCenter
        Title.Caption = 'Procesados'
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'DN_TOTALMASADSK'
        Title.Alignment = taCenter
        Title.Caption = 'Masa Archivo'
        Width = 75
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'DN_TOTALALTASDSK'
        Title.Alignment = taCenter
        Title.Caption = 'Altas Archivo'
        Width = 75
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'DN_TOTALMASAALTADSK'
        Title.Alignment = taCenter
        Title.Caption = 'Masa de Altas'
        Width = 86
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'DN_CANTIDADBAJADSK'
        Title.Alignment = taCenter
        Title.Caption = 'Bajas Archivo'
        Width = 84
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'DN_CANTIDADBAJABASE'
        Title.Alignment = taCenter
        Title.Caption = 'Masa de Bajas'
        Width = 94
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'DN_TOTALMASABASE'
        Title.Alignment = taCenter
        Title.Caption = 'Masa Potencial'
        Width = 95
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DN_FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Carga'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DN_PERIODO'
        Title.Alignment = taCenter
        Title.Caption = 'Per'#237'odo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DN_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'DN_CANTTRAB_AP'
        Title.Alignment = taRightJustify
        Title.Caption = 'Cant. Trabajadores Antes de Procesar'
        Width = 208
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'DN_CANTTRAB_DP'
        Title.Alignment = taRightJustify
        Title.Caption = 'Cant. Trabajadores Despues de Procesar'
        Width = 205
        Visible = True
      end>
  end
  object fpObservaciones: TFormPanel [3]
    Left = 152
    Top = 88
    Width = 320
    Height = 192
    Caption = 'Agregar Observaci'#243'n'
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnBeforeShow = fpObservacionesBeforeShow
    ActiveControl = edFechaRecepcion
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 100
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Fecha de Recepci'#243'n'
    end
    object Label2: TLabel
      Left = 8
      Top = 44
      Width = 100
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Per'#237'odo'
    end
    object Label3: TLabel
      Left = 8
      Top = 76
      Width = 100
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Observaciones'
    end
    object Bevel1: TBevel
      Left = 4
      Top = 152
      Width = 312
      Height = 8
      Shape = bsTopLine
    end
    object edFechaRecepcion: TDateEdit
      Left = 112
      Top = 8
      Width = 88
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
    end
    object edPeriodo: TPeriodoPicker
      Left = 112
      Top = 40
      Width = 49
      Height = 21
      TabOrder = 1
      Color = clWindow
      Periodo.AllowNull = False
      Periodo.Orden = poAnoMes
      Periodo.Separador = '/'
      Periodo.Mes = 5
      Periodo.Ano = 2007
      Periodo.Valor = '2007/05'
      Periodo.MaxPeriodo = '2057/05'
      Periodo.MinPeriodo = '1957/06'
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
    object memoObservaciobes: TMemo
      Left = 112
      Top = 72
      Width = 200
      Height = 72
      Lines.Strings = (
        '111'
        '222'
        '333'
        '444'
        '555'
        '666'
        '777')
      ScrollBars = ssVertical
      TabOrder = 2
    end
    object btnAceptar: TButton
      Left = 160
      Top = 160
      Width = 72
      Height = 25
      Caption = 'Aceptar'
      TabOrder = 3
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 240
      Top = 160
      Width = 72
      Height = 25
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 4
    end
  end
  inherited sdqConsulta: TSDQuery
    Top = 148
  end
  inherited dsConsulta: TDataSource
    Top = 148
  end
  inherited SortDialog: TSortDialog
    Top = 176
  end
  inherited ExportDialog: TExportDialog
    Top = 176
  end
  inherited QueryPrint: TQueryPrint
    Top = 204
  end
  inherited Seguridad: TSeguridad
    Top = 120
  end
  inherited FormStorage: TFormStorage
    Top = 120
  end
  inherited PrintDialog: TPrintDialog
    Top = 204
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
    Top = 120
  end
  inherited FieldHider: TFieldHider
    Top = 148
  end
end
