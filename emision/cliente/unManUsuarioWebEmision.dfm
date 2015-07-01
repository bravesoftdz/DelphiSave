inherited frmManUsuarioWebEmision: TfrmManUsuarioWebEmision
  Left = 333
  Top = 177
  Width = 798
  Caption = 'Mantenimiento Usuario  Web'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 790
    Height = 137
    Visible = True
    object Label1: TLabel
      Left = 8
      Top = 36
      Width = 39
      Height = 13
      Caption = 'Usuario:'
    end
    object Label2: TLabel
      Left = 8
      Top = 13
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    object Label3: TLabel
      Left = 9
      Top = 58
      Width = 37
      Height = 13
      Caption = 'Nombre'
    end
    object Label4: TLabel
      Left = 9
      Top = 83
      Width = 42
      Height = 13
      Caption = 'Tel'#233'fono'
    end
    object Label5: TLabel
      Left = 9
      Top = 108
      Width = 29
      Height = 13
      Caption = 'E-Mail'
    end
    object edUsuarioFiltro: TPatternEdit
      Left = 88
      Top = 32
      Width = 401
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 1
      Pattern = '0123456789ABCDEFGHIJKLMN'#209'OPQRSTUVWXYZ'
    end
    inline fraEmpresaFiltro: TfraEmpresa
      Left = 88
      Top = 8
      Width = 516
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
      DesignSize = (
        516
        21)
      inherited lbRSocial: TLabel
        Left = 89
      end
      inherited lbContrato: TLabel
        Left = 412
      end
      inherited edContrato: TIntEdit
        Left = 459
      end
      inherited cmbRSocial: TArtComboBox
        Left = 141
        Width = 265
      end
    end
    object edNombreFiltro: TEdit
      Left = 88
      Top = 56
      Width = 401
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 3
    end
    object edTelefonoFiltro: TEdit
      Left = 88
      Top = 80
      Width = 84
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 20
      TabOrder = 4
    end
    object edEmailFiltro: TEdit
      Left = 88
      Top = 104
      Width = 401
      Height = 21
      MaxLength = 120
      TabOrder = 5
    end
    object cbNoMostrarBajas: TCheckBox
      Left = 504
      Top = 32
      Width = 97
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'No Mostrar Bajas'
      TabOrder = 2
    end
  end
  inherited CoolBar: TCoolBar
    Top = 137
    Width = 790
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 786
      end>
    inherited ToolBar: TToolBar
      Width = 773
    end
  end
  inherited Grid: TArtDBGrid
    Top = 166
    Width = 790
    Height = 273
    Columns = <
      item
        Expanded = False
        FieldName = 'WE_CONTRATO'
        Title.Caption = 'Contrato'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WE_USUARIO'
        Title.Caption = 'Usuario'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WE_NOMBRE'
        Title.Caption = 'Nombre'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WE_TELEFONO'
        Title.Caption = 'Tel'#233'fono'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WE_MAIL'
        Title.Caption = 'E-Mail'
        Width = 122
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 140
    Top = 136
    Width = 544
    Height = 235
    inherited BevelAbm: TBevel
      Top = 199
      Width = 536
    end
    object lblClaveWeb: TLabel [1]
      Left = 8
      Top = 59
      Width = 56
      Height = 13
      Caption = 'Clave Web:'
    end
    object lblUsuario: TLabel [2]
      Left = 8
      Top = 36
      Width = 39
      Height = 13
      Caption = 'Usuario:'
    end
    object lblCUIT: TLabel [3]
      Left = 8
      Top = 13
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    object lblDescripcion: TLabel [4]
      Left = 9
      Top = 82
      Width = 37
      Height = 13
      Caption = 'Nombre'
    end
    object lblTelefono: TLabel [5]
      Left = 9
      Top = 107
      Width = 42
      Height = 13
      Caption = 'Tel'#233'fono'
    end
    object lblEmail: TLabel [6]
      Left = 9
      Top = 132
      Width = 29
      Height = 13
      Caption = 'E-Mail'
    end
    inherited btnAceptar: TButton
      Left = 386
      Top = 205
      TabOrder = 7
    end
    inherited btnCancelar: TButton
      Left = 464
      Top = 205
      TabOrder = 8
    end
    object edUsuario: TPatternEdit
      Left = 88
      Top = 32
      Width = 452
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 1
      Pattern = '0123456789ABCDEFGHIJKLMN'#209'OPQRSTUVWXYZ'
    end
    object edClaveWeb: TPatternEdit
      Left = 88
      Top = 56
      Width = 452
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      PasswordChar = '*'
      TabOrder = 2
      Pattern = '0123456789ABCDEFGHIJKLMN'#209'OPQRSTUVWXYZ'
    end
    object cbForzarclave: TCheckBox
      Left = 6
      Top = 153
      Width = 95
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Forzar Clave'
      Checked = True
      State = cbChecked
      TabOrder = 6
    end
    inline fraEmpresa: TfraEmpresa
      Left = 88
      Top = 8
      Width = 452
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
      DesignSize = (
        452
        21)
      inherited lbRSocial: TLabel
        Left = 89
      end
      inherited lbContrato: TLabel
        Left = 348
      end
      inherited edContrato: TIntEdit
        Left = 395
      end
      inherited cmbRSocial: TArtComboBox
        Left = 141
        Width = 204
      end
    end
    object edNombre: TEdit
      Left = 88
      Top = 80
      Width = 452
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 3
    end
    object edTelefono: TEdit
      Left = 88
      Top = 104
      Width = 84
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 20
      TabOrder = 4
    end
    object edEmail: TEdit
      Left = 88
      Top = 128
      Width = 451
      Height = 21
      MaxLength = 120
      TabOrder = 5
    end
    object gbPeriodo: TGroupBox
      Left = 390
      Top = 152
      Width = 149
      Height = 43
      Caption = 'P.Conceptos Remunerativos'
      TabOrder = 9
      object edPeriodo: TPeriodoPicker
        Left = 38
        Top = 15
        Width = 57
        Height = 21
        TabOrder = 0
        Color = clWindow
        Periodo.AllowNull = True
        Periodo.Orden = poAnoMes
        Periodo.Separador = #0
        Periodo.Mes = 0
        Periodo.Ano = 0
        Periodo.MaxPeriodo = '205506'
        Periodo.MinPeriodo = '195506'
        WidthMes = 19
        Separation = 0
        ShowButton = False
        ShowOrder = poAnoMes
        ReadOnly = False
        Enabled = True
        Fuente.Charset = DEFAULT_CHARSET
        Fuente.Color = clWindowText
        Fuente.Height = -11
        Fuente.Name = 'MS Sans Serif'
        Fuente.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        NullDropDown = SetMax
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT we_id, we_contrato, we_usuario, we_clave, we_nombre,'
      '       we_mail, we_telefono, we_usualta, we_fechaalta,'
      '       we_usumodif, we_fechamodif, we_usubaja, we_fechabaja,'
      '       we_ultimologin, we_forzarclave'
      '  FROM emi.iwe_usuariowebemision ')
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
