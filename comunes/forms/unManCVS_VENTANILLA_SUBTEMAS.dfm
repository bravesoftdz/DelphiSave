inherited frmManCVS_VENTANILLA_SUBTEMAS: TfrmManCVS_VENTANILLA_SUBTEMAS
  Left = 272
  Top = 59
  Caption = 'Mantenimiento de Ventanilla Electr'#243'nica'
  ClientHeight = 760
  ClientWidth = 1076
  Constraints.MinHeight = 600
  Constraints.MinWidth = 800
  Font.Name = 'Tahoma'
  ExplicitLeft = 272
  ExplicitTop = 59
  ExplicitWidth = 1084
  ExplicitHeight = 790
  PixelsPerInch = 96
  TextHeight = 13
  object SplitterLateral: TSplitter [0]
    Left = 888
    Top = 116
    Height = 644
    Align = alRight
    ExplicitLeft = 604
    ExplicitHeight = 457
  end
  inherited pnlFiltros: TPanel
    Width = 1076
    Height = 87
    Visible = True
    ExplicitWidth = 1076
    ExplicitHeight = 87
    DesignSize = (
      1076
      87)
    object Label1: TLabel
      Left = 12
      Top = 4
      Width = 46
      Height = 13
      Caption = 'Ventanilla'
    end
    object Label8: TLabel
      Left = 320
      Top = 4
      Width = 101
      Height = 13
      Caption = 'Tipo de comunicaci'#243'n'
    end
    object Label9: TLabel
      Left = 12
      Top = 44
      Width = 54
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    inline fraVT_ID: TfraCodDesc
      Left = 12
      Top = 20
      Width = 302
      Height = 23
      TabOrder = 0
      ExplicitLeft = 12
      ExplicitTop = 20
      ExplicitWidth = 302
      DesignSize = (
        302
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 237
        ExplicitWidth = 237
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'VT_FECHABAJA'
        FieldCodigo = 'VT_ID'
        FieldDesc = 'VT_DESCRIPCION'
        FieldID = 'VT_ID'
        OrderBy = 'VT_DESCRIPCION'
        ShowBajas = True
        TableName = 'COMUNES.CVT_VENTANILLA_TEMAS'
        OnChange = tbRefrescarClick
      end
    end
    object rgFiltroVencimiento: TRadioGroup
      Left = 948
      Top = 4
      Width = 121
      Height = 78
      Anchors = [akTop, akRight]
      Caption = ' Vencimiento '
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'Los que tienen'
        'Los que no tienen')
      TabOrder = 3
    end
    object clbFiltroTipoComunicacion_NO_FILTRAR: TARTCheckListBox
      Left = 320
      Top = 20
      Width = 621
      Height = 61
      Anchors = [akLeft, akTop, akRight]
      BevelEdges = []
      Columns = 3
      ItemHeight = 13
      TabOrder = 2
      AutoAjustarColumnas = False
      Locked = False
      SQL = 
        'SELECT VP_DESCRIPCION, VP_ID FROM COMUNES.CVP_VENTANILLA_TIPO OR' +
        'DER BY VP_DESCRIPCION'
    end
    object edDESCRIPCION_FULL_LIKE: TEdit
      Left = 12
      Top = 60
      Width = 301
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
    end
  end
  inherited CoolBar: TCoolBar
    Top = 87
    Width = 1076
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 1070
      end>
    ExplicitTop = 87
    ExplicitWidth = 1076
    inherited ToolBar: TToolBar
      Width = 1061
      ExplicitWidth = 1061
      inherited tbPropiedades: TToolButton
        Hint = 'Configurar respuestas reclamos'
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 116
    Width = 888
    Height = 644
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'VS_ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VS_DESCRIPCION'
        Width = 267
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VT_DESCRIPCION'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_COMUNICACION'
        Title.Caption = 'Tipo de comunicaci'#243'n'
        Width = 214
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTIVO_RESOLUCION'
        Title.Caption = 'Motivo de Resoluci'#243'n'
        Width = 136
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VS_PLAZOPREDETERMINADO'
        Title.Caption = 'Plazo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VS_TIENEVENCIMIENTO'
        Title.Caption = 'Vence'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VS_CONTRATO'
        Title.Caption = 'Contrato'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VS_SINIESTRO'
        Title.Caption = 'Siniestro'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VS_ESTABLECIMIENTO'
        Title.Caption = 'Establecimiento'
        Visible = True
      end>
  end
  object pnlRight: TPanel [4]
    Left = 891
    Top = 116
    Width = 185
    Height = 644
    Align = alRight
    BevelInner = bvLowered
    TabOrder = 4
    object pnlTipoComunicacion: TPanel
      Left = 2
      Top = 2
      Width = 181
      Height = 219
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 0
      object Label6: TLabel
        Left = 8
        Top = 8
        Width = 121
        Height = 13
        Caption = 'Tipo de comunicaci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object clbTipoCom: TARTCheckListBox
        Left = 2
        Top = 32
        Width = 177
        Height = 185
        Align = alBottom
        BevelEdges = []
        Columns = 1
        ItemHeight = 13
        TabOrder = 0
        AutoAjustarColumnas = False
        Locked = False
        SQL = 
          'SELECT VP_DESCRIPCION, VP_ID FROM COMUNES.CVP_VENTANILLA_TIPO OR' +
          'DER BY VP_DESCRIPCION'
      end
    end
    object pnlMotivoResolucion: TPanel
      Left = 2
      Top = 221
      Width = 181
      Height = 421
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 1
      object Label7: TLabel
        Left = 8
        Top = 8
        Width = 120
        Height = 13
        Caption = 'Motivo de Resoluci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object clbMotRes: TARTCheckListBox
        Left = 2
        Top = 28
        Width = 177
        Height = 391
        Align = alBottom
        Anchors = [akLeft, akTop, akRight, akBottom]
        BevelEdges = []
        Columns = 1
        ItemHeight = 13
        TabOrder = 0
        AutoAjustarColumnas = False
        Locked = False
        SQL = 
          'SELECT VA_DESCRIPCION, VA_ID FROM COMUNES.CVA_VENTANILLA_ARTICUL' +
          'OS ORDER BY VA_DESCRIPCION'
      end
    end
  end
  inherited fpAbm: TFormPanel
    Left = 753
    Top = 252
    Width = 885
    Height = 481
    ExplicitLeft = 753
    ExplicitTop = 252
    ExplicitWidth = 885
    ExplicitHeight = 481
    DesignSize = (
      885
      481)
    inherited BevelAbm: TBevel
      Top = 445
      Width = 877
      ExplicitTop = 445
      ExplicitWidth = 877
    end
    object Label2: TLabel [1]
      Left = 16
      Top = 8
      Width = 46
      Height = 13
      Caption = 'Ventanilla'
    end
    object Label3: TLabel [2]
      Left = 16
      Top = 56
      Width = 54
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object Label4: TLabel [3]
      Left = 16
      Top = 104
      Width = 101
      Height = 13
      Caption = 'Motivo de Resoluci'#243'n'
    end
    object Label5: TLabel [4]
      Left = 640
      Top = 6
      Width = 101
      Height = 13
      Caption = 'Tipo de comunicaci'#243'n'
    end
    object Label10: TLabel [5]
      Left = 184
      Top = 56
      Width = 88
      Height = 13
      Caption = 'Plazo determinado'
    end
    inherited btnAceptar: TButton
      Left = 729
      Top = 451
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      ExplicitLeft = 729
      ExplicitTop = 451
    end
    inherited btnCancelar: TButton
      Left = 805
      Top = 451
      TabOrder = 9
      ExplicitLeft = 805
      ExplicitTop = 451
    end
    inline fraVentanilla: TfraCodDesc
      Left = 12
      Top = 24
      Width = 262
      Height = 23
      TabOrder = 0
      ExplicitLeft = 12
      ExplicitTop = 24
      ExplicitWidth = 262
      DesignSize = (
        262
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 197
        ExplicitWidth = 197
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'VT_FECHABAJA'
        FieldCodigo = 'VT_ID'
        FieldDesc = 'VT_DESCRIPCION'
        FieldID = 'VT_ID'
        OrderBy = 'VT_DESCRIPCION'
        ShowBajas = True
        TableName = 'COMUNES.CVT_VENTANILLA_TEMAS'
      end
    end
    object edVS_DESCRIPCION: TEdit
      Left = 16
      Top = 76
      Width = 165
      Height = 21
      TabOrder = 1
    end
    object clbTipoComunicacion: TARTCheckListBox
      Left = 640
      Top = 25
      Width = 233
      Height = 72
      Anchors = [akLeft, akTop, akRight]
      BevelEdges = []
      Columns = 2
      ItemHeight = 13
      TabOrder = 6
      AutoAjustarColumnas = False
      Locked = False
      SQL = 
        'SELECT VP_DESCRIPCION, VP_ID FROM COMUNES.CVP_VENTANILLA_TIPO OR' +
        'DER BY VP_DESCRIPCION'
    end
    object clbMotivosResolucion: TARTCheckListBox
      Left = 16
      Top = 120
      Width = 857
      Height = 313
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelEdges = []
      Columns = 1
      ItemHeight = 13
      TabOrder = 7
      AutoAjustarColumnas = False
      Locked = False
      SQL = 
        'SELECT VA_DESCRIPCION, VA_ID FROM COMUNES.CVA_VENTANILLA_ARTICUL' +
        'OS ORDER BY VA_DESCRIPCION'
    end
    object rgVencimiento: TRadioGroup
      Left = 280
      Top = 20
      Width = 81
      Height = 77
      Caption = ' Vencimiento '
      Items.Strings = (
        'Tiene'
        'No tiene')
      TabOrder = 3
    end
    object edPlazo: TIntEdit
      Left = 184
      Top = 76
      Width = 89
      Height = 21
      Hint = 'Plazo predeterminado de vencimiento (d'#237'as h'#225'biles)'
      TabOrder = 2
      MaxLength = 0
    end
    object rgContrato: TRadioGroup
      Left = 364
      Top = 20
      Width = 85
      Height = 77
      Caption = ' Contrato '
      Items.Strings = (
        'Obligatorio'
        'Optativo'
        'No visible')
      TabOrder = 4
    end
    object rgSiniestro: TRadioGroup
      Left = 452
      Top = 20
      Width = 85
      Height = 77
      Caption = ' Siniestro '
      Items.Strings = (
        'Obligatorio'
        'Optativo'
        'No visible')
      TabOrder = 5
    end
    object rgEstablecimiento: TRadioGroup
      Left = 540
      Top = 20
      Width = 94
      Height = 77
      Caption = ' Establecimiento '
      Items.Strings = (
        'Obligatorio'
        'Optativo'
        'No visible')
      TabOrder = 10
    end
  end
  object fpConfigurarRespuestasReporte: TFormPanel [6]
    Left = 163
    Top = 145
    Width = 948
    Height = 540
    Caption = 'Configurar respuestas para reclamos'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    DesignSize = (
      948
      540)
    object Bevel1: TBevel
      Left = 4
      Top = 504
      Width = 940
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
      ExplicitTop = 445
      ExplicitWidth = 877
    end
    object btnAceptarConfigurarRespuestasReporte: TButton
      Left = 794
      Top = 510
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
      Visible = False
    end
    object btnCancelarConfigurarRespuestasReporte: TButton
      Left = 870
      Top = 510
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Cerrar'
      ModalResult = 2
      TabOrder = 1
    end
    object Panel1: TPanel
      Left = 9
      Top = 6
      Width = 931
      Height = 490
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      object GridMotivos: TArtDBGrid
        Left = 1
        Top = 27
        Width = 929
        Height = 462
        Align = alClient
        DataSource = dsMotivosResolucion
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = GridMotivosDblClick
        FooterBand = False
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'VA_ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VA_DESCRIPCION'
            Visible = True
          end>
      end
      object tlbBarra: TToolBar
        Left = 1
        Top = 1
        Width = 929
        Height = 26
        AutoSize = True
        BorderWidth = 1
        HotImages = frmPrincipal.ilColor
        Images = frmPrincipal.ilByN
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        object btnRefresh: TToolButton
          Left = 0
          Top = 0
          Hint = 'Refrescar'
          ImageIndex = 0
        end
        object ToolButton2: TToolButton
          Left = 23
          Top = 0
          Width = 8
          Caption = 'ToolButton5'
          ImageIndex = 14
          Style = tbsSeparator
        end
        object btnAgregar: TToolButton
          Left = 31
          Top = 0
          Hint = 'Agregar Respuesta'
          Enabled = False
          ImageIndex = 6
          Visible = False
        end
        object btnModificar: TToolButton
          Left = 54
          Top = 0
          Hint = 'Modificar respuesta'
          ImageIndex = 7
          OnClick = btnModificarClick
        end
        object btnEliminar: TToolButton
          Left = 77
          Top = 0
          Hint = 'Dar de baja respuesta'
          Enabled = False
          ImageIndex = 8
          Visible = False
        end
        object ToolButton12: TToolButton
          Left = 100
          Top = 0
          Width = 8
          Caption = 'ToolButton4'
          ImageIndex = 3
          Style = tbsSeparator
          Visible = False
        end
      end
    end
  end
  object fpOpciones: TFormPanel [7]
    Left = 335
    Top = 166
    Width = 612
    Height = 406
    Caption = 'Configurar respuestas para reclamos'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    DesignSize = (
      612
      406)
    object Bevel2: TBevel
      Left = 4
      Top = 370
      Width = 604
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
      ExplicitTop = 445
      ExplicitWidth = 877
    end
    object btnOpcionesAceptar: TButton
      Left = 456
      Top = 376
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
      OnClick = btnOpcionesAceptarClick
    end
    object btnOpcionesCancelar: TButton
      Left = 532
      Top = 376
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object Panel2: TPanel
      Left = 9
      Top = 6
      Width = 595
      Height = 356
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      object clbOpciones: TARTCheckListBox
        Left = 1
        Top = 1
        Width = 593
        Height = 354
        Align = alClient
        BevelEdges = []
        Columns = 1
        ItemHeight = 13
        TabOrder = 0
        AutoAjustarColumnas = False
        Locked = False
        SQL = 'select 1 from dual where 1=2'
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      'SELECT vt_id,'
      '       vt_descripcion,'
      '       descripcion,'
      '       vt_usualta,'
      '       vt_fechaalta,'
      '       vt_usumodif,'
      '       vt_fechamodif,'
      '       vt_usubaja,'
      '       vt_fechabaja,'
      '       vs_id,'
      '       vs_descripcion,'
      '       vs_idtema,'
      '       vs_usualta,'
      '       vs_fechaalta,'
      '       vs_usumodif,'
      '       vs_fechamodif,'
      '       vs_usubaja,'
      '       vs_fechabaja,'
      '/*'
      
        '       TO_CHAR(SUBSTR(tipo_comunicacion,1,4000)) AS tipo_comunic' +
        'acion,'
      
        '       TO_CHAR(SUBSTR(motivo_resolucion,1,4000)) AS motivo_resol' +
        'ucion,'
      '*/'
      ''
      
        '       DBMS_LOB.SUBSTR(tipo_comunicacion, LEAST(3999, LENGTH(tip' +
        'o_comunicacion)) - 2, 1) || CASE WHEN LENGTH(tipo_comunicacion) ' +
        '> 3997 THEN '#39'...'#39' ELSE '#39#39' END tipo_comunicacion,'
      
        '       DBMS_LOB.SUBSTR(motivo_resolucion, LEAST(3999, LENGTH(mot' +
        'ivo_resolucion)) - 2, 1) || CASE WHEN LENGTH(motivo_resolucion) ' +
        '> 3997 THEN '#39'...'#39' ELSE '#39#39' END motivo_resolucion,'
      ''
      '       vs_plazopredeterminado,'
      '       vs_tienevencimiento,'
      '       vs_contrato,'
      '       vs_siniestro,'
      '       vs_establecimiento'
      '  FROM (  SELECT vt_id,'
      '                 vt_descripcion,'
      '                 UPPER(vs_descripcion) descripcion,'
      '                 vt_usualta,'
      '                 vt_fechaalta,'
      '                 vt_usumodif,'
      '                 vt_fechamodif,'
      '                 vt_usubaja,'
      '                 vt_fechabaja,'
      '                 vs_id,'
      '                 vs_descripcion,'
      '                 vs_idtema,'
      '                 vs_usualta,'
      '                 vs_fechaalta,'
      '                 vs_usumodif,'
      '                 vs_fechamodif,'
      '                 vs_usubaja,'
      '                 vs_fechabaja,'
      
        '--                 LISTAGG (CASE WHEN vu_fechabaja IS NULL THEN ' +
        'substr(vp_descripcion, 1, 255) ELSE '#39#39' END, '#39','#39')  WITHIN GROUP (' +
        'ORDER BY vp_descripcion) AS tipo_comunicacion,'
      
        '                 REPLACE(REPLACE(XMLAGG(XMLELEMENT("A", vp_descr' +
        'ipcion) ORDER BY vp_descripcion).getclobval(), '#39'<A>'#39', '#39#39'), '#39'</A>' +
        #39', '#39', '#39') AS tipo_comunicacion,'
      
        '--                 LISTAGG (CASE WHEN vi_fechabaja IS NULL THEN ' +
        'substr(va_descripcion, 1, 30) ELSE '#39#39' END, '#39','#39')  WITHIN GROUP (O' +
        'RDER BY vp_descripcion) AS  motivo_resolucion,'
      
        '                 REPLACE(REPLACE(XMLAGG(XMLELEMENT("A", va_descr' +
        'ipcion) ORDER BY va_descripcion).getclobval(), '#39'<A>'#39', '#39#39'), '#39'</A>' +
        #39', '#39', '#39') AS motivo_resolucion,'
      '                 vs_plazopredeterminado,'
      '                 vs_tienevencimiento,'
      '                 vs_contrato,'
      '                 vs_siniestro,'
      '                 vs_establecimiento'
      '            FROM comunes.cvt_ventanilla_temas cvt,'
      '                 comunes.cvs_ventanilla_subtemas cvs,'
      '                 comunes.cvp_ventanilla_tipo,'
      '                 comunes.cva_ventanilla_articulos,'
      '                 comunes.cvi_ventanilla_subtema_arti,'
      '                 comunes.cvu_ventanilla_subtema_tipo'
      '           WHERE vs_idtema = vt_id'
      '             AND vs_id = vu_idsubtema(+)'
      '             AND vu_idtipo = vp_id(+)'
      '             AND vs_id = vi_idsubtema(+)'
      '             AND vi_idarticulo = va_id(+)'
      '             AND vi_fechabaja(+) IS NULL'
      '        GROUP BY vt_id,'
      '                 vt_descripcion,'
      '                 vt_usualta,'
      '                 vt_fechaalta,'
      '                 vt_usumodif,'
      '                 vt_fechamodif,'
      '                 vt_usubaja,'
      '                 vt_fechabaja,'
      '                 vs_id,'
      '                 vs_descripcion,'
      '                 vs_idtema,'
      '                 vs_usualta,'
      '                 vs_fechaalta,'
      '                 vs_usumodif,'
      '                 vs_fechamodif,'
      '                 vs_usubaja,'
      '                 vs_fechabaja,'
      '                 vs_plazopredeterminado,'
      '                 vs_tienevencimiento,'
      '                 vs_contrato,'
      '                 vs_siniestro,'
      '                 vs_establecimiento)'
      ' WHERE 1 = 1')
    object sdqConsultaVT_ID: TFloatField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'VT_ID'
      Required = True
    end
    object sdqConsultaVT_DESCRIPCION: TStringField
      DisplayLabel = 'Tema'
      FieldName = 'VT_DESCRIPCION'
      Required = True
      Size = 200
    end
    object sdqConsultaVS_ID: TFloatField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'VS_ID'
      Required = True
    end
    object sdqConsultaVS_DESCRIPCION: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'VS_DESCRIPCION'
      Required = True
      Size = 255
    end
    object sdqConsultaVS_IDTEMA: TFloatField
      FieldName = 'VS_IDTEMA'
      Required = True
    end
    object sdqConsultaVT_USUALTA: TStringField
      FieldName = 'VT_USUALTA'
    end
    object sdqConsultaVT_FECHAALTA: TDateTimeField
      FieldName = 'VT_FECHAALTA'
    end
    object sdqConsultaVT_USUMODIF: TStringField
      FieldName = 'VT_USUMODIF'
    end
    object sdqConsultaVT_FECHAMODIF: TDateTimeField
      FieldName = 'VT_FECHAMODIF'
    end
    object sdqConsultaVT_USUBAJA: TStringField
      FieldName = 'VT_USUBAJA'
    end
    object sdqConsultaVT_FECHABAJA: TDateTimeField
      FieldName = 'VT_FECHABAJA'
    end
    object sdqConsultaVS_USUALTA: TStringField
      FieldName = 'VS_USUALTA'
    end
    object sdqConsultaVS_FECHAALTA: TDateTimeField
      FieldName = 'VS_FECHAALTA'
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
    object sdqConsultaDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Size = 200
    end
    object sdqConsultaVS_PLAZOPREDETERMINADO: TFloatField
      FieldName = 'VS_PLAZOPREDETERMINADO'
    end
    object sdqConsultaVS_TIENEVENCIMIENTO: TStringField
      FieldName = 'VS_TIENEVENCIMIENTO'
      Size = 1
    end
    object sdqConsultaVS_CONTRATO: TStringField
      DisplayLabel = 'Exige contrato'
      FieldName = 'VS_CONTRATO'
      Size = 1
    end
    object sdqConsultaVS_SINIESTRO: TStringField
      DisplayLabel = 'Exige siniestro'
      FieldName = 'VS_SINIESTRO'
      Size = 1
    end
    object sdqConsultaTIPO_COMUNICACION: TStringField
      FieldName = 'TIPO_COMUNICACION'
      Size = 4000
    end
    object sdqConsultaMOTIVO_RESOLUCION: TStringField
      FieldName = 'MOTIVO_RESOLUCION'
      Size = 4000
    end
    object sdqConsultaVS_ESTABLECIMIENTO: TStringField
      FieldName = 'VS_ESTABLECIMIENTO'
      Size = 1
    end
  end
  inherited Seguridad: TSeguridad
    AfterExecute = SeguridadAfterExecute
  end
  inherited FormStorage: TFormStorage
    StoredProps.Strings = (
      'pnlRight.Width')
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
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
      end>
    Left = 80
    Top = 200
  end
  object TimerScroll: TTimer
    Enabled = False
    Interval = 250
    OnTimer = TimerScrollTimer
    Left = 80
    Top = 256
  end
  object dsMotivosResolucion: TDataSource
    DataSet = sdqMotivosResolucion
    Left = 86
    Top = 504
  end
  object sdqMotivosResolucion: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      '  SELECT va_descripcion,'
      '         va_id'
      '    FROM comunes.cva_ventanilla_articulos'
      'ORDER BY va_descripcion')
    Left = 196
    Top = 504
    object sdqMotivosResolucionVA_ID: TFloatField
      DisplayLabel = 'Id'
      FieldName = 'VA_ID'
      Required = True
    end
    object sdqMotivosResolucionVA_DESCRIPCION: TStringField
      DisplayLabel = 'Motivo de Resoluci'#243'n'
      FieldName = 'VA_DESCRIPCION'
      Size = 1000
    end
  end
  object sdqOpciones: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT *'
      '  FROM comunes.cvl_ventanilla_listado_arti'
      ' WHERE vl_idarticulo = :idarticulo')
    Left = 92
    Top = 600
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idarticulo'
        ParamType = ptInput
      end>
  end
  object sdqBorrarOpciones: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'DELETE FROM comunes.cvl_ventanilla_listado_arti'
      '      WHERE vl_idarticulo = :idarticulo')
    Left = 92
    Top = 648
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idarticulo'
        ParamType = ptInput
      end>
  end
  object sdqInsertarOpcion: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'INSERT INTO comunes.cvl_ventanilla_listado_arti(vl_id, vl_idarti' +
        'culo, vl_idopcion)'
      
        '    VALUES ((    SELECT NVL(MAX(vl_id), 0) FROM comunes.cvl_vent' +
        'anilla_listado_arti) + 1, :idarticulo, :idopcion)')
    Left = 92
    Top = 692
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idarticulo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idopcion'
        ParamType = ptInput
      end>
  end
end
