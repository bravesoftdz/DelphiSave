inherited frmRelevTiposAnexos: TfrmRelevTiposAnexos
  Left = 276
  Top = 148
  Width = 750
  Height = 470
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Formulario'
  OldCreateOrder = True
  Position = poOwnerFormCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lstTipoAnexo: TJvgAskListBox [0]
    Left = 0
    Top = 81
    Width = 742
    Height = 331
    Align = alClient
    BorderStyle = bsNone
    Color = clBtnFace
    TabOrder = 0
    OnKeyDown = lstTipoAnexoKeyDown
    OnKeyUp = lstTipoAnexoKeyUp
    GlyphsAlign.Vertical = fvaCenter
    ItemStyle.BtnColor = clBtnFace
    ItemStyle.BtnFont.Charset = DEFAULT_CHARSET
    ItemStyle.BtnFont.Color = clWindowText
    ItemStyle.BtnFont.Height = -11
    ItemStyle.BtnFont.Name = 'MS Sans Serif'
    ItemStyle.BtnFont.Style = []
    ItemStyle.BtnTextStyle = fstPushed
    ItemStyle.Color = clBtnFace
    ItemStyle.DelineateColor = clBlack
    ItemStyle.Font.Charset = DEFAULT_CHARSET
    ItemStyle.Font.Color = clWindowText
    ItemStyle.Font.Height = -11
    ItemStyle.Font.Name = 'MS Sans Serif'
    ItemStyle.Font.Style = []
    ItemStyle.Bevel.Inner = bvSpace
    ItemStyle.Bevel.Outer = bvNone
    ItemStyle.Bevel.Sides = [fsdTop]
    ItemStyle.Bevel.Bold = False
    ItemStyle.TextStyle = fstNone
    ItemSelStyle.BtnColor = clBtnFace
    ItemSelStyle.BtnFont.Charset = DEFAULT_CHARSET
    ItemSelStyle.BtnFont.Color = clWindowText
    ItemSelStyle.BtnFont.Height = -11
    ItemSelStyle.BtnFont.Name = 'MS Sans Serif'
    ItemSelStyle.BtnFont.Style = []
    ItemSelStyle.BtnTextStyle = fstNone
    ItemSelStyle.Color = clWindow
    ItemSelStyle.DelineateColor = clBlack
    ItemSelStyle.Font.Charset = DEFAULT_CHARSET
    ItemSelStyle.Font.Color = clBlack
    ItemSelStyle.Font.Height = -11
    ItemSelStyle.Font.Name = 'MS Sans Serif'
    ItemSelStyle.Font.Style = []
    ItemSelStyle.Bevel.Inner = bvLowered
    ItemSelStyle.Bevel.Outer = bvNone
    ItemSelStyle.Bevel.Bold = False
    ItemSelStyle.TextStyle = fstNone
    TextAlign.Vertical = fvaCenter
    TransparentColor = clOlive
    Buttons.Strings = (
      'No'
      'Si')
    Options = []
  end
  object CoolBar: TCoolBar [1]
    Left = 0
    Top = 35
    Width = 742
    Height = 29
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 738
      end>
    object ToolBar: TToolBar
      Left = 9
      Top = 0
      Width = 725
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
      object tbNuevo: TToolButton
        Left = 0
        Top = 0
        Hint = 'Nuevo (Ctrl+N)'
        Enabled = False
        ImageIndex = 6
        OnClick = tbNuevoClick
      end
      object tbModificar: TToolButton
        Left = 23
        Top = 0
        Hint = 'Modificar (Ctrl+M)'
        Caption = 'tbModificar'
        Enabled = False
        ImageIndex = 7
        OnClick = tbModificarClick
      end
      object tbEliminar: TToolButton
        Left = 46
        Top = 0
        Hint = 'Dar de Baja (Ctrl+Del)'
        Enabled = False
        ImageIndex = 8
        OnClick = tbEliminarClick
      end
      object ToolButton1: TToolButton
        Left = 69
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbTodosNo: TToolButton
        Left = 77
        Top = 0
        Hint = 'Marcar Todos en NO'
        Caption = 'tbTodosNo'
        ImageIndex = 45
        OnClick = tbTodosNoClick
      end
      object ToolButton3: TToolButton
        Left = 100
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbLimpiar: TToolButton
        Left = 108
        Top = 0
        Hint = 'Limpiar (Ctrl+L)'
        Enabled = False
        ImageIndex = 1
        OnClick = tbLimpiarClick
      end
      object ToolButton11: TToolButton
        Left = 131
        Top = 0
        Width = 8
        Caption = 'ToolButton11'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir: TToolButton
        Left = 139
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  object pnlHeader: TPanel [2]
    Left = 0
    Top = 0
    Width = 742
    Height = 35
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    DesignSize = (
      742
      35)
    object lblValido: TLabel
      Left = 667
      Top = 11
      Width = 69
      Height = 16
      Anchors = [akTop, akRight]
      Caption = 'V'#225'lido: ---'
    end
  end
  object HeaderControl1: THeaderControl [3]
    Left = 0
    Top = 64
    Width = 742
    Height = 17
    Sections = <
      item
        AllowClick = False
        ImageIndex = -1
        MaxWidth = 70
        MinWidth = 70
        Text = 'C'#243'digo'
        Width = 70
      end
      item
        AutoSize = True
        ImageIndex = -1
        Text = 'Descripci'#243'n'
        Width = 672
      end>
  end
  object panComandos: TPanel [4]
    Left = 0
    Top = 412
    Width = 742
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    DesignSize = (
      742
      31)
    object btnGuardar: TButton
      Left = 583
      Top = 3
      Width = 75
      Height = 25
      Hint = 'Alt + G'
      Anchors = [akRight, akBottom]
      Caption = '&Guardar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnGuardarClick
    end
    object btnCancelar: TButton
      Left = 663
      Top = 3
      Width = 75
      Height = 26
      Hint = 'Alt + C'
      Anchors = [akRight, akBottom]
      Caption = '&Cancelar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object pnlTransparente: TJvPanel [5]
    Left = 640
    Top = 80
    Width = 85
    Height = 333
    Transparent = True
    MultiLine = False
    Anchors = [akTop, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 5
  end
  inherited FormStorage: TFormStorage
    Active = False
    Left = 64
    Top = 136
  end
  inherited XPMenu: TXPMenu
    Left = 116
    Top = 200
  end
  inherited ilByN: TImageList
    Left = 32
    Top = 156
  end
  inherited ilColor: TImageList
    Left = 116
    Top = 156
  end
  inherited IconosXP: TImageList
    Left = 192
    Top = 164
  end
  object sdqConsultaTipoFormulario: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT   it_id, it_codigo, it_descripcion, it_masdatos'
      '    FROM hys.hit_itemtipoanexo'
      '  WHERE it_idtipoanexo = :idtipoAnexo'
      'ORDER BY it_orden')
    Left = 480
    Top = 100
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idtipoAnexo'
        ParamType = ptInput
      end>
  end
  object ShortCutControl1: TShortCutControl
    ShortCuts = <
      item
        Key = 116
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
      end
      item
        Key = 16457
      end
      item
        Key = 16453
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end>
    Left = 8
    Top = 112
  end
end
