inherited frmManUsuariosMantenimiento: TfrmManUsuariosMantenimiento
  Left = 355
  Top = 161
  Width = 783
  Height = 597
  Caption = 'Usuarios con acceso al m'#243'dulo de Obras y Mantenimiento'
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  object JvOutlookSplitter1: TJvOutlookSplitter [0]
    Left = 0
    Top = 378
    Width = 775
    Height = 6
    AutoSnap = True
    Color = 16774371
    ParentColor = False
    ColorFrom = 16765615
    ColorTo = 15587784
  end
  inherited pnlFiltros: TPanel
    Width = 775
    Height = 57
    Visible = True
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 31
      Height = 13
      Caption = 'Sector'
    end
    inline fraSE_IDSECTOR: TfraCodDesc
      Left = 12
      Top = 24
      Width = 301
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        301
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 236
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'se_nivel'
            Title.Caption = 'Nivel'
            Visible = False
          end>
      end
      inherited Propiedades: TPropiedadesFrame
        CodigoType = ctInteger
        ExtraCondition = 'and se_nivel = 4 '
        ExtraFields = ', se_nivel'
        FieldBaja = 'se_fechabaja'
        FieldCodigo = 'se_id'
        FieldDesc = 'se_descripcion'
        FieldID = 'se_id'
        IdType = ctInteger
        OrderBy = 'se_descripcion'
        TableName = 'computos.cse_sector'
        OnChange = tbRefrescarClick
        Left = 103
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 57
    Width = 775
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 771
      end>
    inherited ToolBar: TToolBar
      Width = 758
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 86
    Width = 775
    Height = 292
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'EX_USUARIO'
        Title.Caption = 'Usuario'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_NOMBRE'
        Title.Caption = 'Nombre'
        Width = 285
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 168
    Top = 180
    Height = 72
    inherited BevelAbm: TBevel
      Top = 36
    end
    object lbUsuario: TLabel [1]
      Left = 8
      Top = 12
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    inherited btnAceptar: TButton
      Left = 306
      Top = 42
      TabOrder = 1
    end
    inherited btnCancelar: TButton
      Top = 42
      TabOrder = 2
    end
    inline fraUsuario: TfraCodigoDescripcion
      Left = 48
      Top = 8
      Width = 410
      Height = 23
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Width = 345
      end
    end
  end
  object gbJefe: TJvgGroupBox [5]
    Left = 0
    Top = 384
    Width = 775
    Height = 186
    Align = alBottom
    Caption = ' Jefes '
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
    CaptionGradient.FromColor = 16774371
    CaptionGradient.ToColor = 15587784
    CaptionGradient.Active = True
    CaptionGradient.Orientation = fgdHorizontal
    CaptionShift.X = 8
    CaptionShift.Y = 0
    Colors.Caption = clBtnShadow
    Colors.CaptionActive = clBtnShadow
    Colors.Client = clBtnFace
    Colors.ClientActive = clBtnFace
    Gradient.FromColor = clBlack
    Gradient.ToColor = clGray
    Gradient.Active = False
    Gradient.Orientation = fgdHorizontal
    Options = [fgoCanCollapse, fgoFluentlyCollapse, fgoFluentlyExpand, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
    GroupIndex = 1
    GlyphCollapsed.Data = {
      DE000000424DDE0000000000000076000000280000000F0000000D0000000100
      0400000000006800000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
      7770FFFF7FFFFFFFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
      FF70FFFF7F0000000F70FFFF7FFFF0FFFF70FFFF7FFFF0FFFF70FFFF7FFFF0FF
      FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
      FFF0}
    GlyphExpanded.Data = {
      DE000000424DDE0000000000000076000000280000000F0000000D0000000100
      0400000000006800000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF77777777
      7770FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
      FF70FFFF7F0000000F70FFFF7FFFFFFFFF70FFFF7FFFFFFFFF70FFFF7FFFFFFF
      FF70FFFF7FFFFFFFFF70FFFF777777777770FFFFFFFFFFFFFFF0FFFFFFFFFFFF
      FFF0}
    FullHeight = 157
    object dbJefes: TArtDBGrid
      Left = 2
      Top = 16
      Width = 771
      Height = 168
      Align = alClient
      DataSource = dsJefes
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      IniStorage = FormStorage
      FooterBand = False
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'Usuario'
          Width = 113
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Nombre'
          Width = 278
          Visible = True
        end>
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT   ex_id, ex_usuario, ex_usualta, ex_fechaalta, ex_usumodi' +
        'f, ex_fechamodif, ex_usubaja, ex_fechabaja, se_nombre'
      '    FROM intra.oex_excepcion, art.use_usuarios'
      '   WHERE se_usuario = ex_usuario'
      '     AND se_usuariogenerico = '#39'N'#39
      '     AND computos.general.get_usuarioautorizado(se_id, 1) = 0'
      '')
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
  end
  object sdqJefes: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      
        'SELECT   se_id "ID", se_usuario "Usuario", se_buscanombre "Nombr' +
        'e"'
      '    FROM art.use_usuarios'
      '   WHERE computos.general.get_usuarioautorizado(se_id, 1) = -1'
      '     AND se_fechabaja IS NULL'
      '     AND se_usuariogenerico = '#39'N'#39
      'ORDER BY 2')
    Left = 24
    Top = 312
    object sdqJefesID: TFloatField
      FieldName = 'ID'
    end
    object sdqJefesUsuario: TStringField
      FieldName = 'Usuario'
      Required = True
    end
    object sdqJefesNombre: TStringField
      FieldName = 'Nombre'
      Size = 100
    end
  end
  object dsJefes: TDataSource
    DataSet = sdqJefes
    Left = 52
    Top = 312
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
