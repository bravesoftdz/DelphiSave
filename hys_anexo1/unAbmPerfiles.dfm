inherited frmPerfiles: TfrmPerfiles
  Left = 186
  Top = 145
  Width = 789
  Height = 516
  Caption = 'Mantenimiento de Perfiles'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 781
  end
  inherited CoolBar: TCoolBar
    Width = 781
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 777
      end>
    inherited ToolBar: TToolBar
      Width = 764
    end
  end
  inherited Grid: TArtDBGrid
    Width = 781
    Height = 415
    Columns = <
      item
        Expanded = False
        FieldName = 'PF_ID'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PF_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 171
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PF_USUALTA'
        Title.Caption = 'Usuario Alta'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PF_FECHAALTA'
        Title.Caption = 'Fecha Alta'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PF_USUMODIF'
        Title.Caption = 'Usu. Modif.'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PF_FECHAMODIF'
        Title.Caption = 'Fecha Modif.'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PF_USUBAJA'
        Title.Caption = 'Usu. Baja'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PF_FECHABAJA'
        Title.Caption = 'Fecha Baja'
        Width = 105
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 60
    Top = 112
    Width = 651
    Height = 330
    inherited BevelAbm: TBevel
      Top = 294
      Width = 643
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 15
      Width = 63
      Height = 13
      Caption = 'Nombre Perfil'
    end
    inherited btnAceptar: TButton
      Left = 493
      Top = 300
    end
    inherited btnCancelar: TButton
      Left = 571
      Top = 300
      OnClick = btnCancelarClick
    end
    object edNombrePerfil: TEdit
      Left = 79
      Top = 11
      Width = 266
      Height = 21
      MaxLength = 50
      TabOrder = 2
    end
    object gbCondiciones: TGroupBox
      Left = 3
      Top = 48
      Width = 647
      Height = 244
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Condiciones'
      TabOrder = 3
      DesignSize = (
        647
        244)
      object ToolBar2: TToolBar
        Left = 2
        Top = 15
        Width = 643
        Height = 26
        BorderWidth = 1
        EdgeBorders = []
        Flat = True
        HotImages = frmPrincipal.ilColor
        Images = frmPrincipal.ilByN
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Wrapable = False
        object ToolButton1: TToolButton
          Left = 0
          Top = 0
          Width = 8
          Caption = 'ToolButton1'
          ImageIndex = 7
          Style = tbsSeparator
        end
        object tbNuevaCond: TToolButton
          Left = 8
          Top = 0
          Hint = 'Nuevo'
          ImageIndex = 6
          OnClick = tbNuevaCondClick
        end
        object tbModificarCond: TToolButton
          Left = 31
          Top = 0
          Hint = 'Modificar'
          ImageIndex = 7
          OnClick = tbModificarCondClick
        end
        object tbEliminarCond: TToolButton
          Left = 54
          Top = 0
          Hint = 'Eliminar'
          Caption = 'tbEliminarCond'
          ImageIndex = 8
          OnClick = tbEliminarCondClick
        end
      end
      object pcCondiciones: TPageControl
        Left = 3
        Top = 40
        Width = 639
        Height = 202
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
      end
    end
  end
  object fpCondicion: TFormPanel [4]
    Left = 58
    Top = 450
    Width = 692
    Height = 195
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    object ToolBar1: TToolBar
      Left = 0
      Top = 0
      Width = 692
      Height = 26
      BorderWidth = 1
      EdgeBorders = []
      Flat = True
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Wrapable = False
      object ToolButton9: TToolButton
        Left = 0
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object tbGuardar: TToolButton
        Left = 8
        Top = 0
        Hint = 'Guardar'
        ImageIndex = 3
        OnClick = tbGuardarClick
      end
      object tbLimpiarCondicion: TToolButton
        Left = 31
        Top = 0
        Hint = 'Limpiar'
        ImageIndex = 1
        OnClick = tbLimpiarCondicionClick
      end
      object tbSeleccionarTodo: TToolButton
        Left = 54
        Top = 0
        Hint = 'Seleccionar Todo'
        Caption = 'tbSeleccionarTodo'
        ImageIndex = 13
        OnClick = tbSeleccionarTodoClick
      end
      object tbSalirPerfil: TToolButton
        Left = 77
        Top = 0
        Hint = 'Salir'
        Caption = 'Salir'
        ImageIndex = 5
        OnClick = tbSalirPerfilClick
      end
    end
    inline fraPerfilPreventorABM: TfraPerfilPreventor
      Left = 0
      Top = 26
      Width = 692
      Height = 169
      Align = alTop
      TabOrder = 1
      inherited gbCondicion: TGroupBox
        Width = 683
        inherited gbData: TGroupBox
          Width = 679
          inherited gbCIIU: TGroupBox
            Width = 180
            inherited lstCIIU: TARTCheckListBox
              Width = 176
            end
          end
          inherited gbCatRiesgo: TGroupBox
            Left = 543
          end
        end
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      'FROM hys.hpf_perfil')
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
  end
end
