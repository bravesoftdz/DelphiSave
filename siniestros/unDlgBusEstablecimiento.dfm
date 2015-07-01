inherited frmDlgBusEstablecimiento: TfrmDlgBusEstablecimiento
  Left = 243
  Top = 237
  Width = 670
  Height = 440
  BorderIcons = [biSystemMenu]
  Caption = 'B'#250'squeda de Establecimientos'
  Constraints.MinHeight = 440
  Constraints.MinWidth = 670
  Font.Name = 'Tahoma'
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  object gbDatos: TJvgGroupBox [0]
    Left = 0
    Top = 308
    Width = 662
    Height = 76
    Align = alBottom
    Caption = ' Datos '
    TabOrder = 5
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
    DesignSize = (
      662
      76)
    FullHeight = 0
    object Label6: TLabel
      Left = 8
      Top = 50
      Width = 40
      Height = 13
      Caption = 'C.U.I.T.'
    end
    object Label7: TLabel
      Left = 140
      Top = 50
      Width = 41
      Height = 13
      Caption = 'Empresa'
    end
    object Label8: TLabel
      Left = 8
      Top = 24
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    object Label9: TLabel
      Left = 352
      Top = 24
      Width = 44
      Height = 13
      Caption = 'Actividad'
    end
    object Label11: TLabel
      Left = 416
      Top = 50
      Width = 48
      Height = 13
      Caption = 'Preventor'
    end
    object edEmpresa: TDBEdit
      Left = 184
      Top = 46
      Width = 225
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'EM_NOMBRE'
      DataSource = dsConsulta
      ReadOnly = True
      TabOrder = 1
    end
    object edObservaciones: TDBMemo
      Left = 84
      Top = 20
      Width = 261
      Height = 21
      TabStop = False
      BevelWidth = 0
      Color = clBtnFace
      DataField = 'ES_OBSERVACIONES'
      DataSource = dsConsulta
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 2
    end
    object edActividad: TDBMemo
      Left = 400
      Top = 20
      Width = 254
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      BevelWidth = 0
      Color = clBtnFace
      DataField = 'AC_DESCRIPCION'
      DataSource = dsConsulta
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 3
    end
    object edCUIT: TJvDBMaskEdit
      Left = 52
      Top = 46
      Width = 81
      Height = 21
      TabStop = False
      BevelWidth = 0
      Color = clBtnFace
      DataField = 'EM_CUIT'
      DataSource = dsConsulta
      ReadOnly = True
      TabOrder = 0
    end
    object edPreventor: TDBEdit
      Left = 468
      Top = 46
      Width = 225
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'PREVENTOR'
      DataSource = dsConsulta
      ReadOnly = True
      TabOrder = 4
    end
  end
  inherited pnlFiltros: TPanel
    Width = 662
    Height = 89
    Visible = True
    DesignSize = (
      662
      89)
    object Label1: TLabel
      Left = 4
      Top = 8
      Width = 24
      Height = 13
      Caption = 'CUIT'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    inline fraEmpresa: TfraEmpresa
      Left = 36
      Top = 4
      Width = 623
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
        623
        21)
      inherited lbRSocial: TLabel
        Left = 87
      end
      inherited lbContrato: TLabel
        Left = 519
      end
      inherited mskCUIT: TMaskEdit
        Font.Name = 'Tahoma'
        ParentFont = False
      end
      inherited edContrato: TIntEdit
        Left = 566
        Font.Name = 'Tahoma'
        ParentFont = False
      end
      inherited cmbRSocial: TArtComboBox
        Width = 384
        Font.Name = 'Tahoma'
        ParentFont = False
      end
    end
    object edBusqueda: TEdit
      Left = 316
      Top = 32
      Width = 342
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 2
      OnChange = edBusquedaChange
    end
    object edBusqueda2: TEdit
      Left = 316
      Top = 60
      Width = 342
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 4
      OnChange = edBusqueda2Change
    end
    object pnlBusqueda2: TPanel
      Left = 0
      Top = 58
      Width = 314
      Height = 25
      BevelOuter = bvNone
      TabOrder = 3
      object rb5: TRadioButton
        Left = 4
        Top = 4
        Width = 89
        Height = 17
        Caption = 'Denominaci'#243'n'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = rb2Click
      end
      object rb6: TRadioButton
        Left = 96
        Top = 4
        Width = 69
        Height = 17
        Caption = 'Localidad'
        TabOrder = 1
        OnClick = rb2Click
      end
      object rb7: TRadioButton
        Left = 172
        Top = 4
        Width = 45
        Height = 17
        Caption = 'Calle'
        TabOrder = 2
        OnClick = rb2Click
      end
      object rb8: TRadioButton
        Left = 224
        Top = 4
        Width = 89
        Height = 17
        Caption = 'C'#243'digo Postal'
        TabOrder = 3
        OnClick = rb2Click
      end
    end
    object pnlBusqueda1: TPanel
      Left = 0
      Top = 32
      Width = 315
      Height = 25
      BevelOuter = bvNone
      TabOrder = 1
      object rb1: TRadioButton
        Left = 4
        Top = 4
        Width = 89
        Height = 17
        Caption = 'Denominaci'#243'n'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = rbClick
      end
      object rb2: TRadioButton
        Left = 96
        Top = 4
        Width = 69
        Height = 17
        Caption = 'Localidad'
        TabOrder = 1
        OnClick = rbClick
      end
      object rb3: TRadioButton
        Left = 172
        Top = 4
        Width = 45
        Height = 17
        Caption = 'Calle'
        TabOrder = 2
        OnClick = rbClick
      end
      object rb4: TRadioButton
        Left = 224
        Top = 4
        Width = 89
        Height = 17
        Caption = 'C'#243'digo Postal'
        TabOrder = 3
        OnClick = rbClick
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 89
    Width = 662
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 658
      end>
    inherited ToolBar: TToolBar
      Width = 645
      inherited tbPropiedades: TToolButton
        Hint = 'B'#250'squeda'
        ImageIndex = 38
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbLimpiar: TToolButton
        Hint = 'Reactivar'
        ImageIndex = 22
        Visible = True
        OnClick = Reactivacion
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 118
    Width = 662
    Height = 190
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'ES_ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ES_NROESTABLECI'
        Title.Caption = 'N'#186
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_NOMBRE'
        Title.Caption = 'Nombre'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_CALLE'
        Title.Caption = 'Calle'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_CPOSTAL'
        Title.Caption = 'C'#243'digo Postal'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_LOCALIDAD'
        Title.Caption = 'Localidad'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_PROVINCIA'
        Title.Caption = 'Provincia'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOMICILIO'
        Title.Caption = 'Domicilio'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_NUMERO'
        Title.Caption = 'N'#186
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_PISO'
        Title.Caption = 'Piso'
        Width = 26
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_DEPARTAMENTO'
        Title.Caption = 'Depto.'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_CPOSTALA'
        Title.Caption = 'C'#243'digo Postal Arg.'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_CODAREATELEFONOS'
        Title.Caption = 'C'#243'digo de Area (tel)'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_TELEFONOS'
        Title.Caption = 'Tel'#233'fono'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_CODAREAFAX'
        Title.Caption = 'C'#243'digo de Area (fax)'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_FAX'
        Title.Caption = 'Fax'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_EMPLEADOS'
        Title.Caption = 'Empleados'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_MASA'
        Title.Caption = 'Masa Salarial'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_IDACTIVIDAD'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ES_NIVEL'
        Title.Caption = 'Nivel'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_FEINICACTIV'
        Title.Caption = 'Inicio de Actividades'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_FECHAINICEST'
        Title.Caption = 'Apertura del Establecimiento'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ES_EVENTUAL'
        Title.Caption = 'Eventual'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_FECHABAJA'
        Title.Caption = 'Fecha de baja'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_USUBAJA'
        Title.Caption = 'Usuario de baja'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_DOMICILIO'
        Title.Caption = 'Domicilio'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PV_DESCRIPCION'
        Title.Caption = 'Provincia'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_FECHARECEPCIONBAJA'
        Title.Caption = 'Recepci'#243'n de la baja'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_DESCRIPCION'
        Title.Caption = 'Actividad'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PREVENTOR'
        Title.Caption = 'Preventor'
        Visible = True
      end>
  end
  object pnlBottom: TPanel [4]
    Left = 0
    Top = 384
    Width = 662
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      662
      29)
    object Panel2: TPanel
      Left = 2
      Top = 4
      Width = 506
      Height = 24
      Alignment = taLeftJustify
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvLowered
      TabOrder = 0
    end
    object btnAceptarGlobal: TButton
      Left = 510
      Top = 3
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
      TabOrder = 1
    end
    object btnCancelarGlobal: TButton
      Left = 585
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
  end
  inherited fpAbm: TFormPanel
    Left = 340
    Top = 140
    Width = 637
    Height = 337
    Constraints.MaxHeight = 337
    Constraints.MaxWidth = 637
    Constraints.MinHeight = 337
    Constraints.MinWidth = 637
    DesignSize = (
      637
      337)
    inherited BevelAbm: TBevel
      Top = 301
      Width = 629
    end
    inherited btnAceptar: TButton
      Left = 482
      Top = 307
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited btnCancelar: TButton
      Left = 557
      Top = 307
    end
    object grbDomicilio: TGroupBox
      Left = 8
      Top = 164
      Width = 620
      Height = 129
      Caption = ' Domicilio '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      DesignSize = (
        620
        129)
      object lbCAFaxPostal: TLabel
        Left = 368
        Top = 76
        Width = 18
        Height = 13
        Caption = 'C.A'
      end
      object lbFaxPostal: TLabel
        Left = 440
        Top = 76
        Width = 18
        Height = 13
        Caption = 'Fax'
      end
      object Label3: TLabel
        Left = 8
        Top = 104
        Width = 40
        Height = 13
        Caption = 'Domicilio'
      end
      object edES_CODAREAFAX: TPatternEdit
        Left = 388
        Top = 72
        Width = 42
        Height = 21
        MaxLength = 4
        TabOrder = 2
        Pattern = '0123456789'
      end
      object edES_FAX: TPatternEdit
        Left = 460
        Top = 72
        Width = 153
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 60
        TabOrder = 3
        Pattern = '0123456789()-/'
      end
      object edES_DOMICILIO: TEdit
        Left = 52
        Top = 100
        Width = 560
        Height = 21
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        Color = clMenu
        Enabled = False
        TabOrder = 4
      end
      inline fraTelefono: TfraTelefono
        Left = 4
        Top = 72
        Width = 360
        Height = 21
        HorzScrollBar.Visible = False
        VertScrollBar.Visible = False
        TabOrder = 1
        inherited lbTelefonoTitulo: TLabel
          Left = 24
          Width = 14
        end
        inherited btnABMTelefonos: TButton
          Left = 337
        end
        inherited cmbTelefonos: TComboGrid
          Width = 288
          Cells = ()
          ColWidths = (
            64
            64)
        end
      end
      inline fraDomicilio: TfraDomicilio
        Left = 4
        Top = 16
        Width = 608
        Height = 51
        Anchors = [akLeft, akTop, akRight]
        AutoSize = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          608
          51)
        inherited lbCalle: TLabel
          Left = 20
          Caption = 'C&alle'
          FocusControl = fraDomicilio.cmbCalle
        end
        inherited lbNro: TLabel
          Left = 398
        end
        inherited lbPiso: TLabel
          Left = 469
          Width = 19
        end
        inherited lbDto: TLabel
          Left = 541
          Width = 21
        end
        inherited lbCPostal: TLabel
          Left = 4
          Width = 40
          Caption = '&C.Postal'
          FocusControl = fraDomicilio.edCPostal
        end
        inherited lbCPA: TLabel
          Left = 108
          Width = 20
        end
        inherited lbLocalidad: TLabel
          Left = 216
          Width = 44
          Caption = '&Localidad'
          FocusControl = fraDomicilio.cmbLocalidad
        end
        inherited lbProvincia: TLabel
          Left = 447
          Width = 43
        end
        inherited cmbCalle: TArtComboBox
          Width = 315
          ParentFont = True
        end
        inherited edNumero: TEdit
          Left = 419
          ParentFont = True
        end
        inherited edPiso: TEdit
          Left = 491
          ParentFont = True
        end
        inherited edDto: TEdit
          Left = 563
          ParentFont = True
        end
        inherited edCPostal: TIntEdit
          ParentFont = True
        end
        inherited cmbLocalidad: TArtComboBox
          Width = 176
          ParentFont = True
        end
        inherited edProvincia: TEdit
          Left = 495
          ParentFont = True
        end
        inherited edCPA: TPatternEdit
          Left = 132
          ParentFont = True
        end
        inherited btnBuscar: TButton
          Left = 365
        end
      end
    end
    object grbIdentifica: TGroupBox
      Left = 8
      Top = 8
      Width = 621
      Height = 145
      Caption = ' Identificaci'#243'n del Establecimiento '
      TabOrder = 3
      DesignSize = (
        621
        145)
      object lbNombre: TLabel
        Left = 52
        Top = 20
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'Nombre'
      end
      object lbAlta: TLabel
        Left = 6
        Top = 72
        Width = 83
        Height = 13
        Alignment = taRightJustify
        Caption = 'Inicio Actividades'
      end
      object Label2: TLabel
        Left = 12
        Top = 120
        Width = 77
        Height = 13
        Alignment = taRightJustify
        Caption = 'Apertura Estab.'
      end
      object lbActividad: TLabel
        Left = 45
        Top = 44
        Width = 44
        Height = 13
        Alignment = taRightJustify
        Caption = 'Actividad'
      end
      object lbCantEmpleados: TLabel
        Left = 197
        Top = 72
        Width = 51
        Height = 13
        Caption = 'Empleados'
      end
      object lbMasaSalarial: TLabel
        Left = 186
        Top = 96
        Width = 62
        Height = 13
        Caption = 'Masa Salarial'
      end
      object lbNivel: TLabel
        Left = 443
        Top = 45
        Width = 23
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Nivel'
      end
      object Label4: TLabel
        Left = 328
        Top = 68
        Width = 71
        Height = 13
        Caption = 'Observaciones'
      end
      object Label5: TLabel
        Left = 16
        Top = 96
        Width = 73
        Height = 13
        Alignment = taRightJustify
        Caption = 'Recepci'#243'n Baja'
      end
      object edES_NOMBRE: TEdit
        Left = 92
        Top = 16
        Width = 409
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        MaxLength = 100
        TabOrder = 0
      end
      object edES_FEINICACTIV: TDateComboBox
        Left = 92
        Top = 68
        Width = 88
        Height = 21
        TabOrder = 3
      end
      object edES_FECHAINICEST: TDateComboBox
        Left = 92
        Top = 116
        Width = 88
        Height = 21
        TabOrder = 5
      end
      inline fraES_ACTIVIDAD: TfraActividad
        Left = 91
        Top = 40
        Width = 345
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        DesignSize = (
          345
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 296
        end
      end
      object edES_EMPLEADOS: TIntEdit
        Left = 252
        Top = 68
        Width = 68
        Height = 20
        AutoSize = False
        TabOrder = 6
      end
      object edES_MASA: TCurrencyEdit
        Left = 252
        Top = 92
        Width = 68
        Height = 20
        AutoSize = False
        MaxLength = 12
        TabOrder = 7
      end
      object edES_NIVEL: TPatternEdit
        Left = 471
        Top = 41
        Width = 30
        Height = 21
        Anchors = [akTop, akRight]
        MaxLength = 1
        TabOrder = 2
        Pattern = '1234'
      end
      object edES_OBSERVACIONES: TMemo
        Left = 328
        Top = 84
        Width = 285
        Height = 53
        Anchors = [akLeft, akTop, akRight, akBottom]
        MaxLength = 150
        TabOrder = 9
      end
      object grbSolicitud: TGroupBox
        Left = 509
        Top = 8
        Width = 107
        Height = 54
        Anchors = [akTop, akRight]
        Caption = ' Contrato '
        TabOrder = 10
        DesignSize = (
          107
          54)
        object edES_CONTRATO: TIntEdit
          Left = 6
          Top = 23
          Width = 94
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 0
          Alignment = taRightJustify
          MaxLength = 0
        end
      end
      object cbES_EVENTUAL: TCheckBox
        Left = 252
        Top = 120
        Width = 64
        Height = 17
        Caption = 'Eventual'
        TabOrder = 8
      end
      object edES_FECHARECEPCIONBAJA: TDateComboBox
        Left = 92
        Top = 92
        Width = 88
        Height = 21
        TabOrder = 4
      end
    end
  end
  object fpBusqueda: TFormPanel [6]
    Left = 8
    Top = 240
    Width = 317
    Height = 73
    Caption = 'B'#250'squeda'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    BorderStyle = bsSingle
    Position = poScreenCenter
    ActiveControl = fraEstablecimiento.edCodigo
    DesignSize = (
      317
      73)
    object Bevel1: TBevel
      Left = 4
      Top = 38
      Width = 309
      Height = 3
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label10: TLabel
      Left = 8
      Top = 13
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Button1: TButton
      Left = 161
      Top = 44
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
      TabOrder = 1
    end
    object Button2: TButton
      Left = 236
      Top = 44
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
    inline fraEstablecimiento: TfraEstablecimiento
      Left = 44
      Top = 8
      Width = 268
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        268
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 203
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    Filtered = True
    OnFilterRecord = sdqConsultaFilterRecord
    SQL.Strings = (
      
        'SELECT   ES_ID, ES_NROESTABLECI, ES_NOMBRE, ES_CALLE, ES_CPOSTAL' +
        ', ES_LOCALIDAD, ES_PROVINCIA,'
      
        '            ART.UTILES.ARMAR_DOMICILIO (ES_CALLE, ES_NUMERO, ES_' +
        'PISO, ES_DEPARTAMENTO, NULL)'
      
        '         || ART.UTILES.ARMAR_LOCALIDAD (ES_CPOSTAL, NULL, ES_LOC' +
        'ALIDAD, ES_PROVINCIA) DOMICILIO,'
      
        '         ES_NUMERO, ES_PISO, ES_DEPARTAMENTO, ES_CPOSTALA, ES_CO' +
        'DAREATELEFONOS, ES_TELEFONOS,'
      
        '         ES_CODAREAFAX, ES_FAX, ES_EMPLEADOS, ES_MASA, ES_IDACTI' +
        'VIDAD, AC_DESCRIPCION, ES_NIVEL,'
      
        '         ES_FEINICACTIV, ES_FECHAINICEST, ES_OBSERVACIONES, ES_E' +
        'VENTUAL, ES_FECHABAJA, ES_USUBAJA,'
      
        '         ES_DOMICILIO, PV_DESCRIPCION, ES_FECHARECEPCIONBAJA, ES' +
        '_CONTRATO, EM_CUIT, EM_NOMBRE,'
      
        '         ART.HYS.GET_NOMBRE_PREVENTOR_ESTAB(EM_CUIT, ES_NROESTAB' +
        'LECI, ART.ACTUALDATE) PREVENTOR'
      
        '    FROM AES_ESTABLECIMIENTO, AEM_EMPRESA, ACO_CONTRATO, CPV_PRO' +
        'VINCIAS, CAC_ACTIVIDAD'
      '   WHERE ES_PROVINCIA = PV_CODIGO(+)'
      '     AND ES_CONTRATO = :CONTRATO'
      '     AND AC_ID = ES_IDACTIVIDAD'
      '     AND ES_CONTRATO = CO_CONTRATO'
      '     AND EM_ID = CO_IDEMPRESA'
      'ORDER BY ES_NROESTABLECI')
    Left = 8
    Top = 204
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contrato'
        ParamType = ptInput
      end>
  end
  inherited dsConsulta: TDataSource
    Left = 36
    Top = 204
  end
  inherited SortDialog: TSortDialog
    IniStorage = nil
    Left = 92
    Top = 176
  end
  inherited ExportDialog: TExportDialog
    Left = 120
    Top = 176
  end
  inherited QueryPrint: TQueryPrint
    Left = 120
    Top = 204
  end
  inherited Seguridad: TSeguridad
    Left = 8
    Top = 176
  end
  inherited FormStorage: TFormStorage
    Left = 36
    Top = 176
  end
  inherited PrintDialog: TPrintDialog
    Left = 92
    Top = 204
  end
  inherited ShortCutControl: TShortCutControl
    Left = 64
    Top = 176
  end
  inherited FieldHider: TFieldHider
    Left = 64
    Top = 204
  end
  object ShortCutControlDuplicated: TShortCutControl
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
    Left = 148
    Top = 176
  end
end
