object frmManEstudios: TfrmManEstudios
  Left = 429
  Top = 292
  Width = 442
  Height = 352
  Caption = 'Mantenimiento de Estudios'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object fpABM: TFormPanel
    Left = 8
    Top = 36
    Width = 417
    Height = 280
    Caption = 'Mantenimiento de Estudios'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    OnBeforeShow = fpABMBeforeShow
    ActiveControl = edCodigo
    DesignSize = (
      417
      280)
    object Label1: TLabel
      Left = 12
      Top = 16
      Width = 33
      Height = 13
      Caption = 'C&'#243'digo'
    end
    object Label2: TLabel
      Left = 12
      Top = 44
      Width = 54
      Height = 13
      Caption = '&Descripci'#243'n'
      FocusControl = edDescripcion
    end
    object Label3: TLabel
      Left = 12
      Top = 70
      Width = 85
      Height = 13
      Caption = '&Unidad de Medida'
      FocusControl = edUnidMedida
    end
    object Label5: TLabel
      Left = 12
      Top = 97
      Width = 59
      Height = 13
      Caption = 'Valor M'#237'&nimo'
    end
    object Label4: TLabel
      Left = 12
      Top = 127
      Width = 63
      Height = 13
      Caption = 'Valor &M'#225'ximo'
    end
    object bvSep1: TBevel
      Left = 4
      Top = 239
      Width = 409
      Height = 3
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label6: TLabel
      Left = 12
      Top = 156
      Width = 50
      Height = 13
      Caption = '&Formulario'
    end
    object Label7: TLabel
      Left = 12
      Top = 183
      Width = 104
      Height = 13
      Caption = 'Es&pecialista requerido'
    end
    object btnLimpiarPerfil: TSpeedButton
      Left = 336
      Top = 179
      Width = 23
      Height = 22
      Hint = 'Limpiar Perfil'
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C40E0000C40E0000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0010101020202000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0010
        101020202000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF001F20201F606040606020202000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF001F202066
        666666666620202000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF002F303000808010D0D04FA0A0305F5F20202000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF002F3030666666E3
        E3E3A4A0A066666620202000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF00404040104F4F00D0D000E0E000CFCF00BFBF3050502F2F2F00FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF00404040666666E3E3E3A4
        A0A0E3E3E3A4A0A06666662F2F2F00FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF002F2F2F00909000E0E000C0C000E0E010C0C05FB0B03050502020
        2000FF0000FF0000FF0000FF0000FF0000FF0000FF002F2F2F008080A4A0A0E3
        E3E3CCCCCCD7D7D7B2B2B266666620202000FF0000FF0000FF0000FF0000FF00
        00FF001F1F1F10505000E0E000CFCF00E0E000D0D000DFDF10DFDF2FB0B04060
        6020202000FF0000FF0000FF0000FF0000FF001F1F1F666666B2B2B2E3E3E3CC
        CCCCD7D7D7E3E3E3A4A0A0E3E3E366666620202000FF0000FF0000FF0000FF00
        00FF001010100F80800FD0D000E0E000CFCF00DFDF00D0D03FD0D030DFDF4FB0
        B030606020202000FF0000FF0000FF0000FF00808080666666E3E3E3CCCCCCD7
        D7D7E3E3E3A4A0A0E3E3E3A4A0A0C0C0C066666620202000FF0000FF0000FF00
        302F2F803030204F4F5FC0C000C0C000E0E000D0D030D0D010EFEF00C0C020EF
        EF208F8F10101000FF0000FF0000FF00302F2F808080666666CCCCCCD7D7D7E3
        E3E3A4A0A0E3E3E3A4A0A0C0C0C0C0C0C0B2B2B266666600FF0000FF0000FF00
        80605FD0A0008F502F204F4F5FCFCF00D0D030D0D01FE0E000C0C000E0E0409F
        9F0F20200F0F0F00FF0000FF0000FF0080605F808080808080666666B2B2B2A4
        A0A0E3E3E3A4A0A0C0C0C0C0C0C0B2B2B200666622222200FF0000FF0000FF00
        A05F4FFFF01FDFD06F7F4030204F4F30C0C020DFDF20BFBF40AFAF0F50502F40
        400F0F0F00FF0000FF0000FF0000FF00A4A0A0A4A0A0A4A0A0808080666666E3
        E3E3B2B2B2C0C0C0C0C0C0A4A0A066666639393900FF0000FF0000FF00302F2F
        AF6040E0E06FAFAF7FBF60306F2000204F4F0F8F8F204F4F1F2F2F2F2F2F00FF
        0000FF0000FF0000FF0000FF00302F2FA4A0A0A4A0A0B2B2B2B2B2B280808066
        6666B2B2B233999966666666666600FF0000FF0000FF0000FF0000FF00B07F60
        EFD060C0C0A09F5F3F8030008000003010101010101F1F1F00FF0000FF0000FF
        0000FF0000FF0000FF0000FF00A4A0A0969696C0C0C0B2B2B2B2B2B280808080
        808066666666666600FF0000FF0000FF0000FF0000FF0000FF00805030E0D060
        C0C09F8F502F5F4F4F605F5F605F5F00FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF00666666969696B2B2B2868686969696605F5F605F5F00
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00B06F1FC0C060
        905F302F201F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF00969696A4A0A086868696969600FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF008F4F30605F30
        2F1F1F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0086868686868696969600FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00}
      NumGlyphs = 2
      OnClick = btnLimpiarPerfilClick
    end
    object SpeedButton1: TSpeedButton
      Left = 336
      Top = 152
      Width = 23
      Height = 22
      Hint = 'Limpiar Formulario'
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C40E0000C40E0000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0010101020202000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0010
        101020202000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF001F20201F606040606020202000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF001F202066
        666666666620202000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF002F303000808010D0D04FA0A0305F5F20202000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF002F3030666666E3
        E3E3A4A0A066666620202000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF00404040104F4F00D0D000E0E000CFCF00BFBF3050502F2F2F00FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF00404040666666E3E3E3A4
        A0A0E3E3E3A4A0A06666662F2F2F00FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF002F2F2F00909000E0E000C0C000E0E010C0C05FB0B03050502020
        2000FF0000FF0000FF0000FF0000FF0000FF0000FF002F2F2F008080A4A0A0E3
        E3E3CCCCCCD7D7D7B2B2B266666620202000FF0000FF0000FF0000FF0000FF00
        00FF001F1F1F10505000E0E000CFCF00E0E000D0D000DFDF10DFDF2FB0B04060
        6020202000FF0000FF0000FF0000FF0000FF001F1F1F666666B2B2B2E3E3E3CC
        CCCCD7D7D7E3E3E3A4A0A0E3E3E366666620202000FF0000FF0000FF0000FF00
        00FF001010100F80800FD0D000E0E000CFCF00DFDF00D0D03FD0D030DFDF4FB0
        B030606020202000FF0000FF0000FF0000FF00808080666666E3E3E3CCCCCCD7
        D7D7E3E3E3A4A0A0E3E3E3A4A0A0C0C0C066666620202000FF0000FF0000FF00
        302F2F803030204F4F5FC0C000C0C000E0E000D0D030D0D010EFEF00C0C020EF
        EF208F8F10101000FF0000FF0000FF00302F2F808080666666CCCCCCD7D7D7E3
        E3E3A4A0A0E3E3E3A4A0A0C0C0C0C0C0C0B2B2B266666600FF0000FF0000FF00
        80605FD0A0008F502F204F4F5FCFCF00D0D030D0D01FE0E000C0C000E0E0409F
        9F0F20200F0F0F00FF0000FF0000FF0080605F808080808080666666B2B2B2A4
        A0A0E3E3E3A4A0A0C0C0C0C0C0C0B2B2B200666622222200FF0000FF0000FF00
        A05F4FFFF01FDFD06F7F4030204F4F30C0C020DFDF20BFBF40AFAF0F50502F40
        400F0F0F00FF0000FF0000FF0000FF00A4A0A0A4A0A0A4A0A0808080666666E3
        E3E3B2B2B2C0C0C0C0C0C0A4A0A066666639393900FF0000FF0000FF00302F2F
        AF6040E0E06FAFAF7FBF60306F2000204F4F0F8F8F204F4F1F2F2F2F2F2F00FF
        0000FF0000FF0000FF0000FF00302F2FA4A0A0A4A0A0B2B2B2B2B2B280808066
        6666B2B2B233999966666666666600FF0000FF0000FF0000FF0000FF00B07F60
        EFD060C0C0A09F5F3F8030008000003010101010101F1F1F00FF0000FF0000FF
        0000FF0000FF0000FF0000FF00A4A0A0969696C0C0C0B2B2B2B2B2B280808080
        808066666666666600FF0000FF0000FF0000FF0000FF0000FF00805030E0D060
        C0C09F8F502F5F4F4F605F5F605F5F00FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF00666666969696B2B2B2868686969696605F5F605F5F00
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00B06F1FC0C060
        905F302F201F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF00969696A4A0A086868696969600FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF008F4F30605F30
        2F1F1F00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0086868686868696969600FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00}
      NumGlyphs = 2
      OnClick = SpeedButton1Click
    end
    object Label8: TLabel
      Left = 12
      Top = 213
      Width = 73
      Height = 13
      Caption = 'Tipo de archivo'
    end
    object edDescripcion: TEdit
      Left = 108
      Top = 40
      Width = 304
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 100
      TabOrder = 1
    end
    object edUnidMedida: TEdit
      Left = 108
      Top = 67
      Width = 221
      Height = 21
      MaxLength = 30
      TabOrder = 2
    end
    object edMinimo: TCurrencyEdit
      Left = 108
      Top = 96
      Width = 121
      Height = 21
      AutoSize = False
      DisplayFormat = ' ,0.00;- ,0.00'
      MaxLength = 12
      TabOrder = 3
    end
    object edMaximo: TCurrencyEdit
      Left = 108
      Top = 124
      Width = 121
      Height = 21
      AutoSize = False
      DisplayFormat = ' ,0.00;- ,0.00'
      MaxLength = 12
      TabOrder = 4
    end
    object edCodigo: TPatternEdit
      Left = 108
      Top = 12
      Width = 65
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 8
      TabOrder = 0
      OnExit = edCodigoExit
      Pattern = '0123456789'
    end
    object btnAceptar: TButton
      Left = 251
      Top = 249
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 332
      Top = 249
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 10
    end
    object cmbFormulario: TRxDBLookupCombo
      Left = 108
      Top = 152
      Width = 221
      Height = 21
      DropDownCount = 8
      LookupField = 'TB_CODIGO'
      LookupDisplay = 'TB_DESCRIPCION'
      LookupSource = dsFormulario
      TabOrder = 6
    end
    object chkSinCosto: TCheckBox
      Left = 240
      Top = 128
      Width = 97
      Height = 17
      Caption = 'Sin costo'
      TabOrder = 5
    end
    object cmbPerfilAMP: TRxDBLookupCombo
      Left = 123
      Top = 179
      Width = 205
      Height = 21
      DropDownCount = 8
      LookupField = 'PA_ID'
      LookupDisplay = 'PA_DESCRIPCION'
      LookupSource = dsPerfilAMP
      TabOrder = 7
    end
    object cmbTipoArchivo: TRxDBLookupCombo
      Left = 108
      Top = 209
      Width = 220
      Height = 21
      DropDownCount = 8
      LookupField = 'TA_ID'
      LookupDisplay = 'TA_DESCRIPCION'
      LookupSource = dsTipoArchivo
      TabOrder = 8
    end
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      
        'SELECT   es_codigo, es_descripcion, es_costo, es_umedida, es_max' +
        'imo,'
      
        '         es_minimo, es_formulario, tb_descripcion, es_usualta, e' +
        's_fechalta,'
      
        '         es_usumodif, es_fechamodif, es_usubaja, es_fechabaja, e' +
        's_sincosto,'
      '         es_idperfil, pa_descripcion, es_tipoarchivo'
      '    FROM aes_estudios, ctb_tablas, hys.hpa_perfilamp'
      '   WHERE tb_clave(+) = '#39'EFORM'#39
      '     AND tb_codigo(+) = es_formulario'
      '     AND pa_id(+) = es_idperfil'
      'ORDER BY es_codigo')
    Left = 8
    Top = 4
    object sdqDatosES_CODIGO: TStringField
      FieldName = 'ES_CODIGO'
      Required = True
      Size = 8
    end
    object sdqDatosES_DESCRIPCION: TStringField
      FieldName = 'ES_DESCRIPCION'
      Required = True
      Size = 100
    end
    object sdqDatosES_COSTO: TFloatField
      FieldName = 'ES_COSTO'
    end
    object sdqDatosES_UMEDIDA: TStringField
      FieldName = 'ES_UMEDIDA'
      Size = 30
    end
    object sdqDatosES_MINIMO: TFloatField
      FieldName = 'ES_MINIMO'
    end
    object sdqDatosES_FORMULARIO: TStringField
      FieldName = 'ES_FORMULARIO'
      Size = 5
    end
    object sdqDatosTB_DESCRIPCION: TStringField
      FieldName = 'TB_DESCRIPCION'
      Size = 150
    end
    object sdqDatosES_USUALTA: TStringField
      FieldName = 'ES_USUALTA'
    end
    object sdqDatosES_FECHALTA: TDateTimeField
      FieldName = 'ES_FECHALTA'
    end
    object sdqDatosES_MAXIMO: TFloatField
      FieldName = 'ES_MAXIMO'
    end
    object sdqDatosES_USUMODIF: TStringField
      FieldName = 'ES_USUMODIF'
    end
    object sdqDatosES_FECHAMODIF: TDateTimeField
      FieldName = 'ES_FECHAMODIF'
    end
    object sdqDatosES_USUBAJA: TStringField
      FieldName = 'ES_USUBAJA'
    end
    object sdqDatosES_FECHABAJA: TDateTimeField
      FieldName = 'ES_FECHABAJA'
    end
    object sdqDatosES_SINCOSTO: TStringField
      FieldName = 'ES_SINCOSTO'
      Size = 1
    end
    object sdqDatoses_idperfil: TFloatField
      FieldName = 'es_idperfil'
    end
    object sdqDatosPA_DESCRIPCION: TStringField
      FieldName = 'PA_DESCRIPCION'
      Size = 250
    end
    object sdqDatoses_tipoarchivo: TFloatField
      FieldName = 'es_tipoarchivo'
    end
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 36
    Top = 4
  end
  object ABMDialog: TABMDialog
    Fields = <
      item
        Caption = 'C'#243'digo'
        FieldName = 'ES_CODIGO'
        PrimaryKey = True
        MaxLength = 8
        ColWidth = 54
      end
      item
        Caption = 'Descripci'#243'n'
        FieldName = 'ES_DESCRIPCION'
        MaxLength = 80
        ColWidth = 240
      end
      item
        Caption = 'Unidad de Medida'
        FieldName = 'ES_UMEDIDA'
        MaxLength = 30
        ColWidth = 133
      end
      item
        Caption = 'Valor M'#237'nimo'
        FieldName = 'ES_MINIMO'
        MaxLength = 10
        ColWidth = 68
      end
      item
        Caption = 'Valor M'#225'ximo'
        FieldName = 'ES_MAXIMO'
        MaxLength = 10
        ColWidth = 68
      end
      item
        Caption = 'Formulario'
        FieldName = 'TB_DESCRIPCION'
        MaxLength = 150
        ColWidth = 100
      end
      item
        Caption = 'ES_FECHALTA'
        FieldName = 'ES_FECHALTA'
        Visible = False
        FieldType = ftDateNew
        MaxLength = 18
        ColWidth = 148
      end
      item
        Caption = 'ES_USUALTA'
        FieldName = 'ES_USUALTA'
        Visible = False
        FieldType = ftUserNew
        MaxLength = 20
        ColWidth = 164
      end
      item
        Caption = 'ES_FECHAMODIF'
        FieldName = 'ES_FECHAMODIF'
        Visible = False
        FieldType = ftDateModify
        MaxLength = 18
        ColWidth = 148
      end
      item
        Caption = 'ES_USUMODIF'
        FieldName = 'ES_USUMODIF'
        Visible = False
        FieldType = ftUserModify
        MaxLength = 20
        ColWidth = 164
      end
      item
        Caption = 'ES_FECHABAJA'
        FieldName = 'ES_FECHABAJA'
        Visible = False
        FieldType = ftDateDelete
        MaxLength = 18
        ColWidth = 148
      end
      item
        Caption = 'ES_USUBAJA'
        FieldName = 'ES_USUBAJA'
        Visible = False
        FieldType = ftUserDelete
        MaxLength = 20
        ColWidth = 164
      end
      item
        Caption = 'Sin costo'
        FieldName = 'ES_SINCOSTO'
        DefaultValue = 'N'
        EditType = etCheck
        MaxLength = 1
        ColWidth = 12
      end
      item
        Caption = 'Especialista requerido (Perfil)'
        FieldName = 'PA_DESCRIPCION'
        MaxLength = 250
        ColWidth = 400
      end>
    Caption = 'Mantenimiento de Estudios'
    TableName = 'AES_ESTUDIOS'
    DataSource = dsDatos
    ABMButtons = [abNew, abModify, abDelete, abPrint, abSave, abOrder]
    SortOnExecute = False
    AllowEditPK = False
    Login = frmPrincipal.DBLogin
    MinLeft = 100
    SecurityKey = 'frmManEstudios_ABMDialog'
    BeforePrint = ABMDialogBeforePrint
    BeforeABM = ABMDialogBeforeABM
    AfterABM = ABMDialogAfterABM
    OnGetCellParams = ABMDialogGetCellParams
    Left = 64
    Top = 4
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'C'#243'digo'
        TitleAlignment = taCenter
        DataField = 'ES_CODIGO'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'ES_DESCRIPCION'
        MaxLength = 92
      end
      item
        Title = 'M'#225'ximo'
        TitleAlignment = taCenter
        DataField = 'ES_MAXIMO'
        Alignment = taRightJustify
        FormatFloat = '#,#0.00'
        MaxLength = 12
      end
      item
        Title = 'M'#237'nimo'
        TitleAlignment = taCenter
        DataField = 'ES_MINIMO'
        Alignment = taRightJustify
        FormatFloat = '#,#0.00'
        MaxLength = 12
      end
      item
        Title = 'Unidad de Medida'
        TitleAlignment = taCenter
        DataField = 'ES_UMEDIDA'
        MaxLength = 20
      end>
    DataSource = dsDatos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Estudios'
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
    Detail.Color = 14737632
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
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
    OnGetCellParams = QueryPrintGetCellParams
    Left = 92
    Top = 4
  end
  object sdqFormulario: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'SELECT TB_CODIGO, TB_DESCRIPCION '
      '  FROM CTB_TABLAS'
      ' WHERE TB_CLAVE  (+) = '#39'EFORM'#39
      ' ORDER BY TB_DESCRIPCION ')
    Left = 252
    Top = 184
  end
  object dsFormulario: TDataSource
    DataSet = sdqFormulario
    Left = 280
    Top = 184
  end
  object sdqPerfilAMP: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'SELECT   *'
      '    FROM hys.hpa_perfilamp'
      'ORDER BY pa_descripcion'
      '')
    Left = 249
    Top = 220
  end
  object dsPerfilAMP: TDataSource
    DataSet = sdqPerfilAMP
    Left = 280
    Top = 220
  end
  object sdqTipoArchivo: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'SELECT   ta_id, ta_descripcion'
      '    FROM archivo.rta_tipoarchivo'
      'ORDER BY ta_descripcion')
    Left = 252
    Top = 253
  end
  object dsTipoArchivo: TDataSource
    DataSet = sdqTipoArchivo
    Left = 283
    Top = 253
  end
end
