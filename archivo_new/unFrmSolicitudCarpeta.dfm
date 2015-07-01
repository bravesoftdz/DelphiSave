object FrmSolicitudCarpeta: TFrmSolicitudCarpeta
  Left = 167
  Top = 91
  Width = 723
  Height = 551
  BorderIcons = [biMinimize, biMaximize]
  Caption = 'Solicitud de Carpetas'
  Color = clBtnFace
  Constraints.MinHeight = 479
  Constraints.MinWidth = 723
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefaultPosOnly
  OnClose = FSFormClose
  OnCloseQuery = FSFormCloseQuery
  OnDestroy = FSFormDestroy
  OnShow = FSFormShow
  StatusBar = frmPrincipal.sbEstado
  AutoTabs = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnGrilla: TPanel
    Left = 0
    Top = 309
    Width = 715
    Height = 215
    Align = alClient
    Caption = 'pnGrilla'
    TabOrder = 0
    object dbgEnvio: TArtDBGrid
      Left = 1
      Top = 30
      Width = 713
      Height = 184
      Align = alClient
      DataSource = dsEnvio
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      IniStorage = FormStorage
      FooterBand = False
      TitleHeight = 32
      Columns = <
        item
          Expanded = False
          FieldName = 'TIPOARCHIVO'
          Title.Caption = 'Archivo'
          Width = 103
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPCIONCLAVE'
          Title.Caption = 'Descripci'#243'n'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPOUBICACION'
          Title.Caption = 'Tipo Ubicaci'#243'n'
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UBICACION'
          Title.Caption = 'Ubicaci'#243'n'
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHASOLICITUD'
          Title.Caption = 'F.Solicitud'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPOSOLICITUD'
          Title.Caption = 'Tipo Solicitud'
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHAMOVIMIENTO'
          Title.Caption = 'Fecha Movimiento'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CAJA'
          Title.Caption = 'Caja'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OBSERVACION'
          Title.Caption = 'Observaciones'
          Width = 147
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDTIPOCLAVE'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'CLAVE'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'IDARCHIVO'
          Title.Caption = 'Cod. Archivo'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'IDTIPOARCHIVO'
          Title.Caption = 'C'#243'digo Tipo Archivo'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'FECHABAJA'
          Title.Caption = 'Fecha Baja'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HORASOLICITUD'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'CONTRATOCD'
          Title.Alignment = taCenter
          Title.Caption = 'Contrato Carta Doc.'
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NROEXPEDIENTECD'
          Title.Alignment = taCenter
          Title.Caption = 'Expediente Carta Doc.'
          Width = 114
          Visible = True
        end>
    end
    object CoolBar: TCoolBar
      Left = 1
      Top = 1
      Width = 713
      Height = 29
      Bands = <
        item
          Control = ToolBar
          ImageIndex = -1
          MinHeight = 26
          Width = 709
        end>
      object ToolBar: TToolBar
        Left = 9
        Top = 0
        Width = 696
        Height = 26
        BorderWidth = 1
        Caption = 'ToolBar'
        EdgeBorders = []
        Flat = True
        HotImages = frmPrincipal.ilColor
        Images = frmPrincipal.ilByN
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object tbEliminar: TToolButton
          Left = 0
          Top = 0
          Hint = 'Eliminar (Ctrl+Del)'
          ImageIndex = 8
          OnClick = tbEliminarClick
        end
        object TToolButton
          Left = 23
          Top = 0
          Width = 8
          ImageIndex = 3
          Style = tbsSeparator
          Visible = False
        end
        object tbImprimir: TToolButton
          Left = 31
          Top = 0
          Hint = 'Imprimir (Ctrl+I)'
          ImageIndex = 4
          OnClick = tbImprimirClick
        end
        object TToolButton
          Left = 54
          Top = 0
          Width = 8
          ImageIndex = 6
          Style = tbsSeparator
        end
        object tbSalir: TToolButton
          Left = 62
          Top = 0
          Hint = 'Salir (Ctrl+S)'
          ImageIndex = 5
          OnClick = tbSalirClick
        end
        object TToolButton
          Left = 85
          Top = 0
          Width = 7
          ImageIndex = 6
          Style = tbsSeparator
        end
        object pnColores: TPanel
          Left = 92
          Top = 0
          Width = 412
          Height = 22
          BevelOuter = bvNone
          TabOrder = 0
          object lblReferenciaPeriodoEstimado: TLabel
            Left = 51
            Top = 5
            Width = 82
            Height = 13
            Caption = 'Solicitud Cursada'
          end
          object pnColorSolicitudCursada: TPanel
            Left = 30
            Top = 5
            Width = 16
            Height = 12
            BevelOuter = bvNone
            Color = 14811135
            TabOrder = 0
          end
        end
      end
    end
  end
  object pnSeleccion: TPanel
    Left = 0
    Top = 0
    Width = 715
    Height = 309
    Align = alTop
    TabOrder = 1
    DesignSize = (
      715
      309)
    object gbCarpeta: TGroupBox
      Left = 134
      Top = 2
      Width = 575
      Height = 175
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Carpeta '
      TabOrder = 0
      DesignSize = (
        575
        175)
      object lblUbicacion: TLabel
        Left = 10
        Top = 127
        Width = 45
        Height = 13
        Caption = 'Ubicaci'#243'n'
      end
      object Label1: TLabel
        Left = 4
        Top = 145
        Width = 54
        Height = 26
        Caption = 'Est. Legal/ Abogado'
        WordWrap = True
      end
      object btnAgregarSolicitud: TButton
        Left = 492
        Top = 124
        Width = 75
        Height = 22
        Anchors = [akTop, akRight]
        Caption = '&Agregar'
        TabOrder = 0
        OnClick = btnAgregarSolicitudClick
      end
      inline fraCarpeta: TfraFiltroArchivo
        Left = 8
        Top = 15
        Width = 559
        Height = 103
        VertScrollBar.Visible = False
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        inherited pcFormulario: TJvPageControl
          Width = 559
          inherited tsSiniestro: TTabSheet
            inherited lbRSocial: TLabel
              FocusControl = fraCarpeta.fraEmpresaSiniestro.cmbRSocial
            end
          end
          inherited tsBiblioratoNota: TTabSheet
            inherited lbCUIT: TLabel
              FocusControl = fraCarpeta.fraEmpresaNota.mskCUIT
            end
          end
          inherited tsExtractoBanc: TTabSheet
            inherited fraBancoExtracto: TfraStaticCodigoDescripcion
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
            inherited fraCuentaBancariaExtracto: TfraStaticCodigoDescripcion
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
          end
        end
        inherited pnSeleccionArchivo: TPanel
          Width = 559
          DesignSize = (
            559
            24)
          inherited btnCargarCodigoBarras: TJvXPButton
            Left = 462
          end
          inherited fraTipoArchivo: TfraCodDesc
            Width = 401
            DesignSize = (
              401
              23)
            inherited cmbDescripcion: TArtComboBox
              Width = 338
            end
            inherited Propiedades: TPropiedadesFrame
              OnChange = fraTipoArchivoPropiedadesChange
            end
          end
        end
      end
      object edTipoUbicacion: TEdit
        Left = 60
        Top = 124
        Width = 201
        Height = 21
        TabStop = False
        Color = 15724780
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object edUbicacion: TEdit
        Left = 264
        Top = 124
        Width = 223
        Height = 21
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        Color = 15724780
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object edAbogado: TEdit
        Left = 60
        Top = 148
        Width = 427
        Height = 21
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        Color = 15724780
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
    end
    object gbObservaciones: TGroupBox
      Left = 5
      Top = 236
      Width = 705
      Height = 69
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Observaciones'
      TabOrder = 4
      DesignSize = (
        705
        69)
      object mObservaciones: TMemo
        Left = 6
        Top = 15
        Width = 692
        Height = 48
        Anchors = [akLeft, akTop, akRight, akBottom]
        MaxLength = 250
        TabOrder = 0
      end
    end
    object rgTipoSolicitud: TRadioGroup
      Left = 5
      Top = 3
      Width = 125
      Height = 84
      Caption = ' Tipo de Solicitud '
      ItemIndex = 2
      Items.Strings = (
        '&2 Horas'
        '&4 Horas'
        '24 &Horas')
      TabOrder = 1
    end
    object GroupBox1: TGroupBox
      Left = 5
      Top = 87
      Width = 125
      Height = 45
      TabOrder = 2
      object chkTodosContratosCUIT: TCheckBox
        Left = 4
        Top = 13
        Width = 116
        Height = 24
        Caption = 'Todos los contratos del CUIT'
        Enabled = False
        TabOrder = 0
        WordWrap = True
      end
    end
    object gbBusquedaGeneral2: TGroupBox
      Left = 5
      Top = 177
      Width = 705
      Height = 59
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
      DesignSize = (
        705
        59)
      object CUIL: TLabel
        Left = 5
        Top = 35
        Width = 23
        Height = 13
        Caption = 'CUIL'
      end
      object lbCUIT: TLabel
        Left = 5
        Top = 15
        Width = 24
        Height = 13
        Caption = 'CUIT'
      end
      inline fraEmpresaCD: TfraEmpresa
        Left = 35
        Top = 10
        Width = 663
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
        TabStop = True
        DesignSize = (
          663
          21)
        inherited lbContrato: TLabel
          Left = 559
        end
        inherited edContrato: TIntEdit
          Left = 606
        end
        inherited cmbRSocial: TArtComboBox
          Width = 424
        end
      end
      inline fraTrabajadorSiniestroCD: TfraTrabajadorSiniestro
        Left = 35
        Top = 33
        Width = 664
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        DesignSize = (
          664
          21)
        inherited lbSiniestro: TLabel
          Left = 498
        end
        inherited cmbNombre: TArtComboBox
          Width = 411
        end
        inherited edSiniestro: TSinEdit
          Left = 563
        end
        inherited ToolBar: TToolBar
          Left = 540
          inherited tbLimpiar: TToolButton
            Hint = 'Limpiar'
            OnClick = fraTrabajadorSiniestroCDtbLimpiarClick
          end
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 5
      Top = 132
      Width = 125
      Height = 45
      TabOrder = 3
      object chkTodosEstablContrato: TCheckBox
        Left = 4
        Top = 13
        Width = 116
        Height = 24
        Caption = 'Todos los establec. del contrato'
        Enabled = False
        TabOrder = 0
        WordWrap = True
      end
    end
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT ar_id IdArchivo, ar_tipo IdTipoArchivo, ta_descripcion Ti' +
        'poArchivo, ta_fechabaja FechaBaja,'
      '       DECODE (ar_tipoubicacion,'
      '               '#39'D'#39', '#39'Delegaci'#243'n'#39','
      '               '#39'L'#39', '#39'Lugar'#39','
      '               '#39'S'#39', '#39'Sector'#39','
      '               '#39'U'#39', '#39'Usuario'#39','
      '               '#39'G'#39', '#39'Administradora'#39'               '
      '              ) TipoUbicacion,'
      '       art.archivo.getubicacionnombre (ar_tipoubicacion,'
      '                                       ar_ubicacion'
      '                                      ) Ubicacion,'
      '       ar_fechamovimiento FechaMovimiento, ar_caja Caja, '
      
        '       archivo.getdescripcionclave (tc_id, ar_clave) Descripcion' +
        'Clave,'
      
        '       sc_fechasolicitud FechaSolicitud, sc_horasolicitud HoraSo' +
        'licitud, sc_usuariosolicitud UsuarioSolicitud,'
      '       DECODE (sc_tiposolicitud,'
      '               '#39'1'#39', '#39'2 HORAS'#39','
      '               '#39'2'#39', '#39'4 HORAS'#39','
      '               '#39'3'#39', '#39'24 HORAS'#39
      '              ) TipoSolicitud,'
      
        '       sc_fechaimpresion FechaImpresion, sc_fecharecepcion Fecha' +
        'Recepcion, sc_observaciones Observacion,'
      
        '       sc_usuarioimpresion UsuarioImpresion, tc_id IdTipoClave, ' +
        'ar_clave Clave'
      '  FROM rar_archivo r,'
      '       rta_tipoarchivo t,'
      '       rtc_tipoclave c,'
      '       rsc_solicitudcarpeta s'
      
        ' WHERE ar_tipo = ta_id AND ta_formulario = tc_clave AND sc_idarc' +
        'hivo = ar_id'
      ' order by sc_id desc '
      ''
      '')
    Left = 24
    Top = 356
  end
  object dsEnvio: TDataSource
    DataSet = sdqDatos
    Left = 52
    Top = 356
  end
  object qpEnvio: TQueryPrint
    Border.Lines = [blTop, blLeft, blRight, blBottom]
    Fields = <>
    DataSource = dsEnvio
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Env'#237'o de Documentaci'#243'n'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -11
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = clWhite
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLines = [glHorizontal, glVertical]
    Detail.GridLinesWidth = 0
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Color = 14079702
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Color = 12961221
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLetter
    Margins.Left = 10
    Margins.Right = 10
    PrinterOptions.PrintDialog = PrintDialog
    Left = 24
    Top = 384
  end
  object PrintDialog: TPrintDialog
    Left = 52
    Top = 328
  end
  object FormStorage: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 80
    Top = 328
  end
  object ShortCuts: TShortCutControl
    ShortCuts = <
      item
        Key = 16430
        LinkControl = tbEliminar
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end>
    Left = 24
    Top = 328
  end
end
