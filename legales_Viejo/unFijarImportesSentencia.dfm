object frmFijarImportesSentencia: TfrmFijarImportesSentencia
  Left = 326
  Top = 165
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Fijar Importes de Sentencia'
  ClientHeight = 486
  ClientWidth = 621
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    621
    486)
  PixelsPerInch = 96
  TextHeight = 13
  object bvSeparadorBotones: TBevel
    Left = 4
    Top = 447
    Width = 618
    Height = 2
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
  end
  object lblSentencia: TLabel
    Left = 14
    Top = 8
    Width = 48
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Sentencia'
  end
  object lblImporteDemandaSentencia: TLabel
    Left = 17
    Top = 57
    Width = 96
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Importe Demandado'
  end
  object lblImporteSentenciaSentencia: TLabel
    Left = 18
    Top = 96
    Width = 70
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Importe Capital'
  end
  object lblReservaCapitalSentencia: TLabel
    Left = 132
    Top = 57
    Width = 75
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Reserva Capital'
  end
  object lblReservaHonorariosSentencia: TLabel
    Left = 243
    Top = 57
    Width = 94
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Reserva Honorarios'
  end
  object lblHonorariosSentencia: TLabel
    Left = 131
    Top = 96
    Width = 51
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Honorarios'
  end
  object lblFechaFinJuicioSentencia: TLabel
    Left = 14
    Top = 35
    Width = 84
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Fecha Sentencia:'
  end
  object lblImporteIntereses: TLabel
    Left = 242
    Top = 96
    Width = 81
    Height = 13
    Caption = 'Importe Intereses'
  end
  object Label1: TLabel
    Left = 347
    Top = 96
    Width = 85
    Height = 13
    Caption = 'Imp. Tasa Justicia'
  end
  object Label2: TLabel
    Left = 456
    Top = 97
    Width = 86
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Importe Sentencia'
  end
  object Label3: TLabel
    Left = 208
    Top = 35
    Width = 116
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Fecha Recepci'#243'n Sent.:'
  end
  object lblMontoCondena: TLabel
    Left = 350
    Top = 57
    Width = 91
    Height = 13
    Caption = 'Monto de Condena'
  end
  object lblPorcentajeIncapacidadSentencia: TLabel
    Left = 450
    Top = 57
    Width = 113
    Height = 13
    Caption = 'Incapacidad Sentencia:'
  end
  object lnlPorcentajeIncapacidad: TLabel
    Left = 561
    Top = 74
    Width = 8
    Height = 13
    Caption = '%'
  end
  object btnAceptarSentencia: TButton
    Left = 450
    Top = 456
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Aceptar'
    TabOrder = 11
    OnClick = btnAceptarSentenciaClick
  end
  object btnCancelarFijarSentencia: TButton
    Left = 531
    Top = 456
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 12
  end
  object edImporteDemandaSentencia: TCurrencyEdit
    Left = 15
    Top = 72
    Width = 100
    Height = 21
    TabStop = False
    AutoSize = False
    Color = clInactiveCaption
    DisplayFormat = '$,0.00;-$,0.00'
    Enabled = False
    Anchors = [akLeft, akBottom]
    TabOrder = 3
  end
  object edImporteCapitalFinal: TCurrencyEdit
    Left = 15
    Top = 110
    Width = 102
    Height = 21
    AutoSize = False
    Color = clInactiveCaption
    DisplayFormat = '$,0.00;-$,0.00'
    Enabled = False
    Anchors = [akLeft, akBottom]
    TabOrder = 5
    OnChange = edImporteCapitalFinalChange
  end
  object edImporteHonorariosFinal: TCurrencyEdit
    Left = 128
    Top = 110
    Width = 99
    Height = 21
    AutoSize = False
    Color = clInactiveCaption
    DisplayFormat = '$,0.00;-$,0.00'
    Enabled = False
    Anchors = [akLeft, akBottom]
    TabOrder = 6
    OnChange = edImporteCapitalFinalChange
  end
  object edFechaSentencia: TDateComboBox
    Left = 103
    Top = 32
    Width = 92
    Height = 21
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object pgSentencia: TPageControl
    Left = 2
    Top = 140
    Width = 617
    Height = 304
    ActivePage = tsDetalleSentencia
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 10
    object tsDetalleSentencia: TTabSheet
      Caption = 'Detalle Sentencia'
      object mDetalleSentencia: TRxRichEdit
        Left = 0
        Top = 0
        Width = 609
        Height = 276
        Align = alClient
        PlainText = True
        ScrollBars = ssNone
        TabOrder = 0
      end
    end
    object tsReclamosSentencia: TTabSheet
      Caption = 'Sentencia a Reclamos '
      ImageIndex = 1
      inline fraReclamoSentenciaSentencia: TfraReclamoSentencia
        Left = 0
        Top = 0
        Width = 609
        Height = 276
        Align = alClient
        TabOrder = 0
        inherited dbReclamos: TArtDBGrid
          Width = 609
          Height = 247
          OnDblClick = fraReclamoSentenciaSentenciadbReclamosDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'RC_DESCRIPCION'
              Title.Caption = 'Reclamo'
              Width = 235
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RT_MONTODEMANDADO'
              Title.Caption = 'Monto Demanda'
              Width = 99
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RT_PORCENTAJEINCAPACIDAD'
              Title.Caption = '% Inc. Demanda'
              Width = 94
              Visible = True
            end
            item
              Color = 16776176
              Expanded = False
              FieldName = 'RT_MONTOSENTENCIA'
              Title.Caption = 'Monto Sentencia'
              Width = 86
              Visible = True
            end
            item
              Color = 16776176
              Expanded = False
              FieldName = 'RT_PORCENTAJESENTENCIA'
              Title.Caption = '% Solidario'
              Visible = True
            end>
        end
        inherited cbReclamoSentencia: TCoolBar
          Width = 609
          Bands = <
            item
              Control = fraReclamoSentenciaSentencia.tbrReclamo
              ImageIndex = -1
              MinHeight = 27
              Width = 605
            end>
          inherited tbrReclamo: TToolBar
            Width = 592
            inherited tbNuevoReclamo: TToolButton
              OnClick = fraReclamoSentenciaSentenciatbNuevoReclamoClick
            end
            inherited tbEdicionReclamo: TToolButton
              OnClick = fraReclamoSentenciaSentenciatbEdicionReclamoClick
            end
            inherited tbBajaReclamo: TToolButton
              OnClick = fraReclamoSentenciaSentenciatbBajaReclamoClick
            end
          end
        end
        inherited fpReclamo: TFormPanel
          Left = 28
          Top = 20
          Constraints.MinHeight = 220
          Constraints.MinWidth = 508
          inherited btnAceptarReclamo: TButton
            OnClick = fraReclamoSentenciaSentenciabtnAceptarReclamoClick
          end
          inherited ScrollBox1: TScrollBox
            inherited pnImporteSentencia: TPanel
              inherited lblImporteSentencia: TLabel
                Left = 0
              end
            end
            inherited pnOrigenDemanda: TPanel
              inherited lblOrigenanteRelacionado: TLabel
                Left = 6
              end
            end
          end
        end
        inherited dsReclamos: TDataSource
          Left = 44
          Top = 264
        end
        inherited sdqReclamoJuicioEnTramite: TSDQuery
          Left = 12
          Top = 264
        end
      end
    end
    object tsImportesRegulados: TTabSheet
      Caption = 'Importes de Sentencia'
      ImageIndex = 4
      object cbEdicionImportesRegulados: TCoolBar
        Left = 0
        Top = 0
        Width = 609
        Height = 29
        Bands = <
          item
            Control = tbImportesRegulados
            ImageIndex = -1
            MinHeight = 27
            Width = 605
          end>
        object tbImportesRegulados: TToolBar
          Left = 9
          Top = 0
          Width = 592
          Height = 27
          BorderWidth = 1
          Caption = 'ToolBar'
          EdgeBorders = []
          Flat = True
          HotImages = dmLegales.ilColor
          Images = dmLegales.ilByN
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object tbIngresoValor: TToolButton
            Left = 0
            Top = 0
            Hint = 'Nuevo Importe'
            ImageIndex = 6
            OnClick = tbIngresoValorClick
          end
          object tbEdicionValor: TToolButton
            Left = 23
            Top = 0
            Hint = 'Modificar Importe'
            ImageIndex = 7
            OnClick = tbEdicionValorClick
          end
          object tbEliminarValor: TToolButton
            Left = 46
            Top = 0
            Hint = 'Eliminar Importe'
            ImageIndex = 8
            OnClick = tbEliminarValorClick
          end
          object ToolButton4: TToolButton
            Left = 69
            Top = 0
            Width = 8
            Caption = 'ToolButton5'
            ImageIndex = 5
            Style = tbsSeparator
          end
          object tbImprimirValores: TToolButton
            Left = 77
            Top = 0
            Hint = 'Imprimir'
            ImageIndex = 4
            Visible = False
          end
        end
      end
      object dbgImportesRegulados: TRxDBGrid
        Left = 0
        Top = 29
        Width = 609
        Height = 247
        Align = alClient
        DataSource = dsImportesRegulados
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbgImportesReguladosDblClick
        OnGetCellParams = dbgImportesReguladosGetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'ir_id'
            Title.Alignment = taCenter
            Title.Caption = 'Nro.'
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ir_detalle'
            Title.Alignment = taCenter
            Title.Caption = 'Detalle'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ir_importesentencia'
            Title.Alignment = taCenter
            Title.Caption = 'Importe Sent.'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ir_importe'
            Title.Alignment = taCenter
            Title.Caption = 'Importe c/Ret'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ir_importesinret'
            Title.Alignment = taCenter
            Title.Caption = 'Importe s/Ret'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ir_aplicacion'
            Title.Alignment = taCenter
            Title.Caption = 'Aplicado a'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ir_nropago'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' de pago'
            Visible = True
          end>
      end
    end
    object tsPagosPendientes: TTabSheet
      Caption = 'Pagos Pendientes'
      ImageIndex = 3
      TabVisible = False
    end
    object tbOtros: TTabSheet
      Caption = 'Otros'
      ImageIndex = 4
      object Label4: TLabel
        Left = 13
        Top = 44
        Width = 156
        Height = 13
        Caption = 'Juez autoriza imputaci'#243'n al FFEP'
      end
      object chkImputacionFFEP: TCheckBox
        Left = 12
        Top = 19
        Width = 186
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Imputaci'#243'n al FFEP'
        TabOrder = 0
        OnClick = chkImputacionFFEPClick
      end
      inline fraJuezAutImpFFEP: TfraCodigoDescripcion
        Left = 184
        Top = 40
        Width = 357
        Height = 23
        TabOrder = 1
      end
      object chkSentenciaAjustaPM: TCheckBox
        Left = 11
        Top = 68
        Width = 231
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Sentencia ajusta a la pericia m'#233'dica oficial'
        TabOrder = 2
      end
      object chkDeterminaEnfProf: TCheckBox
        Left = 11
        Top = 89
        Width = 231
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Juez determina enfemedad profesional'
        TabOrder = 3
      end
    end
  end
  inline fraTipoResultadoJuicio: TfraCodigoDescripcion
    Left = 70
    Top = 4
    Width = 515
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    DesignSize = (
      515
      23)
    inherited cmbDescripcion: TArtComboBox
      Left = 45
      Width = 469
    end
    inherited edCodigo: TPatternEdit
      Width = 39
    end
  end
  object ntReservas: TNotebook
    Left = 124
    Top = 70
    Width = 217
    Height = 25
    TabOrder = 4
    object TPage
      Left = 0
      Top = 0
      Caption = 'pgReservasConPermisos'
      DesignSize = (
        217
        25)
      object edReservaCapitalSentencia: TCurrencyEdit
        Left = 4
        Top = 3
        Width = 100
        Height = 21
        TabStop = False
        AutoSize = False
        Color = clInactiveCaption
        DisplayFormat = '$,0.00;-$,0.00'
        Enabled = False
        Anchors = [akLeft, akBottom]
        TabOrder = 0
      end
      object edReservaHonorariosSentencia: TCurrencyEdit
        Left = 113
        Top = 3
        Width = 100
        Height = 21
        TabStop = False
        AutoSize = False
        Color = clInactiveCaption
        DisplayFormat = '$,0.00;-$,0.00'
        Enabled = False
        Anchors = [akLeft, akBottom]
        TabOrder = 1
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'pgReservasSinPermisos'
      object Edit1: TEdit
        Left = 5
        Top = 3
        Width = 100
        Height = 21
        Color = clInactiveCaption
        TabOrder = 0
        Text = '***********'
      end
      object Edit2: TEdit
        Left = 113
        Top = 3
        Width = 100
        Height = 21
        Color = clInactiveCaption
        TabOrder = 1
        Text = '***********'
      end
    end
  end
  object ceImporteIntereses: TCurrencyEdit
    Left = 238
    Top = 110
    Width = 99
    Height = 21
    AutoSize = False
    Color = clInactiveCaption
    DisplayFormat = '$,0.00;-$,0.00'
    Enabled = False
    TabOrder = 7
    OnChange = edImporteCapitalFinalChange
  end
  object ceImporteTasaJusticia: TCurrencyEdit
    Left = 347
    Top = 110
    Width = 99
    Height = 21
    AutoSize = False
    Color = clInactiveCaption
    DisplayFormat = '$,0.00;-$,0.00'
    Enabled = False
    TabOrder = 8
    OnChange = edImporteCapitalFinalChange
  end
  object ceImporteSentenciaFinal: TCurrencyEdit
    Left = 456
    Top = 110
    Width = 99
    Height = 21
    AutoSize = False
    Color = clInactiveCaption
    DisplayFormat = '$,0.00;-$,0.00'
    Enabled = False
    Anchors = [akLeft, akBottom]
    TabOrder = 9
  end
  object edFechaRecepSentencia: TDateComboBox
    Left = 328
    Top = 32
    Width = 92
    Height = 21
    Anchors = [akLeft, akBottom]
    TabOrder = 2
  end
  object edMontoCondena: TCurrencyEdit
    Left = 346
    Top = 71
    Width = 99
    Height = 22
    AutoSize = False
    DisplayFormat = '$,0.00;-$,0.00'
    TabOrder = 13
  end
  object edPorcentajeIncapacidad: TCurrencyEdit
    Left = 454
    Top = 71
    Width = 101
    Height = 21
    AutoSize = False
    DisplayFormat = ' ,0.00;- ,0.00'
    MaxValue = 100.000000000000000000
    TabOrder = 14
  end
  object sdqPagoLegal: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT '
      '     lbp.bp_descripcion, lpl.pl_id,'
      
        '     lpl.pl_numpago, lpl.pl_fechapago, lpl.pl_conpago, lpl.pl_fe' +
        'chaemision,'
      '     lpl.pl_cuitcuil, lpl.pl_letrafactura,'
      
        '     lpl.pl_situacionfactura, lpl.pl_numerofactura, lpl.pl_fecha' +
        'factura,'
      '     lpl.pl_importepago, lpl.pl_formapago,'
      
        '     lpl.pl_comentario, lpl.pl_estado, lpl.pl_usualta, lpl.pl_fe' +
        'chaalta,'
      
        '     lpl.pl_usumodif, lpl.pl_fechamodif, lpl.pl_fechavencimiento' +
        ','
      '     lpl.pl_usuarioaprobado, lpl.pl_fechaaprobado,'
      '     lpl.pl_importeconretencion, lpl.pl_chequenombre,'
      '     lpl.pl_prestadormutual, lpl.pl_proxdigfactura_fncl,'
      '     lpl.pl_telegramapago, lpl.pl_cai, lpl.pl_idjuicioentramite,'
      
        '     lpl.pl_idtipooperacion, lpl.pl_idbeneficiariopago, lpl.pl_d' +
        'etallebeneficiario,'
      
        '     scp.cp_denpago, scp.cp_ctapago, scp.cp_especie, scp.cp_codi' +
        'gossn, scp.cp_retencion,'
      
        '     scp.cp_tipo, scp.cp_autorizacion, scp.cp_altamedica, scp.cp' +
        '_fbaja,'
      '     scp.cp_descripcion, scp.cp_tipomonto, scp.cp_telegrama,'
      
        '     scp.cp_nomenclado, scp.cp_legales, scp.cp_grado, scp.cp_car' +
        'acter,'
      '     scp.cp_adelanto, scp.cp_espagomensual, scp.cp_aporycontri,'
      '     scp.cp_retiva, lto.to_descripcion, lto.to_idmomento'
      'FROM legales.lpl_pagolegal lpl,'
      '     legales.lbp_beneficiariopago lbp,'
      '     scp_conpago scp,'
      '     legales.lto_tipooperacion lto'
      'WHERE (    (lpl.pl_idbeneficiariopago = lbp.bp_id(+))'
      '      AND (lpl.pl_conpago = scp.cp_conpago)'
      '      AND (lpl.pl_idtipooperacion = lto.to_id(+))'
      '     ) AND lpl.pl_idjuicioentramite = :idJuicioEnTramite')
    Left = 390
    Top = 126
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idJuicioEnTramite'
        ParamType = ptInput
        Value = '0'
      end>
  end
  object dsPagoLegal: TDataSource
    DataSet = sdqPagoLegal
    Left = 420
    Top = 126
  end
  object sdqImportesRegulados: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT ir_id, ir_idjuicioentramite, ir_importe, ir_detalle, ir_i' +
        'mportesinret,'
      '       DECODE (ir_aplicacion,'
      '               '#39'H'#39', '#39'Honorarios'#39','
      '               '#39'I'#39', '#39'Intereses'#39','
      '               '#39'C'#39', '#39'Capital'#39','
      '               '#39'T'#39', '#39'Tasas'#39
      '              ) ir_aplicacion,'
      '       ir_idinstancia, '
      '       ir_nropago,'
      '       ir_fechabaja,'
      '       ir_importesentencia'
      '  FROM legales.lir_importesreguladosjuicio irj'
      ' WHERE irj.ir_idjuicioentramite = :idjuicioentramite'
      '   AND irj.ir_idinstancia = :idinstancia'
      ''
      ''
      '')
    Left = 450
    Top = 126
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idJuicioEnTramite'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftUnknown
        Name = 'idinstancia'
        ParamType = ptInput
      end>
  end
  object dsImportesRegulados: TDataSource
    DataSet = sdqImportesRegulados
    Left = 480
    Top = 126
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 519
    Top = 126
  end
  object sdqSumaImportes: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT   ir_aplicacion,'
      
        '         SUM (NVL (ir_importe, 0) + NVL (ir_importesinret, 0)) t' +
        'otal'
      '    FROM legales.lir_importesreguladosjuicio irj'
      '   WHERE irj.ir_idjuicioentramite = :idjuicioentramite'
      '     AND irj.ir_idinstancia = :idinstancia'
      '     AND irj.ir_fechabaja IS NULL'
      'GROUP BY ir_idjuicioentramite, ir_aplicacion, ir_idinstancia'
      '')
    Left = 360
    Top = 126
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idJuicioEnTramite'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftUnknown
        Name = 'idinstancia'
        ParamType = ptInput
      end>
  end
  object sdqSiniestrosJucio: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT  ex_id,'
      '        ex_siniestro,'
      '        ex_orden,'
      '        ex_recaida'
      '  FROM  legales.lod_origendemanda lod,'
      '        legales.lsj_siniestrosjuicioentramite lsj,'
      '        art.sex_expedientes sex'
      ' WHERE  lod.od_id = lsj.sj_idorigendemanda'
      '    AND sex.ex_siniestro = lsj.sj_siniestro'
      '    AND sex.ex_orden = lsj.sj_orden'
      '    AND sex.ex_recaida = lsj.sj_recaida'
      '    AND lod.od_idjuicioentramite = :id_juiciotramite'
      '    AND lsj.sj_fechabaja IS NULL'
      '    AND lod.od_fechabaja IS NULL')
    Left = 560
    Top = 126
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_juiciotramite'
        ParamType = ptInput
      end>
  end
end
