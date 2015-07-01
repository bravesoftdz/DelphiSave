inherited fraABM_ACT_CONTACTO: TfraABM_ACT_CONTACTO
  Width = 549
  inherited AdvToolBarPager: TAdvToolBarPager
    Width = 549
    Height = 63
    Caption.Caption = 'Mantenimiento de Contactos'
    Caption.Visible = False
    inherited AdvPage: TAdvPage
      Top = 26
      Width = 541
      Height = 32
      Caption = 'Contactos'
      inherited AdvToolBar: TAdvToolBar
        Width = 121
        Height = 26
        Caption = ''
        ShowCaption = False
        inherited tbFirst: TDBAdvGlowButton
          Top = 28
          Visible = False
        end
        inherited tbPrior: TDBAdvGlowButton
          Left = 2
          Top = 28
          Visible = False
        end
        inherited tbNext: TDBAdvGlowButton
          Left = 2
          Top = 28
          Visible = False
        end
        inherited tbLast: TDBAdvGlowButton
          Left = 2
          Top = 28
          Visible = False
        end
        inherited tbInsert: TDBAdvGlowButton
          Left = 2
        end
        inherited tbDelete: TDBAdvGlowButton
          Left = 25
        end
        inherited tbEdit: TDBAdvGlowButton
          Left = 48
        end
        inherited tbOk: TDBAdvGlowButton
          Left = 71
        end
        inherited tbCancel: TDBAdvGlowButton
          Left = 94
        end
        inherited tbRefresh: TDBAdvGlowButton
          Left = 117
          Top = 28
          Visible = False
        end
      end
    end
  end
  inherited Grid: TDBAdvGrid
    Top = 63
    Width = 549
    Height = 202
    ColCount = 9
    ParentFont = False
    FixedColWidth = -1
    Columns = <
      item
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'Tahoma'
        HeaderFont.Style = []
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'Tahoma'
        PrintFont.Style = []
        Width = -1
      end
      item
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'CT_CONTACTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Header = 'Apellido | Nombre'
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'Tahoma'
        HeaderFont.Style = []
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'Tahoma'
        PrintFont.Style = []
        Width = 103
      end
      item
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'Correo electr'#243'nico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'Tahoma'
        HeaderFont.Style = []
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'Tahoma'
        PrintFont.Style = []
        Width = 69
      end
      item
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'CT_AREACARGA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Header = 'Area de carga'
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'Tahoma'
        HeaderFont.Style = []
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'Tahoma'
        PrintFont.Style = []
        Width = 79
      end
      item
        Borders = []
        BorderPen.Color = clSilver
        CheckBoxField = True
        CheckFalse = 'N'
        CheckTrue = 'S'
        Color = clWindow
        FieldName = 'CT_FIRMANTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Header = 'Firmante'
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'Tahoma'
        HeaderFont.Style = []
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'Tahoma'
        PrintFont.Style = []
        ReadOnly = True
        Width = 49
      end
      item
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'TELEFONO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Header = 'Tel'#233'fono'
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'Tahoma'
        HeaderFont.Style = []
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'Tahoma'
        PrintFont.Style = []
        Width = 64
      end
      item
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'FAX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Header = 'Fax'
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'Tahoma'
        HeaderFont.Style = []
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'Tahoma'
        PrintFont.Style = []
        Width = 55
      end
      item
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'Cargo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Header = 'Cargo'
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'Tahoma'
        HeaderFont.Style = []
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'Tahoma'
        PrintFont.Style = []
        Width = 48
      end
      item
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'Area'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Header = 'Area'
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'Tahoma'
        HeaderFont.Style = []
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'Tahoma'
        PrintFont.Style = []
        Width = 64
      end>
    ColWidths = (
      -1
      103
      69
      79
      49
      64
      55
      48
      64)
  end
  inherited fpDatos: TFormPanel
    Left = 132
    Top = 32
    Width = 373
    Height = 221
    OnShow = fpDatosShow
    DesignSize = (
      373
      221)
    inherited pnlFondo: TBevel
      Width = 373
      Height = 221
    end
    object Label1: TLabel [1]
      Left = 168
      Top = 92
      Width = 29
      Height = 13
      Caption = 'Cargo'
    end
    object Label2: TLabel [2]
      Left = 168
      Top = 134
      Width = 23
      Height = 13
      Caption = #193'rea'
    end
    inherited btnCancelar: TDBAdvGlowButton
      Left = 288
      Top = 188
      TabOrder = 8
    end
    object edCT_CONTACTO: TDBAdvEdit [4]
      Left = 12
      Top = 28
      Width = 225
      Height = 21
      ShowModified = True
      ReturnIsTab = True
      LengthLimit = 100
      LabelCaption = 'Apellido | Nombre'
      LabelPosition = lpTopLeft
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = clWhite
      Enabled = True
      TabOrder = 0
      Visible = True
      Version = '2.7.0.5'
      ClearOnInsert = True
      DataField = 'CT_CONTACTO'
      DataSource = dsConsultaFrame
    end
    inherited btnAceptar: TDBAdvGlowButton
      Left = 212
      Top = 188
      TabOrder = 7
    end
    object DBAdvEdit2: TDBAdvEdit
      Left = 12
      Top = 68
      Width = 305
      Height = 21
      ShowModified = True
      ReturnIsTab = True
      LengthLimit = 120
      LabelCaption = 'Correo electr'#243'nico'
      LabelPosition = lpTopLeft
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = clWhite
      Enabled = True
      TabOrder = 1
      Visible = True
      Version = '2.7.0.5'
      ClearOnInsert = True
      DataField = 'CT_DIRELECTRONICA'
      DataSource = dsConsultaFrame
    end
    object DBAdvEdit5: TDBAdvEdit
      Left = 12
      Top = 150
      Width = 45
      Height = 21
      ShowModified = True
      ReturnIsTab = True
      LengthLimit = 120
      LabelCaption = 'Fax'
      LabelPosition = lpTopLeft
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = clWhite
      Enabled = True
      TabOrder = 4
      Visible = True
      Version = '2.7.0.5'
      ClearOnInsert = True
      DataField = 'CT_CODAREAFAX'
      DataSource = dsConsultaFrame
    end
    object DBAdvEdit6: TDBAdvEdit
      Left = 60
      Top = 150
      Width = 97
      Height = 21
      ShowModified = True
      ReturnIsTab = True
      LengthLimit = 120
      LabelPosition = lpTopLeft
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = clWhite
      Enabled = True
      TabOrder = 5
      Visible = True
      Version = '2.7.0.5'
      ClearOnInsert = True
      DataField = 'CT_FAX'
      DataSource = dsConsultaFrame
    end
    inline fraCargo: TfraStaticCTB_TABLAS
      Left = 167
      Top = 108
      Width = 194
      Height = 23
      TabOrder = 3
      DesignSize = (
        194
        23)
      inherited edCodigo: TPatternEdit
        Color = clWhite
      end
      inherited cmbDescripcion: TComboGrid
        Width = 130
        Color = clWhite
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
    inline fraArea: TfraStaticCTB_TABLAS
      Left = 167
      Top = 149
      Width = 194
      Height = 23
      TabOrder = 6
      DesignSize = (
        194
        23)
      inherited edCodigo: TPatternEdit
        Color = clWhite
      end
      inherited cmbDescripcion: TComboGrid
        Width = 130
        Color = clWhite
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
    inline fraTelefonos: TfraTelefono
      Left = 4
      Top = 93
      Width = 157
      Height = 37
      HorzScrollBar.Visible = False
      VertScrollBar.Visible = False
      TabOrder = 2
      inherited lbTelefonoTitulo: TLabel
        Left = 8
        Top = 0
        Width = 47
        Caption = 'Tel'#233'fonos'
      end
      inherited btnABMTelefonos: TButton
        Left = 137
        Top = 16
      end
      inherited cmbTelefonos: TComboGrid
        Left = 8
        Top = 16
        Width = 129
        Color = clWhite
        Text = ''
        Cells = ()
        ColWidths = (
          64
          64)
      end
      inherited sdqTelefonos: TSDQuery
        Top = 52
      end
      inherited dsTelefonos: TDataSource
        Top = 52
      end
    end
  end
  inherited AdvToolBarOfficeStyler: TAdvToolBarOfficeStyler
    Left = 132
    Top = 0
  end
  inherited dsConsultaFrame: TDataSource
    Left = 160
    Top = 0
  end
  inherited sdqConsultaFrame: TSDQuery
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT ct_id, ct_idempresa, ct_contacto, ct_cargo, ct_area,'
      '       ct_codareatelefonos, ct_telefonos, ct_codareafax, ct_fax,'
      
        '       ct_direlectronica, ct_fechaalta, ct_usualta, ct_fechamodi' +
        'f,'
      '       ct_usumodif, ct_fechabaja, ct_usubaja, ct_areacarga,'
      '       ct_tipodocumento, ct_numerodocumento, ct_firmante,'
      
        '       art.utiles.armar_telefono(ct_codareatelefonos, null, ct_t' +
        'elefonos) telefono,'
      
        '       art.utiles.armar_telefono(ct_codareafax, null, ct_fax) fa' +
        'x,'
      
        '       art.varios.get_descripciontabla('#39'CTB'#39', ct_cargo, '#39'CARGO'#39')' +
        ' cargo,'
      
        '       art.varios.get_descripciontabla('#39'CTB'#39', ct_area, '#39'AREA'#39') a' +
        'rea'
      '  FROM afi.act_contacto'
      ' WHERE ct_idempresa = :id')
    Left = 188
    Top = 0
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptInput
      end>
    object sdqConsultaFrameCT_ID: TFloatField
      FieldName = 'CT_ID'
      Required = True
    end
    object sdqConsultaFrameCT_IDEMPRESA: TFloatField
      FieldName = 'CT_IDEMPRESA'
      Required = True
    end
    object sdqConsultaFrameCT_CONTACTO: TStringField
      DisplayLabel = 'Apellido | Nombre'
      FieldName = 'CT_CONTACTO'
      Required = True
      Size = 100
    end
    object sdqConsultaFrameCT_CARGO: TStringField
      FieldName = 'CT_CARGO'
      Required = True
      Size = 10
    end
    object sdqConsultaFrameCT_AREA: TStringField
      FieldName = 'CT_AREA'
      Size = 10
    end
    object sdqConsultaFrameCT_CODAREATELEFONOS: TStringField
      FieldName = 'CT_CODAREATELEFONOS'
      Size = 5
    end
    object sdqConsultaFrameCT_TELEFONOS: TStringField
      FieldName = 'CT_TELEFONOS'
      Size = 60
    end
    object sdqConsultaFrameCT_CODAREAFAX: TStringField
      FieldName = 'CT_CODAREAFAX'
      Size = 5
    end
    object sdqConsultaFrameCT_FAX: TStringField
      FieldName = 'CT_FAX'
      Size = 60
    end
    object sdqConsultaFrameCT_DIRELECTRONICA: TStringField
      DisplayLabel = 'Correo electr'#243'nico'
      FieldName = 'CT_DIRELECTRONICA'
      Size = 120
    end
    object sdqConsultaFrameCT_FECHAALTA: TDateTimeField
      FieldName = 'CT_FECHAALTA'
      Required = True
    end
    object sdqConsultaFrameCT_USUALTA: TStringField
      FieldName = 'CT_USUALTA'
      Required = True
    end
    object sdqConsultaFrameCT_FECHAMODIF: TDateTimeField
      FieldName = 'CT_FECHAMODIF'
    end
    object sdqConsultaFrameCT_USUMODIF: TStringField
      FieldName = 'CT_USUMODIF'
    end
    object sdqConsultaFrameCT_FECHABAJA: TDateTimeField
      FieldName = 'CT_FECHABAJA'
    end
    object sdqConsultaFrameCT_USUBAJA: TStringField
      FieldName = 'CT_USUBAJA'
    end
    object sdqConsultaFrameCT_AREACARGA: TStringField
      FieldName = 'CT_AREACARGA'
      Size = 8
    end
    object sdqConsultaFrameCT_TIPODOCUMENTO: TStringField
      FieldName = 'CT_TIPODOCUMENTO'
      Size = 10
    end
    object sdqConsultaFrameCT_NUMERODOCUMENTO: TStringField
      FieldName = 'CT_NUMERODOCUMENTO'
      Size = 8
    end
    object sdqConsultaFrameCT_FIRMANTE: TStringField
      FieldName = 'CT_FIRMANTE'
      Size = 1
    end
    object sdqConsultaFrameTELEFONO: TStringField
      FieldName = 'TELEFONO'
      Size = 4000
    end
    object sdqConsultaFrameFAX: TStringField
      FieldName = 'FAX'
      Size = 4000
    end
    object sdqConsultaFrameCARGO: TStringField
      FieldName = 'CARGO'
      Size = 4000
    end
    object sdqConsultaFrameAREA: TStringField
      FieldName = 'AREA'
      Size = 4000
    end
  end
  inherited sduConsultaFrame: TSDUpdateSQL
    ModifySQL.Strings = (
      'update afi.act_contacto'
      'set'
      '  CT_TIPODOCUMENTO = :CT_TIPODOCUMENTO,'
      '  CT_NUMERODOCUMENTO = :CT_NUMERODOCUMENTO,'
      '  CT_FIRMANTE = :CT_FIRMANTE,'
      '  CT_IDEMPRESA = :CT_IDEMPRESA,'
      '  CT_CONTACTO = :CT_CONTACTO,'
      '  CT_CARGO = :CT_CARGO,'
      '  CT_AREA = :CT_AREA,'
      '  CT_CODAREATELEFONOS = :CT_CODAREATELEFONOS,'
      '  CT_TELEFONOS = :CT_TELEFONOS,'
      '  CT_CODAREAFAX = :CT_CODAREAFAX,'
      '  CT_FAX = :CT_FAX,'
      '  CT_DIRELECTRONICA = :CT_DIRELECTRONICA,'
      '  CT_FECHAMODIF = SYSDATE,'
      '  CT_USUMODIF = UPPER(SYS_CONTEXT('#39'USERENV'#39', '#39'OS_USER'#39')),'
      '  CT_AREACARGA = :CT_AREACARGA'
      'where'
      '  CT_ID = :OLD_CT_ID')
    InsertSQL.Strings = (
      'insert into afi.act_contacto'
      
        '  (CT_ID, CT_TIPODOCUMENTO, CT_NUMERODOCUMENTO, CT_FIRMANTE, CT_' +
        'IDEMPRESA, CT_CONTACTO,'
      
        '   CT_CARGO, CT_AREA, CT_CODAREATELEFONOS, CT_TELEFONOS, CT_CODA' +
        'REAFAX, CT_FAX, CT_DIRELECTRONICA,'
      '   CT_FECHAALTA, CT_USUALTA, CT_AREACARGA)'
      'values'
      
        '  (SEQ_ACT_ID.NextVal, :CT_TIPODOCUMENTO, :CT_NUMERODOCUMENTO, :' +
        'CT_FIRMANTE, :CT_IDEMPRESA, :CT_CONTACTO,'
      
        '   :CT_CARGO, :CT_AREA, :CT_CODAREATELEFONOS, :CT_TELEFONOS, :CT' +
        '_CODAREAFAX, :CT_FAX, :CT_DIRELECTRONICA,'
      
        '    SYSDATE, UPPER(SYS_CONTEXT('#39'USERENV'#39', '#39'OS_USER'#39')), :CT_AREAC' +
        'ARGA)')
    DeleteSQL.Strings = (
      'update afi.act_contacto'
      'set'
      '  CT_FECHABAJA = SYSDATE,'
      '  CT_USUBAJA = UPPER(SYS_CONTEXT('#39'USERENV'#39', '#39'OS_USER'#39'))'
      'where'
      '  CT_ID = :OLD_CT_ID')
    Left = 216
    Top = 0
  end
  inherited AdvMenuOfficeStyler: TAdvMenuOfficeStyler
    IconBar.RadioBorder = clNavy
    Left = 104
    Top = 0
  end
end
