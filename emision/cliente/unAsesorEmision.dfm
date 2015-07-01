object frmAsesorEmision: TfrmAsesorEmision
  Left = 152
  Top = 174
  Width = 543
  Height = 130
  BorderIcons = []
  Caption = 'Asesor de Emisi'#243'n'
  Color = clBtnFace
  Constraints.MinHeight = 130
  Constraints.MinWidth = 543
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
    535
    103)
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
      Hint = 'Limpiar (Ctrl-L)'
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
    object tblSeparador2: TToolButton
      Left = 51
      Top = 0
      Width = 5
      Caption = 'tblSeparador2'
      ImageIndex = 6
      Style = tbsDivider
    end
    object tlbSalir: TToolButton
      Left = 56
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
    Top = 85
    Width = 535
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
    Width = 527
    Height = 53
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Datos del Asesor de Emisi'#243'n'
    TabOrder = 2
    DesignSize = (
      527
      53)
    object Label1: TLabel
      Left = 16
      Top = 23
      Width = 32
      Height = 13
      Caption = 'Asesor'
    end
    inline fraAS_ID: TfraCodigoDescripcion
      Left = 64
      Top = 18
      Width = 457
      Height = 26
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Left = 43
        Width = 409
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
      end
      item
        Key = 16453
      end>
    Left = 188
    Top = 4
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    PermitirEdicion = True
    DBLogin = frmPrincipal.DBLogin
    Claves = <>
    Left = 216
    Top = 5
  end
end
