inherited frmAbmAnalisis: TfrmAbmAnalisis
  Left = 325
  Top = 158
  Width = 635
  Height = 508
  Caption = 'Historia Cl'#237'nica'
  FormStyle = fsNormal
  PixelsPerInch = 96
  TextHeight = 13
  object JvOutlookSplitter1: TJvOutlookSplitter [0]
    Left = 0
    Top = 314
    Width = 627
  end
  inherited CoolBar: TCoolBar [1]
    Width = 627
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 623
      end>
    inherited ToolBar: TToolBar
      Width = 610
    end
  end
  inherited pnlFiltros: TPanel [2]
    Width = 627
    DesignSize = (
      627
      213)
    inherited Bevel1: TBevel
      Width = 629
    end
    inherited Bevel2: TBevel
      Width = 629
    end
    inherited Bevel3: TBevel
      Width = 629
    end
    inherited Bevel4: TBevel
      Width = 629
    end
    inherited Label2: TLabel
      FocusControl = fraOperativo.edPeriodo
    end
    inherited btnTrabajador: TSpeedButton
      Left = 578
      OnClick = btnTrabajadorClick
    end
    inherited Bevel5: TBevel
      Width = 629
    end
    inherited lbEstudio: TLabel
      FocusControl = fraEstudio.edCodigo
    end
    inherited Label1: TLabel
      Left = 495
    end
    inherited Bevel6: TBevel
      Width = 629
    end
    inherited btnReconfirmaciones: TSpeedButton
      Left = 602
    end
    object Label3: TLabel [13]
      Left = 6
      Top = 9
      Width = 24
      Height = 13
      Caption = 'CUIT'
    end
    inherited Label5: TLabel
      Left = 201
    end
    inherited Label6: TLabel
      Left = 351
    end
    object Label12: TLabel [16]
      Left = 4
      Top = 92
      Width = 23
      Height = 13
      Caption = 'CUIL'
    end
    inherited fraOperativo: TfraOperativo
      TabOrder = 8
    end
    inherited fraEstablecimiento: TfraEstablecimiento_OLD
      Width = 624
      TabOrder = 1
      DesignSize = (
        624
        47)
      inherited lbLocalidad: TLabel
        Left = 390
      end
      inherited lbCPostal: TLabel
        Left = 553
      end
      inherited lbProvincia: TLabel
        Left = 390
      end
      inherited cmbDescripcion: TArtComboBox
        Width = 282
      end
      inherited edLocalidad: TEdit
        Left = 442
      end
      inherited edCPostal: TEdit
        Left = 577
      end
      inherited edDomicilio: TEdit
        Width = 329
      end
      inherited edProvincia: TEdit
        Left = 442
      end
    end
    inherited fraEstudio: TfraEstudio
      Width = 150
      TabOrder = 3
      DesignSize = (
        150
        23)
      inherited edCodigo: TPatternEdit
        Width = 70
      end
      inherited cmbDescripcion: TArtComboBox
        Left = 88
        Width = 62
      end
    end
    inherited edFecha: TDateComboBox
      Left = 537
      TabOrder = 6
      OnChange = edFechaChange
    end
    inherited fraTipoEstudio: TfraTipoEstudio
      Width = 570
      TabOrder = 7
      DesignSize = (
        570
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 505
      end
    end
    inherited fraPrestador: TfraPrestadorAMP
      Width = 169
      TabOrder = 9
      DesignSize = (
        169
        21)
      inherited cmbDescripcion: TArtComboBox
        Width = 121
      end
    end
    inherited edFechaRPrest: TDateComboBox
      Left = 254
      TabOrder = 4
    end
    inherited edFechaRML: TDateComboBox
      Left = 398
      TabOrder = 5
    end
    inline fraEmpresaHijo: TfraEmpresa [25]
      Left = 52
      Top = 3
      Width = 570
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      DesignSize = (
        570
        21)
      inherited lbRSocial: TLabel
        Left = 94
      end
      inherited lbContrato: TLabel
        Left = 466
      end
      inherited mskCUIT: TMaskEdit
        Left = 4
      end
      inherited edContrato: TIntEdit
        Left = 513
      end
      inherited cmbRSocial: TArtComboBox
        Left = 136
        Width = 326
      end
    end
    inherited chbAnclarDatos: TCheckBox
      Left = 542
      TabOrder = 10
    end
    inline fraTrabajadorHijo: TfraTrabajadorAMP
      Left = 52
      Top = 88
      Width = 522
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      OnEnter = fraTrabajadorHijoEnter
      DesignSize = (
        522
        25)
      inherited lbTrabCUIL: TLabel
        Width = 23
      end
      inherited mskCUIL: TMaskEdit
        Left = 4
      end
      inherited cmbNombre: TArtComboBox
        Left = 88
        Width = 432
        OnEnter = fraTrabajadorHijocmbNombreEnter
      end
    end
  end
  inherited dbgDatos: TArtDBGrid [3]
    Width = 627
    Height = 72
    Columns = <
      item
        Expanded = False
        FieldName = 'TIPO_EXAMEN'
        Title.Caption = 'Tipo Estudio'
        Width = 152
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_PERIODO'
        Title.Caption = 'Periodo'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_CUIT'
        Title.Caption = 'CUIT'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_CONTRATO'
        Title.Caption = 'Contrato'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 151
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_ESTABLECI'
        Title.Caption = 'Establecimiento'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_CUIL'
        Title.Caption = 'CUIL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_NOMBRE'
        Title.Caption = 'Apellido y Nombre'
        Width = 171
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_FECHA'
        Title.Caption = 'Fecha Est.'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_DESCRIPCION'
        Title.Caption = 'Estudio'
        Width = 192
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_RESULTADO'
        Title.Caption = 'Resultado'
        Width = 137
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_TIPORES'
        Title.Caption = 'Normal / Anormal'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_FECHARECPREST'
        Title.Caption = 'F.Recep.Prest.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_FECHARECML'
        Title.Caption = 'F.Recep.ML'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_IDCARPETAAMP'
        Title.Caption = 'Carpeta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_FECHALTA'
        Title.Caption = 'Fecha alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ET_USUALTA'
        Title.Caption = 'Usuario alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOAUDIOMETRIA'
        Title.Caption = 'Tipo de Audiometria'
        Width = 138
        Visible = True
      end>
  end
  object gbPendientesLote: TJvgGroupBox [5]
    Left = 0
    Top = 321
    Width = 627
    Height = 160
    Align = alBottom
    Caption = 'Pendientes Lote'
    TabOrder = 4
    Border.Inner = bvSpace
    Border.Outer = bvNone
    Border.Bold = False
    CaptionBorder.Inner = bvSpace
    CaptionBorder.Outer = bvNone
    CaptionBorder.Bold = False
    CaptionGradient.Active = False
    CaptionGradient.Orientation = fgdHorizontal
    CaptionShift.X = 8
    CaptionShift.Y = 0
    Colors.Text = clHighlightText
    Colors.TextActive = clHighlightText
    Colors.Caption = clBtnShadow
    Colors.CaptionActive = clBtnShadow
    Colors.Client = clBtnFace
    Colors.ClientActive = clBtnFace
    Gradient.FromColor = clBlack
    Gradient.ToColor = clGray
    Gradient.Active = False
    Gradient.Orientation = fgdHorizontal
    Options = [fgoCanCollapse, fgoFilledCaption, fgoFluentlyCollapse, fgoFluentlyExpand, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
    FullHeight = 0
    object tbFiltro: TToolBar
      Left = 2
      Top = 16
      Width = 623
      Height = 30
      ButtonHeight = 26
      TabOrder = 0
      object tbTrabajadores: TToolBar
        Left = 0
        Top = 2
        Width = 439
        Height = 26
        Align = alNone
        BorderWidth = 1
        Caption = 'ToolBar'
        EdgeBorders = []
        Flat = True
        HotImages = imgGenColor
        Images = imgGenBW
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object tbRefrescarTrab: TToolButton
          Left = 0
          Top = 0
          Hint = 'Refrescar (F6)'
          Caption = 'tbRefrescarTrab'
          ImageIndex = 6
          OnClick = tbRefrescarTrabClick
        end
        object tbOrdenarLote: TToolButton
          Left = 23
          Top = 0
          Caption = 'tbOrdenarLote'
          ImageIndex = 7
          OnClick = tbOrdenarLoteClick
        end
        object tbLimpiarLotes: TToolButton
          Left = 46
          Top = 0
          Caption = 'tbLimpiar'
          ImageIndex = 5
          OnClick = tbLimpiarLotesClick
        end
        object pnlFiltroLote: TPanel
          Left = 69
          Top = 0
          Width = 365
          Height = 22
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            365
            22)
          object Label10: TLabel
            Left = 8
            Top = 4
            Width = 21
            Height = 13
            Caption = '&Lote'
            FocusControl = edDL_IDLOTE
          end
          object Label11: TLabel
            Left = 84
            Top = 4
            Width = 23
            Height = 13
            Caption = '&CUIL'
            FocusControl = fraTJ_CUIL.mskCUIL
          end
          object edDL_IDLOTE: TIntEdit
            Left = 32
            Top = 0
            Width = 49
            Height = 21
            TabOrder = 0
            OnChange = edDL_IDLOTEChange
          end
          inline fraTJ_CUIL: TfraTrabajadorAMP
            Left = 108
            Top = 0
            Width = 257
            Height = 22
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            DesignSize = (
              257
              22)
            inherited lbTrabCUIL: TLabel
              Width = 23
            end
            inherited mskCUIL: TMaskEdit
              Left = 4
              OnKeyPress = fraTJ_CUILmskCUILKeyPress
            end
            inherited cmbNombre: TArtComboBox
              Left = 88
              Width = 167
            end
          end
        end
      end
      object Panel1: TPanel
        Left = 439
        Top = 2
        Width = 325
        Height = 26
        BevelOuter = bvNone
        TabOrder = 1
        object Label7: TLabel
          Left = 89
          Top = 5
          Width = 57
          Height = 13
          Alignment = taRightJustify
          BiDiMode = bdLeftToRight
          Caption = ' Acreditado '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentBiDiMode = False
          ParentFont = False
        end
        object Label8: TLabel
          Left = 146
          Top = 5
          Width = 49
          Height = 13
          Alignment = taRightJustify
          BiDiMode = bdLeftToRight
          Caption = ' Debitado '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentBiDiMode = False
          ParentFont = False
        end
        object Label9: TLabel
          Left = 195
          Top = 5
          Width = 52
          Height = 13
          Alignment = taRightJustify
          BiDiMode = bdLeftToRight
          Caption = ' Pagado '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentFont = False
        end
        object Label13: TLabel
          Left = 247
          Top = 5
          Width = 48
          Height = 13
          Alignment = taRightJustify
          BiDiMode = bdLeftToRight
          Caption = 'Cargado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clPurple
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentFont = False
        end
        object chkPendientes: TCheckBox
          Left = 4
          Top = 6
          Width = 79
          Height = 14
          Alignment = taLeftJustify
          Caption = 'Pendientes'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
      end
    end
    object dbgLotes: TArtDBGrid
      Left = 2
      Top = 46
      Width = 623
      Height = 112
      Align = alClient
      DataSource = dsLotes
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = dbgLotesDblClick
      OnGetCellParams = dbgLotesGetCellParams
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'DL_IDLOTE'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'EST_COD'
          Title.Caption = 'C'#243'd. Estudio'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EST_TIPO'
          Title.Caption = 'Tipo Estudio.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EST_DESCRIP'
          Title.Caption = 'Descripci'#243'n Estudio'
          Width = 339
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TJ_CUIL'
          Title.Caption = 'Trabajador CUIL'
          Width = 103
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TJ_NOMBRE'
          Title.Caption = 'Trabajador Nombre'
          Width = 203
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ES_CONTRATO'
          Title.Caption = 'Estab. Contrato'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ES_NROESTABLECI'
          Title.Caption = 'Estab. N'#250'mero'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'ES_NOMBRE'
          Title.Caption = 'Estab. Nombre'
          Width = 308
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ES_DOMICILIO'
          Title.Caption = 'Estab. Domicilio'
          Width = 334
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ES_LOCALIDAD'
          Title.Caption = 'Estab. Localidad'
          Width = 155
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ES_CPOSTAL'
          Title.Caption = 'Estab. CP'
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ES_PROVINCIA'
          Title.Caption = 'Estab. Provincia'
          Width = 98
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EL_FECHARECIBIDO'
          Title.Caption = 'Recibido'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHARECEPMEDLAB'
          Title.Caption = 'Recepci'#243'n Lab.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHAEXAMEN'
          Title.Caption = 'Examen'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EM_CUIT'
          Title.Caption = 'Empresa CUIT'
          Width = 108
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EM_NOMBRE'
          Title.Caption = 'Empresa Nombre'
          Width = 298
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EL_OPERATIVO'
          Title.Caption = 'Operativo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ULT_OPERATIVO'
          Title.Caption = 'Ultimo Operativo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LE_IDPRESTADOR'
          Title.Caption = 'Prestador'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'CA_DESCRIPCION'
          Title.Caption = 'Prestador'
          Width = 404
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DL_DEBITO'
          Title.Caption = 'D'#233'bito'
          Width = 272
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTADO'
          Title.Caption = 'Estado'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MR_DESCRIPCION'
          Title.Caption = 'Rechazo'
          Width = 249
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DL_FECHAAPROBACION'
          Title.Caption = 'Aprobaci'#243'n'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DL_FECHADEBITO'
          Title.Caption = 'Fecha D'#233'bito'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DL_MOTIVODEBITO'
          Title.Caption = 'Motivo D'#233'bito'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DL_FECHARECONFIRMACION'
          Title.Caption = 'Reconfirmaci'#243'n'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FACTURA'
          Title.Caption = 'Factura'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VO_FECHAFACTURA'
          Title.Caption = 'Vto. Factura'
          Width = 106
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VO_NOTADEBITO'
          Title.Caption = 'Vto. D'#233'bito'
          Width = 112
          Visible = True
        end>
    end
  end
  inherited dsConsulta: TDataSource
    Left = 376
  end
  inherited sdqConsulta: TSDQuery
    Left = 404
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16462
        LinkControl = tbAgregar
      end
      item
        Key = 16461
        LinkControl = tbModificar
      end
      item
        Key = 16430
        LinkControl = tbQuitar
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16468
        LinkControl = tbTraerValores
      end
      item
        Key = 16463
        LinkControl = tbOrdenar
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 117
        LinkControl = tbRefrescarTrab
      end>
    Left = 376
  end
  inherited SortDialog: TSortDialog
    Left = 440
  end
  inherited ExportDialog: TExportDialog
    Fields = <
      item
        DataField = 'ET_PERIODO'
        Title = 'Per'#237'odo'
      end
      item
        DataField = 'ET_CUIT'
        Title = 'CUIT'
      end
      item
        DataField = 'MP_CONTRATO'
        Title = 'Contrato'
      end
      item
        DataField = 'MP_NOMBRE'
        Title = 'Raz'#243'n Social'
      end
      item
        DataField = 'ET_ESTABLECI'
        Title = 'Estab.'
      end
      item
        DataField = 'ET_CUIL'
        Title = 'CUIL'
      end
      item
        DataField = 'TJ_NOMBRE'
        Title = 'Nombre Trabajador'
      end
      item
        DataField = 'ET_FECHA'
        Title = 'F.Estudio'
      end
      item
        DataField = 'ES_DESCRIPCION'
        Title = 'Estudio'
      end
      item
        DataField = 'ET_RESULTADO'
        Title = 'Resultado'
      end
      item
        DataField = 'ET_TIPORES'
        Title = 'Tipo Res.'
      end
      item
        DataField = 'ET_IDCARPETAAMP'
        Title = 'Carpeta Dig.'
      end
      item
        DataField = 'TIPOAUDIOMETRIA'
        Title = 'Tipo de Audiometria'
      end>
    Left = 468
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        MaxLength = 0
      end
      item
        MaxLength = 0
      end
      item
        MaxLength = 0
      end
      item
        MaxLength = 0
      end
      item
        MaxLength = 0
      end
      item
        MaxLength = 0
      end
      item
        MaxLength = 0
      end
      item
        MaxLength = 0
      end
      item
        MaxLength = 0
      end
      item
        MaxLength = 0
      end>
    Left = 468
  end
  inherited Seguridad: TSeguridad
    Left = 504
  end
  inherited PrintDialog: TPrintDialog
    Left = 440
  end
  inherited FormStorage: TFormStorage
    Left = 404
  end
  inherited pmnuImpresion: TPopupMenu
    Left = 504
  end
  inherited imgGenBW: TImageList
    Left = 404
  end
  inherited imgGenColor: TImageList
    Left = 376
  end
  inherited sdqHistCarpetas: TSDQuery
    Left = 536
  end
  inherited dsHistCarpetas: TDataSource
    Left = 565
  end
  object dsLotes: TDataSource
    DataSet = sdqLotes
    Left = 32
    Top = 400
  end
  object sdqLotes: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqLotesAfterScroll
    SQL.Strings = (
      '  SELECT hdl.dl_idlote,'
      '         hdl.dl_idestableci,'
      '         hdl.dl_idtrabajador,'
      '         hdl.dl_idestudio,'
      '         aes.es_nroestableci,'
      '         aes.es_nombre,'
      '         aes.es_domicilio,'
      '         aes.es_localidad,'
      '         aes.es_cpostal,'
      '         aes.es_provincia,'
      '         tj_cuil,'
      '         tj_nombre,'
      '         est.es_codigo est_cod,'
      '         DECODE(el_operativo, '#39'R'#39', '#39'R'#39', '#39'EP'#39') est_tipo,'
      '         est.es_descripcion est_descrip,'
      '         el_fecharecibido,'
      '         el_fecharecepucap fecharecepmedlab,'
      '         dl_fecharealizacion fechaexamen,'
      '         em_cuit,'
      '         em_nombre,'
      '         aes.es_contrato,'
      '         el_operativo,'
      '         EXTRACT(YEAR FROM le_fechaalta) fechaalta,'
      
        '         (EXTRACT(YEAR FROM le_fechaalta) || DECODE(el_operativo' +
        ', '#39'A'#39', '#39'01'#39', '#39'06'#39')) ult_operativo,'
      '         le_idprestador,'
      '         es_descripcion,'
      '         art.cpr_prestador.ca_descripcion,'
      '         art.cpr_prestador.ca_descripcion dl_debito,'
      '         NVL2('
      '              dl_fecharealizacion,'
      '              NVL2('
      '                   dl_motivodebito,'
      '                   '#39'DEBITADO'#39','
      '                   '#39'APROBADO'#39
      '                  ),'
      '              '#39#39
      '             )'
      '           estado,'
      '         mr_descripcion,'
      '         dl_fechaaprobacion,'
      '         dl_fechadebito,'
      '         dl_motivodebito,'
      '         dl_fechareconfirmacion,'
      '         NVL2('
      '              vo_facturatipo,'
      
        '              vo_facturatipo || '#39'-'#39' || vo_facturaestable || '#39'-'#39' ' +
        '|| vo_facturanro,'
      '              NULL'
      '             )'
      '           factura,'
      '         vo_fechafactura,'
      '         NVL2('
      '              dl_motivodebito,'
      '              vo_notadebito,'
      '              NULL'
      '             )'
      '           vo_notadebito,'
      '         ca_descripcion,'
      '         hdl.dl_fecha_cargaamp'
      '    FROM comunes.ctj_trabajador,'
      '         afi.aem_empresa,'
      '         afi.aco_contrato,'
      '         afi.aes_establecimiento aes,'
      '         art.cpr_prestador,'
      '         hys.hle_loteestudio,'
      '         hys.hel_estadolote,'
      '         hys.hdl_detallelote hdl,'
      '         art.aes_estudios est,'
      '         hys.hmr_motivorechazo,'
      '         art.sif_itemfacturaamp,'
      '         art.svo_volantes'
      '   WHERE ((dl_fechabaja IS NULL)'
      '       OR ((dl_fechabaja IS NOT NULL)'
      '       AND EXISTS (SELECT 1'
      '                     FROM hys.hel_estadolote,'
      '                          hys.hrl_relevamientolote'
      '                    WHERE el_estado IN (SELECT de_codigo'
      
        '                                          FROM hys.hde_descripci' +
        'onestadolote'
      
        '                                         WHERE de_versegestudio ' +
        '= '#39'S'#39')'
      '                      AND rl_id = el_rlid'
      '                      AND rl_idestableci = dl_idestableci'
      '                      AND el_idlote = dl_idlote)))'
      '     AND tj_id = dl_idtrabajador'
      '     AND est.es_id = dl_idestudio'
      '     AND mr_id(+) = dl_motivodebito'
      '     AND if_id(+) = dl_iddetvolante'
      '     AND vo_volante(+) = if_idvolante'
      '     AND aes.es_id = dl_idestableci'
      '     AND co_contrato = es_contrato'
      '     AND em_id = co_idempresa'
      '     AND el_idlote = dl_idlote'
      '     AND el_idlote = le_id'
      '     AND ca_identificador = le_idprestador')
    Left = 64
    Top = 400
  end
  object SortDialogLotes: TSortDialog
    Caption = 'Orden'
    DataSet = sdqLotes
    SortFields = <>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 96
    Top = 400
  end
  object sdqOperativosDups: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      '  SELECT  hrl.rl_idestableci,'
      '          EXTRACT (YEAR FROM le_fechaalta)'
      '    FROM  hys.hle_loteestudio hle,'
      '          hys.hel_estadolote hel,'
      '          hys.hrl_relevamientolote hrl,'
      '          hys.hde_descripcionestadolote'
      '   WHERE  hle.le_id = hel.el_idlote'
      '      AND hel.el_rlid = hrl.rl_id'
      '      AND el_operativo <> '#39'R'#39
      '      AND de_codigo = el_estado'
      '      AND TRUNC(de_valor) <> 10'
      '      AND rl_idestableci = :id_estab'
      '      AND EXTRACT (YEAR FROM le_fechaalta) = :anio'
      '      AND el_operativo = :operativo'
      'GROUP BY  hrl.rl_idestableci,'
      '          EXTRACT (YEAR FROM le_fechaalta),'
      '          hel.el_operativo'
      '  HAVING  COUNT (*) > 1')
    Left = 64
    Top = 432
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_estab'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'anio'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'operativo'
        ParamType = ptInput
      end>
  end
end
