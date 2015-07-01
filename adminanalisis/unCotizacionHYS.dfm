inherited frmCotizacionHYS: TfrmCotizacionHYS
  Left = 219
  Top = 367
  Width = 920
  Height = 780
  Caption = 'Mantenimiento Cotizaci'#243'n'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 912
    Height = 77
    Visible = True
    object Label1: TLabel
      Left = 14
      Top = 17
      Width = 44
      Height = 13
      Caption = 'Actividad'
    end
    object Label2: TLabel
      Left = 23
      Top = 47
      Width = 35
      Height = 13
      Caption = 'Estudio'
    end
    inline fraActividadFiltro: TfraCodigoDescripcion
      Left = 72
      Top = 12
      Width = 357
      Height = 23
      TabOrder = 0
    end
    inline fraEstudioFiltro: TfraCodigoDescripcion
      Left = 72
      Top = 40
      Width = 357
      Height = 23
      TabOrder = 1
    end
  end
  inherited CoolBar: TCoolBar
    Top = 77
    Width = 912
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 908
      end>
    inherited ToolBar: TToolBar
      Width = 895
      inherited tbSalir: TToolButton
        Visible = False
      end
      object ToolButton1: TToolButton
        Left = 370
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
        Visible = False
      end
      object tbCotizar: TToolButton
        Left = 378
        Top = 0
        Hint = 'Cotizar'
        Caption = 'tbCotizar'
        ImageIndex = 23
        OnClick = tbCotizarClick
      end
      object ToolButton9: TToolButton
        Left = 401
        Top = 0
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 8
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 409
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        Caption = 'tbSalir2'
        ImageIndex = 5
        OnClick = tbSalir2Click
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 106
    Width = 912
    Height = 647
    Columns = <
      item
        Expanded = False
        FieldName = 'CH_IDESTUDIO'
        Title.Caption = 'IDESTUDIO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CH_IDACTIVIDAD'
        Title.Caption = 'IDACTIVIDAD'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'AC_DESCRIPCION'
        Title.Caption = 'Actividad'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_DESCRIPCION'
        Title.Caption = 'Estudio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CH_PORCENTAJE'
        Title.Caption = 'Porcentaje'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CH_COSTO'
        Title.Caption = 'Costo'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CH_USUALTA'
        Title.Caption = 'Usuario Alta'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CH_FECHAALTA'
        Title.Caption = 'Fecha Alta'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CH_USUMODIF'
        Title.Caption = 'Usuario Modif'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CH_FECHAMODIF'
        Title.Caption = 'Fecha Modif'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CH_USUBAJA'
        Title.Caption = 'Usuario Baja'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CH_FECHABAJA'
        Title.Caption = 'Fecha Baja'
        Width = 145
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 96
    Height = 185
    DesignSize = (
      461
      185)
    inherited BevelAbm: TBevel
      Top = 149
    end
    object lblActividad: TLabel [1]
      Left = 16
      Top = 24
      Width = 44
      Height = 13
      Caption = 'Actividad'
    end
    object lblEstudio: TLabel [2]
      Left = 25
      Top = 54
      Width = 35
      Height = 13
      Caption = 'Estudio'
    end
    object lblPorcTrabajadores: TLabel [3]
      Left = 68
      Top = 104
      Width = 79
      Height = 13
      Caption = 'Trabajadores (%)'
    end
    object lblCosto: TLabel [4]
      Left = 280
      Top = 104
      Width = 27
      Height = 13
      Caption = 'Costo'
    end
    inherited btnAceptar: TButton
      Top = 155
    end
    inherited btnCancelar: TButton
      Top = 155
    end
    inline fraActividad: TfraCodigoDescripcion
      Left = 72
      Top = 20
      Width = 357
      Height = 23
      TabOrder = 2
    end
    inline fraEstudio: TfraCodigoDescripcion
      Left = 72
      Top = 48
      Width = 357
      Height = 23
      TabOrder = 3
    end
    object iePorcentaje: TIntEdit
      Left = 156
      Top = 100
      Width = 53
      Height = 21
      TabOrder = 4
      Text = '0'
    end
    object ceCosto: TCurrencyEdit
      Left = 320
      Top = 100
      Width = 69
      Height = 21
      AutoSize = False
      TabOrder = 5
    end
  end
  object fpCotizacion: TFormPanel [4]
    Left = 148
    Top = 352
    Width = 449
    Height = 141
    Caption = 'Cotizar'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    OnShow = fpCotizacionShow
    DesignSize = (
      449
      141)
    object Bevel1: TBevel
      Left = 4
      Top = 105
      Width = 441
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label3: TLabel
      Left = 16
      Top = 24
      Width = 44
      Height = 13
      Caption = 'Actividad'
    end
    object Label5: TLabel
      Left = 71
      Top = 69
      Width = 62
      Height = 13
      Caption = 'Trabajadores'
    end
    object Label6: TLabel
      Left = 226
      Top = 69
      Width = 27
      Height = 13
      Caption = 'Costo'
    end
    object btnCotizar: TButton
      Left = 291
      Top = 111
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Cotizar'
      TabOrder = 0
      OnClick = btnAceptarClick
    end
    object btnSalir: TButton
      Left = 369
      Top = 111
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Salir'
      ModalResult = 2
      TabOrder = 1
    end
    inline fraActividadCotizacion: TfraCodigoDescripcion
      Left = 72
      Top = 20
      Width = 357
      Height = 23
      TabOrder = 2
    end
    object ieCant: TIntEdit
      Left = 143
      Top = 65
      Width = 47
      Height = 21
      TabOrder = 3
      Text = '0'
    end
    object ceCostoCotizacion: TCurrencyEdit
      Left = 266
      Top = 65
      Width = 75
      Height = 21
      AutoSize = False
      TabOrder = 4
    end
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16467
        LinkControl = tbSalir2
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end>
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
        LinkControl = tbSalir2
      end>
    Left = 80
    Top = 260
  end
end
