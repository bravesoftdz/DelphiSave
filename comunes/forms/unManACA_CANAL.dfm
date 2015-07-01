inherited frmManACA_CANAL: TfrmManACA_CANAL
  Left = 271
  Top = 163
  Caption = 'Mantenimiento de Canales'
  Font.Name = 'Tahoma'
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Height = 71
    Visible = True
    object Label3: TLabel
      Left = 4
      Top = 32
      Width = 36
      Height = 13
      Caption = 'Entidad'
    end
    object Label4: TLabel
      Left = 13
      Top = 7
      Width = 27
      Height = 13
      Caption = 'Canal'
    end
    inline fraEN_ID: TfraEntidades
      Left = 43
      Top = 27
      Width = 580
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Width = 515
      end
    end
    inline fraEN_IDCANAL: TfraCanal
      Left = 43
      Top = 2
      Width = 580
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited cmbDescripcion: TComboGrid
        Left = 64
        Width = 515
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
    object chkMostrarEntidades: TCheckBox
      Left = 44
      Top = 52
      Width = 120
      Height = 17
      Caption = 'Mostrar Entidades'
      TabOrder = 2
      OnClick = CambiaFiltro
    end
  end
  inherited CoolBar: TCoolBar
    Top = 71
    inherited ToolBar: TToolBar
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 100
    Height = 339
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'CA_CODIGO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_DESCRIPCION'
        Title.Caption = 'Canal'
        Width = 305
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_VENDEDORES'
        Title.Caption = 'Vendedor Oblig.'
        Width = 137
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_TIPO'
        Title.Caption = 'Tipo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_CODBANCO'
        Title.Caption = 'C'#243'd. Entidad'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_NOMBRE'
        Title.Caption = 'Entidad'
        Width = 240
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 12
    Top = 8
    Width = 600
    Height = 424
    Caption = 'Alta/Modificaci'#243'n de Canales'
    inherited BevelAbm: TBevel
      Top = 388
      Width = 592
    end
    inherited btnAceptar: TButton
      Left = 445
      Top = 394
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Left = 520
      Top = 394
      TabOrder = 3
    end
    object Panel1: TPanel
      Left = 0
      Top = 77
      Width = 600
      Height = 306
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Panel1'
      TabOrder = 1
      object CoolBar1: TCoolBar
        Left = 1
        Top = 1
        Width = 598
        Height = 29
        Bands = <
          item
            Control = ToolBar1
            ImageIndex = -1
            MinHeight = 27
            Width = 594
          end>
        object ToolBar1: TToolBar
          Left = 9
          Top = 0
          Width = 581
          Height = 27
          BorderWidth = 1
          Caption = 'ToolBar'
          EdgeBorders = []
          Flat = True
          HotImages = frmPrincipal.ilColor
          Images = frmPrincipal.ilByN
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object tbUsuarioNuevo: TToolButton
            Left = 0
            Top = 0
            Hint = 'Nuevo (Ctrl+N)'
            ImageIndex = 6
            OnClick = tbUsuarioNuevoClick
          end
          object tbUsuarioEliminar: TToolButton
            Left = 23
            Top = 0
            Hint = 'Eliminar (Ctrl+Del)'
            ImageIndex = 8
            OnClick = tbUsuarioEliminarClick
          end
        end
      end
      object pgCanal: TPageControl
        Left = 1
        Top = 30
        Width = 598
        Height = 275
        ActivePage = tsUsuarios
        Align = alClient
        TabOrder = 1
        object tsUsuarios: TTabSheet
          Caption = 'Usuarios'
          object GrillaUsuarios: TArtDBGrid
            Left = 0
            Top = 0
            Width = 590
            Height = 247
            Align = alClient
            DataSource = dsAreaUsuario
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDblClick = GrillaUsuariosDblClick
            IniStorage = FormStorage
            OnGetCellParams = GrillaUsuariosGetCellParams
            FooterBand = False
            TitleHeight = 17
            Columns = <
              item
                Expanded = False
                FieldName = 'SE_NOMBRE'
                Title.Caption = 'Usuario'
                Width = 250
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UC_FECHABAJA'
                Title.Caption = 'Fecha Baja'
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'RESPONSABLE'
                Title.Caption = 'Responsable del Canal'
                Width = 116
                Visible = True
              end>
          end
        end
        object tsEntidades: TTabSheet
          Caption = 'Entidades'
          ImageIndex = 1
          object GrillaEntidades: TArtDBGrid
            Left = 0
            Top = 0
            Width = 590
            Height = 247
            Align = alClient
            DataSource = dsEntidades
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
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
                FieldName = 'EN_CODBANCO'
                Title.Caption = 'C'#243'digo'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EN_NOMBRE'
                Title.Caption = 'Entidad'
                Width = 250
                Visible = True
              end>
          end
        end
      end
    end
    object pnlDatos: TPanel
      Left = 0
      Top = 0
      Width = 600
      Height = 77
      Align = alTop
      TabOrder = 0
      DesignSize = (
        600
        77)
      object lbDescripcion: TLabel
        Left = 77
        Top = 8
        Width = 27
        Height = 13
        Caption = '&Canal'
        FocusControl = edCA_DESCRIPCION
      end
      object Label1: TLabel
        Left = 12
        Top = 8
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label5: TLabel
        Left = 44
        Top = 52
        Width = 28
        Height = 13
        Hint = 'Direcci'#243'n de correo electr'#243'nico'
        Alignment = taRightJustify
        Caption = 'e-mail'
        FocusControl = edCA_DIRELECTRONICA
        ParentShowHint = False
        ShowHint = True
      end
      object edCA_DESCRIPCION: TEdit
        Left = 76
        Top = 24
        Width = 318
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 100
        TabOrder = 1
      end
      object chkVendedor: TCheckBox
        Left = 400
        Top = 22
        Width = 120
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Vendedor Obligatorio'
        TabOrder = 2
      end
      object edCodigo: TEdit
        Left = 12
        Top = 24
        Width = 60
        Height = 21
        TabOrder = 0
      end
      object chkCA_TIPO: TCheckBox
        Left = 400
        Top = 38
        Width = 97
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Es Banco'
        Enabled = False
        TabOrder = 3
      end
      object chkCA_INCLUYECOPIACOTIZACION: TCheckBox
        Left = 400
        Top = 54
        Width = 193
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Recibe copia de cotizaci'#243'n v'#237'a mail'
        TabOrder = 4
      end
      object edCA_DIRELECTRONICA: TEdit
        Left = 76
        Top = 48
        Width = 318
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 120
        TabOrder = 5
      end
    end
  end
  object fpEntidad: TFormPanel [4]
    Left = 156
    Top = 338
    Width = 366
    Height = 65
    Caption = 'Alta de Entidad'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    Position = poScreenCenter
    Constraints.MaxHeight = 65
    Constraints.MaxWidth = 366
    Constraints.MinHeight = 65
    Constraints.MinWidth = 366
    DesignSize = (
      366
      65)
    object Bevel1: TBevel
      Left = 4
      Top = 30
      Width = 359
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label2: TLabel
      Left = 6
      Top = 10
      Width = 36
      Height = 13
      Caption = 'Entidad'
    end
    object btnAceptarEntidad: TButton
      Left = 212
      Top = 36
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
      TabOrder = 0
      OnClick = btnAceptarEntidadClick
    end
    object btnCancelarEntidad: TButton
      Left = 287
      Top = 36
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelarEntidadClick
    end
    inline fraEntidad: TfraEntidades
      Left = 43
      Top = 4
      Width = 321
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Width = 256
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT CA_ID, CA_CODIGO, CA_DESCRIPCION, CA_TIPO, '
      
        '       CA_VENDEDORES, CA_USUALTA, CA_FECHAALTA, CA_USUMODIF, CA_' +
        'FECHAMODIF, CA_USUBAJA, CA_FECHABAJA'
      '  FROM ACA_CANAL'
      ' ORDER BY CA_DESCRIPCION')
    UpdateObject = sduConsulta
  end
  inherited dsConsulta: TDataSource
    Left = 80
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
    Top = 256
  end
  object sduConsulta: TSDUpdateSQL
    ModifySQL.Strings = (
      'UPDATE ACA_CANAL'
      '   SET CA_DESCRIPCION = :CA_DESCRIPCION,'
      '       CA_TIPO = :CA_TIPO,'
      '       CA_CODIGO = :CA_CODIGO,'
      '       CA_VENDEDORES = :CA_VENDEDORES,'
      '       CA_USUMODIF = :CA_USUMODIF,'
      '       CA_FECHAMODIF = :CA_FECHAMODIF,'
      '       CA_USUBAJA = :CA_USUBAJA,'
      '       CA_FECHABAJA = :CA_FECHABAJA,'
      '       CA_DIRELECTRONICA = :CA_DIRELECTRONICA,'
      '       CA_INCLUYECOPIACOTIZACION = :CA_INCLUYECOPIACOTIZACION'
      ' WHERE CA_ID = :CA_ID'
      ' '
      ' '
      ' '
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO ACA_CANAL'
      '(CA_ID, CA_CODIGO, CA_TIPO, CA_DESCRIPCION,'
      'CA_VENDEDORES, CA_USUALTA, CA_FECHAALTA,'
      'CA_DIRELECTRONICA, CA_INCLUYECOPIACOTIZACION)'
      'VALUES'
      '(:CA_ID, :CA_CODIGO, :CA_TIPO, :CA_DESCRIPCION,'
      ':CA_VENDEDORES, :CA_USUALTA, SYSDATE,'
      ':CA_DIRELECTRONICA, :CA_INCLUYECOPIACOTIZACION)'
      ''
      ' ')
    Left = 52
    Top = 228
  end
  object sdqUsuCanal: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqUsuCanalAfterOpen
    SQL.Strings = (
      
        'SELECT   se_nombre, uc_id, uc_fechabaja, DECODE(uc_esresponsable' +
        ', '#39'T'#39', '#39'SI'#39', NULL) responsable'
      '    FROM use_usuarios, auc_usuariocanal'
      '   WHERE uc_usuario = se_usuario'
      '     AND uc_idcanal = :ca_id'
      '     AND uc_fechabaja IS NULL'
      'UNION'
      
        'SELECT DISTINCT se_nombre, TO_NUMBER(NULL), uc_fechabaja, DECODE' +
        '(uc_esresponsable, '#39'T'#39', '#39'SI'#39', NULL)'
      '           FROM use_usuarios, auc_usuariocanal u1'
      '          WHERE u1.uc_usuario = se_usuario'
      '            AND u1.uc_idcanal = :ca_id'
      '            AND u1.uc_fechabaja IS NOT NULL'
      '            AND NOT EXISTS(SELECT 1'
      '                             FROM auc_usuariocanal u2'
      '                            WHERE u2.uc_usuario = u1.uc_usuario'
      '                              AND u2.uc_idcanal = u1.uc_idcanal'
      '                              AND u2.uc_fechabaja IS NULL)'
      '       ORDER BY se_nombre')
    Left = 34
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CA_ID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ca_id'
        ParamType = ptInput
      end>
  end
  object dsAreaUsuario: TDataSource
    DataSet = sdqUsuCanal
    Left = 62
    Top = 376
  end
  object sdqUsuarios: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT SE_NOMBRE, SE_USUARIO'
      'FROM USE_USUARIOS'
      'ORDER BY SE_NOMBRE')
    Left = 33
    Top = 406
  end
  object dsUsuarios: TDataSource
    DataSet = sdqUsuarios
    Left = 61
    Top = 406
  end
  object ldUsuarios: TLookupDialog
    CharCase = ecNormal
    DataSource = dsUsuarios
    DataField = 'SE_NOMBRE'
    Columns = <
      item
        Expanded = False
        FieldName = 'SE_NOMBRE'
        Title.Caption = 'Usuarios'
        Visible = True
      end>
    AutoFill = False
    ShowButtons = True
    ShowEditor = True
    ShowHeaders = True
    AllowCancel = True
    MaxRows = 8
    MinRows = 8
    ShowExportar = True
    Left = 89
    Top = 406
  end
  object sdqEntidades: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT EC_ID, EN_NOMBRE, EN_ID, EN_CODBANCO'
      '    FROM XEN_ENTIDAD, XEC_ENTIDADCANAL'
      '  WHERE EN_ID = EC_IDENTIDAD'
      '      AND EC_IDCANAL = :Canal'
      '      AND EC_FECHABAJA IS NULL'
      ' ORDER BY EN_NOMBRE')
    Left = 34
    Top = 348
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Canal'
        ParamType = ptInput
      end>
  end
  object dsEntidades: TDataSource
    DataSet = sdqEntidades
    Left = 62
    Top = 348
  end
end
