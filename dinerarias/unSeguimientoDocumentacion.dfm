inherited frmSeguimientoDocumentacion: TfrmSeguimientoDocumentacion
  Left = 549
  Top = 71
  Caption = 'Seguimiento de documentaci'#243'n'
  ClientHeight = 665
  ClientWidth = 979
  ExplicitLeft = 549
  ExplicitTop = 71
  ExplicitWidth = 987
  ExplicitHeight = 695
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 979
    Height = 83
    Visible = True
    ExplicitWidth = 979
    ExplicitHeight = 83
    object GroupBox1: TGroupBox
      Left = 0
      Top = 1
      Width = 125
      Height = 40
      Caption = ' Siniestro '
      TabOrder = 0
      object edSinFiltro: TSinEdit
        Left = 5
        Top = 14
        Width = 116
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox2: TGroupBox
      Left = 330
      Top = 1
      Width = 505
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Usuario '
      TabOrder = 1
      DesignSize = (
        505
        40)
      object dcUsuarioFiltro: TDBCheckCombo
        Left = 4
        Top = 14
        Width = 495
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DataSource = dsUsuarios
        KeyField = 'SE_USUARIO'
        ListField = 'SE_NOMBRE'
      end
    end
    object GroupBox3: TGroupBox
      Left = 127
      Top = 1
      Width = 200
      Height = 40
      Caption = ' Fecha de ingreso'
      TabOrder = 2
      object Label1: TLabel
        Left = 94
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object dcDesdeFiltro: TDateComboBox
        Left = 4
        Top = 14
        Width = 88
        Height = 21
        MaxDateCombo = dcHastaFiltro
        TabOrder = 0
      end
      object dcHastaFiltro: TDateComboBox
        Left = 108
        Top = 14
        Width = 88
        Height = 21
        MinDateCombo = dcDesdeFiltro
        TabOrder = 1
      end
    end
    object GroupBox5: TGroupBox
      Left = 837
      Top = 1
      Width = 141
      Height = 40
      Anchors = [akTop, akRight]
      TabOrder = 3
      object chkExcluirBajas: TCheckBox
        Left = 8
        Top = 16
        Width = 125
        Height = 17
        Caption = 'No ver dados de baja'
        TabOrder = 0
      end
    end
    object GroupBox6: TGroupBox
      Left = 0
      Top = 41
      Width = 978
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Empresa '
      TabOrder = 4
      DesignSize = (
        978
        40)
      object Label7: TLabel
        Left = 8
        Top = 19
        Width = 25
        Height = 13
        Caption = 'CUIT'
      end
      inline fraEmpresaFiltro: TfraEmpresa
        Left = 39
        Top = 14
        Width = 933
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        ExplicitLeft = 39
        ExplicitTop = 14
        ExplicitWidth = 933
        ExplicitHeight = 21
        inherited lbContrato: TLabel
          Left = 829
          ExplicitLeft = 829
        end
        inherited edContrato: TIntEdit
          Left = 876
          ExplicitLeft = 876
        end
        inherited cmbRSocial: TArtComboBox
          Width = 694
          ExplicitWidth = 694
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 83
    Width = 979
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 973
      end>
    ExplicitTop = 83
    ExplicitWidth = 979
    inherited ToolBar: TToolBar
      Width = 964
      ExplicitWidth = 964
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Hint = 'Mostrar total'
        ImageIndex = 48
        Style = tbsCheck
        Visible = True
      end
      object tbSepTotal: TToolButton
        Left = 370
        Top = 0
        Width = 8
        Caption = 'tbSepTotal'
        ImageIndex = 6
        Style = tbsSeparator
        Visible = False
      end
      object pnlTotal: TPanel
        Left = 378
        Top = 0
        Width = 135
        Height = 22
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 112
    Width = 979
    Height = 553
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SD_FECHAINGRESO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Ingreso'
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Alignment = taCenter
        Title.Caption = 'Siniestro'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOCUM'
        Title.Caption = 'Documentaci'#243'n'
        Width = 450
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SD_LIQUIDADOR'
        Title.Caption = 'Liquidador'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Empresa'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIT'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_NOMBRE'
        Title.Caption = 'Nombre liquidador'
        Width = 150
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SD_FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 75
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 120
    Top = 112
    Width = 772
    Height = 509
    BorderStyle = bsSingle
    OnBeforeShow = fpAbmBeforeShow
    OnShow = fpAbmShow
    ActiveControl = btnAceptar
    ExplicitLeft = 120
    ExplicitTop = 112
    ExplicitWidth = 772
    ExplicitHeight = 509
    inherited BevelAbm: TBevel
      Top = 473
      Width = 764
      ExplicitTop = 473
      ExplicitWidth = 764
    end
    object Label2: TLabel [1]
      Left = 8
      Top = 11
      Width = 30
      Height = 13
      Caption = 'Fecha'
    end
    object Label3: TLabel [2]
      Left = 8
      Top = 36
      Width = 40
      Height = 13
      Caption = 'Siniestro'
    end
    object Label4: TLabel [3]
      Left = 8
      Top = 60
      Width = 49
      Height = 13
      Caption = 'Liquidador'
    end
    object btnBuscarSin: TSpeedButton [4]
      Left = 180
      Top = 28
      Width = 25
      Height = 24
      Hint = 'Buscar siniestro'
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C40E0000C40E00000000000000000000848404848404
        8484048484048484048484048484048484048484048484048484048484048484
        0404040404040404040484840484840484840484840484840484840484840484
        8404848404848404848404848404848404FFFFFFFFFFFF808080848404848404
        8484048484048484048484048484048484048484048484048484048484040404
        043366666699CC04040484840484840484840484840484840484840484840484
        8404848404848404848404848404FFFFFFC0C0C0C0C0C0808080848404848404
        8484048484048484048484048484048484048484048484048484040404043366
        6699CCCCC6D6EF04040484840484840484840484840484840484840484840484
        8404848404848404848404FFFFFFC0C0C0C0C0C0C0C0C0808080848404848404
        8484048484048484048484048484048484048484048484040404043366666699
        CCC6D6EF04040484840484840484840484840484840484840484840484840484
        8404848404848404FFFFFFC0C0C0C0C0C0C0C0C0808080848404848404848404
        8484048484048484048484048484048484048484040404043366666699CCC6D6
        EF04040484840484840484840484840484840484840484840484840484840484
        8404848404FFFFFFC0C0C0C0C0C0C0C0C0808080848404848404848404848404
        8484048484048484048484048484048484040404043366666699CC99CCCC0404
        0484840484840484840484840484840484840484840484840484840484840484
        8404FFFFFFC0C0C0C0C0C0C0C0C0808080848404848404848404848404848404
        8484040404040404040404040404040404046699CC3399CCC6D6EF0404048484
        04848404848404848404848404848404848404FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFC0C0C0C0C0C0C0C0C0808080848404848404848404848404848404848404
        040404CCCC33FFFF99CCCC33CCCC330404040404043399CC0404048484048484
        04848404848404848404848404848404FFFFFFC0C0C0C0C0C0C0C0C0C0C0C080
        8080808080C0C0C0808080848404848404848404848404848404848404040404
        CCCC33FFFF99FFFF99CCCC33CCCC33CCCC330404040404048484048484048484
        04848404848404848404848404FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0808080808080848404848404848404848404848404848404040404FFFFCC
        FFFFFFFFECCCFFFF99CCCC66CCCC33CCCC33CCCC330404048484048484048484
        04848404848404848404FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0808080848404848404848404848404848404848404040404FFFF99
        FFECCCFFECCCFFFF99CCCC66CCCC33CCCC33CCCC330404048484048484048484
        04848404848404848404FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0808080848404848404848404848404848404848404040404FFFF99
        FFFF99FFFF99FFCC66CCCC33CCCC33CC9933CC99330404048484048484048484
        04848404848404848404FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0808080848404848404848404848404848404848404040404FFFF33
        FFCC99FFCC99FFCC66CCCC33CCCC33999933CC99330404048484048484048484
        04848404848404848404FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0808080848404848404848404848404848404848404848404040404
        CCCC66CCCC66CCCC33CCCC33CCCC339999330404048484048484048484048484
        04848404848404848404848404808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0808080848404848404848404848404848404848404848404848404848404
        040404CCCC33CCCC33CC9933CC99330404048484048484048484048484048484
        04848404848404848404848404848404808080C0C0C0C0C0C0C0C0C0C0C0C080
        8080848404848404848404848404848404848404848404848404848404848404
        8484040404040404040404040404048484048484048484048484048484048484
        0484840484840484840484840484840484840480808080808080808080808084
        8404848404848404848404848404848404848404848404848404}
      NumGlyphs = 2
      OnClick = btnBuscarSinClick
    end
    object btnLimpiarSin: TSpeedButton [5]
      Left = 205
      Top = 28
      Width = 25
      Height = 24
      Hint = 'Limpiar siniestro'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000029424200FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000018180000FFFF0063A5A5003152
        5200FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF005A5A5A0000FFFF0000ADAD0000F7F70000A5
        A50018313100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000073730000A5A50000FFFF0000DEDE0000D6
        D600A5BDBD0000181800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF003939390000CECE0000F7F70000DEDE0000CECE0000F7
        F70010B5B50000E7E700294A4A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000031310000EFEF0000CECE0000D6D60000EFEF0000C6
        C60010FFFF004AC6C60063BDBD0031525200FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00BDA5A500005252006BD6D60000DEDE0000FFFF0000BDBD0010FF
        FF005AB5B50000EFEF0000E7E70018CECE0021212100FF00FF00FF00FF00FF00
        FF00FF00FF008C000000A54A0000004242009CCECE000094940000FFFF0052BD
        BD0000F7F70000F7F7007BDEDE00005A5A0021212100FF00FF00FF00FF00FF00
        FF00BD9C9C00FFFF0000F7F731008C4A4A001042420000FFFF0039CECE0000E7
        E70018DEDE0010B5B5000031310039393900FF00FF00FF00FF00FF00FF00FF00
        FF00BD9C9C00FFFF0000B5B58C00C69473007B310000004A4A0029C6C6003184
        84000042420052525200FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C6BD
        BD00B5631000FFFFF700BDADAD00847300008400000094212100212121002121
        2100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C684
        1000FFFFE7008C8C2100B5848400C6B5B500C6B5B500FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0094393900F7F7
        6B009C843900AD847B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00943939007B7B
        0000AD6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      OnClick = btnLimpiarSinClick
    end
    inherited btnAceptar: TButton
      Left = 614
      Top = 479
      TabOrder = 3
      ExplicitLeft = 614
      ExplicitTop = 479
    end
    inherited btnCancelar: TButton
      Left = 692
      Top = 479
      Caption = '&Cerrar'
      TabOrder = 4
      OnClick = btnCancelarClick
      ExplicitLeft = 692
      ExplicitTop = 479
    end
    object dcFechaABM: TDateComboBox
      Left = 62
      Top = 5
      Width = 88
      Height = 21
      MinDate = 35431.000000000000000000
      TabOrder = 0
    end
    object edSinABM: TSinEdit
      Left = 62
      Top = 30
      Width = 116
      Height = 21
      TabOrder = 1
      OnSelect = edSinABMSelect
    end
    inline fraUsuarioABM: TfraUsuario
      Left = 62
      Top = 55
      Width = 263
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      OnExit = fraUsuarioABMExit
      ExplicitLeft = 62
      ExplicitTop = 55
      ExplicitWidth = 263
      inherited edCodigo: TPatternEdit
        Width = 86
        ExplicitWidth = 86
      end
      inherited cmbDescripcion: TArtComboBox
        Left = 88
        Width = 176
        ExplicitLeft = 88
        ExplicitWidth = 176
      end
    end
    object GroupBox4: TGroupBox
      Left = 330
      Top = 8
      Width = 437
      Height = 70
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Datos del siniestro '
      TabOrder = 5
      DesignSize = (
        437
        70)
      object Label5: TLabel
        Left = 4
        Top = 20
        Width = 54
        Height = 13
        Caption = 'Trabajador:'
      end
      object Label6: TLabel
        Left = 4
        Top = 45
        Width = 44
        Height = 13
        Caption = 'Empresa:'
      end
      object edTrabajadorABM: TEdit
        Left = 63
        Top = 17
        Width = 369
        Height = 21
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        Color = 15262169
        ReadOnly = True
        TabOrder = 0
      end
      object edEmpresaABM: TEdit
        Left = 63
        Top = 42
        Width = 369
        Height = 21
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        Color = 15262169
        ReadOnly = True
        TabOrder = 1
      end
    end
    object pcDocumentacion: TPageControl
      Left = 3
      Top = 84
      Width = 763
      Height = 384
      ActivePage = tsR
      TabOrder = 6
      OnChange = pcDocumentacionChange
      OnChanging = pcDocumentacionChanging
      object tsR: TTabSheet
        Caption = 'Reint.'
        DesignSize = (
          755
          356)
        object cgR: TCheckGroup
          Left = 1
          Top = -1
          Width = 753
          Height = 357
          Anchors = [akLeft, akTop, akBottom]
          Caption = ' Documentacion '
          TabOrder = 0
          Columns = 2
        end
      end
      object tsP: TTabSheet
        Caption = 'P. Dir.'
        ImageIndex = 1
        DesignSize = (
          755
          356)
        object cgP: TCheckGroup
          Left = 1
          Top = -1
          Width = 753
          Height = 357
          Anchors = [akLeft, akTop, akBottom]
          Caption = ' Documentacion '
          TabOrder = 0
          Columns = 2
        end
      end
      object tsI: TTabSheet
        Caption = 'Incap.'
        ImageIndex = 2
        DesignSize = (
          755
          356)
        object cgI: TCheckGroup
          Left = 1
          Top = -1
          Width = 753
          Height = 357
          Anchors = [akLeft, akTop, akBottom]
          Caption = ' Documentacion '
          TabOrder = 0
          Columns = 2
        end
      end
      object tsM: TTabSheet
        Caption = 'Mort.'
        ImageIndex = 3
        DesignSize = (
          755
          356)
        object cgM: TCheckGroup
          Left = 1
          Top = -1
          Width = 753
          Height = 357
          Anchors = [akLeft, akTop, akBottom]
          Caption = ' Documentacion '
          TabOrder = 0
          Columns = 2
        end
      end
      object tsO: TTabSheet
        Caption = 'Otros'
        ImageIndex = 4
        DesignSize = (
          755
          356)
        object cgO: TCheckGroup
          Left = 1
          Top = -1
          Width = 753
          Height = 357
          Anchors = [akLeft, akTop, akBottom]
          Caption = ' Documentacion '
          TabOrder = 0
          Columns = 2
        end
      end
    end
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'F.ingreso'
        TitleAlignment = taCenter
        DataField = 'SD_FECHAINGRESO'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'Siniestro'
        TitleAlignment = taCenter
        DataField = 'SINIESTRO'
        Alignment = taCenter
        MaxLength = 12
      end
      item
        Title = 'Liquidador'
        DataField = 'SD_LIQUIDADOR'
        MaxLength = 13
      end
      item
        Title = 'Empresa'
        DataField = 'EM_NOMBRE'
        MaxLength = 38
      end
      item
        Title = 'Documentaci'#243'n'
        DataField = 'DOCUM'
        MaxLength = 0
      end>
    Title.Text = 'Seguimiento de documentaci'#243'n - Prestaciones Dinerarias'
    PageOrientation = pxLandscape
  end
  inherited Seguridad: TSeguridad
    Claves = <
      item
        Name = 'CambiarLiquidador'
      end
      item
        Name = 'ModificarTodaFecha'
      end>
  end
  object sdqUsuarios: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT   se_usuario, se_nombre'
      '    FROM art.use_usuarios'
      '   WHERE se_sector = '#39'PRESDIN'#39
      '     AND se_usuariogenerico = '#39'N'#39
      '     AND se_fechabaja IS NULL'
      'ORDER BY se_nombre'
      '')
    Left = 480
    Top = 8
  end
  object dsUsuarios: TDataSource
    DataSet = sdqUsuarios
    Left = 452
    Top = 8
  end
  object ShortCutControl1: TShortCutControl
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
    Top = 256
  end
end
