object fraNominas: TfraNominas
  Left = 0
  Top = 0
  Width = 427
  Height = 545
  TabOrder = 0
  DesignSize = (
    427
    545)
  object lblTipoFormularioMultiperiodo: TLabel
    Left = 13
    Top = 29
    Width = 75
    Height = 13
    Caption = 'Tipo Formulario:'
  end
  object lblPeriodosSolicitud: TLabel
    Left = 15
    Top = 49
    Width = 46
    Height = 13
    Caption = 'Per'#237'odos:'
  end
  object lblHastaPeriodos: TLabel
    Left = 146
    Top = 51
    Width = 12
    Height = 13
    Caption = '>>'
  end
  object lblVerificacion: TLabel
    Left = 248
    Top = 52
    Width = 66
    Height = 13
    Caption = 'Verificaciones'
  end
  object lblEstado: TLabel
    Left = 339
    Top = 52
    Width = 51
    Height = 13
    Caption = 'Sin Estado'
    Visible = False
  end
  object lblClase: TLabel
    Left = 13
    Top = 6
    Width = 80
    Height = 13
    Caption = 'Desc.Clase Dev:'
  end
  object pcDatosCargar: TJvPageControl
    Left = 0
    Top = 87
    Width = 428
    Height = 458
    ActivePage = tbFormSituacionFacturacion
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 6
    TabPosition = tpBottom
    HideAllTabs = True
    object tb931: TTabSheet
      Caption = 'tb931'
      inline fraForm931: TfraForm931
        Left = 0
        Top = 0
        Width = 420
        Height = 166
        Align = alTop
        TabOrder = 0
        inherited lblNotaRelac: TLabel
          OnClick = nil
        end
        inherited gbTicket: TGroupBox
          Top = 116
          Width = 420
        end
      end
    end
    object tb165_170: TTabSheet
      Caption = 'tb165_170'
      ImageIndex = 1
      inline fraForm165_170: TfraForm165_170
        Left = 0
        Top = 0
        Width = 420
        Height = 281
        Align = alTop
        TabOrder = 0
        inherited gbDetalle: TGroupBox
          Width = 420
          inherited fraCondicion: TfraStaticCodigoDescripcion
            inherited cmbDescripcion: TComboGrid
              Cells = (
                'C'#243'digo'
                'Descripci'#243'n'
                'Id'
                'Fecha de Baja')
              ColWidths = (
                40
                300
                -1
                -1)
            end
          end
          inherited dbgDetalleCUIL: TRxDBGrid
            Width = 407
          end
        end
      end
    end
    object tb900_926: TTabSheet
      Caption = 'tb900_926'
      ImageIndex = 2
      inline fraForm900_926: TfraForm900_926
        Left = 0
        Top = 0
        Width = 420
        Height = 246
        Align = alTop
        TabOrder = 0
        inherited gbDetalle: TGroupBox
          Width = 420
          inherited lblSumEmpleHojas: TLabel
            Width = 59
            Caption = 'Total. Empl.:'
          end
          inherited lblSumMasaSalHojas: TLabel
            Left = 131
          end
          inherited lblSumCantHojas: TLabel
            Left = 287
          end
          inherited dbgDetalleHoja: TDBGrid
            Width = 400
          end
          inherited edSumMasaSalHojas: TCurrencyEdit
            Left = 210
          end
          inherited edSumCantHojas: TCurrencyEdit
            Left = 348
          end
          inherited edSumEmpleHojas: TIntEdit
            Left = 69
          end
        end
        inherited cdsDetalleHoja: TClientDataSet
          Left = 343
        end
        inherited dsDetalleHoja: TDataSource
          Left = 375
        end
      end
    end
    object tb905: TTabSheet
      Caption = 'tb905'
      ImageIndex = 3
      inline fraForm905: TfraForm905
        Left = 0
        Top = 0
        Width = 428
        Height = 57
        TabOrder = 0
      end
    end
    object tb929_569_593: TTabSheet
      Caption = 'tb929_569_593'
      ImageIndex = 4
      inline fraForm929_569_593: TfraForm929_569_593
        Left = 0
        Top = 0
        Width = 428
        Height = 41
        TabOrder = 0
      end
    end
    object tbNota: TTabSheet
      Caption = 'tbNota'
      ImageIndex = 5
      inline fraFormNota: TfraFormNota
        Left = 0
        Top = 0
        Width = 420
        Height = 310
        Align = alTop
        TabOrder = 0
        inherited edNota: TMemo
          Width = 405
        end
        inherited dbgDetalleRespuesta: TRxDBGrid
          Width = 405
        end
        inherited fpAltaRespuesta: TFormPanel
          inherited gbRespuesta: TJvgGroupBox
            FullHeight = 59
          end
        end
        inherited edRespuesta: TDBMemo
          Width = 407
        end
      end
    end
    object tb924_902: TTabSheet
      Caption = 'tb924_902'
      ImageIndex = 6
      inline fraForm924_902: TfraForm924_902
        Left = 0
        Top = 0
        Width = 420
        Height = 96
        Align = alTop
        TabOrder = 0
        inherited chkConTicket: TCheckBox
          Top = 33
        end
        inherited chkConResumen: TCheckBox
          Top = 33
        end
        inherited gbResumen: TGroupBox
          Width = 420
        end
      end
    end
    object tbResMonoTribSol: TTabSheet
      Caption = 'tbResMonoTribSol'
      ImageIndex = 7
      inline fraFormMonoSol: TfraFormMonoSol
        Left = 0
        Top = 0
        Width = 420
        Height = 89
        Align = alTop
        TabOrder = 0
      end
    end
    object tbNoSuss_NoSussCopia: TTabSheet
      Caption = 'tbNoSuss_NoSussCopia'
      ImageIndex = 14
      inline fraFormNoSuss_NoSussCopia: TfraFormNoSuss_NoSussCopia
        Left = 0
        Top = 0
        Width = 420
        Height = 183
        Align = alTop
        TabOrder = 0
        inherited edObservacion: TMemo
          Width = 404
        end
        inherited gbNotaRelacionada: TGroupBox
          Width = 420
        end
      end
    end
    object tbNada: TTabSheet
      Caption = 'tbNada'
      ImageIndex = 8
    end
    object tb921: TTabSheet
      Caption = 'tb921'
      ImageIndex = 9
      inline fraForm921: TfraForm921
        Left = 0
        Top = 0
        Width = 420
        Height = 89
        Align = alTop
        TabOrder = 0
      end
    end
    object tbPagos: TTabSheet
      Caption = 'tbPagos'
      ImageIndex = 10
      inline fraFormPagos: TfraFormPagos
        Left = 0
        Top = 0
        Width = 420
        Height = 231
        Align = alTop
        TabOrder = 0
        inherited gbDetalle: TGroupBox
          Width = 420
          inherited fraCondicion: TfraStaticCodigoDescripcion
            inherited cmbDescripcion: TComboGrid
              Width = 230
              Cells = (
                'C'#243'digo'
                'Descripci'#243'n'
                'Id'
                'Fecha de Baja')
              ColWidths = (
                40
                300
                -1
                -1)
            end
          end
          inherited dbgDetalleCUIL: TRxDBGrid
            Width = 407
          end
        end
      end
    end
    object tbInfMixta931_170: TTabSheet
      Caption = 'tbInfMixta931_170'
      ImageIndex = 11
      inline fraFormMixta931_170: TfraFormMixta931_170
        Left = 0
        Top = 0
        Width = 420
        Height = 430
        Align = alTop
        TabOrder = 0
        inherited gbfrm931: TGroupBox
          Width = 404
          inherited fraForm931: TfraForm931
            Width = 400
            inherited gbTicket: TGroupBox
              Top = 116
            end
          end
        end
        inherited gbfrm170: TGroupBox
          Width = 404
          inherited fraForm170: TfraForm165_170
            inherited gbDetalle: TGroupBox
              inherited fraCondicion: TfraStaticCodigoDescripcion
                inherited cmbDescripcion: TComboGrid
                  Width = 192
                  Cells = (
                    'C'#243'digo'
                    'Descripci'#243'n'
                    'Id'
                    'Fecha de Baja')
                  ColWidths = (
                    40
                    300
                    -1
                    -1)
                end
              end
            end
          end
        end
        inherited gbTotalMixta: TGroupBox
          Width = 404
        end
      end
    end
    object tbTicketPresentacion: TTabSheet
      Caption = 'tbTicketPresentacion'
      ImageIndex = 12
      inline FraFormTicketPresentacion: TFraFormTicketPresentacion
        Left = 0
        Top = 0
        Width = 420
        Height = 97
        Align = alTop
        TabOrder = 0
        inherited gbNotaRelacionada: TGroupBox
          Top = 53
          Width = 420
        end
      end
    end
    object tbRCompl924_902: TTabSheet
      Caption = 'tbRCompl924_902'
      ImageIndex = 13
      inline fraFormRCompl924_902: TfraFormRCompl924_902
        Left = 0
        Top = 0
        Width = 420
        Height = 65
        Align = alTop
        TabOrder = 0
      end
    end
    object tbConstMonoTrib: TTabSheet
      Caption = 'tbConstMonoTrib'
      ImageIndex = 15
      inline fraFormConstMono: TfraFormConstMono
        Left = 0
        Top = 0
        Width = 420
        Height = 43
        Align = alTop
        TabOrder = 0
      end
    end
    object tbConstInscrEmpl: TTabSheet
      Caption = 'tbConstInscrEmpl'
      ImageIndex = 16
      inline fraFormConstInscrEmpl: TfraFormConstInscrEmpl
        Left = 0
        Top = 0
        Width = 420
        Height = 49
        Align = alTop
        TabOrder = 0
      end
    end
    object tbFormEscuelas: TTabSheet
      Caption = 'tbFormEscuelas'
      ImageIndex = 17
      inline fraFormEscuelas: TfraFormEscuelas
        Left = 0
        Top = 0
        Width = 420
        Height = 311
        Align = alTop
        TabOrder = 0
        inherited gbDetalle: TGroupBox
          Width = 420
          inherited dbgRegistros: TDBGrid
            Width = 408
          end
          inherited edTextoGestion: TMemo
            Width = 407
          end
        end
        inherited tbComandosDetalle900_926: TToolBar
          Left = 341
          ButtonHeight = 23
        end
        inherited edArchivo: TEdit
          Width = 331
        end
      end
    end
    object tbAdicionarResumen: TTabSheet
      Caption = 'tbAdicionarResumen'
      ImageIndex = 18
      inline fraFormAdicionarResumen: TfraFormAdicionarResumen
        Left = 0
        Top = 0
        Width = 420
        Height = 50
        Align = alTop
        TabOrder = 0
        inherited lblFechaPresentacion: TLabel
          Left = 5
        end
        inherited lblEmpleados: TLabel
          Left = 5
        end
      end
    end
    object tbAdicionarDetalle: TTabSheet
      Caption = 'tbAdicionarDetalle'
      ImageIndex = 19
      inline fraFormAdicionarDetalle: TfraFormAdicionarDetalle
        Left = 0
        Top = 0
        Width = 420
        Height = 273
        Align = alTop
        TabOrder = 0
        inherited gbDetalle: TGroupBox
          Width = 420
          inherited dbgRegistros: TDBGrid
            Width = 409
          end
        end
        inherited tbComandosDetalleAdicDetalle: TToolBar
          Left = 320
        end
        inherited edArchivo: TEdit
          Width = 310
        end
      end
    end
    object tbFormWeb: TTabSheet
      Caption = 'tbFormWeb'
      ImageIndex = 20
      inline fraFormWebDetalleRNS: TfraFormWebDetalleRNS
        Left = 0
        Top = 0
        Width = 420
        Height = 273
        Align = alTop
        TabOrder = 0
        inherited gbDetalle: TGroupBox
          Width = 420
          inherited dbgRegistros: TDBGrid
            Width = 409
          end
        end
        inherited tbComandosDetalleAdicDetalle: TToolBar
          Left = 372
        end
        inherited edNroTransaccion: TEdit
          Width = 121
        end
      end
    end
    object tbFormSituacionFacturacion: TTabSheet
      Caption = 'tbFormSituacionFacturacion'
      ImageIndex = 21
      inline FraFormSitFacturacion: TFraFormSitFacturacion
        Left = 0
        Top = 0
        Width = 420
        Height = 34
        Align = alTop
        TabOrder = 0
      end
    end
  end
  object ppPeriodoDesde: TPeriodoPicker
    Left = 94
    Top = 48
    Width = 49
    Height = 21
    TabOrder = 2
    Color = clWindow
    Periodo.AllowNull = True
    Periodo.Orden = poAnoMes
    Periodo.Separador = #0
    Periodo.Mes = 0
    Periodo.Ano = 0
    Periodo.MaxPeriodo = '205506'
    Periodo.MinPeriodo = '195506'
    WidthMes = 19
    Separation = 0
    ShowButton = False
    ShowOrder = poAnoMes
    ReadOnly = False
    Enabled = True
    OnChange = ppPeriodosChange
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
  object ppPeriodoHasta: TPeriodoPicker
    Left = 161
    Top = 48
    Width = 49
    Height = 21
    TabOrder = 3
    Color = clWindow
    Periodo.AllowNull = True
    Periodo.Orden = poAnoMes
    Periodo.Separador = #0
    Periodo.Mes = 0
    Periodo.Ano = 0
    Periodo.MaxPeriodo = '205506'
    Periodo.MinPeriodo = '195506'
    WidthMes = 19
    Separation = 0
    ShowButton = False
    ShowOrder = poAnoMes
    ReadOnly = False
    Enabled = True
    OnChange = ppPeriodosChange
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
  object tbComandosObservacion: TToolBar
    Left = 218
    Top = 44
    Width = 28
    Height = 28
    Align = alNone
    BorderWidth = 1
    Caption = 'ToolBar'
    EdgeBorders = []
    HotImages = DmEmision.ilByN
    Images = DmEmision.ilColor
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    object tbAddVerificacion: TToolButton
      Left = 0
      Top = 2
      Hint = 'Observaciones'
      ImageIndex = 23
    end
  end
  object pnlColorEstado: TPanel
    Left = 319
    Top = 50
    Width = 16
    Height = 16
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 7
    Visible = False
  end
  inline fraTipoFormulario: TfraCodigoDescripcionExt
    Left = 93
    Top = 24
    Width = 300
    Height = 23
    TabOrder = 1
    inherited cmbDescripcion: TArtComboBox
      Width = 235
      OnKeyDown = fraTipoFormularioedCodigoKeyDown
    end
  end
  object cbIlegible: TCheckBox
    Left = 14
    Top = 69
    Width = 93
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Ilegible'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 5
  end
  object edClase: TEdit
    Left = 94
    Top = 2
    Width = 297
    Height = 21
    Color = clInactiveCaptionText
    Enabled = False
    TabOrder = 0
  end
end
