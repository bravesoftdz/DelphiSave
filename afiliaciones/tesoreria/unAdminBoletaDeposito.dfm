inherited frmAdminBoletaDeposito: TfrmAdminBoletaDeposito
  Left = 199
  Top = 156
  Width = 684
  Height = 464
  Caption = 'Administraci'#243'n de Boletas de Dep'#243'sito'
  Constraints.MinHeight = 464
  Constraints.MinWidth = 684
  Font.Name = 'Tahoma'
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 676
    Height = 76
    Visible = True
    object gbFecha: TGroupBox
      Left = 531
      Top = 0
      Width = 145
      Height = 71
      Caption = ' Fecha de Dep'#243'sito '
      TabOrder = 2
      object Label6: TLabel
        Left = 9
        Top = 21
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 12
        Top = 46
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object cmbBD_FECHADesde: TDateComboBox
        Left = 44
        Top = 17
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object cmbBD_FECHAHasta: TDateComboBox
        Left = 44
        Top = 42
        Width = 88
        Height = 21
        TabOrder = 1
      end
    end
    object gbNumero: TGroupBox
      Left = 363
      Top = 0
      Width = 163
      Height = 71
      Caption = ' N'#250'mero de Boleta '
      TabOrder = 1
      object Label4: TLabel
        Left = 11
        Top = 21
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 14
        Top = 46
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edBD_NUMERODesde: TIntEdit
        Left = 46
        Top = 17
        Width = 105
        Height = 21
        TabOrder = 0
        MaxLength = 8
      end
      object edBD_NUMEROHasta: TIntEdit
        Left = 46
        Top = 42
        Width = 105
        Height = 21
        TabOrder = 1
        MaxLength = 8
      end
    end
    object gbOpciones: TGroupBox
      Left = 1
      Top = 0
      Width = 358
      Height = 71
      Caption = ' Opciones '
      TabOrder = 0
      object Label2: TLabel
        Left = 6
        Top = 19
        Width = 34
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cuenta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 15
        Top = 44
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'Serie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edBD_SERIE: TPatternEdit
        Left = 43
        Top = 40
        Width = 28
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 1
        TabOrder = 1
        Pattern = 'ABCDEFGHIJKLMN'#209'OPQRSTUVWXYZ'
      end
      object chkPendientes: TCheckBox
        Left = 105
        Top = 43
        Width = 79
        Height = 17
        Caption = 'Pendientes'
        TabOrder = 2
      end
      inline fraBD_IDCUENTABANCARIA: TfraCuentaBancaria
        Left = 42
        Top = 13
        Width = 308
        Height = 23
        TabOrder = 0
        inherited cmbDescripcion: TComboGrid
          Width = 244
          Cells = (
            'C'#243'digo'
            'Cuenta Nro.'
            'Id'
            'Fecha de Baja'
            'Sucursal'
            'Banco')
          ColWidths = (
            64
            100
            -1
            -1
            64
            250)
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 76
    Width = 676
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 672
      end>
    inherited ToolBar: TToolBar
      Width = 659
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbAprobar: TToolButton
        Left = 370
        Top = 0
        Hint = 'Aprobar (Ctrl+A)'
        Caption = 'tbAprobar'
        ImageIndex = 13
        OnClick = tbAprobarClick
      end
      object ToolButton1: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 401
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        Caption = 'tbSalir2'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 105
    Width = 676
    Height = 332
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'CB_NUMERO'
        Title.Caption = 'Cuenta Nro.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CB_SUCURSAL'
        Title.Caption = 'Sucursal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BA_NOMBRE'
        Title.Caption = 'Banco'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BD_SERIE'
        Title.Caption = 'Serie'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BD_NUMERO'
        Title.Caption = 'N'#250'mero'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BD_MONTO'
        Title.Caption = 'Monto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BD_FECHA'
        Title.Caption = 'Fecha '
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLEARING'
        Title.Caption = 'Clearing'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 331
    Top = 131
    Width = 331
    Height = 177
    Caption = 'Administraci'#243'n de Boletas de Dep'#243'sito'
    Position = poScreenCenter
    Constraints.MaxHeight = 177
    Constraints.MaxWidth = 331
    Constraints.MinHeight = 177
    Constraints.MinWidth = 331
    inherited BevelAbm: TBevel
      Top = 141
      Width = 323
    end
    object lbBancoBoletaDeposito: TLabel [1]
      Left = 7
      Top = 13
      Width = 57
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cuenta Nro.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbSerieBoletaDeposito: TLabel [2]
      Left = 35
      Top = 39
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'Serie'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbNumeroBoletaDeposito: TLabel [3]
      Left = 22
      Top = 64
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#250'mero'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel [4]
      Left = 29
      Top = 90
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Monto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel [5]
      Left = 27
      Top = 117
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    inherited btnAceptar: TButton
      Left = 176
      Top = 147
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    inherited btnCancelar: TButton
      Left = 251
      Top = 147
      TabOrder = 6
    end
    object edSerieBoletaDeposito: TPatternEdit
      Left = 66
      Top = 35
      Width = 28
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 1
      TabOrder = 1
      Pattern = 'ABCDEFGHIJKLMN'#209'OPQRSTUVWXYZ'
    end
    object edNumeroBoletaDeposito: TIntEdit
      Left = 66
      Top = 60
      Width = 105
      Height = 21
      TabOrder = 2
      MaxLength = 8
    end
    object edfpMontoBoletaDeposito: TCurrencyEdit
      Left = 66
      Top = 86
      Width = 133
      Height = 21
      TabStop = False
      AutoSize = False
      ReadOnly = True
      TabOrder = 3
    end
    object cmbFechaBoletaDeposito: TDateComboBox
      Left = 65
      Top = 113
      Width = 88
      Height = 21
      TabOrder = 4
    end
    inline fraBancoBoletaDeposito: TfraCuentaBancaria
      Left = 65
      Top = 8
      Width = 264
      Height = 23
      TabOrder = 0
      inherited cmbDescripcion: TComboGrid
        Width = 193
        Cells = (
          'C'#243'digo'
          'Cuenta Nro.'
          'Id'
          'Fecha de Baja'
          'Sucursal'
          'Banco')
        ColWidths = (
          64
          100
          -1
          -1
          64
          250)
      end
    end
  end
  object fpClearing: TFormPanel [4]
    Left = 107
    Top = 311
    Width = 331
    Height = 114
    Caption = 'Selecci'#243'n del tipo de Clearing Bancario'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    Position = poScreenCenter
    Constraints.MaxHeight = 114
    Constraints.MaxWidth = 331
    Constraints.MinHeight = 114
    Constraints.MinWidth = 331
    OnEnter = fpClearingEnter
    DesignSize = (
      331
      114)
    object Bevel1: TBevel
      Left = 4
      Top = 78
      Width = 323
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object lbClearing: TLabel
      Left = 16
      Top = 16
      Width = 38
      Height = 13
      Caption = 'Clearing'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object btnAceptar2: TButton
      Left = 176
      Top = 84
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
      OnClick = btnAceptar2Click
    end
    object btnCancelar2: TButton
      Left = 251
      Top = 84
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    inline fraClearing: TfraCodigoDescripcion
      Left = 16
      Top = 36
      Width = 302
      Height = 23
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Width = 237
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT RBD.BD_ID, RBD.BD_IDCUENTABANCARIA, ZBA.BA_CODIGO, ZCB.CB' +
        '_SUCURSAL,'
      
        '       ZCB.CB_NUMERO, ZBA.BA_NOMBRE, RBD.BD_SERIE, RBD.BD_NUMERO' +
        ', RBD.BD_MONTO,'
      '       RBD.BD_FECHA, RCB.CB_DESCRIPCION CLEARING'
      '  FROM RCB_CLEARINGBANCARIO RCB, ZCB_CUENTABANCARIA ZCB,'
      '  '#9'   ZBA_BANCO ZBA, RBD_BOLETADEPOSITO RBD'
      ' WHERE ZCB.CB_ID = RBD.BD_IDCUENTABANCARIA'
      '   AND ZCB.CB_IDBANCO = ZBA.BA_ID'
      '   AND RCB.CB_ID(+) = RBD.BD_IDCLEARING ')
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
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
        LinkControl = tbSalir2
      end
      item
        Key = 16449
        LinkControl = tbAprobar
      end>
  end
end
