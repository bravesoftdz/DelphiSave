inherited frmAdministracionEventosSISTEMAS: TfrmAdministracionEventosSISTEMAS
  Left = 294
  Top = 128
  Width = 774
  Height = 567
  PixelsPerInch = 96
  TextHeight = 13
  inherited splBottom: TJvgSplitter
    Top = 432
    Width = 766
    Height = 7
  end
  inherited pnlBottom: TPanel
    Top = 439
    Width = 766
    Height = 94
    ParentColor = True
    object pnlSeleccion: TPanel [0]
      Left = 0
      Top = 66
      Width = 766
      Height = 28
      Align = alBottom
      BevelOuter = bvLowered
      Caption = 'Seleccione un evento de la lista'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 1
      Visible = False
      DesignSize = (
        766
        28)
      object btnCancelarSeleccion: TButton
        Left = 14
        Top = 2
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Cancelar'
        ModalResult = 2
        TabOrder = 0
      end
      object btnAceptarSeleccion: TButton
        Left = -62
        Top = 2
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Aceptar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnAceptarSeleccionClick
      end
    end
    inherited gbDatosEvento: TJvgGroupBox
      Width = 766
      Height = 66
      FullHeight = 79
      inherited Shape6: TShape
        Width = 762
      end
      inherited edINGRESO: TDBMemo
        Height = 25
      end
      inherited edMOTIVO: TDBMemo
        Height = 25
      end
      inherited edRespuesta: TDBMemo
        Height = 25
      end
      inherited edObservaciones: TDBMemo
        Height = 25
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 324
    Width = 766
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 762
      end>
    inherited ToolBar: TToolBar
      Width = 749
      Transparent = True
      inherited tbRefrescar: TToolButton
        Visible = False
      end
      inherited ToolButton5: TToolButton
        Visible = False
      end
      inherited tbPropiedades: TToolButton
        ImageIndex = 13
      end
    end
  end
  inherited gbFiltrosEmpresa: TJvgGroupBox
    Top = 268
    Width = 766
    Height = 56
    TabOrder = 6
    GroupIndex = 12
    FullHeight = 59
    inherited Shape7: TShape
      Width = 762
    end
    inherited fraFiltroEmpresa: TfraEmpresa
      Width = 81
      inherited lbContrato: TLabel
        Left = -40
      end
      inherited edContrato: TIntEdit
        Left = 7
      end
      inherited cmbRSocial: TArtComboBox
        Width = 0
      end
    end
  end
  inherited gbFiltrosUsuarios: TJvgGroupBox
    Top = 209
    Width = 766
    TabOrder = 4
    FullHeight = 59
    inherited Shape666: TShape
      Width = 762
    end
    inherited pnlFiltrosUsuarios: TPanel
      Width = 572
      inherited fraSE_USUREALIZADO: TfraCodDesc
        Width = 187
        inherited cmbDescripcion: TArtComboBox
          Width = 122
        end
      end
    end
  end
  inherited gbFiltrosEventosAdicionales: TJvgGroupBox
    Top = 148
    Width = 766
    Height = 61
    TabOrder = 3
    OnClick = gbFiltrosEventosAdicionalesClick
    GroupIndex = 11
    FullHeight = 59
    inherited Shape999: TShape
      Width = 762
    end
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
      Top = 89
      Color = clRed
      ParentColor = False
      TabOrder = 2
      inherited Propiedades: TPropiedadesFrame
        ExtraCondition = ''
      end
    end
    inherited fraSE_IDMOTIVOEVENTO: TfraCodDesc
      Width = 0
      TabOrder = 3
      inherited cmbDescripcion: TArtComboBox
        Width = 0
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
        ShowBajas = True
        TableName = 'CRR_RESPUESTA'
        FieldID = 'RR_ID'
        FieldCodigo = 'RR_ID'
        FieldDesc = 'RR_DESCRIPCION'
        FieldBaja = 'RR_FECHABAJA'
        OrderBy = 'RR_DESCRIPCION'
        CodigoType = ctInteger
        IdType = ctInteger
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 353
    Width = 766
    Height = 79
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
    Width = 766
    Height = 148
    inherited gbFiltrosEventos: TJvgGroupBox
      Width = 766
      Height = 148
      Caption = ' Evento '
      GroupIndex = 10
      FullHeight = 148
      inherited Shape5: TShape
        Width = 762
      end
      inherited pnlLeft: TPanel
        Height = 129
        ParentColor = True
      end
      inherited pnlRight: TPanel
        Left = 556
        Height = 129
        ParentColor = True
      end
      inherited pnlMiddle: TPanel
        Width = 473
        Height = 129
        ParentColor = True
        inherited cmbSE_SECTORINVOLUCRADO: TARTCheckListBox
          Width = 372
        end
      end
    end
  end
  inherited fpAbm: TFormPanel
    Left = 91
    Top = 14
    Width = 664
    Height = 514
    Constraints.MaxHeight = 514
    Constraints.MinHeight = 514
    inherited BevelAbm: TBevel
      Top = 478
      Width = 656
    end
    inherited lblEmpresa: TLabel
      Top = 487
      Transparent = True
    end
    inherited btnAceptar: TButton
      Left = 509
      Top = 484
    end
    inherited btnCancelar: TButton
      Left = 584
      Top = 484
    end
    inherited btnCerrar: TButton
      Left = 434
      Top = 484
    end
    inherited pcPaginas: TAdvToolBarPager
      Width = 664
      Height = 476
      ActivePage = tsDatos
      inherited tsDatos: TAdvPage
        Width = 656
        Height = 445
        inherited sbScroll: TScrollBox
          Width = 656
          Height = 444
          VertScrollBar.Position = 0
          inherited gbAdicionales: TJvgGroupBox
            Top = 173
            Width = 656
            FullHeight = 53
            inherited Shape1: TShape
              Width = 652
            end
            inherited Label9: TLabel
              Transparent = True
            end
            inherited Label10: TLabel
              Transparent = True
            end
            inherited frafpSE_IDMOTIVOEVENTO: TfraCodDesc
              Width = 305
              inherited cmbDescripcion: TArtComboBox
                Width = 240
              end
            end
          end
          inherited gbObservaciones: TJvgGroupBox
            Top = 426
            Width = 656
            Height = 16
            Collapsed = True
            FullHeight = 116
            inherited Shape4: TShape
              Width = 652
              Visible = False
            end
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
              Visible = False
            end
            object Label37: TLabel [3]
              Left = 361
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
              Width = 251
              Height = 41
              TabOrder = 1
              Visible = False
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
                OnDropDown = fraSE_IDRESPUESTA_3cmbDescripcionDropDown
              end
              inherited Propiedades: TPropiedadesFrame
                ShowBajas = True
                TableName = 'CRR_RESPUESTA'
                FieldID = 'RR_ID'
                FieldCodigo = 'RR_ID'
                FieldDesc = 'RR_DESCRIPCION'
                FieldBaja = 'RR_FECHABAJA'
                OrderBy = 'RR_DESCRIPCION'
                CodigoType = ctInteger
                IdType = ctInteger
                OnChange = fraSE_IDRESPUESTA_3PropiedadesChange
              end
            end
            object edSE_OBSERVACIONREALIZADO: TMemo
              Left = 360
              Top = 69
              Width = 290
              Height = 41
              Anchors = [akLeft, akTop, akRight]
              ScrollBars = ssVertical
              TabOrder = 2
              Visible = False
            end
          end
          inherited gbDatosEventos: TJvgGroupBox
            Top = 0
            Width = 656
            FullHeight = 16
            inherited Shape2: TShape
              Width = 652
            end
            inherited Label11: TLabel
              Transparent = True
            end
            inherited Label12: TLabel
              Transparent = True
            end
            inherited Label13: TLabel
              Left = 479
              Transparent = True
            end
            inherited Label14: TLabel
              Transparent = True
            end
            inherited Label15: TLabel
              Transparent = True
            end
            inherited Label16: TLabel
              Transparent = True
            end
            inherited Label17: TLabel
              Transparent = True
            end
            inherited Label18: TLabel
              Transparent = True
            end
            inherited lbRealizado: TLabel
              Transparent = True
            end
            inherited lbEvento: TDBText
              Transparent = True
            end
            inherited btnContactos: TSpeedButton
              Left = 627
            end
            inherited cmbSE_FECHAALTA: TDateComboBox
              Left = 560
            end
            inherited fraSE_IDCONTACTO: TfraCodDesc
              Width = 319
              inherited cmbDescripcion: TArtComboBox
                Width = 254
              end
            end
            inherited fraSE_CARGO: TfraCodDesc
              Width = 342
              inherited cmbDescripcion: TArtComboBox
                Width = 277
              end
            end
            inherited fraSE_SECTORINVOLUCRADO: TfraCodDesc
              Width = 342
              inherited cmbDescripcion: TArtComboBox
                Width = 277
              end
            end
          end
          inherited gbDetalle: TJvgGroupBox
            Top = 226
            Width = 656
            Height = 200
            FullHeight = 200
            inherited Shape3: TShape
              Width = 652
            end
            inherited Label2: TLabel
              Transparent = True
            end
            inherited Label1: TLabel
              Transparent = True
            end
            inherited Label3: TLabel
              Transparent = True
            end
            inherited Label4: TLabel
              Transparent = True
            end
            inherited Label5: TLabel
              Transparent = True
            end
            inherited Label6: TLabel
              Top = 84
              Cursor = crHandPoint
              Transparent = True
            end
            inherited Label7: TLabel
              Left = 456
              Transparent = True
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
              Transparent = True
            end
            object Label36: TLabel [9]
              Left = 309
              Top = 141
              Width = 51
              Height = 13
              Cursor = crHandPoint
              Caption = 'Respuesta'
              Transparent = True
            end
            inherited lblVencimiento: TLabel
              Transparent = True
            end
            inherited fraSE_PRIORIDAD: TfraCodDesc
              Width = 343
              TabOrder = 7
              inherited cmbDescripcion: TArtComboBox
                Width = 278
              end
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
              Width = 342
              Height = 41
              TabOrder = 8
            end
            inherited cmbSE_FECHAREALIZADO: TDateComboBox
              Left = 560
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
                OnDropDown = fraSE_IDRESPUESTA_2cmbDescripcionDropDown
              end
              inherited Propiedades: TPropiedadesFrame
                ShowBajas = True
                TableName = 'CRR_RESPUESTA'
                FieldID = 'RR_ID'
                FieldCodigo = 'RR_ID'
                FieldDesc = 'RR_DESCRIPCION'
                FieldBaja = 'RR_FECHABAJA'
                OrderBy = 'RR_DESCRIPCION'
                CodigoType = ctInteger
                IdType = ctInteger
                OnChange = fraSE_IDRESPUESTA_2PropiedadesChange
              end
            end
            inherited chkAvisoVencido: TCheckBox
              TabOrder = 10
            end
            object edSE_OBSERVACIONREALIZADO_2: TMemo
              Left = 308
              Top = 155
              Width = 342
              Height = 41
              Anchors = [akLeft, akTop, akRight]
              ScrollBars = ssVertical
              TabOrder = 9
            end
          end
        end
      end
      inherited tsObservaciones: TAdvPage
        Width = 656
        Height = 445
        inherited dbgObservaciones: TJvDBGrid
          Width = 613
          Columns = <
            item
              Expanded = False
              FieldName = 'SS_TEXTO'
              Title.Caption = 'Observaciones'
              Width = 382
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SE_NOMBRE'
              Title.Caption = 'Usuario'
              Width = 119
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'SS_FECHAALTA'
              Title.Caption = 'Fecha'
              Width = 105
              Visible = True
            end>
        end
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
  object ShortCutControlHijo1: TShortCutControl
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
    Left = 72
    Top = 372
  end
end
