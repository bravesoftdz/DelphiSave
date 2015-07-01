inherited frmManPolizas: TfrmManPolizas
  Left = 306
  Top = 213
  Width = 730
  BorderIcons = [biSystemMenu]
  Caption = 'P'#243'lizas | Seguros de Mala Praxis'
  Constraints.MinHeight = 466
  Constraints.MinWidth = 730
  Font.Name = 'Tahoma'
  FormStyle = fsNormal
  Position = poScreenCenter
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 722
  end
  inherited CoolBar: TCoolBar
    Width = 722
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 718
      end>
    inherited ToolBar: TToolBar
      Width = 705
      inherited ToolButton4: TToolButton
        Visible = True
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Plan de Pagos'
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbLimpiar: TToolButton
        Hint = 'Extender vigencia'
        ImageIndex = 16
        Visible = True
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      inherited tbEnviarMail: TToolButton
        Hint = 'Enviar pedido de documentaci'#243'n'
        Enabled = True
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 722
    Color = clWhite
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    TitleHeight = 51
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'TIPOPOLIZA'
        Title.Caption = 'Tipo de p'#243'liza'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CS_NOMBRE'
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SM_NUMEROPOLIZA'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SM_VIGENCIADESDE'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SM_VIGENCIAHASTA'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONEDASUMA'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SM_SUMAASEGURADA'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONEDAFRANQUICIA'
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SM_FRANQUICIA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONEDAPRIMA'
        Title.Caption = 'Divisa Premio'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SM_PRIMA'
        Title.Caption = 'Premio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONEDAADELANTO'
        Title.Caption = 'Divisa Adel.'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SM_ADELANTO'
        Title.Caption = 'Adelanto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SM_CANTIDADCUOTAS'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SM_CANTIDADCUOTASPAGAS'
        Width = 39
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ESTADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clOlive
        Font.Height = -16
        Font.Name = 'Wingdings'
        Font.Style = []
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VENCIMIENTO'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SM_FECHAALTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'SM_USUALTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'SM_FECHABAJA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'SM_USUBAJA'
        Visible = False
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 132
    Width = 350
    Height = 254
    BorderStyle = bsSingle
    OnBeforeShow = fpAbmBeforeShow
    DesignSize = (
      350
      254)
    inherited BevelAbm: TBevel
      Top = 214
      Width = 342
    end
    object lbNumero: TLabel [1]
      Left = 272
      Top = 8
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
    end
    object lbCA: TLabel [2]
      Left = 7
      Top = 50
      Width = 112
      Height = 13
      Caption = 'Compa'#241#237'a Aseguradora'
    end
    object lbFD: TLabel [3]
      Left = 7
      Top = 90
      Width = 30
      Height = 13
      Caption = 'Desde'
    end
    object lbFH: TLabel [4]
      Left = 104
      Top = 90
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object lbSA: TLabel [5]
      Left = 7
      Top = 132
      Width = 80
      Height = 13
      Caption = 'Suma asegurada'
    end
    object lbF: TLabel [6]
      Left = 140
      Top = 132
      Width = 49
      Height = 13
      Caption = 'Franquicia'
    end
    object Label1: TLabel [7]
      Left = 7
      Top = 172
      Width = 32
      Height = 13
      Caption = 'Premio'
    end
    object Label2: TLabel [8]
      Left = 140
      Top = 172
      Width = 43
      Height = 13
      Caption = 'Adelanto'
    end
    object Label3: TLabel [9]
      Left = 7
      Top = 8
      Width = 65
      Height = 13
      Caption = 'Tipo de p'#243'liza'
    end
    inherited btnAceptar: TButton
      Left = 195
      Top = 222
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 13
    end
    inherited btnCancelar: TButton
      Left = 270
      Top = 222
      TabOrder = 14
    end
    object edSM_NUMEROPOLIZA: TEdit
      Left = 272
      Top = 23
      Width = 69
      Height = 21
      MaxLength = 11
      TabOrder = 1
    end
    inline fraSM_IDCOMPANIA: TfraStaticCodigoDescripcion
      Left = 7
      Top = 65
      Width = 336
      Height = 23
      TabOrder = 2
      DesignSize = (
        336
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 273
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
    object edSM_VIGENCIADESDE: TDateComboBox
      Left = 7
      Top = 106
      Width = 87
      Height = 21
      TabOrder = 3
    end
    object edSM_VIGENCIAHASTA: TDateComboBox
      Left = 104
      Top = 106
      Width = 87
      Height = 21
      TabOrder = 4
    end
    object edSM_FRANQUICIA: TCurrencyEdit
      Left = 184
      Top = 148
      Width = 70
      Height = 21
      AutoSize = False
      TabOrder = 8
    end
    object edSM_SUMAASEGURADA: TCurrencyEdit
      Left = 51
      Top = 148
      Width = 70
      Height = 21
      AutoSize = False
      TabOrder = 6
    end
    object cmbSM_MONEDASUMA: TComboBox
      Left = 7
      Top = 148
      Width = 45
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 5
      TabStop = False
      Items.Strings = (
        '$'
        'U$S')
    end
    object cmbSM_MONEDAFRANQUICIA: TComboBox
      Left = 140
      Top = 148
      Width = 45
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 7
      TabStop = False
      Items.Strings = (
        '$'
        'U$S')
    end
    object edSM_PRIMA: TCurrencyEdit
      Left = 51
      Top = 188
      Width = 70
      Height = 21
      AutoSize = False
      TabOrder = 10
    end
    object cmbSM_MONEDAPRIMA: TComboBox
      Left = 7
      Top = 188
      Width = 45
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 9
      TabStop = False
      Items.Strings = (
        '$'
        'U$S')
    end
    object edSM_ADELANTO: TCurrencyEdit
      Left = 184
      Top = 188
      Width = 70
      Height = 21
      AutoSize = False
      TabOrder = 12
    end
    object cmbSM_MONEDAADELANTO: TComboBox
      Left = 140
      Top = 188
      Width = 45
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 11
      TabStop = False
      Items.Strings = (
        '$'
        'U$S')
    end
    inline fraTipoPoliza: TfraCodigoDescripcion
      Left = 7
      Top = 22
      Width = 259
      Height = 23
      TabOrder = 0
      DesignSize = (
        259
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 194
      end
      inherited edCodigo: TPatternEdit
        Width = 59
      end
    end
  end
  object fpMail: TFormPanel [4]
    Left = 204
    Top = 164
    Width = 249
    Height = 167
    Caption = 'Env'#237'o de mail al prestador'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    OnBeforeShow = fpMailBeforeShow
    DesignSize = (
      249
      167)
    object Bevel1: TBevel
      Left = 3
      Top = 129
      Width = 243
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label4: TLabel
      Left = 8
      Top = 14
      Width = 77
      Height = 13
      Caption = 'Seguro n'#250'mero:'
    end
    object gbMotivoMail: TGroupBox
      Left = 8
      Top = 39
      Width = 229
      Height = 85
      Caption = ' Seleccione el motivo '
      TabOrder = 0
      object rbSinPoliza: TRadioButton
        Left = 12
        Top = 20
        Width = 113
        Height = 17
        Hint = 'Seguro de mala praxis - Sin p'#243'liza'
        Caption = ' Empresa sin p'#243'liza'
        TabOrder = 0
      end
      object rbVencida: TRadioButton
        Left = 12
        Top = 40
        Width = 161
        Height = 17
        Hint = 'Seguro de mala praxis - P'#243'liza vencida'
        Caption = ' Empresa con p'#243'liza vencida'
        TabOrder = 1
      end
      object rbRetrasados: TRadioButton
        Left = 12
        Top = 61
        Width = 177
        Height = 17
        Hint = 'Seguro de mala praxis - No registro de pagos'
        Caption = ' Empresa con pagos retrasados'
        TabOrder = 2
      end
    end
    object btnCancelarMail: TButton
      Left = 162
      Top = 137
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object btnAceptarMail: TButton
      Left = 78
      Top = 137
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
      TabOrder = 2
      OnClick = btnAceptarMailClick
    end
    object edNroSeguro: TEdit
      Left = 92
      Top = 10
      Width = 141
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      'SELECT mcs_companiaseguro.*, msm_seguromalapraxis.*,'
      '       tp_descripcion tipopoliza, tp_exigeplan,  '
      
        '       DECODE(siniestro.get_seguromalapraxisactivo(sm_prestador)' +
        ', sm_id, '#39#252#39', '#39#251#39') AS estado,'
      
        '       DECODE(siniestro.get_seguromalapraxisactivo(sm_prestador)' +
        ','
      
        '              sm_id, siniestro.get_seguroproximovencimiento(sm_p' +
        'restador), NULL) AS vencimiento,'
      '       DECODE(sm_monedaprima, 0, '#39'$'#39', '#39'U$S'#39') AS monedaprima, '
      
        '       DECODE(sm_monedaadelanto, 0, '#39'$'#39', '#39'U$S'#39') AS monedaadelant' +
        'o'
      '  FROM mcs_companiaseguro, msm_seguromalapraxis, mtp_tipopoliza'
      ' WHERE sm_idcompania = cs_id'
      '   AND sm_idtipopoliza = tp_id(+)'
      '   AND sm_prestador = :prestador'
      ''
      ''
      '')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PRESTADOR'
        ParamType = ptInput
      end>
    object sdqConsultaCS_ID: TFloatField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CS_ID'
      Required = True
      Visible = False
    end
    object sdqConsultaCS_NOMBRE: TStringField
      DisplayLabel = 'Compa'#241'ia Aseguradora'
      FieldName = 'CS_NOMBRE'
      Required = True
      Size = 100
    end
    object sdqConsultaSM_ID: TFloatField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'SM_ID'
      Required = True
    end
    object sdqConsultaSM_PRESTADOR: TFloatField
      FieldName = 'SM_PRESTADOR'
      Required = True
      Visible = False
    end
    object sdqConsultaSM_NUMEROPOLIZA: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'SM_NUMEROPOLIZA'
      Required = True
    end
    object sdqConsultaSM_IDCOMPANIA: TFloatField
      FieldName = 'SM_IDCOMPANIA'
      Required = True
      Visible = False
    end
    object sdqConsultaSM_VIGENCIADESDE: TDateTimeField
      DisplayLabel = 'Vigencia desde'
      FieldName = 'SM_VIGENCIADESDE'
      Required = True
    end
    object sdqConsultaSM_VIGENCIAHASTA: TDateTimeField
      DisplayLabel = 'Vigencia hasta'
      FieldName = 'SM_VIGENCIAHASTA'
      Required = True
    end
    object sdqConsultaSM_SUMAASEGURADA: TFloatField
      DisplayLabel = 'Suma Asegurada'
      FieldName = 'SM_SUMAASEGURADA'
      DisplayFormat = '#,##0.00'
    end
    object sdqConsultaSM_PRIMA: TFloatField
      FieldName = 'SM_PRIMA'
      DisplayFormat = '#,##0.00'
    end
    object sdqConsultaSM_FRANQUICIA: TFloatField
      DisplayLabel = 'Franquicia'
      FieldName = 'SM_FRANQUICIA'
      DisplayFormat = '#,##0.00'
    end
    object sdqConsultaSM_CANTIDADCUOTAS: TFloatField
      DisplayLabel = 'Cuotas'
      FieldName = 'SM_CANTIDADCUOTAS'
    end
    object sdqConsultaSM_CANTIDADCUOTASPAGAS: TFloatField
      DisplayLabel = 'Cuotas Pagas'
      FieldName = 'SM_CANTIDADCUOTASPAGAS'
    end
    object sdqConsultaSM_FECHAALTA: TDateTimeField
      DisplayLabel = 'Fecha alta'
      FieldName = 'SM_FECHAALTA'
    end
    object sdqConsultaSM_USUALTA: TStringField
      DisplayLabel = 'Usuario alta'
      FieldName = 'SM_USUALTA'
    end
    object sdqConsultaSM_FECHABAJA: TDateTimeField
      DisplayLabel = 'Fecha baja'
      FieldName = 'SM_FECHABAJA'
    end
    object sdqConsultaSM_USUBAJA: TStringField
      DisplayLabel = 'Usuario baja'
      FieldName = 'SM_USUBAJA'
    end
    object sdqConsultaESTADO: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
      Size = 1
    end
    object sdqConsultaVENCIMIENTO: TDateTimeField
      DisplayLabel = 'Vencimiento'
      FieldName = 'VENCIMIENTO'
    end
    object sdqConsultaMONEDASUMA: TStringField
      DisplayLabel = 'Divisa Suma'
      DisplayWidth = 3
      FieldName = 'MONEDASUMA'
      Size = 3
    end
    object sdqConsultaMONEDAFRANQUICIA: TStringField
      DisplayLabel = 'Divisa Franq.'
      DisplayWidth = 3
      FieldName = 'MONEDAFRANQUICIA'
      Size = 3
    end
    object sdqConsultaMONEDAPRIMA: TStringField
      FieldName = 'MONEDAPRIMA'
      Size = 3
    end
    object sdqConsultaSM_MONEDASUMA: TStringField
      FieldName = 'SM_MONEDASUMA'
      Size = 1
    end
    object sdqConsultaSM_MONEDAFRANQUICIA: TStringField
      FieldName = 'SM_MONEDAFRANQUICIA'
      Size = 1
    end
    object sdqConsultaSM_MONEDAPRIMA: TStringField
      FieldName = 'SM_MONEDAPRIMA'
      Size = 1
    end
    object sdqConsultaSM_ADELANTO: TFloatField
      FieldName = 'SM_ADELANTO'
    end
    object sdqConsultaSM_MONEDAADELANTO: TStringField
      FieldName = 'SM_MONEDAADELANTO'
      Size = 1
    end
    object sdqConsultaMONEDAADELANTO: TStringField
      FieldName = 'MONEDAADELANTO'
      Size = 3
    end
    object sdqConsultaSM_IDTIPOPOLIZA: TFloatField
      FieldName = 'SM_IDTIPOPOLIZA'
    end
    object sdqConsultaTIPOPOLIZA: TStringField
      FieldName = 'TIPOPOLIZA'
      Size = 50
    end
    object sdqConsultaTP_EXIGEPLAN: TStringField
      FieldName = 'TP_EXIGEPLAN'
      Size = 1
    end
  end
  inherited Seguridad: TSeguridad
    Claves = <
      item
        Name = 'PermisoExtenderVigencia'
      end>
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
        LinkControl = tbSalir
      end>
  end
  inherited FieldHider: TFieldHider
    OnlyCommonFields = False
  end
end
