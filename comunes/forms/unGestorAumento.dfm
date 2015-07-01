object frmGestorAumento: TfrmGestorAumento
  Left = 245
  Top = 171
  Width = 568
  Height = 242
  Caption = 'Gestor de Aumento'
  Color = clBtnFace
  Constraints.MaxHeight = 242
  Constraints.MinHeight = 242
  Constraints.MinWidth = 568
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  DesignSize = (
    560
    215)
  PixelsPerInch = 96
  TextHeight = 13
  object tlbControl: TToolBar
    Left = 0
    Top = 0
    Width = 560
    Height = 27
    Caption = 'tlbControl'
    Color = clBtnFace
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    HotImages = frmPrincipal.ilColor
    Images = frmPrincipal.ilByN
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object tlbLimpiar: TToolButton
      Left = 0
      Top = 0
      Hint = 'Limpiar (Ctrl+L)'
      Caption = 'tlbLimpiar'
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
      Caption = 'tlbGuardar'
      ImageIndex = 3
      OnClick = tlbGuardarClick
    end
    object tlbBaja: TToolButton
      Left = 51
      Top = 0
      Hint = 'Baja (Ctrl-B)'
      Caption = 'tlbBaja'
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
    object tlbSalir: TToolButton
      Left = 79
      Top = 0
      Hint = 'Salir (Ctrl-S)'
      Caption = 'tlbSalir'
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
    Top = 197
    Width = 560
    Height = 18
    Panels = <
      item
        Width = 50
      end>
    SimplePanel = True
  end
  object grbContacto: TGroupBox
    Left = 5
    Top = 31
    Width = 552
    Height = 162
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Datos del Gestor'
    TabOrder = 2
    DesignSize = (
      552
      162)
    object Label1: TLabel
      Left = 9
      Top = 22
      Width = 31
      Height = 13
      Caption = 'Gestor'
    end
    object grbDomicilioLegal: TGroupBox
      Left = 8
      Top = 45
      Width = 535
      Height = 108
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Domicilio Legal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        535
        108)
      object lbCA: TLabel
        Left = 36
        Top = 81
        Width = 17
        Height = 13
        Caption = 'C.A'
      end
      object lbTel: TLabel
        Left = 115
        Top = 81
        Width = 18
        Height = 13
        Caption = 'Tel.'
      end
      object lbCAFAX: TLabel
        Left = 371
        Top = 81
        Width = 17
        Height = 13
        Caption = 'C.A'
      end
      object lbFAX: TLabel
        Left = 444
        Top = 81
        Width = 17
        Height = 13
        Caption = 'Fax'
      end
      object edGA_TELEFONOS: TPatternEdit
        Left = 136
        Top = 77
        Width = 232
        Height = 21
        MaxLength = 60
        TabOrder = 1
        Pattern = '0123456789()-/'
      end
      object edGA_FAX: TPatternEdit
        Left = 464
        Top = 78
        Width = 59
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 60
        TabOrder = 3
        Pattern = '0123456789()-/'
      end
      object edGA_CODARETELEFONOS: TPatternEdit
        Left = 57
        Top = 77
        Width = 50
        Height = 21
        MaxLength = 4
        TabOrder = 0
        Pattern = '0123456789'
      end
      object edGA_CODAREAFAX: TPatternEdit
        Left = 391
        Top = 77
        Width = 50
        Height = 21
        MaxLength = 4
        TabOrder = 2
        Pattern = '0123456789'
      end
      inline fraDomicilio: TfraDomicilioTrab
        Left = 9
        Top = 20
        Width = 513
        Height = 50
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
        inherited lbNro: TLabel
          Left = 298
        end
        inherited lbPiso: TLabel
          Left = 370
        end
        inherited lbDto: TLabel
          Left = 446
        end
        inherited lbProvincia: TLabel
          Left = 351
        end
        inherited cmbCalle: TArtComboBox
          Width = 247
        end
        inherited edNumero: TEdit
          Left = 320
        end
        inherited edPiso: TEdit
          Left = 396
        end
        inherited edDto: TEdit
          Left = 468
        end
        inherited cmbLocalidad: TArtComboBox
          Width = 99
        end
        inherited edProvincia: TEdit
          Left = 400
        end
      end
    end
    inline fraGA_IDGESTOR: TfraCodigoDescripcion
      Left = 41
      Top = 17
      Width = 508
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Left = 43
        Width = 459
      end
      inherited edCodigo: TPatternEdit
        Width = 39
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
    Left = 381
    Top = 1
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <
      item
        Name = 'PermisoEscritura'
      end>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = True
    Left = 288
    Top = 1
  end
end
