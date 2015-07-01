inherited frmControlCampanaF931: TfrmControlCampanaF931
  Left = 384
  Top = 91
  Caption = 'Control Campa'#241'a F931'
  ClientHeight = 450
  ClientWidth = 680
  Constraints.MinWidth = 508
  Position = poOwnerFormCenter
  ExplicitWidth = 688
  ExplicitHeight = 480
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 680
    Height = 188
    Constraints.MinWidth = 680
    Visible = True
    ExplicitWidth = 680
    ExplicitHeight = 188
    object GroupBox1: TGroupBox
      Left = 4
      Top = 4
      Width = 104
      Height = 44
      Caption = ' C.U.I.T. '
      TabOrder = 0
      object edCuitBusqueda: TMaskEdit
        Left = 12
        Top = 16
        Width = 81
        Height = 21
        EditMask = '99-99999999-c;0;'
        MaxLength = 13
        TabOrder = 0
      end
    end
    object GroupBox2: TGroupBox
      Left = 112
      Top = 4
      Width = 568
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Raz'#243'n Social '
      TabOrder = 1
      DesignSize = (
        568
        44)
      object edRazonSocialBusqueda: TEdit
        Left = 12
        Top = 16
        Width = 544
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        TabOrder = 0
        Text = 'EDRAZONSOCIALBUSQUEDA'
      end
    end
    object GroupBox3: TGroupBox
      Left = 4
      Top = 48
      Width = 212
      Height = 44
      TabOrder = 2
      object checkCotizadaMenorTarifario: TCheckBox
        Left = 8
        Top = 16
        Width = 200
        Height = 17
        Caption = 'Al'#237'cuota Cotizada < Al'#237'cuota Tarifario'
        TabOrder = 0
      end
    end
    object GroupBox4: TGroupBox
      Left = 404
      Top = 140
      Width = 136
      Height = 44
      Anchors = [akTop, akRight]
      TabOrder = 8
      object checkF931NoIngresado: TCheckBox
        Left = 12
        Top = 16
        Width = 120
        Height = 17
        Caption = 'F931 NO Ingresado'
        TabOrder = 0
      end
    end
    object GroupBox5: TGroupBox
      Left = 544
      Top = 140
      Width = 136
      Height = 44
      Anchors = [akTop, akRight]
      TabOrder = 9
      object checkF931NoControlado: TCheckBox
        Left = 12
        Top = 16
        Width = 120
        Height = 17
        Caption = 'F931 NO Controlado'
        TabOrder = 0
      end
    end
    object GroupBox6: TGroupBox
      Left = 4
      Top = 92
      Width = 280
      Height = 44
      Caption = ' Entidad '
      TabOrder = 5
      DesignSize = (
        280
        44)
      inline fraEntidad: TfraEntidades
        Left = 12
        Top = 16
        Width = 260
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnExit = fraEntidadExit
        ExplicitLeft = 12
        ExplicitTop = 16
        ExplicitWidth = 260
        DesignSize = (
          260
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 195
          DataSource = nil
          ExplicitWidth = 195
        end
      end
    end
    object GroupBox7: TGroupBox
      Left = 288
      Top = 92
      Width = 392
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Vendedor '
      TabOrder = 6
      DesignSize = (
        392
        44)
      inline fraVendedor: TfraVendedores
        Left = 12
        Top = 16
        Width = 372
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 12
        ExplicitTop = 16
        ExplicitWidth = 372
        DesignSize = (
          372
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 307
          DataSource = nil
          ExplicitWidth = 307
        end
      end
    end
    object GroupBox8: TGroupBox
      Left = 4
      Top = 140
      Width = 396
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Ejecutivo '
      TabOrder = 7
      DesignSize = (
        396
        44)
      inline fraEjecutivo: TfraCodDesc
        Left = 12
        Top = 16
        Width = 372
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 12
        ExplicitTop = 16
        ExplicitWidth = 372
        DesignSize = (
          372
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 307
          DataSource = nil
          ExplicitWidth = 307
        end
        inherited Propiedades: TPropiedadesFrame
          CodigoType = ctInteger
          FieldBaja = 'ec_fechabaja'
          FieldCodigo = 'ec_id'
          FieldDesc = 'ec_nombre'
          FieldID = 'ec_id'
          IdType = ctInteger
          TableName = 'aec_ejecutivocuenta'
        end
      end
    end
    object GroupBox9: TGroupBox
      Left = 468
      Top = 48
      Width = 212
      Height = 44
      TabOrder = 4
      object checkOk: TCheckBox
        Left = 12
        Top = 16
        Width = 56
        Height = 17
        Caption = 'Dif. OK'
        TabOrder = 0
      end
      object checkNo: TCheckBox
        Left = 76
        Top = 16
        Width = 56
        Height = 17
        Caption = 'Dif. NO'
        TabOrder = 1
      end
      object checkSinDif: TCheckBox
        Left = 144
        Top = 16
        Width = 56
        Height = 17
        Caption = 'Sin Dif.'
        TabOrder = 2
      end
    end
    object GroupBox10: TGroupBox
      Left = 220
      Top = 48
      Width = 244
      Height = 44
      TabOrder = 3
      object checkCotizadaMenorTarifario25: TCheckBox
        Left = 8
        Top = 16
        Width = 232
        Height = 17
        Caption = 'Al'#237'cuota Cotizada < (Al'#237'cuota Tarifario - 25%)'
        TabOrder = 0
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 188
    Width = 680
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 674
      end>
    ExplicitTop = 188
    ExplicitWidth = 680
    inherited ToolBar: TToolBar
      Width = 667
      ExplicitWidth = 667
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 217
    Width = 680
    Height = 233
    Columns = <
      item
        Expanded = False
        FieldName = 'cc_cuit'
        Title.Caption = 'C.U.I.T.'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'razonsocial'
        Title.Caption = 'Raz'#243'n Social'
        Width = 215
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'fo_formulario'
        Title.Alignment = taRightJustify
        Title.Caption = 'N'#186' Formulario'
        Width = 100
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'co_contrato'
        Title.Alignment = taRightJustify
        Title.Caption = 'Contrato'
        Width = 77
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'sc_nrosolicitud'
        Title.Alignment = taRightJustify
        Title.Caption = 'Solicitud'
        Width = 82
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'sumafija'
        Title.Alignment = taRightJustify
        Title.Caption = 'Suma Fija'
        Width = 81
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'variable'
        Title.Alignment = taRightJustify
        Title.Caption = 'Variable'
        Width = 83
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'porcvariablecotizado'
        Title.Alignment = taRightJustify
        Title.Caption = 'Porcentaje Variable Cotizado'
        Width = 143
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'sumafijacotizada'
        Title.Alignment = taRightJustify
        Title.Caption = 'Suma Fija Cotizada'
        Width = 100
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'sc_sumafijatarifario'
        Title.Alignment = taRightJustify
        Title.Caption = 'Suma Fija Tarifario'
        Width = 94
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'sc_porcvariabletarifario'
        Title.Alignment = taRightJustify
        Title.Caption = 'Porcentaje Variable Tarifario'
        Width = 139
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'f931completo'
        Title.Alignment = taCenter
        Title.Caption = 'F931 Completo'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cc_usualta'
        Title.Caption = 'Usuario Alta'
        Width = 184
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'cc_fechaalata'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Alta'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cc_usumodif'
        Title.Caption = 'Usuario Modificaci'#243'n'
        Width = 166
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'cc_fechamodif'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Modificaci'#243'n'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cc_usubaja'
        Title.Caption = 'Usuario Baja'
        Width = 128
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'cc_fechabaja'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Baja'
        Width = 134
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'cc_dif_sumafija'
        Title.Alignment = taRightJustify
        Title.Caption = 'Diferencia Suma Fija'
        Width = 112
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'cc_dif_porcmasa'
        Title.Alignment = taRightJustify
        Title.Caption = 'Diferencia Porc. Variable'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tipocierre'
        Title.Caption = 'Tipo Cierre'
        Width = 135
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ejecutivo'
        Title.Caption = 'Ejecutivo de la Entidad'
        Width = 124
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'cc_cantidadcapitas'
        Title.Alignment = taRightJustify
        Title.Caption = '# C'#225'pitas'
        Width = 82
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'cc_masasalarial'
        Title.Alignment = taRightJustify
        Title.Caption = 'Masa Salarial'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'entidad'
        Title.Caption = 'Entidad'
        Width = 137
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 108
    Top = 160
    Width = 560
    Height = 248
    BorderStyle = bsDialog
    OnClose = fpAbmClose
    OnBeforeShow = fpAbmBeforeShow
    ActiveControl = edCuit
    ExplicitLeft = 108
    ExplicitTop = 160
    ExplicitWidth = 560
    ExplicitHeight = 248
    inherited BevelAbm: TBevel
      Top = 212
      Width = 552
      ExplicitTop = 212
      ExplicitWidth = 552
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 36
      Width = 63
      Height = 13
      Caption = 'Raz'#243'n Social'
    end
    object Label2: TLabel [2]
      Left = 8
      Top = 88
      Width = 111
      Height = 13
      Caption = 'Importe Suma Fija F931'
    end
    object Label3: TLabel [3]
      Left = 8
      Top = 112
      Width = 103
      Height = 13
      Caption = 'Importe Variable F931'
    end
    object Label5: TLabel [4]
      Left = 8
      Top = 12
      Width = 37
      Height = 13
      Caption = 'C.U.I.T.'
    end
    object Label4: TLabel [5]
      Left = 128
      Top = 68
      Width = 80
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'F 931'
    end
    object Label6: TLabel [6]
      Left = 288
      Top = 68
      Width = 80
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Al'#237'cuota F931'
    end
    object Label7: TLabel [7]
      Left = 376
      Top = 56
      Width = 80
      Height = 26
      Alignment = taCenter
      AutoSize = False
      Caption = 'Precio Comp. cargado'
      WordWrap = True
    end
    object Label8: TLabel [8]
      Left = 464
      Top = 68
      Width = 80
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Diferencia'
    end
    object Label9: TLabel [9]
      Left = 8
      Top = 136
      Width = 95
      Height = 13
      Caption = 'Cantidad de C'#225'pitas'
    end
    object Label10: TLabel [10]
      Left = 8
      Top = 160
      Width = 63
      Height = 13
      Caption = 'Masa Salarial'
    end
    object Label11: TLabel [11]
      Left = 224
      Top = 12
      Width = 36
      Height = 13
      Caption = 'Entidad'
    end
    inherited btnAceptar: TButton
      Left = 403
      Top = 218
      Width = 72
      Caption = '&Grabar'
      TabOrder = 15
      ExplicitLeft = 403
      ExplicitTop = 218
      ExplicitWidth = 72
    end
    inherited btnCancelar: TButton
      Left = 483
      Top = 218
      Width = 72
      Caption = '&Salir'
      TabOrder = 16
      OnClick = btnCancelarClick
      ExplicitLeft = 483
      ExplicitTop = 218
      ExplicitWidth = 72
    end
    object edSumaFijaAlicuotaF931: TCurrencyEdit
      Left = 288
      Top = 84
      Width = 80
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      TabStop = False
      AutoSize = False
      Color = clBtnFace
      DisplayFormat = '$ ,0.00'
      MaxLength = 12
      ReadOnly = True
      TabOrder = 7
    end
    object edVariableAlicuotaF931: TCurrencyEdit
      Left = 288
      Top = 108
      Width = 80
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      TabStop = False
      AutoSize = False
      Color = clBtnFace
      DecimalPlaces = 3
      DisplayFormat = '% ,0.000'
      MaxLength = 12
      ReadOnly = True
      TabOrder = 8
    end
    object edCuit: TMaskEdit
      Left = 128
      Top = 8
      Width = 80
      Height = 21
      EditMask = '99-99999999-c;0;'
      MaxLength = 13
      TabOrder = 0
      OnExit = edCuitExit
    end
    object edRazonSocial: TEdit
      Left = 128
      Top = 32
      Width = 304
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      Text = 'EDRAZONSOCIALBUSQUEDA'
    end
    object checkF931Completo: TCheckBox
      Left = 6
      Top = 180
      Width = 135
      Height = 17
      Alignment = taLeftJustify
      Caption = 'F931 Completo'
      TabOrder = 13
    end
    object edSumaFijaCompetencia: TCurrencyEdit
      Left = 376
      Top = 84
      Width = 80
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      TabStop = False
      AutoSize = False
      Color = clBtnFace
      DisplayFormat = '$ ,0.00'
      MaxLength = 12
      ReadOnly = True
      TabOrder = 9
    end
    object edVariableCompetencia: TCurrencyEdit
      Left = 376
      Top = 108
      Width = 80
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      TabStop = False
      AutoSize = False
      Color = clBtnFace
      DecimalPlaces = 3
      DisplayFormat = '% ,0.000'
      MaxLength = 12
      ReadOnly = True
      TabOrder = 10
    end
    object edSumaFijaDiferencia: TCurrencyEdit
      Left = 464
      Top = 84
      Width = 80
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      TabStop = False
      AutoSize = False
      Color = 969215
      DisplayFormat = '$ ,0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 12
      ParentFont = False
      ReadOnly = True
      TabOrder = 11
    end
    object edVariableDiferencia: TCurrencyEdit
      Left = 464
      Top = 108
      Width = 80
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      TabStop = False
      AutoSize = False
      Color = 969215
      DecimalPlaces = 3
      DisplayFormat = '% ,0.000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 12
      ParentFont = False
      ReadOnly = True
      TabOrder = 12
    end
    object edSumaFijaF931: TCurrencyEdit
      Left = 128
      Top = 84
      Width = 80
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DisplayFormat = '$ ,0.00'
      MaxLength = 12
      TabOrder = 2
    end
    object edVariableF931: TCurrencyEdit
      Left = 128
      Top = 108
      Width = 80
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DisplayFormat = '$ ,0.00'
      MaxLength = 12
      TabOrder = 3
    end
    object btnCalcular: TBitBtn
      Left = 228
      Top = 88
      Width = 40
      Height = 40
      Hint = 'Calcular'
      Glyph.Data = {
        36100000424D3610000000000000360000002800000020000000200000000100
        20000000000000100000C40E0000C40E00000000000000000000000000000000
        00000000000000000000000000000000000000000008000000260000003F0000
        003A000000240000001000000005000000010000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000B0000006B000000CE000000E30000
        00DA000000BD0000009400000069000000460000002800000013000000060000
        0001000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000005A000000F8000000FE201D1CFE3D38
        36FE2B2726FE050504FD000000F6000000E0000000C30000009C000000700000
        004C0000002D0000001500000008000000020000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000005000000C6000000FE5E5654FEDECBC6FEE1CE
        C8FEE0CDC8FED2C0BBFEA39591FE706663FE3C3735FE0E0D0CFD010000F90000
        00E5000000C9000000A3000000770000005200000032000000190000000A0000
        0002000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000B000000F4080707FED0BEB9FEE2D0CAFED3C2
        BCFEA19490FEA59793FED2C1BBFEE2CFC9FEE1CEC8FEDBC8C3FEB4A5A0FE8176
        73FE4D4744FE1B1918FD020201FB000000E9000000CE000000AA0000007E0000
        0058000000300000000B00000000000000000000000000000000000000000000
        000000000000000000000000001B000000FC23201FFEE1CFCAFEBBACA7FE302C
        2AFE5F5653FE6D6460FE514A47FE7E7370FEE1CEC9FEE2CFCAFEE1CEC9FEDFCD
        C7FEE0CDC8FEDECBC6FEC4B3AEFE928581FE5E5653FE2C2827FE060505FC0000
        00ED000000C6000000660303030F000000000000000000000000000000000000
        000000000000000000000000002F000000FD363231FEE4D2CCFE706865FE8D80
        7BFEA89A94FEA89993FEA69892FE847873FE988C88FEBEAEAAFE544D4BFE4D46
        44FE58504EFE9A8D89FEE0CDC8FEE1CDC8FEE0CDC7FEDFCBC5FED1BEB9FEA294
        8FFE443E3CFE000000DB00000044050504010000000000000000000000000000
        0000000000000000000000000043000000FD4C4644FEE5D4CEFEA89B97FE7D72
        6EFEAD9E98FEAD9E98FEAC9D97FEAA9B95FE897E7AFE635B58FE9F918CFEA193
        8DFE9D8F89FE625956FE938683FED9C7C1FE827773FE69605DFE837774FED4C1
        BBFEDDCAC4FE484240FD0000007C060606060000000000000000000000000000
        0000000000000000000000000058000000FE615A58FEE6D5D0FEE6D4CFFE9A8E
        8BFE827772FEAA9C96FEAD9E98FE948783FEB9ABA7FE807571FEA89993FEA597
        91FEA2948EFE9E918AFE655C59FE857A76FE8D807BFE968983FE796F6AFE443E
        3CFED6C4BEFE8F827EFE00000091090808060000000000000000000000000000
        000000000000000000000000006E000000FE766E6BFEE7D7D1FEE7D7D1FEDFCF
        CAFEBFB1ADFEA99D99FEB1A4A0FED5C5C1FEE6D5D0FEC3B5B1FE877B77FEA697
        92FEA59690FE8F837EFE8B807CFE948883FE998C85FE988B85FE988B85FE685F
        5BFE9F918DFE8F837FFD0000007B0B0A0A030000000000000000000000000000
        0000000000000000000000000084000000FE8C827FFEE8D8D3FE8F8582FE564F
        4CFE776C69FE756B67FE7C726FFED5C6C1FEE8D7D2FEE7D6D1FED8C8C3FEA89B
        97FE9E918DFEB0A29EFEE3D2CCFEBFB0ABFE8D817BFE978A84FE968983FE5850
        4DFEC2B2ACFE6D6461FD00000054000000000000000000000000000000000000
        0000000000000000000000000099000000FEA19693FEE1D2CDFE4A4341FEC1B0
        AAFEC3B1ABFEC2B1ABFEBDADA7FE817773FEE1D1CCFE7D7471FE6D6360FE6E64
        61FE726966FECCBDB9FEE6D5CFFEE5D3CEFEC8B8B3FE9C908BFE8E837FFEBEAE
        A9FEE1CEC8FE484240F507060632000000000000000000000000000000000000
        00000000000000000001000000AD000000FEB8ACA8FEE8D9D4FE544D4BFEC4B3
        ADFEC8B6B1FEC8B6B0FEC6B5AFFE928581FE918784FEA99A94FEB9A9A3FEB5A5
        9FFEAC9D97FE645C59FEDCCDC8FE8A807BFE6D6460FE645C58FE807572FEE0CE
        C8FEE0CEC8FE252221DE0C0B0A1F000000000000000000000000000000000000
        00000000000000000002000000C1020101FECDC0BCFEECDDD9FEC4B8B4FE6961
        5EFE9E908CFEBCABA6FEA2938EFE978C88FEABA09CFEA49691FEBDACA6FEB8A8
        A2FEB3A39DFE706763FE9A8F8BFEA0928DFE9F918BFE9B8E88FE796E6AFE877D
        79FED9C8C2FE070706C116141411000000000000000000000000000000000000
        00000000000000000004000000D5040404FEE0D3CFFEEDDFDBFEECDDD9FECFC2
        BEFE9C928FFEA29895FEC9BDB9FEECDED9FEEBDDD8FE918784FE837874FE9B8D
        88FE807470FE837976FEB6A9A5FE9B8E88FEA0928DFE9C8F89FE90837EFE6D65
        62FEBCADA8FE010101A017151408000000000000000000000000000000000000
        00000000000000000007000000E7111010FEEADDD8FEDBCECAFE6D6563FE9C8E
        8AFEB6A5A0FEA29490FEADA29EFEEDDFDBFEEDDFDBFECFC2BEFEA29895FE9B91
        8EFED1C3BFFEEADBD6FEE9D9D4FE9B908CFE736965FE655C59FE5E5654FECCBC
        B7FE988C89FD0000007B15131303000000000000000000000000000000000000
        0000000000000000000E000000F6252222FEEEE1DCFE7F7775FEB4A49FFED8C5
        BFFEDAC7C1FEDAC6C0FECCBAB4FEB9AEAAFE9B918DFEA59792FEBFAEA8FEA394
        8FFE867C79FEE3D5D1FEE2D3CFFEAEA29EFE9C908CFEAB9F9BFEE4D4CFFEE6D5
        CFFE736A67FD0000005400000000000000000000000000000000000000000000
        0000000000000000001D000000FC3A3736FEF0E3DFFEA9A09DFE766B68FED9C6
        C0FEDDC9C3FEDCC9C3FED0BDB7FEA29895FE807572FECCBAB4FEC6B5AFFEC0AF
        A9FEB0A19BFE968C89FE988C88FEA69892FEA1938DFE847974FE837A77FEE6D6
        D0FE4E4846F50707063200000000000000000000000000000000000000000000
        00000000000000000032000000FD504C4BFEF2E6E2FEF2E5E1FE99918FFE6058
        56FE817572FE7D726FFE847C79FEE7DBD8FE756E6CFEB0A09BFEC5B4AEFEBFAE
        A8FE887B77FE9C928FFE8D817CFEA79993FEA2948EFE9D908AFE534C4AFEE4D3
        CFFE292625DF0C0B0B1F00000000000000000000000000000000000000000000
        00000000000000000047000000FD676160FEF3E7E3FEF4E8E4FEF4E8E4FEF1E6
        E2FEE1D7D3FEEBE0DCFEF3E8E4FEF4E8E4FEEBE0DCFE8F8885FE746D6AFE716A
        67FEA39A97FEEEE0DCFE8C8380FE786E6AFE8A7E79FE615955FE79716EFEE0D0
        CCFE0A0909C21716151100000000000000000000000000000000000000000000
        0000000000000000005C000000FE7C7674FEF5E9E5FEE5DBD7FE847E7CFE7D75
        71FE948B87FEA9A19EFEBFB6B3FED5CBC8FEEADFDBFEF1E5E1FEF2E6E2FEF2E6
        E2FEF1E5E1FEF0E3DFFEEEE1DDFEC5B9B5FE9D9390FEBFB3AFFEE9DAD5FEC3B5
        B1FE010101A11816160800000000000000000000000000000000000000000000
        00000000000000000071000000FE938D8AFEF3E7E4FE383534FE45280DFE9A59
        1FFEA15D23FE965723FE895021FE7C491FFE6E411DFE6C4727FE705136FE755C
        46FE7C6757FE857569FE8E827CFE9E9490FEB3A8A4FEE1D3CFFEEBDCD7FE9F95
        91FD0000007B1715150300000000000000000000000000000000000000000000
        00000000000000000086000000FEABA3A1FEDED4D1FE080503FEA15E24FEAE66
        2BFEB36930FEB66C32FEB86D34FEB86D34FEB66C32FEB2692FFEAD652AFEA660
        24FE9E5A1CFE955415FE8C4E0DFE7F4506FE663701FE473B31FEE8D9D4FE7970
        6EFD000000550000000000000000000000000000000000000000000000000000
        0000000000000000009C000000FEC2B9B6FEC9C0BDFE160D06FEB1682FFEB96E
        36FEBF723BFEC3753EFEC57741FEC57740FEC3753EFEBE723AFEB86D35FEB068
        2DFEA86125FE9E5A1CFE955413FE8C4D0BFE844804FE3F2302FEDACCC8FE524D
        4BF5080707320000000000000000000000000000000000000000000000000000
        000000000001000000B1020201FED7CECBFEB2ABA8FE27170BFEBC7039FEC576
        40FECB7B46FECF7E4AFED2804DFED2804DFECF7E4AFECA7A45FEC3753FFEBA6F
        37FEB0672DFEA56023FE9A5819FE90500FFE874A07FE432C13FEE7D9D5FE2D2A
        29DF0D0C0C1F0000000000000000000000000000000000000000000000000000
        000000000002000000C4040404FEEBE2DEFE999391FE3B2312FEC67741FECF7E
        4AFED68350FEDB8756FEDE8958FEDE8958FEDB8755FED58250FECD7C48FEC375
        3EFEB76D34FEAB6429FEA05B1DFE945313FE894C09FE544333FEE5D7D2FE0C0B
        0BC2191717110000000000000000000000000000000000000000000000000000
        000000000004000000D7121111FEF5ECE8FE827D7BFE52321BFECE7D49FED884
        52FEE08A5AFEE68F60FEEA9163FEEA9163FEE68E5FFEDE8958FED4824FFEC97A
        45FEBD7139FEB0672DFEA35E21FE975515FE894C0BFE675C56FECABDB9FE0101
        01A1191817080000000000000000000000000000000000000000000000000000
        000000000007000000EA272525FEF8EEEBFE787372FE432817FED3814EFEDE89
        58FEE78F61FEEF9568FEF3986CFEF3986BFEED9466FEE58E5EFEDA8654FECE7D
        49FEC0733CFEB3692FFEA55F23FE985617FE7C450BFE847B78FEA49A97FD0000
        007C181616030000000000000000000000000000000000000000000000000000
        000000000006000000EF1E1D1CFEF6EDE9FED8D0CEFE242221FE533320FE8653
        36FE945C3FFEA26648FEAF6E50FEB77353FEBB7452FEBA734EFEB97248FEB56E
        40FEAF6937FEA9632DFEA15D22FE8F5115FE3E250CFEC1B6B2FE7B7471FD0000
        0050000000000000000000000000000000000000000000000000000000000000
        000000000000000000B9010101FEA49E9CFEFAF0EDFEF4EBE8FECFC8C5FEC8C1
        BFFEC0BAB7FEB9B2B0FEAFA9A7FEA8A2A0FE9F9997FE98918FFE8F8886FE8781
        7EFE7E7775FE77716EFE6E6764FE6D6562FEB7ADA9FEE8DAD5FE2B2827E51211
        101C000000000000000000000000000000000000000000000000000000000000
        00000000000006060525000000DA030303FD403E3DFE6C6967FE74706EFE7975
        74FE7F7B7AFE85807EFE8A8583FE908B89FE948E8CFE999391FE9F9896FEA29B
        99FEA79F9DFEADA4A1FEAFA6A3FEB4AAA7FEA39A97FE433F3DF905040461322F
        2E02000000000000000000000000000000000000000000000000000000000000
        0000000000000000000014141309131212510E0D0D781312127D161515811817
        1785181717891918188C1A19188F1A1919931B1A1A981B1A1A9C1B1A1A9E1C1A
        1AA21C1B1AA6070606AB000000AD000000B01110109922201F3B3F3B3A010000
        0000000000000000000000000000000000000000000000000000}
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      TabStop = False
      WordWrap = True
      OnClick = btnCalcularClick
    end
    object rgDiferencia: TRadioGroup
      Left = 288
      Top = 132
      Width = 256
      Height = 40
      Caption = ' Diferencia '
      Columns = 2
      Items.Strings = (
        'Acepta'
        'No acepta')
      TabOrder = 14
    end
    object edMasaSalarial: TCurrencyEdit
      Left = 128
      Top = 156
      Width = 80
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DisplayFormat = '$ ,0.00'
      MaxLength = 12
      TabOrder = 5
    end
    object edCantidadCapitas: TIntEdit
      Left = 128
      Top = 132
      Width = 80
      Height = 21
      TabOrder = 4
    end
    object edEntidad: TEdit
      Left = 272
      Top = 8
      Width = 280
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 17
      Text = 'edEntidad'
    end
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
end
