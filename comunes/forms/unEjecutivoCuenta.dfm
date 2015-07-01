object frmEjecutivoCuenta: TfrmEjecutivoCuenta
  Left = 295
  Top = 175
  Caption = 'Ejecutivo de Cuenta'
  ClientHeight = 204
  ClientWidth = 535
  Color = clBtnFace
  Constraints.MinHeight = 231
  Constraints.MinWidth = 543
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object tlbControl: TToolBar
    Left = 0
    Top = 0
    Width = 535
    Height = 27
    Caption = 'tlbControl'
    Color = clBtnFace
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    HotImages = frmPrincipal.ilColor
    Images = frmPrincipal.ilByN
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object tlbLimpiar: TToolButton
      Left = 0
      Top = 0
      Hint = 'Limpiar (Ctrl-L)'
      ImageIndex = 6
      OnClick = tlbLimpiarClick
    end
    object tblSeparador1: TToolButton
      Left = 23
      Top = 0
      Width = 5
      Caption = 'tblSeparador1'
      ImageIndex = 6
      Style = tbsDivider
    end
    object tlbGuardar: TToolButton
      Left = 28
      Top = 0
      Hint = 'Guardar (Ctrl-G)'
      ImageIndex = 3
      OnClick = tlbGuardarClick
    end
    object tlbBaja: TToolButton
      Left = 51
      Top = 0
      Hint = 'Baja (Ctrl-B)'
      ImageIndex = 8
      OnClick = tlbBajaClick
    end
    object tblSeparador2: TToolButton
      Left = 74
      Top = 0
      Width = 5
      Caption = 'tblSeparador2'
      ImageIndex = 6
      Style = tbsDivider
    end
    object tbHistorico: TToolButton
      Left = 79
      Top = 0
      Hint = 'Ver historial'
      ImageIndex = 15
      OnClick = tbHistoricoClick
    end
    object ToolButton1: TToolButton
      Left = 102
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object tlbSalir: TToolButton
      Left = 110
      Top = 0
      Hint = 'Salir (Ctrl-S)'
      ImageIndex = 5
      Wrap = True
      OnClick = tlbSalirClick
    end
    object ToolButton2: TToolButton
      Left = 0
      Top = 22
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 6
      Style = tbsSeparator
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 186
    Width = 535
    Height = 18
    Panels = <
      item
        Width = 50
      end>
    SimplePanel = True
  end
  object grbContacto: TGroupBox
    Left = 0
    Top = 27
    Width = 535
    Height = 159
    Align = alClient
    Caption = ' Datos del Ejecutivo '
    TabOrder = 2
    ExplicitLeft = 5
    ExplicitTop = 31
    ExplicitWidth = 527
    ExplicitHeight = 149
    DesignSize = (
      535
      159)
    object Label1: TLabel
      Left = 16
      Top = 22
      Width = 44
      Height = 13
      Caption = 'Ejecutivo'
    end
    object grbDomicilioLegal: TGroupBox
      Left = 12
      Top = 49
      Width = 512
      Height = 102
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Domicilio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        512
        102)
      object lbCA: TLabel
        Left = 36
        Top = 76
        Width = 18
        Height = 13
        Caption = 'C.A'
      end
      object lbTel: TLabel
        Left = 115
        Top = 76
        Width = 18
        Height = 13
        Caption = 'Tel.'
      end
      object lbCAFAX: TLabel
        Left = 303
        Top = 76
        Width = 18
        Height = 13
        Caption = 'C.A'
      end
      object lbFAX: TLabel
        Left = 376
        Top = 76
        Width = 18
        Height = 13
        Caption = 'Fax'
      end
      object edEC_TELEFONOS: TPatternEdit
        Left = 136
        Top = 72
        Width = 161
        Height = 21
        MaxLength = 60
        TabOrder = 1
        Pattern = '0123456789()-/'
      end
      object edEC_FAX: TPatternEdit
        Left = 400
        Top = 72
        Width = 101
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 60
        TabOrder = 3
        Pattern = '0123456789()-/'
      end
      object edEC_CODAREATELEFONOS: TPatternEdit
        Left = 57
        Top = 72
        Width = 50
        Height = 21
        MaxLength = 4
        TabOrder = 0
        Pattern = '0123456789'
      end
      object edEC_CODAREAFAX: TPatternEdit
        Left = 323
        Top = 72
        Width = 50
        Height = 21
        MaxLength = 4
        TabOrder = 2
        Pattern = '0123456789'
      end
      inline fraDomicilio: TfraDomicilioTrab
        Left = 9
        Top = 15
        Width = 492
        Height = 50
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
        ExplicitLeft = 9
        ExplicitTop = 15
        ExplicitWidth = 492
        inherited lbCalle: TLabel
          Left = 19
          Top = 3
          ExplicitLeft = 19
          ExplicitTop = 3
        end
        inherited lbNro: TLabel
          Left = 277
          ExplicitLeft = 275
        end
        inherited lbPiso: TLabel
          Left = 349
          ExplicitLeft = 347
        end
        inherited lbDto: TLabel
          Left = 425
          ExplicitLeft = 423
        end
        inherited lbProvincia: TLabel
          Left = 330
          ExplicitLeft = 328
        end
        inherited cmbCalle: TArtComboBox
          Width = 226
          ExplicitWidth = 224
        end
        inherited edNumero: TEdit
          Left = 299
          ExplicitLeft = 297
        end
        inherited edPiso: TEdit
          Left = 375
          ExplicitLeft = 373
        end
        inherited edDto: TEdit
          Left = 447
          ExplicitLeft = 445
        end
        inherited cmbLocalidad: TArtComboBox
          Width = 78
          ExplicitWidth = 76
        end
        inherited edProvincia: TEdit
          Left = 379
          ExplicitLeft = 377
        end
      end
    end
    inline fraEC_ID: TfraCodigoDescripcion
      Left = 64
      Top = 17
      Width = 465
      Height = 26
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      ExplicitLeft = 64
      ExplicitTop = 17
      ExplicitWidth = 457
      ExplicitHeight = 26
      inherited cmbDescripcion: TArtComboBox
        Left = 43
        Width = 417
        ExplicitLeft = 43
        ExplicitWidth = 409
      end
      inherited edCodigo: TPatternEdit
        Width = 39
        ExplicitWidth = 39
      end
    end
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16455
        LinkControl = tlbGuardar
      end
      item
        Key = 16460
        LinkControl = tlbLimpiar
      end
      item
        Key = 16467
        LinkControl = tlbSalir
      end
      item
        Key = 16457
      end
      item
        Key = 16466
      end
      item
        Key = 16468
      end
      item
        Key = 16450
        LinkControl = tlbBaja
      end
      item
        Key = 16453
      end>
    Left = 324
    Top = 32
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <
      item
        Name = 'PermisoEscritura'
      end>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = True
    Left = 244
    Top = 32
  end
  object sdqHistorico: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      '  SELECT he_contrato AS contrato,'
      '         ec_nombre AS ejecutivo,'
      '         NVL(se_nombre, he_usualta) AS usuario,'
      '         he_fechaalta AS fecha,'
      
        '         NVL(he_motivo, '#39'No se especific'#243' el motivo del cambio'#39')' +
        ' AS motivo'
      
        '    FROM art.use_usuarios, afi.ahe_historicoejecutivo, afi.aec_e' +
        'jecutivocuenta'
      '   WHERE he_contrato = :contrato'
      '     AND he_idejecutivo = ec_id'
      '     AND he_usualta = se_usuario(+)'
      'ORDER BY he_fechaalta')
    Left = 479
    Top = 4
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end>
  end
end
