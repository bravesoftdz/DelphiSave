inherited frmPedidoEndoso: TfrmPedidoEndoso
  Left = 358
  Top = 185
  BorderStyle = bsDialog
  Caption = 'Visualizaci'#243'n de Endoso'
  ClientHeight = 762
  ClientWidth = 756
  FormStyle = fsNormal
  Visible = False
  ExplicitWidth = 762
  ExplicitHeight = 790
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBusqueda: TPanel
    Width = 756
    Visible = False
    ExplicitWidth = 756
  end
  inherited CoolBar: TCoolBar
    Width = 756
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 750
      end>
    ExplicitWidth = 756
    inherited ToolBar: TToolBar
      Left = 9
      Width = 743
      ExplicitLeft = 9
      ExplicitWidth = 743
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
      inherited ToolButton4: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = False
      end
      inherited ToolButton6: TToolButton
        Visible = False
      end
      inherited tbImprimir: TToolButton
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        ImageIndex = 5
      end
      object tbObservaciones: TToolButton
        Left = 174
        Top = 0
        Hint = 'Ver Observaciones'
        Caption = 'Observaciones'
        ImageIndex = 55
        OnClick = tbObservacionesClick
      end
      object tbVerAdjunto: TToolButton
        Left = 199
        Top = 0
        Hint = 'Ver Archivos Adjuntos'
        Caption = 'tbVerAdjunto'
        ImageIndex = 31
        OnClick = tbVerAdjuntoClick
      end
    end
  end
  inherited pnlDatos: TPanel
    Width = 756
    Height = 704
    Align = alClient
    ExplicitWidth = 756
    ExplicitHeight = 704
    DesignSize = (
      756
      704)
    object Label3: TLabel
      Left = 4
      Top = 51
      Width = 37
      Height = 13
      Caption = 'C.U.I.T.'
    end
    object lbSector: TLabel
      Left = 4
      Top = 94
      Width = 31
      Height = 13
      Caption = 'Sector'
    end
    object lbComunicacion: TLabel
      Left = 4
      Top = 153
      Width = 67
      Height = 13
      Caption = 'Comunicaci'#243'n'
    end
    object Label7: TLabel
      Left = 4
      Top = 177
      Width = 71
      Height = 13
      Caption = 'Vigencia Tarifa'
    end
    object lbFirmado: TLabel
      Left = 21
      Top = 202
      Width = 37
      Height = 13
      Caption = 'Firmado'
    end
    object lbEndosoAutomatico: TLabel
      Left = 4
      Top = 226
      Width = 92
      Height = 13
      Caption = 'Endoso Autom'#225'tico'
    end
    object lbEntregaEnMano: TLabel
      Left = 4
      Top = 272
      Width = 82
      Height = 13
      Caption = 'Entrega en Mano'
    end
    object Label8: TLabel
      Left = 5
      Top = 494
      Width = 72
      Height = 13
      Caption = 'Usuario Pedido'
    end
    object Label9: TLabel
      Left = 5
      Top = 517
      Width = 93
      Height = 13
      Caption = 'Usuario Confecci'#243'n'
    end
    object Label10: TLabel
      Left = 5
      Top = 541
      Width = 97
      Height = 13
      Caption = 'Usuario Autorizaci'#243'n'
    end
    object Label11: TLabel
      Left = 5
      Top = 566
      Width = 81
      Height = 13
      Caption = 'Usuario Afiliaci'#243'n'
    end
    object Label12: TLabel
      Left = 485
      Top = 494
      Width = 105
      Height = 13
      Caption = 'Fecha Pedido Endoso'
    end
    object Label13: TLabel
      Left = 485
      Top = 517
      Width = 105
      Height = 13
      Caption = 'Fecha Envio Afiliaci'#243'n'
    end
    object lbNroEndoso: TLabel
      Left = 5
      Top = 647
      Width = 39
      Height = 13
      Caption = 'Endoso:'
    end
    object Bevel1: TBevel
      Left = 0
      Top = 79
      Width = 754
      Height = 3
      Anchors = [akLeft, akRight]
      ExplicitWidth = 748
    end
    object Estado: TLabel
      Left = 223
      Top = 173
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object lbAplicado: TLabel
      Left = 597
      Top = 564
      Width = 41
      Height = 13
      Caption = 'Aplicado'
    end
    object lbTextoCarta: TLabel
      Left = 17
      Top = 249
      Width = 55
      Height = 13
      Caption = 'Texto Carta'
    end
    object Bevel2: TBevel
      Left = 0
      Top = 300
      Width = 748
      Height = 3
    end
    inline fraEmpresa: TfraEmpresa
      Left = 47
      Top = 48
      Width = 674
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      ExplicitLeft = 47
      ExplicitTop = 48
      ExplicitWidth = 674
      DesignSize = (
        674
        24)
      inherited lbContrato: TLabel
        Left = 560
        ExplicitLeft = 560
      end
      inherited edContrato: TIntEdit
        Left = 606
        Width = 65
        ExplicitLeft = 606
        ExplicitWidth = 65
      end
      inherited cmbRSocial: TArtComboBox
        Width = 423
        ExplicitWidth = 423
      end
    end
    object GroupBox1: TGroupBox
      Left = 4
      Top = 4
      Width = 434
      Height = 35
      TabOrder = 1
      object Label1: TLabel
        Left = 5
        Top = 13
        Width = 109
        Height = 13
        Caption = 'N'#186' Revisi'#243'n de Precios'
      end
      object Label2: TLabel
        Left = 213
        Top = 13
        Width = 127
        Height = 13
        Caption = 'Fecha Revisi'#243'n de Precios'
      end
      object edNumeroSolicitud: TIntEdit
        Left = 116
        Top = 10
        Width = 80
        Height = 21
        TabOrder = 0
        Text = '1'
        Value = 1
      end
      object edFechaSolicitud: TDateEdit
        Left = 342
        Top = 10
        Width = 88
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
      end
    end
    inline fraEM_SECTOR: TfraStaticCTB_TABLAS
      Left = 47
      Top = 90
      Width = 311
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      ExplicitLeft = 47
      ExplicitTop = 90
      ExplicitWidth = 311
      ExplicitHeight = 22
      DesignSize = (
        311
        22)
      inherited edCodigo: TPatternEdit
        Left = 0
        ExplicitLeft = 0
      end
      inherited cmbDescripcion: TComboGrid
        Width = 247
        ExplicitWidth = 247
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'TB_CLAVE'
          'TB_ESPECIAL1')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          -1)
      end
    end
    object GroupBox2: TGroupBox
      Left = 4
      Top = 111
      Width = 493
      Height = 35
      TabOrder = 3
      DesignSize = (
        493
        35)
      object lbMotivoSolicitud: TLabel
        Left = 10
        Top = 13
        Width = 90
        Height = 13
        Caption = 'Motivo de Solicitud'
      end
      inline fraMotivoSolicitud: TfraCodDesc
        Left = 106
        Top = 10
        Width = 384
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 106
        ExplicitTop = 10
        ExplicitWidth = 384
        DesignSize = (
          384
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 46
          Top = -1
          Width = 326
          ExplicitLeft = 46
          ExplicitTop = -1
          ExplicitWidth = 326
        end
        inherited edCodigo: TPatternEdit
          Left = 0
          Top = 0
          Width = 40
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 40
        end
        inherited Propiedades: TPropiedadesFrame
          FieldBaja = 'MS_FECHABAJA'
          FieldCodigo = 'MS_CODIGO'
          FieldDesc = 'MS_DETALLE'
          FieldID = 'MS_ID'
          IdType = ctInteger
          TableName = 'AMS_MOTIVOSOLICREAFILIACION'
        end
      end
    end
    inline fraComunicacion: TfraStaticCTB_TABLAS
      Left = 101
      Top = 149
      Width = 314
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      OnExit = fraComunicacionExit
      ExplicitLeft = 101
      ExplicitTop = 149
      ExplicitWidth = 314
      DesignSize = (
        314
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 250
        ExplicitWidth = 250
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'TB_CLAVE'
          'TB_ESPECIAL1')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          -1)
      end
    end
    object cmbVIGENCIATARIFA: TDateComboBox
      Left = 102
      Top = 174
      Width = 86
      Height = 21
      ButtonWidth = 19
      TabOrder = 5
    end
    inline fraEntregaMano: TfraUsuarios
      Left = 102
      Top = 268
      Width = 312
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 7
      ExplicitLeft = 102
      ExplicitTop = 268
      ExplicitWidth = 312
      ExplicitHeight = 22
      DesignSize = (
        312
        22)
      inherited cmbDescripcion: TArtComboBox
        Width = 219
        ExplicitWidth = 219
      end
      inherited edCodigo: TPatternEdit
        Left = 0
        ExplicitLeft = 0
      end
      inherited sdqDatos: TSDQuery
        Left = 1
        Top = 26
      end
      inherited dsDatos: TDataSource
        Left = 32
        Top = 27
      end
    end
    object gbTarifario: TGroupBox
      Left = 0
      Top = 314
      Width = 680
      Height = 121
      Caption = 'Cuadro Tarifario'
      TabOrder = 8
      DesignSize = (
        680
        121)
      object Label4: TLabel
        Left = 11
        Top = 24
        Width = 21
        Height = 13
        Caption = 'CIIU'
      end
      object Label5: TLabel
        Left = 11
        Top = 52
        Width = 30
        Height = 13
        Caption = 'CIIU 2'
      end
      object Label6: TLabel
        Left = 11
        Top = 80
        Width = 30
        Height = 13
        Caption = 'CIIU 3'
      end
      object Label34: TLabel
        Left = 7
        Top = 102
        Width = 66
        Height = 13
        Alignment = taRightJustify
        Caption = 'Prima x c'#225'pita'
      end
      object Label35: TLabel
        Left = 347
        Top = 101
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'Suma Fija'
      end
      object Label38: TLabel
        Left = 174
        Top = 101
        Width = 73
        Height = 13
        Alignment = taRightJustify
        Caption = 'Porcentaje Var.'
      end
      inline fraCiiuNuevo1: TfraStaticActividad
        Left = 48
        Top = 20
        Width = 622
        Height = 26
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 48
        ExplicitTop = 20
        ExplicitWidth = 622
        ExplicitHeight = 26
        DesignSize = (
          622
          26)
        inherited edCodigo: TPatternEdit
          Top = 0
          ExplicitTop = 0
        end
        inherited cmbDescripcion: TComboGrid
          Left = 64
          Top = 0
          Width = 559
          ExplicitLeft = 64
          ExplicitTop = 0
          ExplicitWidth = 559
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
      inline fraCiiuNuevo2: TfraStaticActividad
        Left = 48
        Top = 47
        Width = 622
        Height = 26
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ExplicitLeft = 48
        ExplicitTop = 47
        ExplicitWidth = 622
        ExplicitHeight = 26
        DesignSize = (
          622
          26)
        inherited edCodigo: TPatternEdit
          Top = 0
          ExplicitTop = 0
        end
        inherited cmbDescripcion: TComboGrid
          Left = 64
          Top = 0
          Width = 559
          ExplicitLeft = 64
          ExplicitTop = 0
          ExplicitWidth = 559
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
      inline fraCiiuNuevo3: TfraStaticActividad
        Left = 48
        Top = 74
        Width = 622
        Height = 26
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        ExplicitLeft = 48
        ExplicitTop = 74
        ExplicitWidth = 622
        ExplicitHeight = 26
        DesignSize = (
          622
          26)
        inherited edCodigo: TPatternEdit
          Top = 0
          ExplicitTop = 0
        end
        inherited cmbDescripcion: TComboGrid
          Left = 64
          Top = 0
          Width = 559
          ExplicitLeft = 64
          ExplicitTop = 0
          ExplicitWidth = 559
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
      object edCostoXTrabajadorCotizado: TCurrencyEdit
        Left = 79
        Top = 98
        Width = 76
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        Color = clBtnFace
        MaxLength = 12
        ReadOnly = True
        TabOrder = 3
      end
      object edCostoFijoCotizado: TCurrencyEdit
        Left = 398
        Top = 98
        Width = 76
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        Color = clBtnFace
        MaxLength = 12
        ReadOnly = True
        TabOrder = 4
      end
      object edPorcentajeVariableCotizado: TCurrencyEdit
        Left = 249
        Top = 98
        Width = 76
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        Color = clBtnFace
        DecimalPlaces = 3
        DisplayFormat = ',0.000 %;-,0.000 %'
        MaxLength = 12
        ReadOnly = True
        TabOrder = 5
      end
    end
    inline fraUsuAlta: TfraUsuarios
      Left = 107
      Top = 490
      Width = 319
      Height = 22
      TabOrder = 10
      ExplicitLeft = 107
      ExplicitTop = 490
      ExplicitWidth = 319
      ExplicitHeight = 22
      DesignSize = (
        319
        22)
      inherited cmbDescripcion: TArtComboBox
        Left = 80
        Width = 226
        ExplicitLeft = 80
        ExplicitWidth = 226
      end
      inherited edCodigo: TPatternEdit
        Width = 76
        ExplicitWidth = 76
      end
    end
    inline fraUsuAfiliacion: TfraUsuarios
      Left = 107
      Top = 560
      Width = 319
      Height = 22
      TabOrder = 11
      ExplicitLeft = 107
      ExplicitTop = 560
      ExplicitWidth = 319
      ExplicitHeight = 22
      DesignSize = (
        319
        22)
      inherited cmbDescripcion: TArtComboBox
        Left = 80
        Width = 226
        ExplicitLeft = 80
        ExplicitWidth = 226
      end
      inherited edCodigo: TPatternEdit
        Width = 76
        ExplicitWidth = 76
      end
    end
    inline fraUsuConfeccion: TfraUsuarios
      Left = 107
      Top = 514
      Width = 319
      Height = 22
      TabOrder = 12
      ExplicitLeft = 107
      ExplicitTop = 514
      ExplicitWidth = 319
      ExplicitHeight = 22
      DesignSize = (
        319
        22)
      inherited cmbDescripcion: TArtComboBox
        Left = 80
        Width = 226
        ExplicitLeft = 80
        ExplicitWidth = 226
      end
      inherited edCodigo: TPatternEdit
        Width = 76
        ExplicitWidth = 76
      end
    end
    object edTC_FECHAAUTORIZA: TDateComboBox
      Left = 595
      Top = 491
      Width = 86
      Height = 21
      ButtonWidth = 19
      TabOrder = 13
    end
    object edFechaEnvioAfi: TDateComboBox
      Left = 595
      Top = 514
      Width = 86
      Height = 21
      ButtonWidth = 19
      TabOrder = 14
    end
    object btnEnviarSuscripciones: TAdvGlassButton
      Left = 284
      Top = 604
      Width = 154
      Height = 32
      BackColor = clLime
      Caption = 'Enviar a Suscripciones'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ForeColor = clWhite
      GlowColor = 16760205
      InnerBorderColor = clBlack
      OuterBorderColor = clWhite
      ParentFont = False
      ShineColor = clWhite
      TabOrder = 16
      Version = '1.2.3.1'
      OnClick = btnEnviarSuscripcionesClick
    end
    object btnEnviarAfiliaciones: TAdvGlassButton
      Left = 461
      Top = 604
      Width = 154
      Height = 32
      BackColor = clLime
      Caption = 'Enviar a Afiliaciones'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ForeColor = clWhite
      GlowColor = 16760205
      InnerBorderColor = clBlack
      OuterBorderColor = clWhite
      ParentFont = False
      ShineColor = clWhite
      TabOrder = 17
      Version = '1.2.3.1'
      OnClick = btnEnviarAfiliacionesClick
    end
    object GroupBox3: TGroupBox
      Left = 0
      Top = 437
      Width = 680
      Height = 44
      TabOrder = 9
      object Label15: TLabel
        Left = 5
        Top = 17
        Width = 71
        Height = 13
        Caption = 'Motivo Endoso'
      end
      inline fraMOTIVO: TfraStaticCTB_TABLAS
        Left = 107
        Top = 13
        Width = 305
        Height = 24
        TabOrder = 0
        ExplicitLeft = 107
        ExplicitTop = 13
        ExplicitWidth = 305
        ExplicitHeight = 24
        DesignSize = (
          305
          24)
        inherited cmbDescripcion: TComboGrid
          Width = 243
          ExplicitWidth = 243
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja'
            'TB_CLAVE'
            'TB_ESPECIAL1')
          ColWidths = (
            40
            300
            -1
            -1
            -1
            -1)
        end
      end
    end
    object edAplicado: TEdit
      Left = 641
      Top = 561
      Width = 40
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 18
      Text = 'P'
    end
    inline fraEstado: TfraStaticCTB_TABLAS
      Left = 260
      Top = 172
      Width = 314
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 6
      ExplicitLeft = 260
      ExplicitTop = 172
      ExplicitWidth = 314
      DesignSize = (
        314
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 250
        ExplicitWidth = 250
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'TB_CLAVE'
          'TB_ESPECIAL1')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          -1)
      end
    end
    object btnRechazar: TAdvGlassButton
      Left = 108
      Top = 604
      Width = 154
      Height = 32
      BackColor = clRed
      Caption = 'Rechazar Pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ForeColor = clWhite
      GlowColor = 16760205
      InnerBorderColor = clBlack
      OuterBorderColor = clWhite
      ParentFont = False
      ShineColor = clWhite
      TabOrder = 15
      Version = '1.2.3.1'
      OnClick = btnRechazarClick
    end
    object fpObservaciones: TFormPanel
      Left = 249
      Top = 88
      Width = 449
      Height = 211
      Caption = 'Observaci'#243'n'
      FormWidth = 0
      FormHeigth = 0
      FormLeft = 0
      FormTop = 0
      BorderStyle = bsDialog
      Position = poOwnerFormCenter
      object edObservaciones: TMemo
        Left = 17
        Top = 46
        Width = 419
        Height = 123
        TabOrder = 0
      end
      object btnAceptarObservacion: TButton
        Left = 279
        Top = 175
        Width = 75
        Height = 25
        Caption = 'Aceptar'
        TabOrder = 1
        OnClick = btnAceptarObservacionClick
      end
      object btnCancelarObservacion: TButton
        Left = 360
        Top = 175
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 2
        OnClick = btnCancelarObservacionClick
      end
      object rgTipoRechazo: TRadioGroup
        Left = 17
        Top = 3
        Width = 416
        Height = 37
        Columns = 2
        Items.Strings = (
          'Rechazar Pedido'
          'Eliminar Pedido')
        TabOrder = 3
        OnClick = rgTipoRechazoClick
      end
    end
    object edUsuarioAutorizacion: TEdit
      Left = 108
      Top = 538
      Width = 304
      Height = 21
      TabOrder = 20
    end
    object cboxFirmado: TComboBox
      Left = 102
      Top = 200
      Width = 69
      Height = 21
      TabOrder = 21
      Items.Strings = (
        'S'#237
        'No'
        '')
    end
    object cboxEndosoAutomatico: TComboBox
      Left = 102
      Top = 223
      Width = 69
      Height = 21
      TabOrder = 22
      Items.Strings = (
        'S'#237
        'No'
        '')
    end
    inline fraCodigoCodTexto: TfraStaticCodigoDescripcion
      Left = 101
      Top = 245
      Width = 312
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 23
      ExplicitLeft = 101
      ExplicitTop = 245
      ExplicitWidth = 312
      ExplicitHeight = 24
      DesignSize = (
        312
        24)
      inherited cmbDescripcion: TComboGrid
        Width = 249
        ExplicitWidth = 249
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
  inherited btnAceptar: TButton
    Left = 602
    Top = 739
    Visible = False
    ExplicitLeft = 602
    ExplicitTop = 739
  end
  inherited btnCancelar: TButton
    Left = 680
    Top = 739
    Visible = False
    ExplicitLeft = 680
    ExplicitTop = 739
  end
  inherited btnAplicar: TButton
    Left = 523
    Top = 739
    Visible = False
    ExplicitLeft = 523
    ExplicitTop = 739
  end
  inherited ShortCutControl: TShortCutControl
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
      end>
  end
  inherited Seguridad: TSeguridad
    AutoEjecutar = False
    DBLogin = frmPrincipal.DBLogin
    Left = 356
  end
  inherited FormStorage: TFormStorage
    Left = 384
  end
end
