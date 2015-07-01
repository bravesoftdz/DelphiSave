inherited frmAdministracionEventosCOBRANZAS: TfrmAdministracionEventosCOBRANZAS
  Left = 204
  Top = 110
  Height = 565
  PixelsPerInch = 96
  TextHeight = 13
  inherited splBottom: TJvgSplitter
    Top = 455
  end
  inherited pnlBottom: TPanel
    Top = 461
    inherited gbDatosEvento: TJvgGroupBox
      FullHeight = 79
    end
  end
  inherited CoolBar: TCoolBar
    Top = 325
    inherited ToolBar: TToolBar
      inherited tbRefrescar: TToolButton
        Visible = False
      end
      inherited ToolButton5: TToolButton
        Visible = False
      end
    end
  end
  inherited gbFiltrosEmpresa: TJvgGroupBox
    Top = 269
    Height = 56
    TabOrder = 3
    GroupIndex = 12
    FullHeight = 59
    inherited fraFiltroEmpresa: TfraEmpresa
      Width = 755
      inherited lbContrato: TLabel
        Left = 651
      end
      inherited edContrato: TIntEdit
        Left = 698
      end
      inherited cmbRSocial: TArtComboBox
        Width = 516
      end
    end
  end
  inherited gbFiltrosUsuarios: TJvgGroupBox
    Top = 210
    TabOrder = 5
    FullHeight = 59
  end
  inherited Grid: TArtDBGrid
    Top = 354
    Height = 101
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    Columns = <
      item
        Expanded = False
        FieldName = 'IDEVENTO'
        Title.Caption = 'Evento'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUBEVENTO'
        Title.Caption = 'SubEvento'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'RELLAMADAS'
        Title.Caption = 'Rellamadas'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EVENTO'
        Title.Caption = 'Descr. Evento'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUREALIZADO'
        Title.Caption = 'Realiz'#243
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NOMBREUSUREALIZADO'
        Title.Caption = 'Realiz'#243
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA'
        Title.Caption = 'Fecha'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_SECTORINVOLUCRADO'
        Title.Caption = 'Sector'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'HORA'
        Title.Caption = 'Hora'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_IDCODIGOINGRESO'
        Title.Caption = 'C'#243'd. Ingreso'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'SECTORSOLICITANTE'
        Title.Caption = 'Sector solicitante'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERSONALSOLICITANTE'
        Title.Caption = 'Usuario solicitante'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INGRESO'
        Title.Caption = 'Ingreso'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MOTIVO'
        Title.Caption = 'Motivo'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SECTORINTERVINIENTE'
        Title.Caption = 'Sector interviniente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRIORIDAD'
        Title.Caption = 'Prioridad'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'SE_FECHACOMPROMETIDA'
        Title.Caption = 'Fecha Comprometida'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_FECHAREALIZADO'
        Title.Caption = 'Fecha Realizaci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RESPUESTA'
        Title.Caption = 'Observaciones Realizado'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 146
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRRESPUESTA'
        Title.Caption = 'Respuesta'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRATO'
        Title.Caption = 'Contrato'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPRESA'
        Title.Caption = 'Empresa'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUITEMPRESA'
        Title.Caption = 'CUIT Empresa'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'SITUACIONEMPRESA'
        Title.Caption = 'Situaci'#243'n de la empresa'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'GENERAL'
        Title.Caption = 'General'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'USUALTA'
        Title.Caption = 'Usuario de Alta'
        Width = 61
        Visible = True
      end>
  end
  inherited pnlFiltros: TPanel
    Height = 148
    inherited gbFiltrosEventos: TJvgGroupBox
      Height = 148
      Caption = ' Evento '
      GroupIndex = 10
      FullHeight = 148
      inherited pnlLeft: TPanel
        Height = 129
      end
      inherited pnlRight: TPanel
        Height = 129
      end
      inherited pnlMiddle: TPanel
        Height = 129
      end
    end
  end
  inherited gbFiltrosEventosAdicionales: TJvgGroupBox
    Top = 148
    Height = 62
    TabOrder = 4
    OnClick = gbFiltrosEventosAdicionalesClick
    GroupIndex = 11
    FullHeight = 59
    inherited Labelx2: TLabel
      Left = 232
      Top = 70
      Color = clRed
      ParentColor = False
    end
    object Label32: TLabel [4]
      Left = 235
      Top = 19
      Width = 51
      Height = 13
      Caption = 'Respuesta'
    end
    inherited fraSE_IDCODIGOINGRESO: TfraCodDesc
      Left = 229
      Top = 81
      Color = clRed
      ParentColor = False
      TabOrder = 2
      inherited Propiedades: TPropiedadesFrame
        ExtraCondition = ''
      end
    end
    inherited fraSE_IDMOTIVOEVENTO: TfraCodDesc
      Width = 299
      TabOrder = 3
      inherited cmbDescripcion: TArtComboBox
        Width = 234
      end
    end
    inline fraSE_IDRESPUESTA: TfraCodDesc
      Left = 232
      Top = 32
      Width = 226
      Height = 23
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Width = 161
        Height = 22
      end
      inherited Propiedades: TPropiedadesFrame
        CodigoType = ctInteger
        FieldBaja = 'RR_FECHABAJA'
        FieldCodigo = 'RR_ID'
        FieldDesc = 'RR_DESCRIPCION'
        FieldID = 'RR_ID'
        IdType = ctInteger
        OrderBy = 'RR_DESCRIPCION'
        ShowBajas = True
        TableName = 'CRR_RESPUESTA'
      end
    end
  end
  inherited fpAbm: TFormPanel
    Left = 127
    Top = 14
    Height = 512
    Constraints.MaxHeight = 512
    Constraints.MinHeight = 512
    inherited BevelAbm: TBevel
      Top = 476
    end
    inherited lblEmpresa: TLabel
      Top = 484
    end
    inherited btnAceptar: TButton
      Top = 482
    end
    inherited btnCancelar: TButton
      Top = 482
    end
    inherited btnCerrar: TButton
      Top = 482
    end
    inherited pcPaginas: TAdvToolBarPager
      Height = 474
      inherited tsDatos: TAdvPage
        Height = 443
        inherited sbScroll: TScrollBox
          Height = 442
          inherited gbAdicionales: TJvgGroupBox
            FullHeight = 0
          end
          inherited gbObservaciones: TJvgGroupBox
            Top = 426
            FullHeight = 112
            object Label34: TLabel [1]
              Left = 10
              Top = 18
              Width = 51
              Height = 13
              Caption = 'Respuesta'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Visible = False
            end
            inherited Label35: TLabel
              Top = 55
            end
            object Label37: TLabel [3]
              Left = 309
              Top = 55
              Width = 51
              Height = 13
              Cursor = crHandPoint
              Caption = 'Respuesta'
              Visible = False
            end
            inherited edSE_OBSERVACION: TMemo
              Left = 10
              Top = 69
              Width = 287
              Height = 41
              TabOrder = 1
            end
            inline fraSE_IDRESPUESTA_3: TfraCodDesc
              Left = 9
              Top = 32
              Width = 290
              Height = 23
              TabOrder = 0
              Visible = False
              inherited cmbDescripcion: TArtComboBox
                Width = 225
                Height = 22
              end
              inherited Propiedades: TPropiedadesFrame
                CodigoType = ctInteger
                FieldBaja = 'RR_FECHABAJA'
                FieldCodigo = 'RR_ID'
                FieldDesc = 'RR_DESCRIPCION'
                FieldID = 'RR_ID'
                IdType = ctInteger
                OrderBy = 'RR_DESCRIPCION'
                ShowBajas = True
                TableName = 'CRR_RESPUESTA'
                OnChange = fraSE_IDRESPUESTA_3PropiedadesChange
              end
            end
            object edSE_OBSERVACIONREALIZADO: TMemo
              Left = 308
              Top = 69
              Width = 307
              Height = 41
              Anchors = [akLeft, akTop, akRight]
              ScrollBars = ssVertical
              TabOrder = 2
              Visible = False
            end
          end
          inherited gbDatosEventos: TJvgGroupBox
            FullHeight = 16
            inherited Label13: TLabel
              Left = 448
            end
          end
          inherited gbDetalle: TJvgGroupBox
            Height = 200
            FullHeight = 200
            inherited Label6: TLabel
              Top = 84
              Cursor = crHandPoint
            end
            object Label33: TLabel [8]
              Left = 10
              Top = 159
              Width = 51
              Height = 13
              Caption = 'Respuesta'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label36: TLabel [9]
              Left = 309
              Top = 141
              Width = 51
              Height = 13
              Cursor = crHandPoint
              Caption = 'Respuesta'
            end
            inherited fraSE_PRIORIDAD: TfraCodDesc
              TabOrder = 7
            end
            inherited fraSE_IDMOTIVOEVENTO_2: TfraCodDesc
              inherited Propiedades: TPropiedadesFrame
                ExtraCondition = 
                  ' AND EXISTS (SELECT 1 FROM CAG_AGENDA WHERE AG_TIPO = '#39'M'#39' AND AG' +
                  '_IDMOTIVO = ME_ID)'
              end
            end
            inherited edSE_OBSERVACION_2: TMemo
              Top = 98
              Height = 41
              TabOrder = 8
            end
            inherited cmbSE_FECHAREALIZADO: TDateComboBox
              TabOrder = 6
            end
            inherited chkNotificado: TCheckBox
              TabOrder = 5
            end
            inline fraSE_IDRESPUESTA_2: TfraCodDesc [19]
              Left = 9
              Top = 172
              Width = 290
              Height = 23
              TabOrder = 1
              inherited cmbDescripcion: TArtComboBox
                Width = 225
                Height = 22
              end
              inherited Propiedades: TPropiedadesFrame
                CodigoType = ctInteger
                FieldBaja = 'RR_FECHABAJA'
                FieldCodigo = 'RR_ID'
                FieldDesc = 'RR_DESCRIPCION'
                FieldID = 'RR_ID'
                IdType = ctInteger
                OrderBy = 'RR_DESCRIPCION'
                ShowBajas = True
                TableName = 'CRR_RESPUESTA'
                OnChange = fraSE_IDRESPUESTA_2PropiedadesChange
              end
            end
            inherited chkAvisoVencido: TCheckBox
              TabOrder = 10
            end
            object edSE_OBSERVACIONREALIZADO_2: TMemo
              Left = 308
              Top = 155
              Width = 306
              Height = 41
              Anchors = [akLeft, akTop, akRight]
              ScrollBars = ssVertical
              TabOrder = 9
            end
          end
        end
      end
      inherited tsObservaciones: TAdvPage
        Height = 443
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = ()
    Left = 8
  end
  inherited dsConsulta: TDataSource
    Left = 36
  end
  inherited SortDialog: TSortDialog
    Left = 8
  end
  inherited ExportDialog: TExportDialog
    Left = 36
  end
  inherited QueryPrint: TQueryPrint
    Left = 36
  end
  inherited Seguridad: TSeguridad
    Left = 8
  end
  inherited FormStorage: TFormStorage
    Left = 36
  end
  inherited PrintDialog: TPrintDialog
    Left = 8
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
    Left = 64
  end
  inherited FieldHider: TFieldHider
    Left = 64
  end
  inherited ShortCutControlHijo: TShortCutControl
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
end
