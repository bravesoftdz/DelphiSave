inherited frmGestionDeVisitas: TfrmGestionDeVisitas
  Left = 174
  Top = 162
  Caption = 'Gesti'#243'n de Visitas'
  ClientHeight = 612
  ClientWidth = 962
  Constraints.MinHeight = 600
  Constraints.MinWidth = 970
  Font.Name = 'Tahoma'
  Position = poScreenCenter
  OnActivate = FSFormActivate
  ExplicitWidth = 970
  ExplicitHeight = 642
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Top = 30
    Width = 962
    Height = 249
    Visible = True
    ExplicitTop = 30
    ExplicitWidth = 962
    ExplicitHeight = 249
    DesignSize = (
      962
      249)
    object lblDescripcionFiltro: TLabel
      Left = 241
      Top = 8
      Width = 25
      Height = 13
      Caption = 'Visita'
    end
    object Label5: TLabel
      Left = 476
      Top = 55
      Width = 61
      Height = 13
      Caption = 'Responsable'
    end
    object Label6: TLabel
      Left = 165
      Top = 8
      Width = 10
      Height = 13
      Caption = 'Id'
    end
    object Label7: TLabel
      Left = 606
      Top = 7
      Width = 75
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Fecha creaci'#243'n '
      ExplicitLeft = 692
    end
    object Label8: TLabel
      Left = 692
      Top = 30
      Width = 18
      Height = 13
      Anchors = [akTop, akRight]
      Caption = ' >> '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 778
    end
    object Label9: TLabel
      Left = 692
      Top = 76
      Width = 18
      Height = 13
      Anchors = [akTop, akRight]
      Caption = ' >> '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 778
    end
    object Label10: TLabel
      Left = 606
      Top = 54
      Width = 84
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Fecha finalizaci'#243'n'
      ExplicitLeft = 692
    end
    object Label11: TLabel
      Left = 9
      Top = 101
      Width = 41
      Height = 13
      Caption = 'Empresa'
    end
    object Label13: TLabel
      Left = 474
      Top = 8
      Width = 115
      Height = 13
      Caption = 'Motivo de no realizaci'#243'n'
    end
    object Label2: TLabel
      Left = 606
      Top = 99
      Width = 57
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Fecha visita'
      ExplicitLeft = 692
    end
    object Label4: TLabel
      Left = 692
      Top = 120
      Width = 18
      Height = 13
      Anchors = [akTop, akRight]
      Caption = ' >> '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 778
    end
    object Label17: TLabel
      Left = 166
      Top = 55
      Width = 64
      Height = 13
      Caption = 'Usuario visita'
    end
    object Label19: TLabel
      Left = 606
      Top = 145
      Width = 89
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Fecha vencimiento'
      ExplicitLeft = 692
    end
    object Label20: TLabel
      Left = 692
      Top = 165
      Width = 18
      Height = 13
      Anchors = [akTop, akRight]
      Caption = ' >> '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 778
    end
    inline fraVI_IDVISITA: TfraCodDesc
      Left = 240
      Top = 26
      Width = 229
      Height = 23
      TabOrder = 1
      ExplicitLeft = 240
      ExplicitTop = 26
      ExplicitWidth = 229
      DesignSize = (
        229
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 32
        Width = 197
        ExplicitLeft = 32
        ExplicitWidth = 197
      end
      inherited edCodigo: TPatternEdit
        Width = 30
        ExplicitWidth = 30
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'VS_FECHABAJA'
        FieldCodigo = 'VS_ID'
        FieldDesc = 'VS_DESCRIPCION'
        FieldID = 'VS_ID'
        OrderBy = 'VS_DESCRIPCION'
        ShowBajas = True
        TableName = 'COMERCIAL.CVS_VISITA'
        OnChange = fravi_IDvisitaPropiedadesChange
        Left = 84
        Top = 2
      end
    end
    inline fraVI_RESPONSABLE: TfraCodDesc
      Left = 473
      Top = 72
      Width = 125
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 7
      ExplicitLeft = 473
      ExplicitTop = 72
      ExplicitWidth = 125
      DesignSize = (
        125
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 112
        Width = 13
        ExplicitLeft = 112
        ExplicitWidth = 13
      end
      inherited edCodigo: TPatternEdit
        Left = 0
        Width = 110
        ExplicitLeft = 0
        ExplicitWidth = 110
      end
      inherited Propiedades: TPropiedadesFrame
        ExtraCondition = 'AND SE_USUARIOGENERICO = '#39'N'#39
        FieldBaja = 'SE_FECHABAJA'
        FieldCodigo = 'SE_USUARIO'
        FieldDesc = 'SE_NOMBRE'
        FieldID = 'SE_USUARIO'
        ShowBajas = True
        TableName = 'ART.USE_USUARIOS'
        Left = 68
      end
    end
    object edVI_ID: TIntEdit
      Left = 165
      Top = 27
      Width = 73
      Height = 21
      TabOrder = 2
      OnKeyPress = edVI_IDKeyPress
    end
    object edVI_FECHAALTADesde: TDateComboBox
      Left = 606
      Top = 26
      Width = 85
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 4
    end
    object edVI_FECHAALTAHasta: TDateComboBox
      Left = 712
      Top = 26
      Width = 85
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 5
    end
    object Panel5: TPanel
      Left = 6
      Top = 10
      Width = 151
      Height = 85
      BevelInner = bvLowered
      TabOrder = 0
      object Panel1: TPanel
        Left = 2
        Top = 2
        Width = 147
        Height = 20
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Estados'
        TabOrder = 0
      end
      object cblVI_ESTADO: TARTCheckListBox
        Left = 2
        Top = 22
        Width = 147
        Height = 61
        Align = alClient
        BevelEdges = []
        BorderStyle = bsNone
        Columns = 1
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 1
        OnClick = cblVI_ESTADOClick
        AutoAjustarColumnas = False
        Locked = False
        SQL = 'select ve_descripcion, ve_estado from comercial.cve_visitaestado'
      end
    end
    object edVI_FECHAMODIFDesde: TDateComboBox
      Left = 606
      Top = 72
      Width = 85
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 8
    end
    object edVI_FECHAMODIFHasta: TDateComboBox
      Left = 712
      Top = 72
      Width = 85
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 9
    end
    inline fraVI_IDMOTIVONOREALIZADA: TfraCodDesc
      Left = 472
      Top = 26
      Width = 127
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      ExplicitLeft = 472
      ExplicitTop = 26
      ExplicitWidth = 127
      DesignSize = (
        127
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 32
        Width = 94
        ExplicitLeft = 32
        ExplicitWidth = 94
      end
      inherited edCodigo: TPatternEdit
        Width = 30
        ExplicitWidth = 30
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'VM_FECHABAJA'
        FieldCodigo = 'VM_ID'
        FieldDesc = 'VM_DESCRIPCION'
        FieldID = 'VM_ID'
        OrderBy = 'VM_DESCRIPCION'
        ShowBajas = True
        TableName = 'COMERCIAL.CVM_VISITAMOTIVONOREALIZADA'
        Left = 84
        Top = 2
      end
    end
    object edVI_FECHAINICIOVISITADesde: TDateComboBox
      Left = 606
      Top = 118
      Width = 85
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 10
    end
    object edVI_FECHAINICIOVISITAHasta: TDateComboBox
      Left = 712
      Top = 118
      Width = 85
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 11
    end
    inline fraVI_USUARIOVISITA: TfraCodDesc
      Left = 165
      Top = 72
      Width = 302
      Height = 23
      TabOrder = 12
      ExplicitLeft = 165
      ExplicitTop = 72
      ExplicitWidth = 302
      DesignSize = (
        302
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 112
        Width = 192
        ExplicitLeft = 112
        ExplicitWidth = 192
      end
      inherited edCodigo: TPatternEdit
        Left = 0
        Width = 110
        ExplicitLeft = 0
        ExplicitWidth = 110
      end
      inherited Propiedades: TPropiedadesFrame
        ExtraCondition = 'AND SE_USUARIOGENERICO = '#39'N'#39
        FieldBaja = 'SE_FECHABAJA'
        FieldCodigo = 'SE_USUARIO'
        FieldDesc = 'SE_NOMBRE'
        FieldID = 'SE_USUARIO'
        ShowBajas = True
        TableName = 'ART.USE_USUARIOS'
        Left = 68
        Top = 65530
      end
    end
    object rgVI_FECHAINICIOVISITA: TAdvOfficeRadioGroup
      Left = 802
      Top = 8
      Width = 155
      Height = 239
      Version = '1.3.2.0'
      Anchors = [akRight, akBottom]
      Caption = ' Cu'#225'ndo '
      ParentBackground = False
      TabOrder = 13
      OnClick = tbRefrescarClick
      ItemIndex = 0
      Items.Strings = (
        'Todas'
        'Antiguas'
        'Hace cuatro semanas'
        'Hace tres semanas'
        'Hace dos semanas'
        'La semana pasada'
        'Esta semana'
        'La semana que viene'
        'Dentro de dos semanas'
        'A futuro'
        'Sin fecha')
      Ellipsis = False
    end
    inline fraEntidadVendedorAGENDABuscar: TfraEntidadVendedorAGENDA
      Left = 9
      Top = 139
      Width = 589
      Height = 108
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 14
      ExplicitLeft = 9
      ExplicitTop = 139
      ExplicitWidth = 589
      ExplicitHeight = 108
      inherited fraEntidadAGENDA: TfraEntidadAGENDA
        Top = 6
        Width = 589
        ExplicitTop = 6
        ExplicitWidth = 589
        inherited cmbDescripcion: TArtComboBox
          Width = 280
          ExplicitWidth = 280
        end
      end
      inherited fraVendedorAGENDA: TfraVendedorAGENDA
        Top = 55
        Width = 589
        Height = 53
        ExplicitTop = 55
        ExplicitWidth = 589
        ExplicitHeight = 53
        inherited cmbDescripcion: TArtComboBox
          Width = 272
          ExplicitWidth = 272
        end
      end
      inherited pnlTop: TPanel
        Width = 589
        Height = 6
        ExplicitWidth = 589
        ExplicitHeight = 6
        inherited lbBancosInstitoriosProductoresBrokers: TLabel
          Left = 196
          Top = 5
          Visible = False
          ExplicitLeft = 196
          ExplicitTop = 5
        end
      end
    end
    inline fraVI_CONTRATO: TfraEmpresa
      Left = 6
      Top = 118
      Width = 591
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      ExplicitLeft = 6
      ExplicitTop = 118
      ExplicitWidth = 591
      DesignSize = (
        591
        24)
      inherited lbContrato: TLabel
        Left = 487
        ExplicitLeft = 328
      end
      inherited mskCUIT: TMaskEdit
        Left = 3
        ExplicitLeft = 3
      end
      inherited edContrato: TIntEdit
        Left = 534
        ExplicitLeft = 534
      end
      inherited cmbRSocial: TArtComboBox
        Width = 352
        ExplicitWidth = 352
      end
    end
    object edVI_FECHAVENCIMIENTODesde: TDateComboBox
      Left = 606
      Top = 163
      Width = 85
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 15
    end
    object edVI_FECHAVENCIMIENTOHasta: TDateComboBox
      Left = 712
      Top = 163
      Width = 85
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 16
    end
    object rgVencimientoBuscar: TAdvOfficeRadioGroup
      Left = 606
      Top = 187
      Width = 191
      Height = 60
      Version = '1.3.2.0'
      Anchors = [akRight, akBottom]
      Caption = ' Estado respecto del vencimiento '
      ParentBackground = False
      TabOrder = 17
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Todas'
        'A t'#233'rmino'
        'Vencidas')
      Ellipsis = False
    end
  end
  inherited CoolBar: TCoolBar
    Top = 279
    Width = 962
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 24
        Width = 956
      end>
    ExplicitTop = 279
    ExplicitWidth = 962
    inherited ToolBar: TToolBar
      Left = 9
      Width = 949
      Height = 24
      ExplicitLeft = 9
      ExplicitWidth = 949
      ExplicitHeight = 24
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      object tbAsignar: TToolButton
        Left = 370
        Top = 0
        Hint = 'Asignar visitas'
        ImageIndex = 19
        Visible = False
      end
      object tbReporte: TToolButton
        Left = 393
        Top = 0
        Hint = 'Imprimir visita (Ctrl + P)'
        Caption = 'Imprimir visita (Ctrl + P)'
        ImageIndex = 55
        OnClick = tbReporteClick
      end
      object tbNoRealizada: TToolButton
        Left = 416
        Top = 0
        Hint = 'No realizaci'#243'n de visita...'
        ImageIndex = 39
        OnClick = tbNoRealizadaClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 308
    Width = 962
    Height = 262
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = pmAgendarVisita
    TitleFont.Name = 'Tahoma'
    OnMouseDown = GridMouseDown
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'VI_ID'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VS_DESCRIPCION'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_NOMBRE'
        Title.Caption = 'Responsable'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VE_DESCRIPCION'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VI_FECHAINICIOVISITA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CUANDO'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_VISITA'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HORA_INICIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HORA_FIN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO_VENCIMIENTO'
        Title.Caption = 'Estado vencimiento'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VI_FECHAVENCIMIENTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VI_CONTRATO'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_NOMBRE'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CT_CONTACTO'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENTIDAD'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VENDEDOR'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VI_USUARIOVISITA'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VI_USUALTA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VI_FECHAALTA'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VI_USUMODIF'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VI_FECHAMODIF'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VI_USUBAJA'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VI_FECHABAJA'
        Width = 90
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 93
    Top = 41
    Width = 1200
    Height = 704
    BorderStyle = bsNone
    Position = poScreenCenter
    OnShow = fpAbmShow
    ExplicitLeft = 93
    ExplicitTop = 41
    ExplicitWidth = 1200
    ExplicitHeight = 704
    DesignSize = (
      1200
      704)
    inherited BevelAbm: TBevel
      Top = 668
      Width = 1192
      ExplicitTop = 69
      ExplicitWidth = 341
    end
    object bvlLeft: TBevel [1]
      Left = 0
      Top = 55
      Width = 7
      Height = 646
      Align = alLeft
      Shape = bsLeftLine
      Style = bsRaised
      ExplicitTop = 30
      ExplicitHeight = 607
    end
    object bvlRight: TBevel [2]
      Left = 1193
      Top = 55
      Width = 7
      Height = 646
      Align = alRight
      Shape = bsRightLine
      Style = bsRaised
      ExplicitLeft = 1075
      ExplicitTop = 30
      ExplicitHeight = 608
    end
    object bvlBottom: TBevel [3]
      Left = 0
      Top = 701
      Width = 1200
      Height = 3
      Align = alBottom
      Shape = bsFrame
      Style = bsRaised
      ExplicitTop = 636
      ExplicitWidth = 1081
    end
    inherited btnAceptar: TButton
      Left = 1045
      Top = 674
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      TabStop = False
      ExplicitLeft = 1045
      ExplicitTop = 674
    end
    inherited btnCancelar: TButton
      Left = 1120
      Top = 674
      TabOrder = 2
      TabStop = False
      ExplicitLeft = 1120
      ExplicitTop = 674
    end
    object btFinalizarvisita: TButton
      Left = 6
      Top = 674
      Width = 177
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Finalizar visita'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      TabStop = False
      OnClick = btFinalizarvisitaClick
    end
    object pgVisita: TPageControl
      Left = 3
      Top = 34
      Width = 1190
      Height = 629
      ActivePage = tsVisita
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 3
      object tsVisita: TTabSheet
        Caption = 'Visita'
        OnResize = tsVisitaResize
        object pnlVisitaTemas: TJvPanel
          AlignWithMargins = True
          Left = 545
          Top = 0
          Width = 637
          Height = 601
          Margins.Left = 10
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
          Transparent = True
          MultiLine = True
          Align = alClient
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = 13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentColor = True
          ParentFont = False
          TabOrder = 0
          inline fraTemasVisita: TfraTemas
            Left = 0
            Top = 26
            Width = 637
            Height = 575
            Align = alClient
            ParentBackground = False
            TabOrder = 0
            ExplicitTop = 26
            ExplicitWidth = 637
            ExplicitHeight = 575
            inherited smTemas: TJvScrollMax
              Width = 637
              Height = 575
              ExplicitWidth = 637
              ExplicitHeight = 575
            end
          end
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 637
            Height = 26
            Align = alTop
            Alignment = taLeftJustify
            BevelOuter = bvNone
            Caption = '   Temas'
            TabOrder = 1
          end
        end
        object pnlVisitaDetalle: TJvPanel
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 535
          Height = 601
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
          MultiLine = True
          Align = alLeft
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = 13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
          object pnlFechaVisita: TPanel
            Left = 0
            Top = 179
            Width = 535
            Height = 50
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              535
              50)
            object lbFechaVisita: TLabel
              Left = 8
              Top = 6
              Width = 70
              Height = 13
              Caption = 'Fecha visita '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbHasta: TLabel
              Left = 220
              Top = 29
              Width = 38
              Height = 13
              Caption = 'Hora fin'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = 13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label3: TLabel
              Left = 108
              Top = 29
              Width = 49
              Height = 13
              Caption = 'Hora inicio'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = 13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object edFechaVisita: TDateComboBox
              Left = 6
              Top = 25
              Width = 99
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnExit = edFechaVisitaExit
            end
            object edHoraVisitaInicio: TDateTimePicker
              Left = 161
              Top = 26
              Width = 52
              Height = 21
              Date = 36524.958333333340000000
              Format = 'HH:mm'
              Time = 36524.958333333340000000
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Kind = dtkTime
              ParentFont = False
              TabOrder = 1
            end
            object edHoraVisitaFin: TDateTimePicker
              Left = 263
              Top = 26
              Width = 52
              Height = 21
              Date = 36524.958333333340000000
              Format = 'HH:mm'
              Time = 36524.958333333340000000
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Kind = dtkTime
              ParentFont = False
              TabOrder = 2
            end
            object pnlMotivoIngreso: TPanel
              Left = 321
              Top = 0
              Width = 214
              Height = 50
              Anchors = [akLeft, akTop, akRight]
              BevelOuter = bvNone
              TabOrder = 3
              DesignSize = (
                214
                50)
              object Label18: TLabel
                Left = 10
                Top = 7
                Width = 31
                Height = 13
                Caption = 'Canal'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              inline fraMotivoDeIngreso: TfraCodDesc
                Left = 8
                Top = 24
                Width = 202
                Height = 23
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
                ExplicitLeft = 8
                ExplicitTop = 24
                ExplicitWidth = 202
                DesignSize = (
                  202
                  23)
                inherited cmbDescripcion: TArtComboBox
                  Left = 38
                  Width = 166
                  ExplicitLeft = 38
                  ExplicitWidth = 166
                end
                inherited edCodigo: TPatternEdit
                  Width = 36
                  ExplicitWidth = 36
                end
                inherited Propiedades: TPropiedadesFrame
                  FieldBaja = 'BAJA'
                  FieldCodigo = 'ID'
                  FieldDesc = 'DESCRIPCION'
                  FieldID = 'ID'
                  OrderBy = 'DESCRIPCION'
                  TableName = 'tabla'
                  Left = 68
                end
              end
            end
          end
          object pnlUsuarioVisita: TPanel
            Left = 0
            Top = 229
            Width = 535
            Height = 50
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            DesignSize = (
              535
              50)
            object lbUsuarioVisita: TLabel
              Left = 8
              Top = 3
              Width = 77
              Height = 13
              Caption = 'Usuario visita'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            inline fraUsuarioVisita: TfraCodDesc
              Left = 8
              Top = 22
              Width = 525
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              TabStop = True
              ExplicitLeft = 8
              ExplicitTop = 22
              ExplicitWidth = 525
              DesignSize = (
                525
                23)
              inherited cmbDescripcion: TArtComboBox
                Left = 124
                Width = 401
                ExplicitLeft = 124
                ExplicitWidth = 401
              end
              inherited edCodigo: TPatternEdit
                Left = 0
                Width = 122
                ExplicitLeft = 0
                ExplicitWidth = 122
              end
              inherited Propiedades: TPropiedadesFrame
                ExtraCondition = 'AND SE_USUARIOGENERICO = '#39'N'#39
                FieldBaja = 'SE_FECHABAJA'
                FieldCodigo = 'SE_USUARIO'
                FieldDesc = 'SE_NOMBRE'
                FieldID = 'SE_USUARIO'
                ShowBajas = True
                TableName = 'ART.USE_USUARIOS'
                OnChange = fraUsuarioVisitaPropiedadesChange
              end
            end
          end
          object pnlVisita: TPanel
            Left = 0
            Top = 0
            Width = 535
            Height = 97
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 2
            TabStop = True
            DesignSize = (
              535
              97)
            object Label14: TLabel
              Left = 8
              Top = 8
              Width = 31
              Height = 13
              Caption = 'Visita'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label15: TLabel
              Left = 8
              Top = 52
              Width = 38
              Height = 13
              Caption = 'Estado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label16: TLabel
              Left = 166
              Top = 52
              Width = 72
              Height = 13
              Caption = 'Responsable'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            inline fraVisita: TfraCodDesc
              Left = 8
              Top = 24
              Width = 527
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              TabStop = True
              ExplicitLeft = 8
              ExplicitTop = 24
              ExplicitWidth = 527
              DesignSize = (
                527
                23)
              inherited cmbDescripcion: TArtComboBox
                Width = 462
                ExplicitWidth = 462
              end
              inherited Propiedades: TPropiedadesFrame
                ExtraFields = ',VS_DESTINATARIO,VS_IDMOTIVOINGRESO,VS_IDTIPOEVENTO'
                FieldBaja = 'NULL'
                FieldCodigo = 'VS_ID'
                FieldDesc = 'VS_DESCRIPCION'
                FieldID = 'VS_ID'
                OrderBy = 'VS_DESCRIPCION'
                ShowBajas = True
                TableName = 'COMERCIAL.CVS_VISITA'
                OnChange = fraVisitaPropiedadesChange
              end
            end
            inline fraResponsable: TfraCodDesc
              Left = 164
              Top = 67
              Width = 369
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              TabStop = True
              ExplicitLeft = 164
              ExplicitTop = 67
              ExplicitWidth = 369
              DesignSize = (
                369
                23)
              inherited cmbDescripcion: TArtComboBox
                Left = 124
                Width = 246
                ExplicitLeft = 124
                ExplicitWidth = 246
              end
              inherited edCodigo: TPatternEdit
                Left = 0
                Width = 122
                ExplicitLeft = 0
                ExplicitWidth = 122
              end
              inherited Propiedades: TPropiedadesFrame
                ExtraCondition = 'AND SE_USUARIOGENERICO = '#39'N'#39
                FieldBaja = 'SE_FECHABAJA'
                FieldCodigo = 'SE_USUARIO'
                FieldDesc = 'SE_NOMBRE'
                FieldID = 'SE_USUARIO'
                ShowBajas = True
                TableName = 'ART.USE_USUARIOS'
              end
            end
            object edEstado: TEdit
              Left = 8
              Top = 68
              Width = 150
              Height = 21
              TabOrder = 1
              OnChange = edEstadoChange
            end
          end
          object pnlGen: TPanel
            Left = 0
            Top = 97
            Width = 535
            Height = 82
            Align = alTop
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 3
            object pnlEmpresa: TPanel
              Left = 0
              Top = 0
              Width = 535
              Height = 41
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
            end
            object pnlEntidadVendedor: TPanel
              Left = 0
              Top = 41
              Width = 535
              Height = 41
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 1
            end
          end
          object pnlBottom: TPanel
            Left = 0
            Top = 279
            Width = 535
            Height = 322
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 4
            object pnlObservaciones: TPanel
              Left = 0
              Top = 0
              Width = 331
              Height = 322
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              DesignSize = (
                331
                322)
              object Label1: TLabel
                Left = 8
                Top = 3
                Width = 83
                Height = 13
                Caption = 'Observaciones'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object mObservaciones: TMemo
                Left = 8
                Top = 22
                Width = 321
                Height = 293
                Anchors = [akLeft, akTop, akRight, akBottom]
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = 13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ScrollBars = ssVertical
                TabOrder = 0
              end
            end
            object pnlFoto: TPanel
              Left = 331
              Top = 0
              Width = 204
              Height = 322
              Align = alRight
              BevelOuter = bvNone
              Caption = 'Foto'
              TabOrder = 1
              Visible = False
              object dbiFoto: TDBAdvPicture
                AlignWithMargins = True
                Left = 3
                Top = 24
                Width = 198
                Height = 295
                Animate = False
                AutoSize = True
                Picture.Stretch = False
                Picture.Frame = 0
                PicturePosition = bpTopLeft
                Align = alClient
                StretchMode = smShrink
                Version = '1.4.2.1'
                DataField = 'MM_FOTO'
                DataSource = dsFotoMobile
                ExplicitLeft = 0
                ExplicitTop = 21
                ExplicitWidth = 284
                ExplicitHeight = 301
              end
              object pnlTituloFoto: TPanel
                Left = 0
                Top = 0
                Width = 204
                Height = 21
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
                object Label21: TLabel
                  Left = 4
                  Top = 3
                  Width = 169
                  Height = 13
                  Caption = 'Foto obtenida desde el celular'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
              end
            end
          end
        end
      end
      object tsMapa: TTabSheet
        Caption = 'Mapa'
        ImageIndex = 2
        inline fraDomicilioGISVisita: TfraDomicilioGIS
          Left = 0
          Top = 0
          Width = 1182
          Height = 59
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          ExplicitWidth = 1182
          DesignSize = (
            1182
            59)
          inherited lbNro: TLabel
            Left = 1005
            ExplicitLeft = 904
          end
          inherited lbPiso: TLabel
            Left = 1069
            ExplicitLeft = 968
          end
          inherited lbDto: TLabel
            Left = 1121
            ExplicitLeft = 1020
          end
          inherited lbProvincia: TLabel
            Left = 1025
            ExplicitLeft = 924
          end
          inherited cmbCalle: TArtComboBox
            Width = 854
            ExplicitWidth = 854
          end
          inherited edNumero: TEdit
            Left = 1021
            ExplicitLeft = 1021
          end
          inherited edPiso: TEdit
            Left = 1093
            ExplicitLeft = 1093
          end
          inherited edDto: TEdit
            Left = 1145
            ExplicitLeft = 1145
          end
          inherited cmbLocalidad: TArtComboBox
            Width = 750
            ExplicitWidth = 750
          end
          inherited edProvincia: TEdit
            Left = 1073
            ExplicitLeft = 1073
          end
          inherited btnBuscar: TButton
            Left = 721
            ExplicitLeft = 721
          end
          inherited btnBuscarGIS: TAdvGlowButton
            Left = 909
            ExplicitLeft = 909
          end
          inherited btnMapaGIS: TAdvGlowButton
            Left = 955
            ExplicitLeft = 955
          end
        end
      end
    end
    inline fraTituloABM: TfraTitulo
      Left = 0
      Top = 0
      Width = 1200
      Height = 55
      Align = alTop
      AutoSize = True
      TabOrder = 4
      ExplicitWidth = 1200
      ExplicitHeight = 55
      inherited AdvToolBarPager: TAdvToolBarPager
        Width = 1200
        Height = 55
        ActivePage = advVisita
        Caption.Caption = 'Visita'
        TabSettings.StartMargin = 5
        ShowHelpButton = False
        TabOrder = 1
        TabStop = False
        OnChange = fraTituloABMAdvToolBarPagerChange
        ExplicitWidth = 1200
        ExplicitHeight = 55
        object advVisita: TAdvPage
          Left = 4
          Top = 53
          Width = 1192
          Height = 0
          Caption = 'Visita'
        end
        object advMapa: TAdvPage
          Left = 4
          Top = 53
          Width = 1192
          Height = 0
          Caption = 'Mapa'
        end
      end
    end
  end
  object fpNoRealizada: TFormPanel [4]
    Left = 421
    Top = 396
    Width = 508
    Height = 110
    Caption = 'No realizaci'#243'n de visita'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poScreenCenter
    Constraints.MinWidth = 300
    DesignSize = (
      508
      110)
    object bvlNoRealizada: TBevel
      Left = -488
      Top = 70
      Width = 996
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
      ExplicitTop = 131
      ExplicitWidth = 772
    end
    object Label12: TLabel
      Left = 10
      Top = 15
      Width = 115
      Height = 13
      Caption = 'Motivo de no realizaci'#243'n'
    end
    object btAceptarNoAsignada: TButton
      Left = 351
      Top = 78
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btAceptarNoAsignadaClick
    end
    object btCancelarNoRealizada: TButton
      Left = 426
      Top = 78
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    inline fraMotivoNoRealizada: TfraCodDesc
      Left = 9
      Top = 32
      Width = 492
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      TabStop = True
      ExplicitLeft = 9
      ExplicitTop = 32
      ExplicitWidth = 492
      DesignSize = (
        492
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 427
        ExplicitWidth = 427
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'VM_FECHABAJA'
        FieldCodigo = 'VM_ID'
        FieldDesc = 'VM_DESCRIPCION'
        FieldID = 'VM_ID'
        OrderBy = 'VM_DESCRIPCION'
        ShowBajas = True
        TableName = 'COMERCIAL.CVM_VISITAMOTIVONOREALIZADA'
      end
    end
  end
  inline fraTituloVisita: TfraTitulo [5]
    Left = 0
    Top = 0
    Width = 962
    Height = 30
    Align = alTop
    AutoSize = True
    TabOrder = 5
    ExplicitWidth = 962
    inherited AdvToolBarPager: TAdvToolBarPager
      Width = 962
      Caption.Caption = 'Gesti'#243'n de Visitas'
      ExplicitWidth = 962
    end
  end
  object pnlEstados: TPanel [6]
    Left = 0
    Top = 570
    Width = 962
    Height = 42
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 6
    object pnlP: TJvPanel
      Left = 142
      Top = 2
      Width = 92
      Height = 38
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      MultiLine = True
      Align = alLeft
      BevelOuter = bvNone
      Caption = ' Programada '
      Color = 13874520
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      OnMouseDown = pnlPMouseDown
    end
    object pnlA: TJvPanel
      Left = 234
      Top = 2
      Width = 92
      Height = 38
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      MultiLine = True
      Align = alLeft
      BevelOuter = bvNone
      Caption = ' Agendada '
      Color = 7127792
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      OnMouseDown = pnlAMouseDown
    end
    object pnlN: TJvPanel
      Left = 418
      Top = 2
      Width = 92
      Height = 38
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      MultiLine = True
      Align = alLeft
      BevelOuter = bvNone
      Caption = ' No Realizada '
      Color = 9079526
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      OnMouseDown = pnlNMouseDown
    end
    object pnlR: TJvPanel
      Left = 326
      Top = 2
      Width = 92
      Height = 38
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      MultiLine = True
      Align = alLeft
      BevelOuter = bvNone
      Caption = ' Realizada '
      Color = 9878901
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 3
      OnMouseDown = pnlRMouseDown
    end
    object pnl1: TJvPanel
      Left = 650
      Top = 2
      Width = 92
      Height = 38
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      MultiLine = True
      Align = alLeft
      BevelOuter = bvNone
      Caption = ' A t'#233'rmino '
      Color = 9408327
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 4
      OnMouseDown = pnl1MouseDown
    end
    object pnl2: TJvPanel
      Left = 742
      Top = 2
      Width = 92
      Height = 38
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      MultiLine = True
      Align = alLeft
      BevelOuter = bvNone
      Caption = ' Vencida '
      Color = 5460942
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 5
      OnMouseDown = pnl2MouseDown
    end
    object pnlReferenciasEstadoVto: TJvPanel
      Left = 510
      Top = 2
      Width = 140
      Height = 38
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      MultiLine = True
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'Estados de vencimiento ->'
      Color = 3618615
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInfoBk
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 6
      OnMouseDown = pnlReferenciasEstadoVtoMouseDown
    end
    object pnlReferencias: TJvPanel
      Left = 2
      Top = 2
      Width = 140
      Height = 38
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      MultiLine = True
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'Estados de la visita ->'
      Color = 3618615
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInfoBk
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 7
      OnMouseDown = pnlReferenciasMouseDown
    end
  end
  inherited sdqConsulta: TSDQuery [7]
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      'SELECT tabla.*,'
      
        '       CASE id_estado_vencimiento WHEN 1 THEN '#39'A t'#233'rmino'#39' ELSE '#39 +
        'Vencida'#39' END estado_vencimiento'
      '  FROM (SELECT CASE'
      '                 WHEN TRUNC(vi_fechainiciovisita) IS NULL THEN'
      '                   '#39'Sin fecha'#39
      
        '                 WHEN TRUNC(vi_fechainiciovisita) = TRUNC(SYSDAT' +
        'E) - 1 THEN'
      '                   '#39'Ayer'#39
      
        '                 WHEN TRUNC(vi_fechainiciovisita) = TRUNC(SYSDAT' +
        'E) THEN'
      '                   '#39'Hoy'#39
      
        '                 WHEN TRUNC(vi_fechainiciovisita) = TRUNC(SYSDAT' +
        'E) + 1 THEN'
      '                   '#39'Ma'#241'ana'#39
      
        '                 WHEN vi_fechainiciovisita < TRUNC(SYSDATE) - 28' +
        ' - TO_NUMBER(TO_CHAR(SYSDATE, '#39'd'#39')) THEN'
      '                   '#39'Antiguas'#39
      
        '                 WHEN TRUNC(vi_fechainiciovisita) BETWEEN TRUNC(' +
        'SYSDATE) - 27 - TO_NUMBER(TO_CHAR(SYSDATE, '#39'd'#39'))'
      
        '                                                      AND  TRUNC' +
        '(SYSDATE) - 21 - TO_NUMBER(TO_CHAR(SYSDATE, '#39'd'#39')) THEN'
      '                   '#39'Hace cuatro semanas'#39
      
        '                 WHEN TRUNC(vi_fechainiciovisita) BETWEEN TRUNC(' +
        'SYSDATE) - 20 - TO_NUMBER(TO_CHAR(SYSDATE, '#39'd'#39'))'
      
        '                                                      AND  TRUNC' +
        '(SYSDATE) - 14 - TO_NUMBER(TO_CHAR(SYSDATE, '#39'd'#39')) THEN'
      '                   '#39'Hace tres semanas'#39
      
        '                 WHEN TRUNC(vi_fechainiciovisita) BETWEEN TRUNC(' +
        'SYSDATE) - 13 - TO_NUMBER(TO_CHAR(SYSDATE, '#39'd'#39'))'
      
        '                                                      AND  TRUNC' +
        '(SYSDATE) - 07 - TO_NUMBER(TO_CHAR(SYSDATE, '#39'd'#39')) THEN'
      '                   '#39'Hace dos semanas'#39
      
        '                 WHEN TRUNC(vi_fechainiciovisita) BETWEEN TRUNC(' +
        'SYSDATE) - 06 - TO_NUMBER(TO_CHAR(SYSDATE, '#39'd'#39'))'
      
        '                                                      AND  TRUNC' +
        '(SYSDATE) - 00 - TO_NUMBER(TO_CHAR(SYSDATE, '#39'd'#39')) THEN'
      '                   '#39'La semana pasada'#39
      
        '                 WHEN TRUNC(vi_fechainiciovisita) BETWEEN TRUNC(' +
        'SYSDATE) + 08 - TO_NUMBER(TO_CHAR(SYSDATE, '#39'd'#39'))'
      
        '                                                      AND  TRUNC' +
        '(SYSDATE) + 14 - TO_NUMBER(TO_CHAR(SYSDATE, '#39'd'#39')) THEN'
      '                   '#39'La semana que viene'#39
      
        '                 WHEN TRUNC(vi_fechainiciovisita) BETWEEN TRUNC(' +
        'SYSDATE) + 15 - TO_NUMBER(TO_CHAR(SYSDATE, '#39'd'#39'))'
      
        '                                                      AND  TRUNC' +
        '(SYSDATE) + 21 - TO_NUMBER(TO_CHAR(SYSDATE, '#39'd'#39')) THEN'
      '                   '#39'Dentro de dos semanas'#39
      
        '                 WHEN TRUNC(vi_fechainiciovisita) > TRUNC(SYSDAT' +
        'E) + 22 - TO_NUMBER(TO_CHAR(SYSDATE, '#39'd'#39')) THEN'
      '                   '#39'A futuro'#39
      '                 ELSE'
      '                   INITCAP(TO_CHAR(vi_fechainiciovisita, '#39'day'#39'))'
      '               END'
      '                 cuando,'
      '               cvi.*,'
      '               cvs.*,'
      '               ve_descripcion,'
      '               se_usuario,'
      '               se_nombre,'
      '               em_nombre,'
      '               em_cuit,'
      '               ct_contacto,'
      '               TRUNC(vi_fechainiciovisita) fecha_visita,'
      
        '               TO_CHAR(vi_fechainiciovisita, '#39'HH24:MI'#39') hora_ini' +
        'cio,'
      '               TO_CHAR(vi_fechafinvisita, '#39'HH24:MI'#39') hora_fin,'
      '               es_nombre,'
      '               en_nombre entidad,'
      '               xve.ve_nombre vendedor,'
      '               CASE'
      '                 WHEN cvi.vi_fechavencimiento IS NULL'
      
        '                   OR cvi.vi_fechavencimiento > NVL(TRUNC(NVL(cv' +
        'i.vi_fechainiciovisita, cvi.vi_fechamodif)), SYSDATE) THEN'
      '                   1'
      '                 ELSE'
      '                   2'
      '               END'
      '                 id_estado_vencimiento,'
      '               CASE'
      
        '                 WHEN vi_idestablecimiento IS NOT NULL THEN art.' +
        'utiles.armar_domicilio(es_calle, es_numero, NULL /*es_piso*/'
      
        '                                                                ' +
        '                                                , NULL /*es_depa' +
        'rtamento*/'
      
        '                                                                ' +
        '                                                      , NULL) ||' +
        ' art.utiles.armar_localidad(NULL /*es_cpostal*/'
      
        '                                                                ' +
        '                                                                ' +
        '                                , NULL, es_localidad, es_provinc' +
        'ia, '#39', '#39')'
      
        '                 WHEN vi_contrato IS NOT NULL THEN art.utiles.ar' +
        'mar_domicilio(dc_calle, dc_numero, NULL /*dc_piso*/'
      
        '                                                                ' +
        '                                       , NULL /* dc_departamento' +
        '*/'
      
        '                                                                ' +
        '                                             , NULL) || art.util' +
        'es.armar_localidad(NULL /*dc_cpostal*/'
      
        '                                                                ' +
        '                                                                ' +
        '                       , NULL, dc_localidad, dc_provincia, '#39', '#39')'
      '                 ELSE '#39#39
      '               END'
      '                 AS domicilio'
      '          FROM comercial.cvi_visitainstancia cvi,'
      '               comercial.cvs_visita cvs,'
      '               comercial.cve_visitaestado cve,'
      '               art.use_usuarios,'
      '               afi.aco_contrato,'
      '               afi.adc_domiciliocontrato,'
      '               aem_empresa,'
      '               act_contacto,'
      '               aes_establecimiento,'
      '               com.xen_entidad,'
      '               com.xve_vendedor xve'
      '         WHERE vi_identidad = en_id(+)'
      '           AND vi_idvendedor = xve.ve_id(+)'
      '           AND vi_idvisita = vs_id'
      '           AND vi_estado = ve_estado'
      '           AND vi_responsable = se_usuario(+)'
      '           AND vi_contrato = co_contrato(+)'
      '           AND co_contrato = dc_contrato(+)'
      '           AND dc_tipo(+) = '#39'L'#39
      '           AND co_idempresa = em_id(+)'
      '           AND vi_idcontacto = ct_id(+)'
      '           AND vi_idestablecimiento = es_id(+)) tabla'
      ' WHERE 1 = 1')
    Top = 384
    object sdqConsultaVI_ID: TFloatField
      DisplayLabel = 'Id'
      FieldName = 'VI_ID'
      Required = True
    end
    object sdqConsultaVI_IDVISITA: TFloatField
      DisplayLabel = 'Visita'
      FieldName = 'VI_IDVISITA'
      Required = True
    end
    object sdqConsultaVI_CONTRATO: TFloatField
      DisplayLabel = 'Contrato'
      FieldName = 'VI_CONTRATO'
    end
    object sdqConsultaVI_IDCONTACTO: TFloatField
      FieldName = 'VI_IDCONTACTO'
    end
    object sdqConsultaVI_IDESTABLECIMIENTO: TFloatField
      FieldName = 'VI_IDESTABLECIMIENTO'
    end
    object sdqConsultaVI_IDTAREASIC: TFloatField
      FieldName = 'VI_IDTAREASIC'
    end
    object sdqConsultaVI_RESPONSABLE: TStringField
      DisplayLabel = 'Responsable'
      FieldName = 'VI_RESPONSABLE'
    end
    object sdqConsultaVI_ESTADO: TStringField
      FieldName = 'VI_ESTADO'
      Required = True
      Size = 1
    end
    object sdqConsultaVI_IDMOTIVONOREALIZADA: TFloatField
      FieldName = 'VI_IDMOTIVONOREALIZADA'
    end
    object sdqConsultaFECHA_VISITA: TDateTimeField
      DisplayLabel = 'Fecha visita'
      FieldName = 'FECHA_VISITA'
    end
    object sdqConsultaHORA_INICIO: TStringField
      DisplayLabel = 'Hora inicio'
      FieldName = 'HORA_INICIO'
      Size = 5
    end
    object sdqConsultaHORA_FIN: TStringField
      DisplayLabel = 'Hora fin'
      FieldName = 'HORA_FIN'
      Size = 5
    end
    object sdqConsultaVI_USUALTA: TStringField
      DisplayLabel = 'Usuario alta'
      FieldName = 'VI_USUALTA'
      Required = True
    end
    object sdqConsultaVI_FECHAALTA: TDateTimeField
      DisplayLabel = 'Fecha alta'
      FieldName = 'VI_FECHAALTA'
      Required = True
    end
    object sdqConsultaVI_USUMODIF: TStringField
      DisplayLabel = 'Usuario modificaci'#243'n'
      FieldName = 'VI_USUMODIF'
    end
    object sdqConsultaVI_FECHAMODIF: TDateTimeField
      DisplayLabel = 'Fecha modificaci'#243'n '
      FieldName = 'VI_FECHAMODIF'
    end
    object sdqConsultaVI_USUBAJA: TStringField
      DisplayLabel = 'Usuario baja'
      FieldName = 'VI_USUBAJA'
    end
    object sdqConsultaVI_FECHABAJA: TDateTimeField
      DisplayLabel = 'Fecha baja'
      FieldName = 'VI_FECHABAJA'
    end
    object sdqConsultaVI_FECHAINICIOVISITA: TDateTimeField
      DisplayLabel = 'Fecha inicio visita'
      FieldName = 'VI_FECHAINICIOVISITA'
    end
    object sdqConsultaVI_FECHAFINVISITA: TDateTimeField
      FieldName = 'VI_FECHAFINVISITA'
    end
    object sdqConsultaVI_USUARIOVISITA: TStringField
      DisplayLabel = 'Usuario visita'
      FieldName = 'VI_USUARIOVISITA'
    end
    object sdqConsultaVS_ID: TFloatField
      FieldName = 'VS_ID'
      Required = True
    end
    object sdqConsultaVS_DESCRIPCION: TStringField
      DisplayLabel = 'Visita'
      FieldName = 'VS_DESCRIPCION'
      Required = True
      Size = 255
    end
    object sdqConsultaVS_USUALTA: TStringField
      FieldName = 'VS_USUALTA'
      Required = True
    end
    object sdqConsultaVS_FECHAALTA: TDateTimeField
      FieldName = 'VS_FECHAALTA'
      Required = True
    end
    object sdqConsultaVS_USUMODIF: TStringField
      FieldName = 'VS_USUMODIF'
    end
    object sdqConsultaVS_FECHAMODIF: TDateTimeField
      FieldName = 'VS_FECHAMODIF'
    end
    object sdqConsultaVS_USUBAJA: TStringField
      FieldName = 'VS_USUBAJA'
    end
    object sdqConsultaVS_FECHABAJA: TDateTimeField
      FieldName = 'VS_FECHABAJA'
    end
    object sdqConsultaVS_IDTIPOEVENTO: TFloatField
      FieldName = 'VS_IDTIPOEVENTO'
    end
    object sdqConsultaVS_IDMOTIVOINGRESO: TFloatField
      FieldName = 'VS_IDMOTIVOINGRESO'
    end
    object sdqConsultaVE_DESCRIPCION: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'VE_DESCRIPCION'
    end
    object sdqConsultaSE_NOMBRE: TStringField
      DisplayLabel = 'Usuario alta'
      FieldName = 'SE_NOMBRE'
      Size = 50
    end
    object sdqConsultaEM_NOMBRE: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EM_NOMBRE'
      Size = 200
    end
    object sdqConsultaCT_CONTACTO: TStringField
      DisplayLabel = 'Contacto'
      FieldName = 'CT_CONTACTO'
      Size = 100
    end
    object sdqConsultaVI_OBSERVACIONES: TStringField
      FieldName = 'VI_OBSERVACIONES'
      Size = 4000
    end
    object sdqConsultaSE_USUARIO: TStringField
      FieldName = 'SE_USUARIO'
    end
    object sdqConsultaES_NOMBRE: TStringField
      DisplayLabel = 'Establecimiento'
      FieldName = 'ES_NOMBRE'
      Required = True
      Size = 100
    end
    object sdqConsultaCUANDO: TStringField
      DisplayLabel = 'Cu'#225'ndo'
      FieldName = 'CUANDO'
      Size = 21
    end
    object sdqConsultaVI_IDENTIDAD: TFloatField
      FieldName = 'VI_IDENTIDAD'
    end
    object sdqConsultaVI_IDVENDEDOR: TFloatField
      FieldName = 'VI_IDVENDEDOR'
    end
    object sdqConsultaVS_DESTINATARIO: TFloatField
      FieldName = 'VS_DESTINATARIO'
    end
    object sdqConsultaENTIDAD: TStringField
      DisplayLabel = 'Entidad'
      FieldName = 'ENTIDAD'
      Size = 50
    end
    object sdqConsultaVENDEDOR: TStringField
      DisplayLabel = 'Vendedor'
      FieldName = 'VENDEDOR'
      Size = 60
    end
    object sdqConsultaVI_FECHAVENCIMIENTO: TDateTimeField
      DisplayLabel = 'Fecha vencimiento'
      FieldName = 'VI_FECHAVENCIMIENTO'
    end
    object sdqConsultaVI_IDMOTIVOINGRESO: TFloatField
      FieldName = 'VI_IDMOTIVOINGRESO'
    end
    object sdqConsultaID_ESTADO_VENCIMIENTO: TFloatField
      FieldName = 'ID_ESTADO_VENCIMIENTO'
    end
    object sdqConsultaESTADO_VENCIMIENTO: TStringField
      DisplayLabel = 'Estado vto'
      FieldName = 'ESTADO_VENCIMIENTO'
      Size = 9
    end
    object sdqConsultaDOMICILIO: TStringField
      FieldName = 'DOMICILIO'
      Size = 4000
    end
    object sdqConsultaEM_CUIT: TStringField
      FieldName = 'EM_CUIT'
      Size = 11
    end
  end
  inherited dsConsulta: TDataSource [8]
    Top = 384
  end
  inherited SortDialog: TSortDialog [9]
    Top = 412
  end
  inherited ExportDialog: TExportDialog [10]
    Top = 412
  end
  inherited QueryPrint: TQueryPrint [11]
    Top = 440
  end
  inherited Seguridad: TSeguridad [12]
    Top = 356
  end
  inherited FormStorage: TFormStorage [13]
    Top = 356
  end
  inherited PrintDialog: TPrintDialog [14]
    Top = 440
  end
  inherited ShortCutControl: TShortCutControl [15]
    Enabled = False
    Top = 356
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
    Top = 384
  end
  object ShortCutControlHijo: TShortCutControl
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
      end
      item
        Key = 16464
        LinkControl = tbReporte
      end
      item
        Key = 16449
        LinkControl = tbAsignar
      end>
    Left = 108
    Top = 356
  end
  object TiempoCarga: TTimer
    Enabled = False
    Interval = 100
    OnTimer = TiempoCargaTimer
    Left = 80
    Top = 412
  end
  object sdqSinAsignar: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT * '
      '  FROM comercial.cvi_visitainstancia'
      ' WHERE vi_idvisita = :idvisita'
      '   AND vi_responsable IS NULL')
    Left = 52
    Top = 468
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idvisita'
        ParamType = ptInput
      end>
  end
  object sdqAsignarvisitas: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        '    SELECT TRIM(REPLACE(REPLACE(se_nombre, '#39'(desa)'#39', '#39#39'), '#39'(test' +
        ')'#39', '#39#39')) nombre,'
      '           se_usuario'
      '      FROM art.use_usuarios'
      '     WHERE se_fechabaja IS NULL'
      '       AND se_usuariogenerico = '#39'N'#39
      'START WITH se_usuario =:usuario'
      'CONNECT BY PRIOR se_usuario = se_respondea'
      '       AND se_usuario <> se_respondea'
      '  ORDER BY 1')
    Left = 81
    Top = 468
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'usuario'
        ParamType = ptInput
      end>
  end
  object sdqMotivoNoRealizada: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT * '
      '  FROM comercial.cvi_visitainstancia'
      ' WHERE vi_idvisita = :idvisita'
      '   AND vi_responsable IS NULL')
    Left = 23
    Top = 468
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idvisita'
        ParamType = ptInput
      end>
  end
  object TiempoContacto: TTimer
    Enabled = False
    Interval = 100
    OnTimer = TiempoContactoTimer
    Left = 23
    Top = 496
  end
  object pmAgendarVisita: TPopupMenu
    AutoHotkeys = maManual
    OnPopup = pmAgendarVisitaPopup
    Left = 23
    Top = 524
  end
  object sdqUpdateVisita: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'UPDATE comercial.cvi_visitainstancia'
      '   SET vi_fechainiciovisita = :fechainiciovisita, '
      '          vi_estado = :estado'
      ' WHERE vi_id = :idvisita')
    Left = 52
    Top = 496
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'fechainiciovisita'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'estado'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idvisita'
        ParamType = ptInput
      end>
  end
  object sdqDiasMenuVisita: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT dia fecha,'
      '       TRIM(CASE'
      '              WHEN dia = TRUNC(SYSDATE) - 1 THEN'
      '                '#39'Ayer'#39
      '              WHEN dia = TRUNC(SYSDATE) THEN'
      '                '#39'Hoy'#39
      '              WHEN dia = TRUNC(SYSDATE) + 1 THEN'
      '                '#39'Ma'#241'ana'#39
      '              WHEN dia = TRUNC(SYSDATE) + 2 THEN'
      '                '#39'Pasado ma'#241'ana'#39
      '              WHEN dia = TRUNC(SYSDATE) + 3'
      '               AND TO_CHAR(dia, '#39'd'#39') = 5 THEN'
      '                '#39'Este jueves'#39
      '              WHEN dia = TRUNC(SYSDATE) + 4'
      '               AND TO_CHAR(dia, '#39'd'#39') = 6 THEN'
      '                '#39'Este viernes'#39
      '              ELSE'
      '                INITCAP(TO_CHAR(dia, '#39'day'#39'))'
      '            END)'
      '         AS dia_power,'
      '       INITCAP(TO_CHAR(dia, '#39'day'#39')) dia,'
      '       dia - TRUNC(SYSDATE) dif,'
      '       TO_CHAR(dia, '#39'IW'#39') AS semana'
      '  FROM (SELECT TRUNC(SYSDATE) + ROWNUM - 1 dia'
      '          FROM art.use_usuarios'
      '         WHERE ROWNUM < 60)'
      
        ' WHERE TO_CHAR(dia, '#39'IW'#39') - TO_CHAR(SYSDATE, '#39'IW'#39') between 0 and' +
        ' 4'
      '   AND art.amebpba.isferiado(dia) = 0')
    Left = 81
    Top = 496
  end
  object sdqMotivoDeingreso: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT id,'
      '       codigo,'
      '       descripcion,'
      '       baja,'
      '       idtipoevento'
      '  FROM (SELECT mi_id id,'
      '               mi_id codigo,'
      '               mi_descripcion descripcion,'
      '               ti_idtipoevento idtipoevento,'
      '               mi_fechabaja baja'
      
        '          FROM agenda.ami_motivoingreso, agenda.ati_tipoeventomo' +
        'tivoingreso'
      '         WHERE ti_idmotivoingreso = mi_id'
      '           AND ti_fechabaja IS NULL) tabla'
      ' WHERE 1 = 1')
    Left = 52
    Top = 524
  end
  object TiempoMapa: TTimer
    Enabled = False
    Interval = 100
    OnTimer = TiempoMapaTimer
    Left = 82
    Top = 524
  end
  object sdqHolding: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      '  SELECT    CHR(13)'
      '         || CHR(10)'
      '         || REPLACE(   '#39'Recuerde que '#39
      '                    || (SELECT em_nombre'
      '                          FROM aco_contrato, aem_empresa'
      '                         WHERE co_idempresa = em_id'
      '                           AND co_contrato = :contrato)'
      '                    || '#39' es parte del holding '#39
      '                    || ge_descripcion'
      
        '                    || '#39' integrado tambi'#233'n por: '#39' || CHR(13) || ' +
        'CHR(10) || CHR(13) || CHR(10)'
      
        '                    || LISTAGG(otras_empresas.em_nombre || '#39' ('#39' ' +
        '||otros_contratos.co_contrato || '#39')'#39', CHR(13) || CHR(10)) WITHIN' +
        ' GROUP (ORDER BY otras_empresas.em_nombre) || '#39'.'#39
      '                        , '#39'..'#39', '#39'.'#39')'
      '         || CHR(13)'
      '         || CHR(10)'
      '           AS texto'
      '    FROM aco_contrato otros_contratos,'
      '         aem_empresa otras_empresas,'
      '         age_grupoeconomico,'
      '         aem_empresa esta_empresa,'
      '         aco_contrato este_contrato'
      '   WHERE esta_empresa.em_idgrupoeconomico = ge_id'
      '     AND este_contrato.co_idempresa = esta_empresa.em_id'
      '     AND otros_contratos.co_idempresa = otras_empresas.em_id'
      '     AND este_contrato.co_contrato = :contrato'
      '     AND otras_empresas.em_idgrupoeconomico = ge_id'
      '     AND NOT EXISTS (SELECT 1'
      
        '                       FROM aco_contrato mismo_contrato, aem_emp' +
        'resa misma'
      '                      WHERE misma.em_id = otras_empresas.em_id'
      
        '                        AND mismo_contrato.co_idempresa = otras_' +
        'empresas.em_id'
      
        '                        AND mismo_contrato.co_contrato = :contra' +
        'to)'
      'GROUP BY ge_descripcion')
    Left = 20
    Top = 568
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end>
  end
  object JvAppEvents: TJvAppEvents
    OnIdle = JvAppEventsIdle
    Left = 108
    Top = 412
  end
  object sdqFotoMobile: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT mm_fechamovimiento,'
      '       mm_lat,'
      '       mm_lng,'
      '       mm_foto'
      
        '  FROM comercial.cmm_movimientomobile, comercial.cum_usuariomobi' +
        'le, art.use_usuarios'
      ' WHERE mm_idusuario = um_id'
      '   AND se_legajorrhh = um_legajo'
      '   AND se_usuario = :usuario'
      '   AND TRUNC(mm_fechamovimiento) = :fecha'
      '   AND mm_foto IS NOT NULL')
    Left = 88
    Top = 568
    ParamData = <
      item
        DataType = ftString
        Name = 'usuario'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'fecha'
        ParamType = ptInput
      end>
  end
  object dsFotoMobile: TDataSource
    DataSet = sdqFotoMobile
    Left = 116
  end
end
