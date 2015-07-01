object frmLiqAMPAutPago: TfrmLiqAMPAutPago
  Left = 158
  Top = 210
  Width = 829
  Height = 382
  Caption = 'Liquidaci'#243'n AMP - Autorizaci'#243'n del pago'
  Color = clBtnFace
  Constraints.MinHeight = 382
  Constraints.MinWidth = 693
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefaultPosOnly
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  DesignSize = (
    821
    355)
  PixelsPerInch = 96
  TextHeight = 13
  object tbcPaginas: TTabControl
    Left = 4
    Top = 1
    Width = 814
    Height = 350
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Tabs.Strings = (
      'Autorizaci'#243'n Individual'
      'Autorizaci'#243'n Masiva')
    TabIndex = 0
    OnChange = tbcPaginasChange
    DesignSize = (
      814
      350)
    object dbgListado: TRxDBGrid
      Tag = 132
      Left = 4
      Top = 174
      Width = 805
      Height = 173
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsConsulta
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = tbDetallesClick
      IniStorage = FormPlacement
      MultiSelect = True
      OnGetCellParams = dbgListadoGetCellParams
      Columns = <
        item
          Color = clMoneyGreen
          Expanded = False
          FieldName = 'AU_VOLANTE'
          Title.Caption = 'Volante'
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AU_DESTINO'
          Title.Caption = 'Destino'
          Width = 131
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AU_PRESTADORES'
          Title.Caption = 'Prestador'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AU_FACTURA'
          Title.Caption = 'Factura'
          Width = 86
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AU_DESCRIPCION'
          Title.Caption = 'Descripci'#243'n'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AU_FECHAFACTURA'
          Title.Caption = 'Fecha Factura'
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AU_IMPORTE'
          Title.Caption = 'Importe FCT/ND'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AU_APAGAR'
          Title.Caption = 'A Pagar/Debitar'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AU_FECHAAPROBACION'
          Title.Caption = 'Fecha Aprobaci'#243'n'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AU_USUARIOAPROBACION'
          Title.Caption = 'Usuario Aprobaci'#243'n'
          Width = 111
          Visible = True
        end>
    end
    object cbHerramientas: TCoolBar
      Left = 4
      Top = 140
      Width = 156
      Height = 29
      Align = alNone
      Bands = <
        item
          Control = tbHerramientas
          ImageIndex = -1
          Width = 152
        end>
      object tbHerramientas: TToolBar
        Left = 9
        Top = 0
        Width = 139
        Height = 25
        Align = alNone
        Caption = 'tbHerramientas'
        EdgeBorders = []
        Flat = True
        HotImages = frmPrincipal.imgGenColor
        Images = frmPrincipal.imgGenBW
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object tbAutorizar: TToolButton
          Left = 0
          Top = 0
          Hint = 'Autorizar'
          Caption = 'tbAutorizar'
          ImageIndex = 13
          OnClick = tbAutorizarClick
        end
        object ToolButton6: TToolButton
          Left = 23
          Top = 0
          Width = 8
          Caption = 'ToolButton6'
          ImageIndex = 2
          Style = tbsSeparator
        end
        object tbRefrescar: TToolButton
          Left = 31
          Top = 0
          Hint = 'Refrescar'
          Caption = 'tbRefrescar'
          ImageIndex = 4
          OnClick = tbRefrescarClick
        end
        object tbLimpiar: TToolButton
          Left = 54
          Top = 0
          Hint = 'Limpiar'
          Caption = 'tbLimpiar'
          ImageIndex = 3
          OnClick = tbLimpiarClick
        end
        object ToolButton3: TToolButton
          Left = 77
          Top = 0
          Width = 8
          Caption = 'ToolButton3'
          ImageIndex = 9
          Style = tbsSeparator
        end
        object tbDetalles: TToolButton
          Left = 85
          Top = 0
          Hint = 'Detalle del Volante'
          ImageIndex = 15
          OnClick = tbDetallesClick
        end
        object ToolButton2: TToolButton
          Left = 108
          Top = 0
          Width = 8
          Caption = 'ToolButton2'
          ImageIndex = 1
          Style = tbsSeparator
        end
        object tbSalir: TToolButton
          Left = 116
          Top = 0
          Hint = 'Salir'
          Caption = 'tbSalir'
          ImageIndex = 8
          OnClick = tbSalirClick
        end
      end
    end
    object pnlTotalFacturado: TPanel
      Left = 162
      Top = 140
      Width = 647
      Height = 29
      Anchors = [akLeft, akTop, akRight]
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
    end
    object grpVolantes: TGroupBox
      Left = 5
      Top = 24
      Width = 803
      Height = 115
      Anchors = [akLeft, akTop, akRight]
      Caption = '&Volantes'
      TabOrder = 3
      DesignSize = (
        803
        115)
      inline fraVolantes: TfraVolantes
        Left = 4
        Top = 14
        Width = 795
        Height = 96
        Anchors = [akLeft, akTop, akRight]
        AutoScroll = False
        TabOrder = 0
        inherited Label7: TLabel
          Left = 409
        end
        inherited Label10: TLabel
          Left = 563
        end
        inherited Label11: TLabel
          Left = 678
        end
        inherited Label13: TLabel
          Left = 622
        end
        inherited Label14: TLabel
          Left = 695
        end
        inherited Label15: TLabel
          Left = 767
        end
        inherited edEstado: TEdit
          Width = 541
        end
        inherited edPrestRSocial: TEdit
          Width = 352
        end
        inherited edObservaciones: TMemo
          Width = 729
        end
        inherited edTotFact: TCurrencyEdit
          Left = 488
        end
        inherited edVO_MONTOPERCEPCION: TCurrencyEdit
          Left = 617
        end
        inherited edVO_MONTODEBITO: TCurrencyEdit
          Left = 738
        end
        inherited edVO_OBSERVACIONDEBITO: TMemo
          Width = 729
        end
        inherited chContratoART: TCheckBox
          Left = 607
        end
        inherited chContratoMutual: TCheckBox
          Left = 680
        end
        inherited chMixto: TCheckBox
          Left = 752
        end
      end
    end
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT * FROM MAU_AUTOPAGO_AMP')
    Left = 236
    object sdqConsultaAU_VOLANTE: TFloatField
      FieldName = 'AU_VOLANTE'
    end
    object sdqConsultaAU_DESTINO: TStringField
      FieldName = 'AU_DESTINO'
      Size = 4000
    end
    object sdqConsultaAU_PRESTADORES: TStringField
      FieldName = 'AU_PRESTADORES'
      Size = 150
    end
    object sdqConsultaAU_FACTURA: TStringField
      FieldName = 'AU_FACTURA'
      Size = 15
    end
    object sdqConsultaAU_FECHAFACTURA: TDateTimeField
      FieldName = 'AU_FECHAFACTURA'
    end
    object sdqConsultaAU_IMPORTE: TFloatField
      FieldName = 'AU_IMPORTE'
      DisplayFormat = ',0.00'
    end
    object sdqConsultaAU_DESCRIPCION: TStringField
      FieldName = 'AU_DESCRIPCION'
      Size = 14
    end
    object sdqConsultaAU_FECHAAPROBACION: TDateTimeField
      FieldName = 'AU_FECHAAPROBACION'
    end
    object sdqConsultaAU_USUARIOAPROBACION: TStringField
      FieldName = 'AU_USUARIOAPROBACION'
    end
    object sdqConsultaAU_DESTINATARIO: TStringField
      FieldName = 'AU_DESTINATARIO'
      Size = 1
    end
    object sdqConsultaAU_ASISTENCIAL: TFloatField
      FieldName = 'AU_ASISTENCIAL'
    end
    object sdqConsultaAU_PREST_FECHABAJA: TDateTimeField
      FieldName = 'AU_PREST_FECHABAJA'
    end
    object sdqConsultaAU_IDPRESTADOR: TFloatField
      FieldName = 'AU_IDPRESTADOR'
    end
    object sdqConsultaAU_APAGAR: TFloatField
      FieldName = 'AU_APAGAR'
      DisplayFormat = ',0.00'
    end
    object sdqConsultaAU_ESTADO: TStringField
      FieldName = 'AU_ESTADO'
      Size = 3
    end
  end
  object dsConsulta: TDataSource
    DataSet = sdqConsulta
    Left = 267
  end
  object FormPlacement: TFormPlacement
    UseRegistry = True
    Left = 292
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <
      item
        Name = 'LIMITAR'
      end>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = True
    Left = 320
  end
  object sdqDetalle: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT   if_idvolante "Volante", if_idlote "Lote", em_nombre "Em' +
        'presa",'
      '         es_nroestableci "Estab.", es_nombre "Nombre Estab.",'
      '         if_fecha "F.Prest.",'
      '         DECODE(if_concepto,'
      '                0, es_descripcion,'
      '                1, '#39'Vi'#225'ticos D'#237'as'#39','
      '                2, '#39'Vi'#225'ticos KM'#39'),'
      
        '                3, NVL2 (if_observaciones, if_observaciones, '#39'Ot' +
        'ros conceptos'#39')) "Prestaci'#243'n",'
      '         if_cantfacturada "Cantidad", if_valorfacturado "Valor",'
      '         NVL(if_cantfacturada * if_valorfacturado, 0) "A Pagar",'
      '         tb_descripcion "Estado"'
      
        '    FROM art.sif_itemfacturaamp, aes_estudios, ctb_tablas, aem_e' +
        'mpresa,'
      '         aes_establecimiento aes'
      '   WHERE tb_codigo(+) = if_estado'
      '     AND tb_clave = '#39'MUVOL'#39
      '     AND aes.es_id = if_idestableci'
      '     AND em_id = if_idempresa'
      '     AND es_codigo = if_idestudio'
      '     AND if_estado NOT IN('#39'X'#39', '#39'Z'#39')'
      '     AND if_idvolante = :pvolante'
      'ORDER BY if_id')
    Left = 409
    Top = 2
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pVolante'
        ParamType = ptInput
      end>
  end
  object dsDetalle: TDataSource
    DataSet = sdqDetalle
    Left = 437
    Top = 2
  end
  object dlgDetalle: TLookupDialog
    Caption = 'Detalle del Volante AMP'
    CharCase = ecNormal
    DataSource = dsDetalle
    DataField = 'Volante'
    Columns = <
      item
        Expanded = False
        FieldName = 'Volante'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Lote'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Empresa'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Estab.'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nombre Estab.'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F.Prest.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Prestaci'#243'n'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cantidad'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'A Pagar'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Estado'
        Width = 150
        Visible = True
      end>
    AutoFill = False
    ShowButtons = True
    ShowEditor = False
    ShowHeaders = True
    AllowCancel = True
    MaxRows = 0
    MinRows = 8
    ShowExportar = True
    Left = 378
    Top = 65535
  end
end
