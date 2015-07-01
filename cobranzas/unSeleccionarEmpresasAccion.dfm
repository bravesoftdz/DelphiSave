object frmSeleccionarEmpresasAccion: TfrmSeleccionarEmpresasAccion
  Left = 207
  Top = 108
  Width = 760
  Height = 417
  Caption = 'Selecci'#243'n de Empresas'
  Color = clBtnFace
  Constraints.MinHeight = 417
  Constraints.MinWidth = 760
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 33
    Width = 752
    Height = 320
    Align = alClient
    TabOrder = 0
    object GridEmpresas: TArtDBGrid
      Left = 1
      Top = 1
      Width = 750
      Height = 318
      Align = alClient
      DataSource = dsEmpresas
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = pmnuMarcar
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = GridEmpresasCellClick
      OnKeyUp = GridEmpresasKeyUp
      MultiSelect = True
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CUIT'
          Title.Alignment = taCenter
          Width = 76
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RSOCIAL'
          Title.Caption = 'Raz'#243'n Social'
          Width = 217
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONTRATO'
          Title.Alignment = taCenter
          Title.Caption = 'Contrato'
          Width = 55
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NROCARTADOC'
          Title.Alignment = taCenter
          Title.Caption = 'Nro. Carta Resc.'
          Width = 113
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'FECHAIMPRESION'
          Title.Alignment = taCenter
          Title.Caption = 'F. Impresi'#243'n'
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRRECEPCION'
          Title.Caption = 'Recepci'#243'n'
          Width = 212
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'FECHARECEPCION'
          Title.Alignment = taCenter
          Title.Caption = 'F. Recepci'#243'n'
          Width = 71
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'RECEPCIONOK'
          Title.Alignment = taCenter
          Title.Caption = 'Recepc. OK'
          Width = 65
          Visible = True
        end>
    end
    object fpBusqueda: TFormPanel
      Left = 332
      Top = 100
      Width = 175
      Height = 71
      Caption = 'Buscar Registro'
      FormWidth = 0
      FormHeigth = 0
      BorderStyle = bsDialog
      Position = poOwnerFormCenter
      ActiveControl = edCUITBusqueda
      OnEnter = fpBusquedaEnter
      object lbCuitBusqueda: TLabel
        Left = 25
        Top = 14
        Width = 25
        Height = 13
        Caption = 'CUIT'
      end
      object edCUITBusqueda: TMaskEdit
        Left = 55
        Top = 10
        Width = 88
        Height = 20
        AutoSize = False
        EditMask = '##-########-c;0; '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 13
        ParentFont = False
        TabOrder = 0
      end
      object cmdBuscar: TButton
        Left = 13
        Top = 42
        Width = 71
        Height = 22
        Caption = '&Buscar'
        TabOrder = 1
        OnClick = cmdBuscarClick
      end
      object cmdCerrar: TButton
        Left = 91
        Top = 42
        Width = 71
        Height = 22
        Caption = '&Cerrar'
        ModalResult = 1
        TabOrder = 2
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 353
    Width = 752
    Height = 37
    Align = alBottom
    TabOrder = 1
    object btnAceptar: TBitBtn
      Left = 3
      Top = 4
      Width = 117
      Height = 29
      Caption = '&Aceptar'
      Default = True
      TabOrder = 0
      OnClick = btnAceptarClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btnCancelar: TBitBtn
      Left = 128
      Top = 4
      Width = 117
      Height = 29
      Cancel = True
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 752
    Height = 33
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 27
        Width = 748
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 735
      Height = 27
      ButtonWidth = 25
      Caption = 'ToolBar'
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      TabOrder = 0
      object Panel3: TPanel
        Left = 0
        Top = 2
        Width = 157
        Height = 22
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = ' Contr. Seleccionados: '
        TabOrder = 0
        object edCantContratos: TCardinalEdit
          Left = 111
          Top = 0
          Width = 44
          Height = 21
          TabStop = False
          Color = clSilver
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
      end
      object ToolButton1: TToolButton
        Left = 157
        Top = 2
        Width = 7
        Caption = 'ToolButton1'
        ImageIndex = 4
        Style = tbsDivider
      end
      object tbCalcularTotal: TToolButton
        Left = 164
        Top = 2
        Hint = 'Total Seleccionados'
        ImageIndex = 37
        Style = tbsCheck
        OnClick = tbCalcularTotalClick
      end
      object Panel4: TPanel
        Left = 189
        Top = 2
        Width = 112
        Height = 22
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = ' Cant. Contr.: '
        TabOrder = 1
        object edTotalContratos: TCardinalEdit
          Left = 65
          Top = 0
          Width = 44
          Height = 21
          TabStop = False
          Color = clSilver
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
      end
      object ToolButton2: TToolButton
        Left = 301
        Top = 2
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 38
        Style = tbsDivider
      end
      object tbBuscar: TToolButton
        Left = 309
        Top = 2
        Hint = 'Buscar (Ctrl+U)'
        ImageIndex = 14
        ParentShowHint = False
        ShowHint = True
        OnClick = tbBuscarClick
      end
    end
  end
  object sdqEmpresas: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT EM_CUIT CUIT, EM_NOMBRE RSOCIAL, CO_CONTRATO CONTRATO,'
      
        '       CA_NROCARTADOC NROCARTADOC, CA_FECHAIMPRESION FECHAIMPRES' +
        'ION,'
      
        '       CA_FECHARECEPCION FECHARECEPCION, CA_RECEPCIONOK RECEPCIO' +
        'NOK,'
      '       CTBCODRECEP.TB_DESCRIPCION DESCRRECEPCION'
      
        '  FROM CTB_TABLAS CTBCODRECEP, AEN_ENDOSO, CCA_CARTA, AEM_EMPRES' +
        'A, ACO_CONTRATO'
      ' WHERE CO_IDEMPRESA=EM_ID'
      '   AND CTBCODRECEP.TB_CLAVE(+)='#39'CODRE'#39
      '   AND CTBCODRECEP.TB_CODIGO(+)=CA_CODRECEPCION'
      '   AND CA_IDENDOSO(+)=EN_ID'
      '   AND EN_CONTRATO(+)=CO_CONTRATO'
      '   AND CA_ID(+)=1'
      ''
      ' ')
    Left = 136
    Top = 156
  end
  object dsEmpresas: TDataSource
    DataSet = sdqEmpresas
    Left = 164
    Top = 156
  end
  object pmnuMarcar: TPopupMenu
    Left = 224
    Top = 156
    object mnuMarcarTodos: TMenuItem
      Caption = '&Marcar Todos'
      OnClick = mnuMarcarTodosClick
    end
    object mnuDesmarcarTodos: TMenuItem
      Caption = '&Desmarcar Todos'
      OnClick = mnuDesmarcarTodosClick
    end
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16469
        LinkControl = tbBuscar
      end>
    Left = 136
    Top = 125
  end
end
