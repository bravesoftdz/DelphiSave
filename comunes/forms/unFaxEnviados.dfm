inherited frmFaxEnviados: TfrmFaxEnviados
  Left = 197
  Top = 160
  Width = 765
  Height = 453
  Caption = 'Fax | Documentos enviados'
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object JvNetscapeSplitter: TJvNetscapeSplitter [0]
    Left = 166
    Top = 90
    Height = 274
    Align = alLeft
    Maximized = False
    Minimized = False
    ButtonCursor = crDefault
  end
  inherited pnlFiltros: TPanel
    Width = 757
    Height = 61
    Color = clGray
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 49
      Height = 13
      Caption = 'Remitente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 268
      Top = 8
      Width = 33
      Height = 13
      Caption = 'Estado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    inline fraUsuario: TfraUsuario
      Left = 8
      Top = 24
      Width = 251
      Height = 21
      TabOrder = 0
      DesignSize = (
        251
        21)
      inherited cmbDescripcion: TArtComboBox
        Width = 167
      end
    end
    object gbFecha: TGroupBox
      Left = 448
      Top = 4
      Width = 213
      Height = 49
      Caption = ' Fecha '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Label4: TLabel
        Left = 100
        Top = 22
        Width = 16
        Height = 13
        Caption = '>>'
      end
      object cmbFechaDesde: TDateComboBox
        Left = 9
        Top = 19
        Width = 88
        Height = 21
        Hint = 'Desde Fecha'
        MaxDateCombo = cmbFechaHasta
        DialogTitle = 'La fecha desde debe ser menor a la fecha actual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnChange = tbRefrescarClick
      end
      object cmbFechaHasta: TDateComboBox
        Left = 118
        Top = 19
        Width = 88
        Height = 21
        Hint = 'Hasta Fecha'
        MinDateCombo = cmbFechaDesde
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnChange = tbRefrescarClick
      end
    end
    object cmbEstados: TComboBox
      Left = 268
      Top = 24
      Width = 173
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      OnChange = tbRefrescarClick
      Items.Strings = (
        'Pendientes'
        'Enviados con '#233'xito'
        'Env'#237'o fallido'
        'Borrados'
        'Env'#237'o en curso')
    end
  end
  inherited CoolBar: TCoolBar
    Top = 61
    Width = 757
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 753
      end>
    inherited ToolBar: TToolBar
      Width = 740
    end
  end
  inherited Grid: TArtDBGrid
    Top = 90
    Width = 166
    Height = 274
    Align = alLeft
    FixedColor = clGray
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    OnGetCellProps = GridGetCellProps
    Columns = <
      item
        Expanded = False
        FieldName = 'FS_FECHA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FS_CANTPAG'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 49
        Visible = True
      end>
  end
  inline fraVistaTIFF: TfraVistaTIFF [4]
    Left = 176
    Top = 90
    Width = 581
    Height = 274
    Align = alClient
    Constraints.MinWidth = 581
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    inherited sbScrollBox: TJvScrollBox
      Height = 177
    end
    inherited CoolBar: TCoolBar
      Bands = <
        item
          Control = fraVistaTIFF.tbToolBar
          ImageIndex = -1
          MinHeight = 26
          Width = 577
        end>
    end
    inherited pnlImgStatus: TPanel
      Top = 207
      inherited Label1: TLabel
        Left = 593
      end
      inherited Label2: TLabel
        Left = 582
      end
      inherited edWidth: TIntEdit
        Left = 617
      end
      inherited edHeight: TIntEdit
        Left = 617
      end
      inherited btnOriginal: TAdvGlowButton
        Left = 495
      end
    end
    inherited pnlStatus: TPanel
      Top = 255
    end
  end
  object gbDatosExtra: TJvgGroupBox [5]
    Left = 0
    Top = 364
    Width = 757
    Height = 62
    Align = alBottom
    Caption = ' Visualizando '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Border.Inner = bvNone
    Border.Outer = bvNone
    Border.Bold = False
    CaptionAlignment = fcaWidth
    CaptionBorder.Inner = bvRaised
    CaptionBorder.Outer = bvNone
    CaptionBorder.Bold = False
    CaptionGradient.FromColor = 10461087
    CaptionGradient.ToColor = clSilver
    CaptionGradient.Active = True
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
    Options = [fgoCollapseOther, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
    DesignSize = (
      757
      62)
    FullHeight = 81
    object pnlBottom: TPanel
      Left = 2
      Top = 40
      Width = 753
      Height = 20
      Align = alBottom
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object pnlVisualizando: TPanel
      Left = 2
      Top = 16
      Width = 609
      Height = 24
      Align = alClient
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Label3: TLabel
        Left = 4
        Top = 4
        Width = 49
        Height = 13
        Caption = 'Remitente'
      end
      object pnlStatus4: TPanel
        Left = 525
        Top = 1
        Width = 83
        Height = 22
        Align = alRight
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Env'#237'o en curso'
        Color = 16432353
        TabOrder = 0
      end
      object pnlStatus3: TPanel
        Left = 467
        Top = 1
        Width = 58
        Height = 22
        Align = alRight
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Borrados'
        Color = 14141132
        TabOrder = 1
      end
      object pnlStatus2: TPanel
        Left = 398
        Top = 1
        Width = 69
        Height = 22
        Align = alRight
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Env'#237'o fallido'
        Color = 11450350
        TabOrder = 2
      end
      object pnlStatus1: TPanel
        Left = 297
        Top = 1
        Width = 101
        Height = 22
        Align = alRight
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Enviados con '#233'xito'
        Color = 16766894
        TabOrder = 3
      end
      object pnlStatus0: TPanel
        Left = 227
        Top = 1
        Width = 70
        Height = 22
        Align = alRight
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Pendientes'
        Color = 15198159
        TabOrder = 4
      end
    end
    object pnlSeleccionados: TPanel
      Left = 611
      Top = 16
      Width = 144
      Height = 24
      Align = alRight
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object edFS_USUARIO: TDBEdit
      Left = 60
      Top = 17
      Width = 162
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clWhite
      DataField = 'FS_USUARIO'
      DataSource = dsConsulta
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery [6]
    BeforeOpen = sdqConsultaBeforeOpen
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      'SELECT   DECODE(fs_estado,'
      '                1, '#39'Pendiente'#39','
      '                2, '#39'Enviado con '#233'xito'#39','
      '                3, fs_descripcion,'
      '                4, '#39'Borrado'#39','
      
        '                8, '#39'Env'#237'o en curso'#39') AS estado, fs_id, fs_tipo, ' +
        'fs_estado, fs_fecha, fs_origdest, fs_archasoc, fs_casilla,'
      
        '         fs_fechaproxenv, fs_reintento, fs_cantpag, fs_tiempo, f' +
        's_canal, fs_descripcion, fs_usuario, fs_tipodedocumento,'
      
        '         fs_tipodedestinatario, fs_iddestinatario, fs_sector, fs' +
        '_clave, fs_archivo as imagen'
      '    FROM ffs_faxsalientes f1'
      '   WHERE fs_fecha = (SELECT MAX(fs_fecha)'
      '                       FROM ffs_faxsalientes f2'
      '                      WHERE f1.fs_id = f2.fs_id)')
    object sdqConsultaESTADO: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
      Size = 100
    end
    object sdqConsultaFS_ID: TFloatField
      FieldName = 'FS_ID'
    end
    object sdqConsultaFS_TIPO: TStringField
      FieldName = 'FS_TIPO'
      Size = 6
    end
    object sdqConsultaFS_ESTADO: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'FS_ESTADO'
      Size = 3
    end
    object sdqConsultaFS_FECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FS_FECHA'
    end
    object sdqConsultaFS_ORIGDEST: TStringField
      FieldName = 'FS_ORIGDEST'
      Size = 30
    end
    object sdqConsultaFS_ARCHASOC: TStringField
      FieldName = 'FS_ARCHASOC'
      Size = 30
    end
    object sdqConsultaFS_CASILLA: TFloatField
      FieldName = 'FS_CASILLA'
    end
    object sdqConsultaFS_FECHAPROXENV: TDateTimeField
      FieldName = 'FS_FECHAPROXENV'
    end
    object sdqConsultaFS_REINTENTO: TFloatField
      FieldName = 'FS_REINTENTO'
    end
    object sdqConsultaFS_CANTPAG: TFloatField
      DisplayLabel = 'P'#225'ginas'
      FieldName = 'FS_CANTPAG'
    end
    object sdqConsultaFS_TIEMPO: TFloatField
      FieldName = 'FS_TIEMPO'
    end
    object sdqConsultaFS_CANAL: TFloatField
      FieldName = 'FS_CANAL'
    end
    object sdqConsultaFS_DESCRIPCION: TStringField
      FieldName = 'FS_DESCRIPCION'
      Size = 100
    end
    object sdqConsultaFS_USUARIO: TStringField
      FieldName = 'FS_USUARIO'
    end
    object sdqConsultaFS_TIPODEDOCUMENTO: TStringField
      FieldName = 'FS_TIPODEDOCUMENTO'
      Size = 10
    end
    object sdqConsultaFS_TIPODEDESTINATARIO: TStringField
      FieldName = 'FS_TIPODEDESTINATARIO'
      Size = 10
    end
    object sdqConsultaFS_IDDESTINATARIO: TFloatField
      FieldName = 'FS_IDDESTINATARIO'
    end
    object sdqConsultaFS_SECTOR: TStringField
      FieldName = 'FS_SECTOR'
    end
    object sdqConsultaFS_CLAVE: TStringField
      FieldName = 'FS_CLAVE'
    end
    object sdqConsultaIMAGEN: TStringField
      FieldName = 'IMAGEN'
      Size = 100
    end
  end
  inherited dsConsulta: TDataSource [7]
  end
  inherited SortDialog: TSortDialog [8]
  end
  inherited ExportDialog: TExportDialog [9]
  end
  inherited QueryPrint: TQueryPrint [10]
  end
  inherited Seguridad: TSeguridad [11]
  end
  inherited FormStorage: TFormStorage [12]
  end
  inherited PrintDialog: TPrintDialog [13]
  end
  inherited ShortCutControl: TShortCutControl [14]
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
end
