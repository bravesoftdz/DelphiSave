object fraReclamoSentencia: TfraReclamoSentencia
  Left = 0
  Top = 0
  Width = 658
  Height = 438
  TabOrder = 0
  object dbReclamos: TArtDBGrid
    Left = 0
    Top = 29
    Width = 658
    Height = 409
    Align = alClient
    DataSource = dsReclamos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnGetCellParams = dbReclamosGetCellParams
    OnPaintFooter = dbReclamosPaintFooter
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'RC_DESCRIPCION'
        Title.Caption = 'Reclamo'
        Width = 222
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RT_MONTODEMANDADO'
        Title.Caption = 'Monto Demandado'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RT_MONTOSENTENCIA'
        Title.Caption = 'Monto Sentencia'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RT_MONTOAPAGAR'
        Title.Caption = 'Monto a Pagar'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RT_PORCENTAJESENTENCIA'
        Title.Caption = '% Sentencia'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RT_PORCENTAJEINCAPACIDAD'
        Title.Caption = '% Incapacidad'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RT_ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'RT_IDRECLAMO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'RT_IDJUICIOENTRAMITE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'RT_FECHABAJA'
        Visible = False
      end>
  end
  object cbReclamoSentencia: TCoolBar
    Left = 0
    Top = 0
    Width = 658
    Height = 29
    Bands = <
      item
        Control = tbrReclamo
        ImageIndex = -1
        MinHeight = 27
        Width = 654
      end>
    object tbrReclamo: TToolBar
      Left = 9
      Top = 0
      Width = 641
      Height = 27
      BorderWidth = 1
      Caption = 'ToolBar'
      EdgeBorders = []
      Flat = True
      HotImages = dmLegales.ilByN
      Images = dmLegales.ilColor
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object tbNuevoReclamo: TToolButton
        Left = 0
        Top = 0
        Hint = 'Nuevo'
        ImageIndex = 6
        OnClick = tbNuevoReclamoClick
      end
      object tbEdicionReclamo: TToolButton
        Left = 23
        Top = 0
        Hint = 'Modificar'
        ImageIndex = 7
        OnClick = tbEdicionReclamoClick
      end
      object tbBajaReclamo: TToolButton
        Left = 46
        Top = 0
        Hint = 'Eliminar'
        ImageIndex = 8
        OnClick = tbBajaReclamoClick
      end
      object ToolButton2: TToolButton
        Left = 69
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object tbImprimirReclamos: TToolButton
        Left = 77
        Top = 0
        Hint = 'Imprimir Reclamos'
        ImageIndex = 4
        Visible = False
      end
    end
  end
  object fpReclamo: TFormPanel
    Left = 72
    Top = 74
    Width = 521
    Height = 258
    Caption = 'Reclamo'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biMinimize]
    OnBeforeShow = fpReclamoBeforeShow
    DesignSize = (
      521
      258)
    object bvSeparadorBotones: TBevel
      Left = 9
      Top = 220
      Width = 508
      Height = 5
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object btnAceptarReclamo: TButton
      Left = 354
      Top = 228
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarReclamoClick
    end
    object btnCancelarReclamo: TButton
      Left = 436
      Top = 228
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object ScrollBox1: TScrollBox
      Left = 0
      Top = 6
      Width = 519
      Height = 211
      Anchors = [akTop, akRight]
      AutoSize = True
      BevelOuter = bvNone
      BorderStyle = bsNone
      TabOrder = 2
      object pnImporteReclamo: TPanel
        Left = 0
        Top = 37
        Width = 519
        Height = 71
        Align = alTop
        Anchors = []
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          519
          71)
        object lblImporteDemandado: TLabel
          Left = 6
          Top = 9
          Width = 99
          Height = 13
          Caption = 'Importe Demandado:'
        end
        object lblPor: TLabel
          Left = 6
          Top = 50
          Width = 19
          Height = 13
          Caption = 'Por:'
        end
        object pnReclamoIncapacidad: TPanel
          Left = 185
          Top = 6
          Width = 328
          Height = 63
          Anchors = []
          BevelOuter = bvNone
          TabOrder = 3
          object lblPorcentajeIncapacidadDemanda: TLabel
            Left = 125
            Top = 2
            Width = 70
            Height = 13
            Caption = 'Inc. Demanda:'
          end
          object Label1: TLabel
            Left = 124
            Top = 43
            Width = 131
            Height = 13
            Caption = 'Incapacidad Segun Peritos:'
          end
          object Label2: TLabel
            Left = 309
            Top = 42
            Width = 8
            Height = 13
            Caption = '%'
          end
          object lnlPorcentajeIncapacidad: TLabel
            Left = 309
            Top = 5
            Width = 8
            Height = 13
            Caption = '%'
          end
          object edPorcentajeIncapacidadDemanda: TCurrencyEdit
            Left = 257
            Top = 0
            Width = 46
            Height = 21
            AutoSize = False
            DisplayFormat = ' ,0.00;- ,0.00'
            MaxValue = 100.000000000000000000
            TabOrder = 1
          end
          object edPorcentajeIncapacidadSegunPerito: TCurrencyEdit
            Left = 259
            Top = 40
            Width = 46
            Height = 21
            AutoSize = False
            DisplayFormat = ' ,0.00;- ,0.00'
            MaxValue = 100.000000000000000000
            TabOrder = 2
          end
          object cbIndeterminadoIncDem: TCheckBox
            Left = 215
            Top = 23
            Width = 89
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Indeterminado'
            TabOrder = 0
            OnClick = cbIndeterminadoIncDemClick
          end
        end
        object edtImporteDemandadoReclamo: TCurrencyEdit
          Left = 120
          Top = 6
          Width = 63
          Height = 21
          AutoSize = False
          DisplayFormat = '$,0.00;-$,0.00'
          TabOrder = 0
        end
        object cmbPor: TExComboBox
          Left = 120
          Top = 46
          Width = 185
          Height = 22
          Style = csOwnerDrawFixed
          ItemHeight = 16
          TabOrder = 2
          Items.Strings = (
            'A=Accidente'
            'E=Enfermedad'
            'T=Accidente y Enfermedad')
          ItemIndex = -1
          Options = []
          ValueWidth = 64
        end
        object cbIndeterminado: TCheckBox
          Left = 120
          Top = 29
          Width = 87
          Height = 17
          Caption = 'Indeterminado'
          TabOrder = 1
          OnClick = cbIndeterminadoClick
        end
      end
      object pnImporteSentencia: TPanel
        Left = 0
        Top = 130
        Width = 519
        Height = 51
        Align = alTop
        Anchors = []
        BevelOuter = bvNone
        TabOrder = 3
        object lblImporteSentencia: TLabel
          Left = 4
          Top = 8
          Width = 111
          Height = 13
          Caption = 'Importe Capital s/Sent.:'
        end
        object lblTituloPorcentajeSolidario: TLabel
          Left = 196
          Top = 9
          Width = 97
          Height = 13
          Caption = 'Porcentaje Solidario:'
        end
        object lblPorcentajeSolidario: TLabel
          Left = 495
          Top = 9
          Width = 8
          Height = 13
          Caption = '%'
        end
        object lblImporteAPagar: TLabel
          Left = 4
          Top = 32
          Width = 113
          Height = 13
          Caption = 'Importe Capital a Pagar:'
        end
        object Label3: TLabel
          Left = 195
          Top = 33
          Width = 54
          Height = 13
          Caption = 'Siniestro(s):'
        end
        object ceImporteSentencia: TCurrencyEdit
          Left = 120
          Top = 4
          Width = 64
          Height = 21
          AutoSize = False
          DisplayFormat = '$,0.00;-$,0.00'
          TabOrder = 0
        end
        object cePorcentajeSolidario: TCurrencyEdit
          Left = 445
          Top = 3
          Width = 46
          Height = 21
          AutoSize = False
          DisplayFormat = ' ,0.00;- ,0.00'
          MaxValue = 100.000000000000000000
          TabOrder = 1
        end
        object ceImporteAPagar: TCurrencyEdit
          Left = 120
          Top = 28
          Width = 64
          Height = 21
          AutoSize = False
          DisplayFormat = '$,0.00;-$,0.00'
          TabOrder = 2
        end
        object edSiniestros: TEdit
          Left = 258
          Top = 28
          Width = 233
          Height = 21
          ReadOnly = True
          TabOrder = 3
        end
      end
      object pnOrigenDemanda: TPanel
        Left = 0
        Top = 181
        Width = 519
        Height = 30
        Align = alTop
        Anchors = []
        BevelOuter = bvNone
        TabOrder = 4
        Visible = False
        DesignSize = (
          519
          30)
        object lblOrigenanteRelacionado: TLabel
          Left = 5
          Top = 8
          Width = 34
          Height = 13
          Caption = 'Origen:'
        end
        inline fraOrigenReclamoRelacionado: TfraCodigoDescripcion
          Left = 120
          Top = 6
          Width = 373
          Height = 23
          Anchors = []
          Color = clBtnFace
          ParentColor = False
          TabOrder = 0
          OnResize = fraOrigenReclamoRelacionadoResize
          DesignSize = (
            373
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 68
            Top = 0
            Width = 305
            Anchors = [akLeft, akRight]
          end
          inherited edCodigo: TPatternEdit
            Left = 0
            Top = 0
            Width = 65
          end
        end
      end
      object pnl1: TPanel
        Left = 0
        Top = 0
        Width = 519
        Height = 37
        Align = alTop
        Anchors = []
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          519
          37)
        object lblReclamo: TLabel
          Left = 5
          Top = 15
          Width = 45
          Height = 13
          Caption = 'Reclamo:'
        end
        inline fraReclamo: TfraCodigoDescripcion
          Left = 120
          Top = 8
          Width = 373
          Height = 23
          Anchors = []
          TabOrder = 0
          OnResize = fraReclamoResize
          DesignSize = (
            373
            23)
          inherited cmbDescripcion: TArtComboBox
            Left = 60
            Width = 311
            Anchors = [akLeft, akRight]
          end
          inherited edCodigo: TPatternEdit
            Left = 0
            Width = 58
          end
        end
        object tbReclamo: TToolBar
          Left = 61
          Top = 7
          Width = 29
          Height = 26
          Align = alNone
          Anchors = [akTop, akRight]
          BorderWidth = 1
          Caption = 'ToolBar'
          EdgeBorders = []
          Flat = True
          HotImages = frmPrincipal.ilColor
          Images = frmPrincipal.ilByN
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Visible = False
          object tbEditarReclamos: TToolButton
            Left = 0
            Top = 0
            Hint = 'Editar'
            ImageIndex = 6
            OnClick = tbEditarReclamosClick
          end
        end
      end
      object pnl2: TPanel
        Left = 0
        Top = 108
        Width = 519
        Height = 22
        Align = alTop
        Anchors = []
        BevelOuter = bvNone
        TabOrder = 2
        Visible = False
        OnResize = pnl2Resize
        object lblImporteNominal: TLabel
          Left = 4
          Top = 4
          Width = 79
          Height = 13
          Caption = 'Importe Nominal:'
        end
        object Label5: TLabel
          Left = 196
          Top = 4
          Width = 46
          Height = 13
          Caption = 'Intereses:'
        end
        object lbMontoDemanda: TLabel
          Left = 328
          Top = 4
          Width = 94
          Height = 13
          Caption = 'Monto Demandado:'
        end
        object edImporteNominal: TCurrencyEdit
          Left = 120
          Top = 0
          Width = 63
          Height = 21
          AutoSize = False
          DisplayFormat = '$,0.00;-$,0.00'
          TabOrder = 0
          OnChange = edImporteNominalChange
        end
        object edIntereses: TCurrencyEdit
          Left = 256
          Top = 0
          Width = 63
          Height = 21
          AutoSize = False
          DisplayFormat = '$,0.00;-$,0.00'
          TabOrder = 1
          OnChange = edInteresesChange
        end
        object edMontoDemanda: TCurrencyEdit
          Left = 428
          Top = 0
          Width = 63
          Height = 21
          AutoSize = False
          DisplayFormat = '$,0.00;-$,0.00'
          TabOrder = 2
        end
      end
    end
  end
  object dsReclamos: TDataSource
    DataSet = sdqReclamoJuicioEnTramite
    Left = 252
    Top = 56
  end
  object sdqReclamoJuicioEnTramite: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT rt_id, rt_idjuicioentramite, rt_idreclamo, rt_idorigendem' +
        'anda, rt_montodemandado, rt_montosentencia,'
      
        '       rt_porcentajesentencia, rt_porcentajeincapacidad, rt_porc' +
        'entajeincapacidadperito, rt_usualta, rt_fechaalta, rt_usumodif,'
      
        '       rt_fechamodif, rt_usubaja, rt_fechabaja, rt_montoapagar, ' +
        'rt_importenominal, rt_intereses, rt_origen, rt_indeterminado, RT' +
        '_INDETERMINADOINCDEM,'
      '       rc_descripcion, rt_fechabaja'
      
        '  FROM legales.lrt_reclamojuicioentramite recj, legales.lrc_recl' +
        'amo rec'
      ' WHERE recj.rt_idjuicioentramite = :idjuicioentramite'
      '   AND recj.rt_idreclamo = rec.rc_id')
    Left = 220
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idjuicioentramite'
        ParamType = ptInput
        Value = '0'
      end>
  end
  object sdqSiniestros: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT rt_id, rt_idjuicioentramite, rt_idreclamo,'
      
        '       rt_montodemandado, rt_montosentencia, rt_porcentajesenten' +
        'cia,'
      '       rt_porcentajeincapacidad, rc_descripcion, rt_fechabaja,'
      '       RT_PORCENTAJEINCAPACIDADPERITO, rt_montoapagar'
      'FROM legales.lrt_reclamojuicioentramite  recj,'
      '     legales.lrc_reclamo rec'
      'WHERE recj.rt_idjuicioentramite = :idjuicioentramite'
      '      and recj.rt_idreclamo = rec.rc_id'
      '')
    Left = 83
    Top = 292
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idjuicioentramite'
        ParamType = ptInput
        Value = '0'
      end>
  end
end
