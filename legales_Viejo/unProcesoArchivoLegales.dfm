inherited frmProcesoArchivoLegales: TfrmProcesoArchivoLegales
  Caption = 'Proceso Archivos Legales'
  ClientWidth = 998
  ExplicitWidth = 1006
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 998
    Height = 156
    ExplicitWidth = 998
    ExplicitHeight = 156
    inherited pcFiltrosBusqueda: TPageControl
      Width = 998
      Height = 156
      ExplicitWidth = 998
      ExplicitHeight = 156
      inherited TabSheet1: TTabSheet
        ExplicitWidth = 990
        ExplicitHeight = 128
        inherited lbCodigoErrorFiltro: TLabel
          Width = 112
          Caption = 'Codigo Error Exportado:'
          ExplicitWidth = 112
        end
        object Label3: TLabel [3]
          Left = 8
          Top = 81
          Width = 129
          Height = 13
          Caption = 'Codigo Error No Exportado:'
        end
        object Label6: TLabel [4]
          Left = 621
          Top = 80
          Width = 12
          Height = 13
          Caption = '    '
          Color = clMoneyGreen
          ParentColor = False
        end
        inherited cbResueltoFiltro: TCheckBox
          Top = 104
          ExplicitTop = 104
        end
        inherited cbSinResolverFiltro: TCheckBox
          Top = 104
          ExplicitTop = 104
        end
        inherited fraTipoArchivoFiltro: TfraCodigoDescripcion
          Left = 148
          ExplicitLeft = 148
        end
        inherited fraProcesoFiltro: TfraCodigoDescripcion
          Left = 148
          ExplicitLeft = 148
        end
        inherited fraCodigoErrorFiltro: TfraCodigoDescripcion
          Left = 148
          ExplicitLeft = 148
        end
        object cbExportado: TCheckBox
          Left = 515
          Top = 54
          Width = 101
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Exportado'
          TabOrder = 5
        end
        inline fraCodigoErrorNoExpFiltro: TfraCodigoDescripcion
          Left = 148
          Top = 76
          Width = 357
          Height = 23
          TabOrder = 6
          ExplicitLeft = 148
          ExplicitTop = 76
        end
        object cbNoExportado: TCheckBox
          Left = 514
          Top = 79
          Width = 101
          Height = 17
          Alignment = taLeftJustify
          Caption = 'No exportable'
          TabOrder = 7
        end
        object cbAceptados: TCheckBox
          Left = 290
          Top = 103
          Width = 101
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Aceptados'
          TabOrder = 8
        end
      end
      object Legales: TTabSheet
        Caption = 'Legales'
        ImageIndex = 1
        object lbExpedienteSrtFiltro: TLabel
          Left = 8
          Top = 6
          Width = 81
          Height = 13
          Caption = 'Expediente SRT:'
        end
        object lbNroCarpetaFiltro: TLabel
          Left = 8
          Top = 33
          Width = 60
          Height = 13
          Caption = 'Nro Carpeta:'
        end
        object lbNroSiniestroFiltro: TLabel
          Left = 8
          Top = 61
          Width = 63
          Height = 13
          Caption = 'Nro Siniestro:'
        end
        object Label1: TLabel
          Left = 179
          Top = 7
          Width = 5
          Height = 13
          Caption = '/'
        end
        object Label4: TLabel
          Left = 8
          Top = 82
          Width = 86
          Height = 13
          Caption = 'Expediente Export'
        end
        object Label5: TLabel
          Left = 8
          Top = 106
          Width = 92
          Height = 13
          Caption = 'Tipo de operaci'#243'n: '
        end
        inline fraNroCarpetaFiltro: TfraCodigoDescripcion
          Left = 100
          Top = 28
          Width = 597
          Height = 23
          TabOrder = 0
          ExplicitLeft = 100
          ExplicitTop = 28
          ExplicitWidth = 597
          inherited cmbDescripcion: TArtComboBox
            Width = 532
            ExplicitWidth = 532
          end
        end
        object edNroExpediente: TPatternEdit
          Left = 101
          Top = 3
          Width = 75
          Height = 21
          MaxLength = 10
          TabOrder = 1
          Pattern = 
            'abcdefghijklmn'#241'opqrstuvwxyzABCDEFGHIJKLMN'#209'OPQRSTUVWXYZ0123456789' +
            '-'
        end
        object edAnioExpediente: TPatternEdit
          Left = 190
          Top = 3
          Width = 30
          Height = 21
          MaxLength = 2
          TabOrder = 2
          Pattern = '0123456789'
        end
        object edSiniestro: TSinEdit
          Left = 102
          Top = 54
          Width = 100
          Height = 21
          TabOrder = 3
          ViewStyle = [etSiniestro, etOrden]
        end
        object edExpedienteExportFiltro: TPatternEdit
          Left = 102
          Top = 79
          Width = 269
          Height = 21
          TabOrder = 4
          Pattern = 
            'abcdefghijklmn'#241'opqrstuvwxyzABCDEFGHIJKLMN'#209'OPQRSTUVWXYZ0123456789' +
            '-/'
        end
        object cbAltaFiltro: TCheckBox
          Left = 106
          Top = 104
          Width = 52
          Height = 17
          Caption = 'Alta'
          TabOrder = 5
        end
        object cbModificacionFiltro: TCheckBox
          Left = 162
          Top = 103
          Width = 85
          Height = 17
          Caption = 'Modificaci'#243'n'
          TabOrder = 6
        end
        object cbBajaFiltro: TCheckBox
          Left = 258
          Top = 103
          Width = 52
          Height = 17
          Caption = 'Baja'
          TabOrder = 7
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 156
    Width = 998
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 992
      end>
    ExplicitTop = 156
    ExplicitWidth = 998
    inherited ToolBar: TToolBar
      Width = 985
      ExplicitWidth = 985
      object tbMarcarResuelto: TToolButton
        Left = 370
        Top = 0
        Hint = 'Marcar como resuelto'
        Caption = 'tbMarcarResuelto'
        ImageIndex = 13
        OnClick = tbMarcarResueltoClick
      end
      object tbSeleccionarTodos: TToolButton
        Left = 393
        Top = 0
        Hint = 'Seleccionar Todos'
        Caption = 'Seleccionar Todos'
        ImageIndex = 24
        OnClick = tbSeleccionarTodosClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 185
    Width = 998
    Height = 313
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    OnCellClick = GridCellClick
    OnDrawColumnCell = GridDrawColumnCell
    OnGetCellParams = GridGetCellParams
  end
  object pnMarcarComoResuelto: TFormPanel [3]
    Left = 148
    Top = 312
    Width = 423
    Height = 141
    Caption = 'Marcar Resoluci'#243'n'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    DesignSize = (
      423
      141)
    object lbObservacion: TLabel
      Left = 10
      Top = 39
      Width = 60
      Height = 13
      Caption = 'Observaci'#243'n'
    end
    object Label2: TLabel
      Left = 10
      Top = 15
      Width = 32
      Height = 13
      Caption = 'Motivo'
    end
    object btnAceptarMarcarComoResuelto: TButton
      Left = 266
      Top = 111
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarMarcarComoResueltoClick
    end
    object btnCancelarMarcarComoResuelto: TButton
      Left = 344
      Top = 111
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object edObservacion: TMemo
      Left = 80
      Top = 37
      Width = 337
      Height = 69
      MaxLength = 400
      TabOrder = 2
    end
    inline fraMotivoResolucionSRT: TfraCodigoDescripcion
      Left = 79
      Top = 10
      Width = 340
      Height = 23
      TabOrder = 3
      ExplicitLeft = 79
      ExplicitTop = 10
      ExplicitWidth = 340
      inherited cmbDescripcion: TArtComboBox
        Width = 275
        ExplicitWidth = 275
      end
    end
  end
  object Panel1: TPanel [4]
    Left = 0
    Top = 498
    Width = 998
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    DesignSize = (
      998
      29)
    object pnlBottom: TPanel
      Left = 2
      Top = 4
      Width = 994
      Height = 24
      Alignment = taLeftJustify
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvLowered
      TabOrder = 0
      object lbCantidad: TLabel
        Left = 7
        Top = 6
        Width = 5
        Height = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  inherited SortDialog: TSortDialog
    UseFieldIndex = True
  end
  object ShortCutControl1: TShortCutControl
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
    Left = 81
    Top = 256
  end
  object sdqModificacionRegistro: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      'SELECT *'
      'FROM ljg_juiciogestion, legales.ljt_juicioentramite'
      'WHERE jt_id = :jt_id'
      '  AND jt_id = jg_idjuicioentramite(+)')
    Left = 81
    Top = 284
    ParamData = <
      item
        DataType = ftInteger
        Name = 'jt_id'
        ParamType = ptInput
      end>
  end
  object sdqConsultaRegistro: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      'SELECT *'
      'FROM legales.ljt_juicioentramite'
      'WHERE jt_id = :jt_id')
    Left = 24
    Top = 312
    ParamData = <
      item
        DataType = ftInteger
        Name = 'jt_id'
        ParamType = ptInput
      end>
  end
end
