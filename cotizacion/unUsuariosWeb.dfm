inherited frmUsuariosWeb: TfrmUsuariosWeb
  Left = 195
  Top = 107
  Caption = 'Usuarios Web'
  ClientHeight = 442
  ClientWidth = 544
  Constraints.MinHeight = 472
  Constraints.MinWidth = 548
  ExplicitWidth = 552
  ExplicitHeight = 472
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 544
    Height = 217
    Visible = True
    ExplicitWidth = 544
    ExplicitHeight = 217
    object GroupBox1: TGroupBox
      Left = 4
      Top = 4
      Width = 264
      Height = 48
      Caption = ' Canal '
      TabOrder = 0
      inline fraCanalFiltro: TfraCanal
        Left = 12
        Top = 16
        Width = 240
        Height = 23
        TabOrder = 0
        ExplicitLeft = 12
        ExplicitTop = 16
        ExplicitWidth = 240
        inherited cmbDescripcion: TComboGrid
          Width = 177
          ExplicitWidth = 177
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
    end
    object GroupBox2: TGroupBox
      Left = 272
      Top = 4
      Width = 268
      Height = 48
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Entidad '
      TabOrder = 1
      DesignSize = (
        268
        48)
      inline fraEntidadFiltro: TfraEntidades
        Left = 12
        Top = 16
        Width = 244
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 12
        ExplicitTop = 16
        ExplicitWidth = 244
        inherited cmbDescripcion: TArtComboBox
          Width = 179
          DataSource = nil
          OnDropDown = fraEntidadFiltrocmbDescripcionDropDown
          ExplicitWidth = 179
        end
      end
    end
    object GroupBox3: TGroupBox
      Left = 272
      Top = 56
      Width = 268
      Height = 48
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Vendedor '
      TabOrder = 3
      DesignSize = (
        268
        48)
      inline fraVendedorFiltro: TfraVendedores
        Left = 12
        Top = 16
        Width = 244
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 12
        ExplicitTop = 16
        ExplicitWidth = 244
        inherited cmbDescripcion: TArtComboBox
          Left = 63
          Width = 179
          DataSource = nil
          ExplicitLeft = 63
          ExplicitWidth = 179
        end
      end
    end
    object GroupBox4: TGroupBox
      Left = 4
      Top = 108
      Width = 264
      Height = 48
      Caption = 'Usuario'
      TabOrder = 4
      object edUsuarioFiltro: TEdit
        Left = 12
        Top = 16
        Width = 240
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
        Text = 'EDUSUARIOFILTRO'
      end
    end
    object GroupBox5: TGroupBox
      Left = 272
      Top = 108
      Width = 268
      Height = 48
      Anchors = [akLeft, akTop, akRight]
      Caption = ' E-Mail '
      TabOrder = 5
      DesignSize = (
        268
        48)
      object edEmailFiltro: TEdit
        Left = 12
        Top = 16
        Width = 244
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecLowerCase
        TabOrder = 0
        Text = 'edemailfiltro'
      end
    end
    object GroupBox6: TGroupBox
      Left = 4
      Top = 56
      Width = 264
      Height = 48
      Caption = ' Sucursal '
      TabOrder = 2
      inline fraSucursalFiltro: TfraSucursal
        Left = 12
        Top = 16
        Width = 240
        Height = 23
        TabOrder = 0
        ExplicitLeft = 12
        ExplicitTop = 16
        ExplicitWidth = 240
        inherited cmbDescripcion: TComboGrid
          Width = 177
          ExplicitWidth = 177
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja'
            'Entidad'
            'Centro Regional')
          ColWidths = (
            40
            300
            -1
            -1
            -1
            0)
        end
      end
    end
    object GroupBox7: TGroupBox
      Left = 4
      Top = 160
      Width = 264
      Height = 48
      Caption = 'Centro Regional'
      TabOrder = 6
      inline fraCentroRegional: TfraCentroRegional
        Left = 11
        Top = 16
        Width = 238
        Height = 23
        TabOrder = 0
        ExplicitLeft = 11
        ExplicitTop = 16
        ExplicitWidth = 238
        inherited cmbDescripcion: TComboGrid
          Width = 175
          ExplicitWidth = 175
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
    end
  end
  inherited CoolBar: TCoolBar
    Top = 217
    Width = 544
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 538
      end>
    ExplicitTop = 217
    ExplicitWidth = 544
    inherited ToolBar: TToolBar
      Left = 9
      Width = 531
      ExplicitLeft = 9
      ExplicitWidth = 531
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 246
    Width = 544
    Height = 196
    Columns = <
      item
        Expanded = False
        FieldName = 'UW_USUARIO'
        Title.Caption = 'Usuario'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANAL'
        Title.Caption = 'Canal'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENTIDAD'
        Title.Caption = 'Entidad'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUCURSAL'
        Title.Caption = 'Sucursal'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cr_descripcion'
        Title.Caption = 'Centro Regional'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VENDEDOR'
        Title.Caption = 'Vendedor'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UW_MAIL'
        Title.Caption = 'E-Mail'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UW_TELEFONO'
        Title.Caption = 'Telefono'
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'UW_NIVEL'
        Title.Alignment = taRightJustify
        Title.Caption = 'Nivel'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UW_USUALTA'
        Title.Caption = 'Usuario Alta'
        Width = 103
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'UW_FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Alta'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UW_USUMODIF'
        Title.Caption = 'Usuario Modificaci'#243'n'
        Width = 113
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'UW_FECHAMODIF'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Modificaci'#243'n'
        Width = 123
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'bloqueado'
        Title.Alignment = taCenter
        Title.Caption = 'Bloqueado'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'controlbcra'
        Title.Alignment = taCenter
        Title.Caption = 'Control BCRA'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UW_MAILAVISOART'
        Title.Caption = 'e-Mail Aviso ART'
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VERLIQ'
        Title.Caption = 'Ver Liquidaci'#243'n'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 124
    Top = -36
    Width = 360
    Height = 449
    OnShow = fpAbmShow
    Constraints.MinHeight = 216
    Constraints.MinWidth = 312
    ExplicitLeft = 124
    ExplicitTop = -36
    ExplicitWidth = 360
    ExplicitHeight = 449
    inherited BevelAbm: TBevel
      Top = 413
      Width = 352
      ExplicitTop = 413
      ExplicitWidth = 352
    end
    object Label1: TLabel [1]
      Left = 36
      Top = 132
      Width = 64
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Usuario'
    end
    object Label2: TLabel [2]
      Left = 36
      Top = 156
      Width = 64
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Clave'
    end
    object Label3: TLabel [3]
      Left = 36
      Top = 12
      Width = 64
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Canal'
    end
    object Label4: TLabel [4]
      Left = 36
      Top = 36
      Width = 64
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Entidad'
    end
    object Label5: TLabel [5]
      Left = 36
      Top = 84
      Width = 64
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Vendedor'
    end
    object Label6: TLabel [6]
      Left = 36
      Top = 204
      Width = 64
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'E-Mails'
    end
    object Label8: TLabel [7]
      Left = 36
      Top = 180
      Width = 64
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Confirmaci'#243'n'
    end
    object Label9: TLabel [8]
      Left = 36
      Top = 60
      Width = 64
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Sucursal'
    end
    object Label10: TLabel [9]
      Left = 30
      Top = 252
      Width = 70
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'E-mails Aviso'
    end
    object Label11: TLabel [10]
      Left = 36
      Top = 108
      Width = 64
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'C.U.I.T.'
    end
    object Label7: TLabel [11]
      Left = 56
      Top = 228
      Width = 42
      Height = 13
      Caption = 'Telefono'
    end
    inherited btnAceptar: TButton
      Left = 200
      Top = 419
      Width = 72
      TabOrder = 19
      ExplicitLeft = 200
      ExplicitTop = 419
      ExplicitWidth = 72
    end
    inherited btnCancelar: TButton
      Left = 280
      Top = 419
      Width = 72
      TabOrder = 20
      ExplicitLeft = 280
      ExplicitTop = 419
      ExplicitWidth = 72
    end
    object edUsuario: TEdit
      Left = 108
      Top = 128
      Width = 152
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 20
      TabOrder = 5
      Text = 'XXXXXXXXXXXXXXXXXXXX'
      OnKeyPress = FiltrarTeclas
    end
    object edClave: TEdit
      Left = 108
      Top = 152
      Width = 152
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 20
      PasswordChar = '*'
      TabOrder = 6
      Text = 'EDCLAVE'
      OnKeyPress = FiltrarTeclas
    end
    inline fraCanal: TfraCanal
      Left = 108
      Top = 8
      Width = 244
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 108
      ExplicitTop = 8
      ExplicitWidth = 244
      inherited cmbDescripcion: TComboGrid
        Width = 181
        ExplicitWidth = 181
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
    inline fraEntidad: TfraEntidades
      Left = 108
      Top = 32
      Width = 244
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      ExplicitLeft = 108
      ExplicitTop = 32
      ExplicitWidth = 244
      inherited cmbDescripcion: TArtComboBox
        Left = 63
        Width = 181
        DataSource = nil
        ExplicitLeft = 63
        ExplicitWidth = 181
      end
    end
    inline fraVendedor: TfraVendedores
      Left = 108
      Top = 80
      Width = 244
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      ExplicitLeft = 108
      ExplicitTop = 80
      ExplicitWidth = 244
      inherited cmbDescripcion: TArtComboBox
        Left = 63
        Width = 181
        DataSource = nil
        ExplicitLeft = 63
        ExplicitWidth = 181
      end
    end
    object checkForzarClave: TCheckBox
      Left = 268
      Top = 156
      Width = 80
      Height = 17
      Caption = 'Forzar Clave'
      TabOrder = 7
    end
    object edEmail: TPatternEdit
      Left = 108
      Top = 200
      Width = 244
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecLowerCase
      MaxLength = 120
      TabOrder = 9
      Text = 'edemail'
    end
    object edConfirmacion: TEdit
      Left = 108
      Top = 176
      Width = 152
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 20
      PasswordChar = '*'
      TabOrder = 8
      Text = 'EDCLAVE'
      OnKeyPress = FiltrarTeclas
    end
    inline fraSucursal: TfraSucursal
      Left = 108
      Top = 56
      Width = 244
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      ExplicitLeft = 108
      ExplicitTop = 56
      ExplicitWidth = 244
      inherited cmbDescripcion: TComboGrid
        Width = 181
        ExplicitWidth = 181
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'Entidad'
          'Centro Regional')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          0)
      end
    end
    object checkAutocotizacion: TCheckBox
      Left = 4
      Top = 292
      Width = 117
      Height = 17
      Alignment = taLeftJustify
      Caption = 'AutoCotizaci'#243'n'
      TabOrder = 13
    end
    object edUsuariosAviso: TPatternEdit
      Left = 108
      Top = 248
      Width = 244
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecLowerCase
      MaxLength = 200
      TabOrder = 11
      Text = 'edemail'
    end
    object checkEstadoCuenta: TCheckBox
      Left = 4
      Top = 312
      Width = 117
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Estado de Cuenta'
      TabOrder = 14
    end
    object checkListadoSiniestros: TCheckBox
      Left = 4
      Top = 332
      Width = 117
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Listado de Siniestros '
      TabOrder = 15
    end
    object edCuit: TMaskEdit
      Left = 108
      Top = 104
      Width = 81
      Height = 21
      EditMask = '99-99999999-c;0;'
      MaxLength = 13
      TabOrder = 4
      OnExit = edCuitExit
    end
    object checkBloqueado: TCheckBox
      Left = 5
      Top = 352
      Width = 116
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Bloqueado'
      TabOrder = 16
    end
    object checkControlBcra: TCheckBox
      Left = 5
      Top = 372
      Width = 116
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Control BCRA'
      TabOrder = 17
    end
    object edTelefono: TEdit
      Left = 108
      Top = 224
      Width = 245
      Height = 21
      TabOrder = 10
    end
    object checkVerLiquidacion: TCheckBox
      Left = 5
      Top = 392
      Width = 116
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Ver Liquidaci'#243'n'
      TabOrder = 18
    end
    object checkCotizacion: TCheckBox
      Left = 4
      Top = 272
      Width = 117
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Sol. Cotizacion'
      TabOrder = 12
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    Left = 16
    Top = 276
  end
  inherited dsConsulta: TDataSource
    Left = 44
    Top = 276
  end
  inherited SortDialog: TSortDialog
    Left = 16
    Top = 304
  end
  inherited ExportDialog: TExportDialog
    Left = 44
    Top = 304
  end
  inherited QueryPrint: TQueryPrint
    DataSource = nil
    Left = 44
    Top = 332
  end
  inherited Seguridad: TSeguridad
    Left = 16
    Top = 248
  end
  inherited FormStorage: TFormStorage
    Left = 44
    Top = 248
  end
  inherited PrintDialog: TPrintDialog
    Left = 16
    Top = 332
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
    Left = 72
    Top = 248
  end
  inherited FieldHider: TFieldHider
    Left = 72
    Top = 276
  end
end
