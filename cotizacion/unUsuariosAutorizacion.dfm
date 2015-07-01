inherited frmUsuariosAutorizacion: TfrmUsuariosAutorizacion
  Left = 252
  Top = 166
  Width = 720
  Caption = 'Usuarios Autorizaci'#243'n'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 712
  end
  inherited CoolBar: TCoolBar
    Width = 712
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 708
      end>
    inherited ToolBar: TToolBar
      Width = 695
    end
  end
  inherited Grid: TArtDBGrid
    Width = 712
    Columns = <
      item
        Expanded = False
        FieldName = 'PUESTO'
        Title.Caption = 'Puesto'
        Width = 159
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_USUARIO'
        Title.Caption = 'Usuario'
        Width = 95
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'AC_CAPITASDESDE'
        Title.Alignment = taRightJustify
        Title.Caption = 'C'#225'pitas Desde'
        Width = 89
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'AC_CAPITASHASTA'
        Title.Alignment = taRightJustify
        Title.Caption = 'C'#225'pitas Hasta'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_SRT'
        Title.Caption = 'SRT - Cotizaci'#243'n'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_SRTREVISION'
        Title.Caption = 'SRT - Revisi'#243'n'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_BCRA'
        Title.Caption = 'BCRA'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_RIESGO'
        Title.Caption = 'Riesgos'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_USUARIONOTIFICACION'
        Title.Caption = 'Usuarios de Notificaci'#243'n'
        Width = 120
        Visible = True
      end>
  end
  object fpAbmCampos: TFormPanel [3]
    Left = 160
    Top = 120
    Width = 400
    Height = 240
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    KeyPreview = True
    OnKeyPress = fpAbmCamposKeyPress
    object CoolBar1: TCoolBar
      Left = 0
      Top = 0
      Width = 400
      Height = 32
      Bands = <
        item
          Control = ToolBar1
          ImageIndex = -1
          Width = 396
        end>
      object ToolBar1: TToolBar
        Left = 9
        Top = 0
        Width = 383
        Height = 25
        Caption = 'ToolBar1'
        HotImages = frmPrincipal.ilColor
        Images = frmPrincipal.ilByN
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        object tbNuevo2: TToolButton
          Left = 0
          Top = 2
          Hint = 'Nuevo'
          Caption = 'tbNuevo2'
          ImageIndex = 6
          ParentShowHint = False
          ShowHint = True
          OnClick = tbNuevo2Click
        end
        object tbDarBaja: TToolButton
          Left = 23
          Top = 2
          Hint = 'Dar de Baja'
          Caption = 'tbDarBaja'
          ImageIndex = 8
          ParentShowHint = False
          ShowHint = True
          OnClick = tbDarBajaClick
        end
        object ToolButton9: TToolButton
          Left = 46
          Top = 2
          Width = 8
          Caption = 'ToolButton9'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object tbSalir2: TToolButton
          Left = 54
          Top = 2
          Hint = 'Salir'
          Caption = 'tbSalir2'
          ImageIndex = 5
          ParentShowHint = False
          ShowHint = True
          OnClick = tbSalir2Click
        end
      end
    end
    object gridCampos: TArtDBGrid
      Left = 0
      Top = 32
      Width = 400
      Height = 208
      Align = alClient
      DataSource = dsConsultaCampos
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      FooterBand = False
      TitleHeight = 17
    end
    object fpItem: TFormPanel
      Left = 56
      Top = 72
      Width = 320
      Height = 96
      Caption = 'Agregar Item'
      FormWidth = 0
      FormHeigth = 0
      BorderIcons = []
      BorderStyle = bsDialog
      Position = poOwnerFormCenter
      OnBeforeShow = fpItemBeforeShow
      ActiveControl = fraItem.edCodigo
      KeyPreview = True
      OnKeyPress = fpItemKeyPress
      object lbItem: TLabel
        Left = 8
        Top = 8
        Width = 28
        Height = 13
        Caption = 'lbItem'
      end
      object Bevel1: TBevel
        Left = 4
        Top = 56
        Width = 312
        Height = 8
        Shape = bsTopLine
      end
      object btnAceptar2: TButton
        Left = 160
        Top = 64
        Width = 72
        Height = 25
        Caption = 'Aceptar'
        TabOrder = 1
        OnClick = btnAceptar2Click
      end
      object btnCancelar2: TButton
        Left = 240
        Top = 64
        Width = 72
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 2
        OnClick = btnCancelar2Click
      end
      inline fraItem: TfraCodDesc
        Left = 8
        Top = 24
        Width = 304
        Height = 23
        TabOrder = 0
      end
    end
  end
  inherited fpAbm: TFormPanel
    Left = 140
    Top = 96
    Width = 488
    Height = 296
    Caption = 'Usuario Autorizaci'#243'n'
    BorderStyle = bsDialog
    ActiveControl = fraPuesto.edCodigo
    Constraints.MinHeight = 128
    Constraints.MinWidth = 456
    inherited BevelAbm: TBevel
      Top = 260
      Width = 480
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 12
      Width = 33
      Height = 13
      Caption = 'Puesto'
    end
    object Label2: TLabel [2]
      Left = 8
      Top = 60
      Width = 69
      Height = 13
      Caption = 'C'#225'pitas Desde'
    end
    object Label3: TLabel [3]
      Left = 8
      Top = 84
      Width = 66
      Height = 13
      Caption = 'C'#225'pitas Hasta'
    end
    object Label4: TLabel [4]
      Left = 8
      Top = 112
      Width = 107
      Height = 13
      Caption = 'Status SRT Cotizaci'#243'n'
    end
    object Label5: TLabel [5]
      Left = 8
      Top = 160
      Width = 62
      Height = 13
      Caption = 'Status BCRA'
    end
    object Label6: TLabel [6]
      Left = 8
      Top = 184
      Width = 38
      Height = 13
      Caption = 'Riesgos'
    end
    object Label7: TLabel [7]
      Left = 8
      Top = 208
      Width = 100
      Height = 13
      Caption = 'Usuarios Notificaci'#243'n'
    end
    object Label8: TLabel [8]
      Left = 8
      Top = 228
      Width = 41
      Height = 13
      Caption = 'Prioridad'
    end
    object Label9: TLabel [9]
      Left = 8
      Top = 36
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    object Label10: TLabel [10]
      Left = 8
      Top = 136
      Width = 99
      Height = 13
      Caption = 'Status SRT Revisi'#243'n'
    end
    inherited btnAceptar: TButton
      Left = 328
      Top = 266
      Width = 72
      TabOrder = 13
    end
    inherited btnCancelar: TButton
      Left = 408
      Top = 266
      Width = 72
      TabOrder = 14
    end
    object edRangoDesde: TIntEdit
      Left = 124
      Top = 56
      Width = 60
      Height = 21
      TabOrder = 2
    end
    object edRangoHasta: TIntEdit
      Left = 124
      Top = 80
      Width = 60
      Height = 21
      TabOrder = 3
    end
    object edStatusSrt: TEdit
      Left = 124
      Top = 104
      Width = 160
      Height = 21
      TabStop = False
      TabOrder = 4
      Text = 'edStatusSrt'
    end
    object edStatusBcra: TEdit
      Left = 124
      Top = 152
      Width = 160
      Height = 21
      TabStop = False
      TabOrder = 6
      Text = 'edStatusBcra'
    end
    object edRiesgos: TEdit
      Left = 124
      Top = 176
      Width = 160
      Height = 21
      TabStop = False
      TabOrder = 8
      Text = 'edRiesgos'
    end
    object edUsuariosNotificacion: TEdit
      Left = 124
      Top = 200
      Width = 336
      Height = 21
      TabStop = False
      TabOrder = 10
      Text = 'edUsuariosNotificacion'
    end
    object btnStatusSrt: TButton
      Left = 284
      Top = 104
      Width = 21
      Height = 21
      Hint = 'Seleccionar Status SRT Cotizaci'#243'n'
      Caption = '...'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = btnStatusSrtClick
    end
    object btnStatusBcra: TButton
      Tag = 2
      Left = 284
      Top = 152
      Width = 21
      Height = 21
      Hint = 'Seleccionar Status BCRA'
      Caption = '...'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = btnStatusSrtClick
    end
    object btnRiesgos: TButton
      Tag = 3
      Left = 284
      Top = 176
      Width = 21
      Height = 21
      Hint = 'Seleccionar Riesgos'
      Caption = '...'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnClick = btnStatusSrtClick
    end
    object btnUsuariosNotificacion: TButton
      Tag = 4
      Left = 460
      Top = 200
      Width = 21
      Height = 21
      Hint = 'Seleccionar Usuarios de Notificaci'#243'n'
      Caption = '...'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      OnClick = btnStatusSrtClick
    end
    inline fraPuesto: TfraCodDesc
      Left = 124
      Top = 8
      Width = 360
      Height = 23
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Width = 295
      end
      inherited edCodigo: TPatternEdit
        Left = 0
      end
      inherited Propiedades: TPropiedadesFrame
        ExtraCondition = ' AND tb_clave = '#39'REUSA'#39' AND tb_codigo <> '#39'0'#39' '
        FieldBaja = 'tb_fechabaja'
        FieldCodigo = 'tb_codigo'
        FieldDesc = 'tb_descripcion'
        FieldID = 'tb_codigo'
        TableName = 'ctb_tablas'
      end
    end
    object edPrioridad: TIntEdit
      Left = 124
      Top = 224
      Width = 60
      Height = 21
      TabOrder = 12
    end
    inline fraUsuario: TfraUsuarios
      Left = 123
      Top = 32
      Width = 360
      Height = 23
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Width = 267
      end
    end
    object edStatusSrtRevision: TEdit
      Left = 124
      Top = 128
      Width = 160
      Height = 21
      TabStop = False
      TabOrder = 15
      Text = 'edStatusSrt'
    end
    object btnStatusSrtRevision: TButton
      Tag = 1
      Left = 284
      Top = 128
      Width = 21
      Height = 21
      Hint = 'Seleccionar Status SRT Revisi'#243'n'
      Caption = '...'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 16
      OnClick = btnStatusSrtClick
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      '  FROM art.aac_autorizacotiza')
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
      end
      item
        Key = 16449
      end
      item
        Key = 16468
      end>
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
  end
  object sdqConsultaCampos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    Left = 24
    Top = 312
  end
  object dsConsultaCampos: TDataSource
    DataSet = sdqConsultaCampos
    Left = 52
    Top = 312
  end
end
