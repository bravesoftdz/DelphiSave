inherited frmManAsigPrestaFijo: TfrmManAsigPrestaFijo
  Left = 236
  Top = 159
  Width = 800
  Height = 600
  Caption = 'frmManAsigPrestaFijo'
  PixelsPerInch = 96
  TextHeight = 13
  object JvNetscapeSplitter1: TJvNetscapeSplitter [0]
    Left = 0
    Top = 413
    Width = 792
    Height = 10
    Cursor = crVSplit
    Align = alBottom
    Beveled = True
    Color = clBtnShadow
    ParentColor = False
    Maximized = False
    Minimized = False
    ButtonCursor = crDefault
    ButtonStyle = bsWindows
    ButtonColor = clActiveBorder
  end
  inherited CoolBar: TCoolBar [1]
    Top = 97
    Width = 792
    Height = 32
    BandBorderStyle = bsNone
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 788
      end>
    inherited ToolBar: TToolBar
      Width = 775
      inherited tbModificar: TToolButton
        Enabled = True
      end
      inherited tbEliminar: TToolButton
        Enabled = True
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited ToolButton6: TToolButton
        Visible = False
      end
      inherited tbImprimir: TToolButton
        Visible = False
      end
      inherited tbExportar: TToolButton
        Visible = False
      end
    end
  end
  inherited pnlFiltros: TPanel [2]
    Width = 792
    Height = 81
    Visible = True
    object pnlEmpresa: TPanel
      Left = 0
      Top = 0
      Width = 792
      Height = 81
      Align = alTop
      BevelOuter = bvNone
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 0
      object Label1: TLabel
        Left = 0
        Top = 0
        Width = 792
        Height = 13
        Align = alTop
        Caption = 'Empresa'
      end
      object Label4: TLabel
        Left = 0
        Top = 34
        Width = 792
        Height = 20
        Align = alTop
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'Establecimiento'
        ParentBiDiMode = False
        Layout = tlBottom
      end
      inline fraEmpresaFiltro: TfraEmpresa
        Left = 0
        Top = 13
        Width = 792
        Height = 21
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnExit = fraEmpresaFiltroExit
        DesignSize = (
          792
          21)
        inherited lbContrato: TLabel
          Left = 688
        end
        inherited edContrato: TIntEdit
          Left = 735
        end
        inherited cmbRSocial: TArtComboBox
          Left = 127
          Width = 553
          DataSource = nil
        end
      end
      inline fraEstablecimientoFiltro: TfraEstablecimiento
        Left = 0
        Top = 54
        Width = 792
        Height = 23
        Align = alTop
        TabOrder = 1
        DesignSize = (
          792
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 84
          Width = 709
          DataSource = nil
        end
        inherited edCodigo: TPatternEdit
          Width = 80
        end
      end
    end
  end
  object gbTrabajadores: TJvgGroupBox [3]
    Left = 0
    Top = 423
    Width = 792
    Height = 150
    Hint = 'Mostrar/Ocultar Prestadores'#13#10'de la Empresa/Establecimiento'
    Align = alBottom
    Caption = 'Prestadores'
    TabOrder = 3
    Border.Inner = bvNone
    Border.Outer = bvNone
    Border.Bold = True
    CaptionAlignment = fcaWidth
    CaptionBorder.Inner = bvNone
    CaptionBorder.Outer = bvNone
    CaptionBorder.Bold = False
    CaptionGradient.FromColor = clSilver
    CaptionGradient.Active = False
    CaptionGradient.BufferedDraw = True
    CaptionGradient.Orientation = fgdHorizontal
    CaptionShift.X = 8
    CaptionShift.Y = 0
    Colors.Text = clHighlightText
    Colors.TextActive = clWhite
    Colors.Caption = clBtnShadow
    Colors.CaptionActive = clBlue
    Colors.Client = clBtnFace
    Colors.ClientActive = clBtnFace
    Gradient.FromColor = clBlack
    Gradient.ToColor = clGray
    Gradient.Active = False
    Gradient.Orientation = fgdHorizontal
    Options = [fgoCanCollapse, fgoFilledCaption, fgoFluentlyCollapse, fgoFluentlyExpand]
    GlyphCollapsed.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA47755BA
      865DBB865EA87958FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFA3773FDA9D3CCF924DC1875CC58A66D6976AECA76AAF7E59FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA98047E2AD42DFAB42AA7A5D57
      3CA8573CA8A67467EDA864F5AD6DBA865CFF00FFFF00FFFF00FFFF00FFFF00FF
      9F7B54E8BD66E6BE6EE5BD6F9E77790000FF0000FF8F6672DEA03CEAA65EF5AE
      6DAF7E59FF00FFFF00FFFF00FFFF00FFDFBC7CEECE8FECCE96ECCF96AA84840C
      0EFF0000FF987077DBA63BDEA13DEDA864ECA76AFF00FFFF00FFFF00FF9A7C60
      F2D7A0B49289A88996A9899385679E2E2FFF1113FF67499F976F78916771A674
      67D6976AA87958FF00FFFF00FFB09477F9E5BB8C73AB696EFF6365FF5658FF49
      49FD3535FD1819FF0002FF0000FF4F36AEC48967BB865EFF00FFFF00FFB0977F
      FDF0D38D73AD6D72FF6E6FFF6869FF5D5DFC4E4EFD3A3BFF2123FF0104FF5036
      AEBF875DBA855DFF00FFFF00FF9B8170FDF3DEBFA4A6B59BAAB69BA7977BA06A
      6BFE5F60FF896C9EAA8583A27B78AA7A5CCF934DA47756FF00FFFF00FFFF00FF
      EBDFCFFFFEF5FEFDFCFFFEFDB89EAA6F70FF6B6CFFAC8C94ECCE96E5BC6EDFAA
      40DA9E3DFF00FFFF00FFFF00FFFF00FFA58E80FEFCF3FFFFFDFEFDFBB499A96D
      71FF6D71FFA88996ECCE95E6BD6DE2AC41A37740FF00FFFF00FFFF00FFFF00FF
      FF00FFAD978BFEFBF3FFFDF5BEA3A59279AE9177ABB5928AEECE8EE8BC65A980
      46FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA58E80EADFCFFDF3DDFD
      EFD1F9E5BAF2D79EDFBB7B9F7B54FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF9B816FB0977FB094769B7B60FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    GlyphExpanded.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA77855B9
      855DBA855DAB7B59FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF9F743FD59A3AE7A641EBA74CF0AA5DF5AD6AE8A469AE7E59FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB08649E5B046E0AD46DCA83FDB
      A337DBA034E1A144EDA863F6AF6DC28B5EFF00FFFF00FFFF00FFFF00FFFF00FF
      9F7B53EABE67E6BE6EE5BD6FE4BA68E1B55DDEAD4ADAA335DFA03FECA763F6AE
      6DAE7E59FF00FFFF00FFFF00FFFF00FFDCBA7CEECE8FECCE95ECCE95EACB8EE8
      C682E5BE72E1B45ADBA53BDFA03FEEA964E8A569FF00FFFF00FFFF00FF9E8064
      F4DBA6B9978DAA8B97AD8E95AC8B94AC8A8EB08C86AD867DA97F6FAC7C58B47F
      5DD6966AAB7B58FF00FFFF00FFB2967AFAE7C09A7EA26A6EFF6667FF5F60FF54
      55FF4949FD3B3BFD2B2BFE1415FC4632BDAF7A6FBB855DFF00FFFF00FFB29982
      FDF0D49579A46B6EFF6667FF5F60FF5455FF4748FF3739FF2729FF0B10FF4C36
      B7B57E64B9855DFF00FFFF00FF9E8473FEF5E1C4AAABB9A0ACB398AAAF94A7AE
      91A2A6889C9D7D9698768C906C84996D6BC68C54A77957FF00FFFF00FFFF00FF
      E6DBCCFFFEF7FEFDFCFFFEFDFDF9F2FAF2E2F6E8CDF1DDB4EBCC91E4BB6AE0AA
      40D69A3EFF00FFFF00FFFF00FFFF00FF9F887BFFFEF6FFFFFCFEFDFAFCF8F0F9
      F1E1F6E7CCF1DCB3EBCB8FE5BB69E3AD409F7440FF00FFFF00FFFF00FFFF00FF
      FF00FFB4A194FFFEF5FFFEF5FBF3E7F8ECD8F4E4C4F0D9ABEDCC89E9BC60AF84
      45FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F887AE6DAC9FEF3DCFC
      EECFF9E5BAF4D8A0DBB7769E7951FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF9E8472B2987FB195779E7E62FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    FullHeight = 285
    object dbgPrestadores: TArtDBGrid
      Left = 2
      Top = 16
      Width = 788
      Height = 132
      Align = alClient
      DataSource = dsPrestadores
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      IniStorage = FormStorage
      OnGetCellParams = dbgPrestadoresGetCellParams
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'AP_ID'
          ReadOnly = True
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'AP_IDASIGNACIONESTAB'
          ReadOnly = True
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'C'#243'digo'
          ReadOnly = True
          Width = 96
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Descripci'#243'n'
          ReadOnly = True
          Width = 418
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Viegencia Desde'
          ReadOnly = True
          Width = 105
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Vigencia Hasta'
          ReadOnly = True
          Width = 105
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AP_FECHAALTA'
          ReadOnly = True
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'AP_USUALTA'
          ReadOnly = True
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'AP_FECHAMODIF'
          ReadOnly = True
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'AP_USUMODIF'
          ReadOnly = True
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'AP_FECHABAJA'
          ReadOnly = True
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'AP_USUBAJA'
          ReadOnly = True
          Visible = False
        end>
    end
  end
  object pnlChecks: TPanel [4]
    Left = 0
    Top = 81
    Width = 792
    Height = 16
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object chkVerBajas: TCheckBox
      Left = 0
      Top = 0
      Width = 200
      Height = 13
      Caption = 'Ver bajas'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
  end
  inherited Grid: TArtDBGrid
    Top = 129
    Width = 792
    Height = 284
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    Columns = <
      item
        Expanded = False
        FieldName = 'AE_ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'AE_CONTRATO'
        Title.Caption = 'Contrato'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AE_NROESTABLECI'
        Title.Caption = 'N'#250'mero Estab.'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nombreestab'
        Title.Caption = 'Nombre Establecimiento'
        Width = 280
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AE_DESCRIPCIONASIG'
        Title.Caption = 'Descripci'#243'n Asignaci'#243'n'
        Width = 313
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'AE_TODOSLOSESTAB'
        Title.Alignment = taCenter
        Title.Caption = 'Estab.Todos'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AE_FECHAALTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'AE_USUALTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'AE_FECHAMODIF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'AE_USUMODIF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'AE_FECHABAJA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'AE_USUBAJA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'AE_IDESTAB'
        Visible = False
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 156
    Top = 28
    Width = 617
    Height = 417
    BorderIcons = [biSystemMenu, biMinimize, biMaximize]
    OnBeforeShow = fpAbmBeforeShow
    DesignSize = (
      617
      417)
    inherited BevelAbm: TBevel
      Top = 381
      Width = 609
    end
    object Label5: TLabel [1]
      Left = 0
      Top = 109
      Width = 617
      Height = 13
      Align = alTop
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = 'Prestadores seleccionados'
      ParentBiDiMode = False
      Layout = tlBottom
    end
    inherited btnAceptar: TButton
      Left = 459
      Top = 387
      TabOrder = 6
    end
    inherited btnCancelar: TButton
      Left = 537
      Top = 387
      TabOrder = 7
      OnClick = btnCancelarClick
    end
    object pnlDescrip: TPanel
      Left = 0
      Top = 285
      Width = 617
      Height = 92
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelOuter = bvNone
      Caption = 'pnlDescrip'
      TabOrder = 5
      object Label3: TLabel
        Left = 0
        Top = 0
        Width = 617
        Height = 13
        Align = alTop
        AutoSize = False
        Caption = 'Descripci'#243'n a asignar'
        Layout = tlBottom
      end
      object edDescrip: TMemo
        Left = 0
        Top = 13
        Width = 617
        Height = 79
        Align = alClient
        Anchors = [akLeft, akTop, akRight]
        BevelInner = bvNone
        BevelOuter = bvNone
        MaxLength = 1024
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object pnlEEP: TPanel
      Left = 0
      Top = 0
      Width = 617
      Height = 109
      Align = alTop
      BevelOuter = bvNone
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 0
      object Label8: TLabel
        Left = 0
        Top = 0
        Width = 617
        Height = 13
        Align = alTop
        Caption = 'Empresa'
      end
      object Label9: TLabel
        Left = 0
        Top = 34
        Width = 617
        Height = 14
        Align = alTop
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = 'Establecimiento'
        ParentBiDiMode = False
        Layout = tlBottom
      end
      object Label2: TLabel
        Left = 0
        Top = 71
        Width = 617
        Height = 13
        Align = alTop
        AutoSize = False
        Caption = 'Prestador'
        Layout = tlBottom
      end
      inline fraEstablecimientoABM: TfraEstablecimiento
        Left = 0
        Top = 48
        Width = 617
        Height = 23
        Align = alTop
        TabOrder = 1
        DesignSize = (
          617
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 552
        end
      end
      inline fraEmpresaABM: TfraEmpresa
        Left = 0
        Top = 13
        Width = 617
        Height = 21
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnExit = fraEmpresaABMExit
        DesignSize = (
          617
          21)
        inherited lbContrato: TLabel
          Left = 513
        end
        inherited edContrato: TIntEdit
          Left = 560
        end
        inherited cmbRSocial: TArtComboBox
          Width = 378
        end
      end
      inline fraPrestadores: TfraPrestadorAMP
        Left = 0
        Top = 84
        Width = 533
        Height = 21
        Align = alCustom
        TabOrder = 2
        DesignSize = (
          533
          21)
        inherited cmbDescripcion: TArtComboBox
          Left = 84
          Width = 448
          Columns = <
            item
              Expanded = False
              FieldName = 'PR_CODIGO'
              Title.Caption = 'C'#243'digo'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PR_NOMBRE'
              Title.Caption = 'Raz'#243'n Social'
              Width = 140
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOMICILIO'
              Title.Caption = 'Domicilio'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'PROVINCIA'
              Title.Caption = 'Provincia'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'PR_CPOSTAL'
              Title.Caption = 'C.P.'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'PR_LOCALIDAD'
              Title.Caption = 'Localidad'
              Width = 100
              Visible = True
            end>
        end
        inherited edCodigo: TIntEdit
          Width = 80
        end
      end
    end
    object dbgPrestadoresABM: TArtDBGrid
      Left = 0
      Top = 122
      Width = 617
      Height = 135
      Align = alTop
      DataSource = dsPrestadores
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnGetCellParams = dbgPrestadoresABMGetCellParams
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'AP_ID'
          ReadOnly = True
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'AP_IDASIGNACIONESTAB'
          ReadOnly = True
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'AP_IDPRESTADOR'
          ReadOnly = True
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CA_DESCRIPCION'
          ReadOnly = True
          Title.Caption = 'Descripci'#243'n'
          Width = 330
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AP_VIGENCIADESDE'
          ReadOnly = True
          Title.Caption = 'Vigencia Desde'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AP_VIGENCIAHASTA'
          ReadOnly = True
          Title.Caption = 'Vigencia Hasta'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AP_FECHAALTA'
          ReadOnly = True
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'AP_USUALTA'
          ReadOnly = True
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'AP_FECHAMODIF'
          ReadOnly = True
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'AP_USUMODIF'
          ReadOnly = True
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'AP_FECHABAJA'
          ReadOnly = True
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'AP_USUBAJA'
          ReadOnly = True
          Visible = False
        end>
    end
    object btnPresAgregar: TBitBtn
      Left = 536
      Top = 84
      Width = 35
      Height = 20
      Hint = 'Agrega prestador a la lista.'
      Anchors = [akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnPresAgregarClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777777777777777777777777777777777777000777
        7777777777000777777777777700077777777770000000007777777000000000
        7777777000000000777777777700077777777777770007777777777777000777
        7777777777777777777777777777777777777777777777777777}
    end
    object btnPresQuitar: TBitBtn
      Left = 576
      Top = 84
      Width = 35
      Height = 20
      Hint = 'Da de baja prestador de la lista.'
      Anchors = [akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnPresQuitarClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777777777777777777777777777777777777777777
        7777777777777777777777777777777777777770000000000777777000000000
        0777777000000000077777777777777777777777777777777777777777777777
        7777777777777777777777777777777777777777777777777777}
    end
    object pnlVigencia: TPanel
      Left = 0
      Top = 257
      Width = 617
      Height = 28
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 4
      object Label7: TLabel
        Left = 232
        Top = 8
        Width = 26
        Height = 13
        Caption = 'hasta'
      end
      object Label6: TLabel
        Left = 28
        Top = 8
        Width = 73
        Height = 13
        Caption = 'Vigencia desde'
      end
      object edVigenciaHasta: TDateEdit
        Left = 277
        Top = 4
        Width = 100
        Height = 21
        Hint = 'Fecha de vigencia hasta la que regir'#225' la asignaci'#243'n/descripci'#243'n'
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnExit = edVigenciaHastaExit
      end
      object edVigenciaDesde: TDateEdit
        Left = 117
        Top = 4
        Width = 100
        Height = 21
        Hint = 
          'Fecha de vigencia a partir de la cual regir'#225' la asignaci'#243'n/descr' +
          'ipci'#243'n'
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnExit = edVigenciaDesdeExit
      end
      object chkEstabTodos: TCheckBox
        Left = 392
        Top = 8
        Width = 200
        Height = 13
        Hint = 
          'Aplicar la selecci'#243'n realizada a totos los establecimientos del ' +
          'contrato.'
        Caption = 'Asignar a todos los establecimientos'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = chkEstabTodosClick
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      'SELECT * FROM HYS.HAE_ASIGESTABLECIMIENTO WHERE 1 = 2')
    UpdateObject = updHAE
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
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
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16463
        LinkControl = tbOrdenar
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 0
      end
      item
        Key = 0
      end>
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
  end
  object updHAP: TSDUpdateSQL
    RefreshSQL.Strings = (
      
        'select AP_ID, AP_IDASIGNACIONESTAB, AP_IDPRESTADOR, AP_VIGENCIAD' +
        'ESDE, AP_VIGENCIAHASTA, AP_FECHAALTA, AP_USUALTA, AP_FECHAMODIF,' +
        ' AP_USUMODIF, AP_FECHABAJA, AP_USUBAJA'#13#10'from hys.hap_asigprestad' +
        'ores'
      'where'
      '  AP_ID = :OLD_AP_ID')
    ModifySQL.Strings = (
      'update hys.hap_asigprestadores'
      'set'
      '  AP_ID = :AP_ID,'
      '  AP_IDASIGNACIONESTAB = :AP_IDASIGNACIONESTAB,'
      '  AP_IDPRESTADOR = :AP_IDPRESTADOR,'
      '  AP_VIGENCIADESDE = :AP_VIGENCIADESDE,'
      '  AP_VIGENCIAHASTA = :AP_VIGENCIAHASTA,'
      '  AP_FECHAALTA = :AP_FECHAALTA,'
      '  AP_USUALTA = :AP_USUALTA,'
      '  AP_FECHAMODIF = :AP_FECHAMODIF,'
      '  AP_USUMODIF = :AP_USUMODIF,'
      '  AP_FECHABAJA = :AP_FECHABAJA,'
      '  AP_USUBAJA = :AP_USUBAJA'
      'where'
      '  AP_ID = :OLD_AP_ID')
    InsertSQL.Strings = (
      'insert into hys.hap_asigprestadores'
      
        '  (AP_ID, AP_IDASIGNACIONESTAB, AP_IDPRESTADOR, AP_VIGENCIADESDE' +
        ', AP_VIGENCIAHASTA, AP_FECHAALTA, AP_USUALTA, AP_FECHAMODIF, AP_' +
        'USUMODIF, AP_FECHABAJA, AP_USUBAJA)'
      'values'
      
        '  (:AP_ID, :AP_IDASIGNACIONESTAB, :AP_IDPRESTADOR, :AP_VIGENCIAD' +
        'ESDE, :AP_VIGENCIAHASTA, :AP_FECHAALTA, :AP_USUALTA, :AP_FECHAMO' +
        'DIF, :AP_USUMODIF, :AP_FECHABAJA, :AP_USUBAJA)')
    DeleteSQL.Strings = (
      'delete from hys.hap_asigprestadores'
      'where'
      '  AP_ID = :OLD_AP_ID')
    Left = 88
    Top = 508
  end
  object updHAE: TSDUpdateSQL
    RefreshSQL.Strings = (
      
        'select AE_ID, AE_CONTRATO, AE_NROESTABLECI, AE_DESCRIPCIONASIG, ' +
        'AE_TODOSLOSESTAB, AE_FECHAALTA, AE_USUALTA, AE_FECHAMODIF, AE_US' +
        'UMODIF, AE_FECHABAJA, AE_USUBAJA, AE_IDESTAB'
      'from hys.hae_asigestablecimiento'
      'where'
      '  AE_ID = :OLD_AE_ID')
    ModifySQL.Strings = (
      'update hys.hae_asigestablecimiento'
      'set'
      '  AE_ID = :AE_ID,'
      '  AE_CONTRATO = :AE_CONTRATO,'
      '  AE_NROESTABLECI = :AE_NROESTABLECI,'
      '  AE_DESCRIPCIONASIG = :AE_DESCRIPCIONASIG,'
      '  AE_TODOSLOSESTAB = :AE_TODOSLOSESTAB,'
      '  AE_FECHAALTA = :AE_FECHAALTA,'
      '  AE_USUALTA = :AE_USUALTA,'
      '  AE_FECHAMODIF = :AE_FECHAMODIF,'
      '  AE_USUMODIF = :AE_USUMODIF,'
      '  AE_FECHABAJA = :AE_FECHABAJA,'
      '  AE_USUBAJA = :AE_USUBAJA,'
      '  AE_IDESTAB = :AE_IDESTAB'
      'where'
      '  AE_ID = :OLD_AE_ID')
    InsertSQL.Strings = (
      'insert into hys.hae_asigestablecimiento'
      
        '  (AE_ID, AE_CONTRATO, AE_NROESTABLECI, AE_DESCRIPCIONASIG, AE_T' +
        'ODOSLOSESTAB, AE_FECHAALTA, AE_USUALTA, AE_FECHAMODIF, AE_USUMOD' +
        'IF, AE_FECHABAJA, AE_USUBAJA, AE_IDESTAB)'
      'values'
      
        '  (:AE_ID, :AE_CONTRATO, :AE_NROESTABLECI, :AE_DESCRIPCIONASIG, ' +
        ':AE_TODOSLOSESTAB, :AE_FECHAALTA, :AE_USUALTA, :AE_FECHAMODIF, :' +
        'AE_USUMODIF, :AE_FECHABAJA, :AE_USUBAJA, :AE_IDESTAB)')
    DeleteSQL.Strings = (
      'delete from hys.hae_asigestablecimiento'
      'where'
      '  AE_ID = :OLD_AE_ID')
    Left = 24
    Top = 320
  end
  object sdqPrestadores: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqPrestadoresAfterScroll
    SQL.Strings = (
      'SELECT  cpr.ca_descripcion, hap.* '
      '  FROM  hys.hap_asigprestadores hap, '
      '        art.cpr_prestador cpr '
      ' WHERE  hap.ap_idprestador = cpr.ca_identificador '
      '       AND ap_idasignacionestab = :id_hae ')
    UpdateObject = updHAP
    Left = 24
    Top = 508
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id_hae'
        ParamType = ptInput
        Value = 10065
      end>
  end
  object dsPrestadores: TDataSource
    DataSet = sdqPrestadores
    Left = 56
    Top = 508
  end
end
