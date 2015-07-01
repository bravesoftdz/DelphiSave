inherited frmConsultas: TfrmConsultas
  Left = 394
  Top = 251
  Width = 514
  Height = 425
  Caption = 'Visualizador'
  Font.Charset = ANSI_CHARSET
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 506
    Height = 53
    object lblConsulta: TLabel
      Left = 3
      Top = 6
      Width = 42
      Height = 13
      Caption = 'Consulta'
    end
    object lblEjecucion: TLabel
      Left = 3
      Top = 30
      Width = 49
      Height = 13
      Caption = 'Ejecuci'#243'n:'
    end
    object btnObservaciones: TSpeedButton
      Left = 464
      Top = 4
      Width = 21
      Height = 18
      Anchors = [akTop, akRight]
      Caption = '...'
      OnClick = btnObservacionesClick
    end
    inline fraConsulta: TfraCodigoDescripcion
      Left = 67
      Top = 2
      Width = 393
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Width = 328
      end
      inherited edCodigo: TPatternEdit
        OnExit = fraConsultaedCodigoExit
      end
    end
    object cboEjecuciones: TComboBox
      Left = 68
      Top = 27
      Width = 390
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 13
      TabOrder = 1
      OnChange = cboEjecucionesChange
      OnClick = cboEjecucionesClick
    end
  end
  inherited CoolBar: TCoolBar
    Top = 53
    Width = 506
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 502
      end>
    inherited ToolBar: TToolBar
      Width = 489
      inherited tbNuevo: TToolButton
        Hint = 'Ejecuta la consulta'
        Enabled = False
        ImageIndex = 32
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbEliminar: TToolButton
        Enabled = True
        Visible = True
        OnClick = tbEliminarClick
      end
      inherited ToolButton4: TToolButton
        Visible = True
      end
      inherited tbPropiedades: TToolButton
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbImprimir: TToolButton
        Enabled = True
      end
      inherited tbExportar: TToolButton
        Enabled = True
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      object tbSumatoria: TToolButton
        Left = 370
        Top = 0
        Caption = 'tbSumatoria'
        ImageIndex = 21
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 82
    Width = 506
    Height = 297
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'DUMMY'
        Title.Caption = '   '
        Width = 678
        Visible = True
      end>
  end
  object fpObservaciones: TFormPanel [3]
    Left = 80
    Top = 128
    Width = 425
    Height = 273
    FormWidth = 0
    FormHeigth = 0
    Position = poMainFormCenter
    object mObservaciones: TMemo
      Left = 8
      Top = 8
      Width = 409
      Height = 249
      TabOrder = 0
    end
  end
  object fpProceso: TFormPanel [4]
    Left = 48
    Top = 127
    Width = 417
    Height = 140
    Caption = 'Observaciones'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsDialog
    Position = poMainFormCenter
    OnClose = fpProcesoClose
    DesignSize = (
      417
      140)
    object Bevel1: TBevel
      Left = 7
      Top = 102
      Width = 406
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
    end
    object lblObservaciones: TLabel
      Left = 13
      Top = 8
      Width = 75
      Height = 13
      Anchors = [akTop]
      Caption = 'Observaciones:'
    end
    object bvObservacion1: TBevel
      Left = 8
      Top = 102
      Width = 406
      Height = 2
      Anchors = [akLeft, akTop, akRight]
    end
    object btnAceptar: TButton
      Left = 256
      Top = 109
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Aceptar'
      ModalResult = 1
      TabOrder = 0
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 336
      Top = 109
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelarClick
    end
    object mObservacionEjecucion: TMemo
      Left = 8
      Top = 24
      Width = 403
      Height = 73
      TabOrder = 2
    end
  end
  object sb: TStatusBar [5]
    Left = 0
    Top = 379
    Width = 506
    Height = 19
    Panels = <
      item
        Width = 50
      end>
    Visible = False
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'select '#39'   '#39' from dual')
  end
  inherited SortDialog: TSortDialog
    SortFields = <
      item
        FieldIndex = 0
      end>
  end
  inherited ExportDialog: TExportDialog
    DataSet = sdqConsultaExportacion
  end
  inherited QueryPrint: TQueryPrint
    Border.Lines = [blBottom]
    Headers.Color = 11184810
    Headers.Font.Color = clWhite
    Detail.Color = 14737632
    Detail.GridLines = []
    Totals.Color = 14079702
    SubTotals.Color = 12961221
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
  object sdqConsultaExportacion: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    Left = 184
    Top = 228
  end
end
