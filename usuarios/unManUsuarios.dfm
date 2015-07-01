inherited frmManUsuarios: TfrmManUsuarios
  Left = 209
  Top = 183
  Caption = 'Mantenimiento de Usuarios'
  ClientHeight = 672
  ClientWidth = 1160
  Constraints.MinHeight = 500
  Constraints.MinWidth = 700
  Font.Name = 'Tahoma'
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Visible = True
  ExplicitWidth = 1168
  ExplicitHeight = 699
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid: TArtDBGrid [0]
    Left = 0
    Top = 29
    Width = 1160
    Height = 618
    Align = alClient
    Constraints.MinWidth = 640
    DataSource = dsDatos
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGridDblClick
    IniStorage = FormPlacement
    OnGetCellParams = DBGridGetCellParams
    FooterBand = False
    TitleHeight = 34
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'SE_USUARIO'
        Title.Caption = 'Clave'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_NOMBRE'
        Title.Caption = 'Apellido y Nombre'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PF_DESCRIPCION'
        Title.Caption = 'Perfil'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_DESCRIPCION'
        Title.Caption = 'Sector'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EL_NOMBRE'
        Title.Caption = 'Delegaci'#243'n'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TB_DESCRIPCION'
        Title.Caption = 'Cargo'
        Width = 34
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SE_ACCESOSEGURIDAD'
        Title.Alignment = taCenter
        Title.Caption = 'Acc. Seguridad'
        Width = 58
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SE_USUARIOGENERICO'
        Title.Alignment = taCenter
        Title.Caption = 'Usuario Gen'#233'rico'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_INTERNO'
        Title.Caption = 'Interno'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERFILES'
        Title.Caption = 'Digitalizaci'#243'n AGA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SECTOR_INTRANET'
        Title.Caption = 'Sector de la Intranet'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EQ_DESCRIPCION'
        Title.Caption = 'PC'
        Width = 23
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RU_DETALLE'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_FECHAALTA'
        Title.Caption = 'Fecha de alta'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_FECHABAJA'
        Title.Caption = 'Fecha de baja'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPOEXPO'
        Width = 20
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NA_DESCRIPCION'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JEFE'
        Title.Caption = 'Jefe'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_MAIL'
        Title.Caption = 'Correo'
        Visible = True
      end>
  end
  object fpDigitalizacion: TFormPanel [1]
    Left = 108
    Top = 124
    Width = 577
    Height = 405
    Caption = 'Asignaci'#243'n de perfiles de Digitalizaci'#243'n - AGA'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    DesignSize = (
      577
      405)
    object Bevel6: TBevel
      Left = 4
      Top = 365
      Width = 570
      Height = 5
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label7: TLabel
      Left = 16
      Top = 12
      Width = 249
      Height = 13
      Caption = 'Perfiles de visualizaci'#243'n (los tildados son los activos)'
    end
    object clbDigitalizacion: TARTCheckListBox
      Left = 12
      Top = 32
      Width = 553
      Height = 321
      Anchors = [akLeft, akTop, akRight, akBottom]
      Columns = 2
      ItemHeight = 13
      TabOrder = 2
      AutoAjustarColumnas = False
      Locked = False
      SQL = 
        ' SELECT ta_descripcion AS descripcion, ta_id AS codigo FROM arch' +
        'ivo.rta_tipoarchivo WHERE ta_fechabaja IS NULL ORDER BY 1'
    end
    object btnAceptarDigitalizacion: TAdvGlowButton
      Left = 422
      Top = 373
      Width = 75
      Height = 27
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      WordWrap = False
      TabOrder = 0
      TabStop = True
      OnClick = btnAceptarDigitalizacionClick
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
    object btnCancelarDigitalizacion: TAdvGlowButton
      Left = 498
      Top = 373
      Width = 75
      Height = 27
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      WordWrap = False
      TabOrder = 1
      TabStop = True
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
  end
  object fpImpoExpo: TFormPanel [2]
    Left = 28
    Top = 196
    Width = 641
    Height = 397
    Caption = 'ImpoExpo'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsSingle
    Position = poOwnerFormCenter
    DesignSize = (
      641
      397)
    object Bevel7: TBevel
      Left = 4
      Top = 357
      Width = 634
      Height = 5
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label10: TLabel
      Left = 16
      Top = 12
      Width = 238
      Height = 13
      Caption = 'Perfiles de ImpoExpo (los tildados son los activos)'
    end
    object clbImpoExpo: TARTCheckListBox
      Left = 12
      Top = 32
      Width = 617
      Height = 317
      Anchors = [akLeft, akTop, akRight, akBottom]
      Columns = 2
      ItemHeight = 13
      PopupMenu = pmuImpoExpo
      TabOrder = 2
      AutoAjustarColumnas = False
      Locked = False
      SQL = 
        ' SELECT distinct pr_descripcion AS descripcion, pr_id AS codigo ' +
        'FROM impoexpo.ipr_proceso WHERE pr_fechabaja IS NULL ORDER BY 1 '
    end
    object btnAceptarImpoExpo: TAdvGlowButton
      Left = 486
      Top = 365
      Width = 75
      Height = 27
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      WordWrap = False
      TabOrder = 0
      TabStop = True
      OnClick = btnAceptarImpoExpoClick
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
    object btnCancelarImpoExpo: TAdvGlowButton
      Left = 562
      Top = 365
      Width = 75
      Height = 27
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      WordWrap = False
      TabOrder = 1
      TabStop = True
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
  end
  object CoolBar1: TCoolBar [3]
    Left = 0
    Top = 0
    Width = 1160
    Height = 29
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 33
        Width = 1156
      end>
    ParentShowHint = False
    ShowHint = True
    ExplicitWidth = 692
    object ToolBar: TToolBar
      Left = 9
      Top = 0
      Width = 1147
      Height = 33
      Align = alClient
      AutoSize = True
      EdgeInner = esNone
      EdgeOuter = esNone
      HotImages = ImgColor2
      Images = imgBN2
      TabOrder = 0
      object tbRefrescar: TToolButton
        Left = 0
        Top = 0
        Hint = 'Refrescar (F5)'
        ImageIndex = 5
        OnClick = tbRefrescarClick
      end
      object ToolButton2: TToolButton
        Left = 23
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object tbNuevo: TToolButton
        Left = 31
        Top = 0
        Hint = 'Nuevo (Ctrl+N)'
        DropdownMenu = pmnuNuevos
        ImageIndex = 2
        Style = tbsDropDown
        OnClick = tbNuevoClick
      end
      object tbModificar: TToolButton
        Left = 69
        Top = 0
        Hint = 'Modificar (Enter)'
        ImageIndex = 3
        OnClick = tbModificarClick
      end
      object tbEliminar: TToolButton
        Left = 92
        Top = 0
        Hint = 'Eliminar (Sup)'
        ImageIndex = 4
        OnClick = tbEliminarClick
      end
      object tbFax: TToolButton
        Left = 115
        Top = 0
        Hint = 'Formularios de fax asociados'
        ImageIndex = 11
        OnClick = tbFaxClick
      end
      object ToolButton6: TToolButton
        Left = 138
        Top = 0
        Width = 8
        Caption = 'ToolButton6'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object tbBuscar: TToolButton
        Left = 146
        Top = 0
        Hint = 'Buscar (F3)'
        ImageIndex = 13
        OnClick = tbBuscarClick
      end
      object tbFiltros: TToolButton
        Left = 169
        Top = 0
        Hint = 'Filtros (Ctrl+F)'
        Caption = 'Filtros'
        ImageIndex = 14
        OnClick = tbFiltrosClick
      end
      object ToolButton11: TToolButton
        Left = 192
        Top = 0
        Width = 8
        Caption = 'ToolButton11'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object tbOrdenar: TToolButton
        Left = 200
        Top = 0
        Hint = 'Ordenar (Ctrl+O)'
        ImageIndex = 6
        OnClick = tbOrdenarClick
      end
      object ToolButton5: TToolButton
        Left = 223
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object tbExportar: TToolButton
        Left = 231
        Top = 0
        Hint = 'Exportar (Ctrl+E)'
        ImageIndex = 8
        OnClick = tbExportarClick
      end
      object tbImprimir: TToolButton
        Left = 254
        Top = 0
        Hint = 'Imprimir (Ctrl+I)'
        ImageIndex = 7
        OnClick = tbImprimirClick
      end
      object ToolButton3: TToolButton
        Left = 277
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object tbSalir: TToolButton
        Left = 285
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 0
        OnClick = tbSalirClick
      end
    end
  end
  object fpBusqueda: TFormPanel [4]
    Left = 113
    Top = 50
    Width = 453
    Height = 69
    Caption = 'Buscar Usuario'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsSingle
    Position = poScreenCenter
    ActiveControl = fraUsuario.edCodigo
    DesignSize = (
      453
      69)
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    inline fraUsuario: TfraUsuario
      Left = 52
      Top = 8
      Width = 393
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 52
      ExplicitTop = 8
      ExplicitWidth = 393
      DesignSize = (
        393
        21)
      inherited cmbDescripcion: TArtComboBox
        Width = 309
        ExplicitWidth = 309
      end
    end
    object btnBuscCancelar: TAdvGlowButton
      Left = 374
      Top = 36
      Width = 75
      Height = 27
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      WordWrap = False
      TabOrder = 2
      TabStop = True
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
    object btnBuscBuscar: TAdvGlowButton
      Left = 298
      Top = 36
      Width = 75
      Height = 27
      Anchors = [akRight, akBottom]
      Caption = '&Buscar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ModalResult = 1
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      WordWrap = False
      TabOrder = 1
      TabStop = True
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
  end
  object fpFiltros: TFormPanel [5]
    Left = 612
    Top = 80
    Width = 660
    Height = 429
    Caption = 'Filtros de Selecci'#243'n'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    Position = poOwnerFormCenter
    Constraints.MinWidth = 640
    DesignSize = (
      660
      429)
    object Bevel1: TBevel
      Left = 5
      Top = 389
      Width = 648
      Height = 5
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Bevel2: TBevel
      Left = 4
      Top = 140
      Width = 648
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object ilbFiltros: TImageListBox
      Left = 8
      Top = 4
      Width = 441
      Height = 129
      BorderStyle = bsNone
      Color = clBtnFace
      Items.Strings = (
        'Usuarios dados de Baja'
        'Usuarios con la Contrase'#241'a Vencida'
        'Usuarios Demorados'
        'Usuarios sin Sector'
        'Usuarios sin Perfil'
        'Usuarios sin Sector de la Intranet'
        'Usuarios gen'#233'ricos')
      TabOrder = 3
      Images = ImageList
      ImageBorder = 1
      OnImageClick = ilbFiltrosImageClick
    end
    inline fraUsuFiltros: TfraUsuDatos
      Left = 8
      Top = 148
      Width = 640
      Height = 187
      Anchors = [akLeft, akTop, akRight]
      Constraints.MinWidth = 640
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      ExplicitLeft = 8
      ExplicitTop = 148
      ExplicitHeight = 187
      DesignSize = (
        640
        187)
      inherited cmbCargos: TRxDBLookupCombo
        Anchors = [akLeft, akTop, akRight]
      end
      inherited chkAccesoSeguridad: TCheckBox
        Left = 419
        ExplicitLeft = 419
      end
      inherited chkUsuarioGenerico: TCheckBox
        Left = 539
        ExplicitLeft = 539
      end
      inherited fraSector: TfraCodDesc
        Width = 330
        ExplicitWidth = 330
        DesignSize = (
          330
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 282
          ExplicitWidth = 282
        end
      end
      inherited ToolBarSectores: TToolBar
        Left = 393
        ExplicitLeft = 393
      end
      inherited fraUsuarioJefe: TfraCodDesc
        Width = 367
        ExplicitWidth = 367
        DesignSize = (
          367
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 302
          ExplicitWidth = 302
        end
      end
      inherited fraRelacionLaboral: TfraCodDesc
        Width = 345
        ExplicitWidth = 345
        DesignSize = (
          345
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 302
          ExplicitWidth = 302
        end
      end
      inherited fraNivelCobranzas: TfraCodDesc
        Width = 345
        ExplicitWidth = 345
        DesignSize = (
          345
          22)
        inherited cmbDescripcion: TArtComboBox
          Width = 302
          ExplicitWidth = 302
        end
      end
      inherited ImageListSectores: TImageList
        Bitmap = {
          494C010101000400100010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
          0000000000003600000028000000400000001000000001002000000000000010
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000F7F7F70084ADC6004284
          A50094B5C600FFFFFF0000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000DEE7EF0042849C0008638C00106B
          9400005A8C005A8CAD00EFF7F700000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000F7F7FF0031739C00186B940039A5C60031B5
          DE0029ADCE0000638C0073A5BD00000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000FFFFFF00F7F7EF006394B500106B94004AB5D60063D6EF0029C6
          E70042D6EF000884AD00297B9C00000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000FFFF
          FF00DECEBD00BDA57B009C845200425239004A7373006BD6EF0042E7FF0039EF
          F7005ADEEF00007BAD0063A5BD00000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000FFF7F700B59C
          6B008C6300009C6B0800A5731000A56B00008C520000737B520039DEE70073FF
          FF0021ADCE000873AD00D6E7EF00000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000BD9C6300A573
          0800D69C2100EFB53100EFBD3900E7B53100C68C1800945200007B7B4A0018AD
          D6000073AD0094C6DE0000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000DECEAD00A56B0000E7AD
          4200F7BD4200F7C64200F7C64200FFCE4A00FFCE4200D6A52100945200003163
          6B008CBDDE000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000AD7B2900CE9C3900F7BD
          6300E7AD4200E7AD3900E7AD3100EFB53100F7CE4200F7CE4200AD7B1000A584
          4200000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000AD6B0000EFBD7B00F7BD
          6B00EFAD5200E7AD4A00E7A53900E7A52900E7B53100F7C63900C69C2100A573
          3100FFFFF7000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000B5730800EFC68400FFD6
          A500F7B56300EFB56300EFAD4A00E7A53100E7A52900EFB53100C69418009C73
          3100FFFFFF000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000D6AD6B00DEA54200FFF7
          EF00FFD69C00F7B56300EFAD5200E7A53900E7A52900E7AD2100A5730800B59C
          6B00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000FFF7EF00D6943100EFC6
          8400FFFFF700FFDEB500F7C67B00F7B55A00EFAD4A00BD841000946B1800EFEF
          E700000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000F7EFDE00D69C
          3900D6A54A00E7BD7B00EFBD7B00DEA54A00B57B1000A57B3100EFDECE000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000FFF7
          EF00DEB58400BD842900AD6B0000AD7B2100C6A57300F7EFE700000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000424D3E000000000000003E000000
          2800000040000000100000000100010000000000800000000000000000000000
          000000000000000000000000FFFFFF00FF83000000000000FF01000000000000
          FE01000000000000F801000000000000E001000000000000C001000000000000
          C0030000000000008007000000000000800F0000000000008007000000000000
          8007000000000000800F000000000000800F000000000000C01F000000000000
          E03F000000000000FFFF00000000000000000000000000000000000000000000
          000000000000}
      end
    end
    object gbFechaAlta: TGroupBox
      Left = 8
      Top = 336
      Width = 209
      Height = 45
      Caption = ' Fecha de alta '
      TabOrder = 5
      object Label8: TLabel
        Left = 100
        Top = 20
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edSE_FECHAALTADesde: TDateComboBox
        Left = 8
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object edSE_FECHAALTAHasta: TDateComboBox
        Left = 116
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 1
      end
    end
    object gbFechaBaja: TGroupBox
      Left = 224
      Top = 336
      Width = 209
      Height = 45
      Caption = ' Fecha de baja '
      TabOrder = 6
      object Label9: TLabel
        Left = 100
        Top = 20
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edSE_FECHABAJADesde: TDateComboBox
        Left = 8
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object edSE_FECHABAJAHasta: TDateComboBox
        Left = 116
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 1
      end
    end
    object btnFiltrosAceptar: TAdvGlowButton
      Left = 503
      Top = 396
      Width = 75
      Height = 27
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ModalResult = 1
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      WordWrap = False
      TabOrder = 0
      TabStop = True
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
    object btnFiltrosCancelar: TAdvGlowButton
      Left = 579
      Top = 396
      Width = 75
      Height = 27
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      WordWrap = False
      TabOrder = 1
      TabStop = True
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
    object btnFiltrosLimpiar: TAdvGlowButton
      Left = 427
      Top = 396
      Width = 75
      Height = 27
      Anchors = [akRight, akBottom]
      Caption = '&Limpiar'
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      WordWrap = False
      TabOrder = 2
      TabStop = True
      OnClick = btnFiltrosLimpiarClick
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
  end
  object fpUsuario: TFormPanel [6]
    Left = 8
    Top = 155
    Width = 660
    Height = 460
    Caption = 'Usuario'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    Position = poOwnerFormCenter
    OnShow = fpUsuarioShow
    Constraints.MaxHeight = 460
    Constraints.MinHeight = 460
    Constraints.MinWidth = 450
    DesignSize = (
      660
      460)
    object Label2: TLabel
      Left = 8
      Top = 12
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label3: TLabel
      Left = 8
      Top = 40
      Width = 37
      Height = 13
      Caption = 'Nombre'
    end
    object Label4: TLabel
      Left = 8
      Top = 374
      Width = 56
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Contrase'#241'a'
    end
    object Label5: TLabel
      Left = 8
      Top = 402
      Width = 54
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Verificaci'#243'n'
    end
    object Bevel3: TBevel
      Left = 4
      Top = 62
      Width = 652
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Bevel4: TBevel
      Left = 4
      Top = 361
      Width = 652
      Height = 5
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Bevel5: TBevel
      Left = 4
      Top = 421
      Width = 652
      Height = 5
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object lbTextCopia: TLabel
      Left = 256
      Top = 12
      Width = 42
      Height = 13
      Caption = 'Copia de'
      Visible = False
    end
    object lbUsuCopia: TLabel
      Left = 304
      Top = 12
      Width = 62
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      Caption = 'lbUsuCopia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label6: TLabel
      Left = 555
      Top = 374
      Width = 36
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'Interno'
    end
    object Label11: TLabel
      Left = 12
      Top = 252
      Width = 28
      Height = 13
      Caption = 'Notas'
    end
    object edUsuario: TPatternEdit
      Left = 72
      Top = 8
      Width = 173
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 20
      TabOrder = 0
      Pattern = 'ABCDEFGHIJKLMN'#209'OPQRSTUVWXYZ'
    end
    object edNombre: TEdit
      Left = 72
      Top = 36
      Width = 573
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 50
      TabOrder = 1
    end
    object edClave: TPatternEdit
      Left = 72
      Top = 370
      Width = 45
      Height = 21
      Anchors = [akLeft, akBottom]
      CharCase = ecUpperCase
      MaxLength = 8
      PasswordChar = '*'
      TabOrder = 3
      Text = '********'
      OnChange = edClaveChange
      OnExit = edClaveExit
      ExcludePattern = ' '#39
    end
    object edVerificacion: TPatternEdit
      Left = 72
      Top = 398
      Width = 45
      Height = 21
      Anchors = [akLeft, akBottom]
      CharCase = ecUpperCase
      MaxLength = 8
      PasswordChar = '*'
      TabOrder = 4
      Text = '********'
      OnChange = edClaveChange
      ExcludePattern = ' '#39
    end
    inline fraUsuDatosABM: TfraUsuDatos
      Left = 8
      Top = 68
      Width = 640
      Height = 179
      Anchors = [akLeft, akTop, akRight]
      Constraints.MinWidth = 640
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      ExplicitLeft = 8
      ExplicitTop = 68
      ExplicitHeight = 179
      DesignSize = (
        640
        179)
      inherited Label5: TLabel
        Left = 247
        ExplicitLeft = 247
      end
      inherited Label10: TLabel
        Left = 247
        ExplicitLeft = 247
      end
      inherited cmbCargos: TRxDBLookupCombo
        Width = 177
        ExplicitWidth = 177
      end
      inherited chkAccesoSeguridad: TCheckBox
        Left = 419
        ExplicitLeft = 419
      end
      inherited edSE_MAIL: TEdit
        Width = 177
        ExplicitWidth = 177
      end
      inherited chkUsuarioGenerico: TCheckBox
        Left = 536
        ExplicitLeft = 536
      end
      inherited fraSector: TfraCodDesc
        Width = 328
        ExplicitWidth = 328
        DesignSize = (
          328
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 280
          ExplicitWidth = 280
        end
        inherited Propiedades: TPropiedadesFrame
          ExtraCondition = ' and se_nivel = 4 '
          ShowBajas = True
        end
      end
      inherited ToolBarSectores: TToolBar
        Left = 393
        ExplicitLeft = 393
      end
      inherited fraUsuarioJefe: TfraCodDesc
        inherited cmbDescripcion: TArtComboBox
          Left = 80
          Width = 287
          ExplicitLeft = 80
          ExplicitWidth = 287
        end
        inherited edCodigo: TPatternEdit
          Width = 76
          ExplicitWidth = 76
        end
      end
      inherited fraRelacionLaboral: TfraCodDesc
        Left = 328
        Width = 311
        ExplicitLeft = 328
        ExplicitWidth = 311
        DesignSize = (
          311
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 268
          ExplicitWidth = 268
        end
      end
      inherited fraNivelCobranzas: TfraCodDesc
        Left = 328
        Width = 311
        ExplicitLeft = 328
        ExplicitWidth = 311
        DesignSize = (
          311
          22)
        inherited cmbDescripcion: TArtComboBox
          Width = 268
          ExplicitWidth = 268
        end
        inherited Propiedades: TPropiedadesFrame
          OnChange = fraNivelCobranzasPropiedadesChange
        end
      end
      inherited ImageListSectores: TImageList
        Left = 312
        Bitmap = {
          494C010101000400100010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
          0000000000003600000028000000400000001000000001002000000000000010
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000F7F7F70084ADC6004284
          A50094B5C600FFFFFF0000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000DEE7EF0042849C0008638C00106B
          9400005A8C005A8CAD00EFF7F700000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000F7F7FF0031739C00186B940039A5C60031B5
          DE0029ADCE0000638C0073A5BD00000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000FFFFFF00F7F7EF006394B500106B94004AB5D60063D6EF0029C6
          E70042D6EF000884AD00297B9C00000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000FFFF
          FF00DECEBD00BDA57B009C845200425239004A7373006BD6EF0042E7FF0039EF
          F7005ADEEF00007BAD0063A5BD00000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000FFF7F700B59C
          6B008C6300009C6B0800A5731000A56B00008C520000737B520039DEE70073FF
          FF0021ADCE000873AD00D6E7EF00000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000BD9C6300A573
          0800D69C2100EFB53100EFBD3900E7B53100C68C1800945200007B7B4A0018AD
          D6000073AD0094C6DE0000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000DECEAD00A56B0000E7AD
          4200F7BD4200F7C64200F7C64200FFCE4A00FFCE4200D6A52100945200003163
          6B008CBDDE000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000AD7B2900CE9C3900F7BD
          6300E7AD4200E7AD3900E7AD3100EFB53100F7CE4200F7CE4200AD7B1000A584
          4200000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000AD6B0000EFBD7B00F7BD
          6B00EFAD5200E7AD4A00E7A53900E7A52900E7B53100F7C63900C69C2100A573
          3100FFFFF7000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000B5730800EFC68400FFD6
          A500F7B56300EFB56300EFAD4A00E7A53100E7A52900EFB53100C69418009C73
          3100FFFFFF000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000D6AD6B00DEA54200FFF7
          EF00FFD69C00F7B56300EFAD5200E7A53900E7A52900E7AD2100A5730800B59C
          6B00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000FFF7EF00D6943100EFC6
          8400FFFFF700FFDEB500F7C67B00F7B55A00EFAD4A00BD841000946B1800EFEF
          E700000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000F7EFDE00D69C
          3900D6A54A00E7BD7B00EFBD7B00DEA54A00B57B1000A57B3100EFDECE000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000FFF7
          EF00DEB58400BD842900AD6B0000AD7B2100C6A57300F7EFE700000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000424D3E000000000000003E000000
          2800000040000000100000000100010000000000800000000000000000000000
          000000000000000000000000FFFFFF00FF83000000000000FF01000000000000
          FE01000000000000F801000000000000E001000000000000C001000000000000
          C0030000000000008007000000000000800F0000000000008007000000000000
          8007000000000000800F000000000000800F000000000000C01F000000000000
          E03F000000000000FFFF00000000000000000000000000000000000000000000
          000000000000}
      end
    end
    object chkDemorada: TCheckBox
      Left = 367
      Top = 372
      Width = 137
      Height = 17
      Anchors = [akRight, akBottom]
      Caption = 'Contrase'#241'a Demorada'
      TabOrder = 5
    end
    object chkVencida: TCheckBox
      Left = 367
      Top = 400
      Width = 285
      Height = 17
      Anchors = [akRight, akBottom]
      Caption = 'Requerir el Cambio de Contrase'#241'a en el pr'#243'ximo Login'
      TabOrder = 6
    end
    object edSE_INTERNO: TEdit
      Left = 595
      Top = 370
      Width = 45
      Height = 21
      Anchors = [akRight, akBottom]
      MaxLength = 50
      TabOrder = 7
    end
    object btnPermisos: TAdvGlowButton
      Left = 4
      Top = 427
      Width = 85
      Height = 27
      Anchors = [akLeft, akBottom]
      Caption = '&Permisos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      Picture.Data = {
        89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
        F80000000473424954080808087C086488000000097048597300000B1200000B
        1201D2DD7EFC0000002574455874536F667477617265004D6163726F6D656469
        612046697265776F726B73204D5820323030348776ACCF000000147445587443
        72656174696F6E2054696D6500392F352F3034C1E2C4B0000005654944415478
        9CAD93596C9CD519869FF32FB3FCB378C63378CFE2A441D0C495131491960BA4
        921B2E2A75910AA20A0A9590905A7151D11B941067911A2945BDAC4A15A90984
        AAD08B2ADD2E9A26A4650909B4146F64C1109B383376EC19FF33FFCCBF9D737A
        61852672625AA9EFF5F9DEE73BAFBE5768AD594DC75F7ED58AA2684D10049BE3
        38EE0AC3308EE3D896528E2AA53ED65AD75ED8FBBCBADBBCB81BE02FA7CE8846
        A331ECFBFEEE300C9F00CA5A6BC230C2F7DB349B4DA494E7E2383E06FAF881FD
        FB5AFF13E0E5577EFDA86559273A0A85626F7717C5CE02421828A988A2904AA5
        CAD8F804954A0529E5EF8410DF3F7470A4F65F017EF1D2D12DA669BEBF7EFDFA
        C4830F6E2797CDD0F43CBCA647CB0FC83A291C2783EBBA9C3EFD06A363E308C1
        2F6DDB7EE6C0FE176E8BCBBAD3F6BEEF1F28954A896DDB86B12D9389C94BD46A
        757CBFBD3C649994CB650AF93C5B86B650A956999F9F7F5A297514787755C04F
        0E1FE9B72C6BE7E0E07A1C27CDF9F3EF333D3D4DB3D92408024CD3249BCDA294
        26994CA0B5A6BFBF9F5AAD86D6FAC92F048461F8B06118D9EEEE2EA6A6A6B870
        E13D1AEE124AEB39A5D479DFF73FB12CEB3BBEDFEE2B163B709C0CA552896432
        49BBDDDEBA67EF8879E8E088BCE967AC8CA73D64DBB6D04A333E3E49B55A416A
        3166D8CE53870E8E7CE3A7470E3F1BC4FC68E6B34AB0B85843A0492412384E1A
        A00474DDEAB702104BD19D4866B0520566E703DA71A67E797EE85B237B9EFBD3
        CD373F3B72E83761A42FBA9EC64C9548658B24D3791046375A76AF1A91B24A5E
        1448E6AEFC0D31F77BCAFEC7CD6D8D3D0FFDFC297685212A96A0DAD49DE26072
        E6C218B6FB00D22C13B55D30D38E4AAF59FD8A7A1A27FAD2F10237FEB1C096AE
        16CE8672BF95FDEAAFE278F9B3524AA240A1FC3A956B27997EEB753CDFC10D7B
        899D4DAD54DF23DEAD7EB7F44088A33FE070B1C433430FEFC8E707BE4DA16F2B
        76D247586D845183D805194014E3359A845E4063E13A3766AE3073E53A1727AB
        A1D74EBC66F8E193FB4E2E1B7F0E78F17BE2A17B7A78F3EBBB1E6760F855D0E7
        08DDB789FD0F90FE0CD5CFEA8CBDDB426BC5BD9B34B9AC40A91C8665912BADC5
        B42D3E78EB3DDE3C3B835B8F761E3EA9FF7A5B4441C0A3F99E0E06869FC79B7F
        89FAA7FB90411503F0DB70EA0FF0D1280801B39B60C703A0235040AB6F81F2C6
        2136DEBF8EC9891A6EBDB60BB81D80C1F68EF297402E323FF16322AF8130C034
        C05D80F93948E796010B7568B521E780366CEC740E6565B0D2924C26816170FF
        8A33F57CCC20B4086BE7F0E67C822508EAD05C8484820DEBC0B2C03461700D38
        49900AEC4C27A9CE015299225242142910FF59FC7340B3C587D73FBD8A377719
        D94E13B8E02F815F0753423E034A81D6D05910388E81E514C8766FC4B9672D96
        65D05874A9D57C0C417B052091E48F572F55B97A71827C572F663283997448A4
        12B82D8B4B53CBF1480995791323BF96D2C6AD74ACDD8C9DCC1035AA5C9E98C5
        ADFB18823FAF00F4F4F2F730D667DF39338AD796147A07C8F56C20DF7B2FA1DD
        47A305910F7E0B165D8B64CF309D835F2199768896A6F9E7DB934C8C56D0329E
        038EDFA107B0FFBBE26B5A1867FBD77458DB77F450EE2D91CA6689A549B32189
        24086192CEA62975175132A2569965ECC2278CFF6B9656C3436B76EF7F5D1FBB
        63938B1DBCB3B0A4775766BD17DF3873BD7BDDA04FCF40817C214BDA4990CB98
        480541D3E5D2B56B54AFD5B83AB5C08DCA12711406C0735A73E22E4D5ED6C863
        C2D4B1B84F98FCD0B0EC27924E2A9FC9A5483B3609DB40494DAB15D1586AE37B
        6DA48C7DADF42B42704C08CE8DBCA6E3550137B5F79BC2529A2F5B09B113211E
        11D0AB119B053A42F0A156AAAE14A7B4E6B4613076E0B7B71B7F21E0FFA57F03
        03C9B5585217A2D00000000049454E44AE426082}
      WordWrap = False
      TabOrder = 8
      TabStop = True
      OnClick = btnPermisosClick
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
    object btnDigitalizacion: TAdvGlowButton
      Left = 90
      Top = 427
      Width = 129
      Height = 27
      Anchors = [akLeft, akBottom]
      Caption = '&Digitalizaci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      Picture.Data = {
        89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
        F80000000473424954080808087C086488000000097048597300000B1200000B
        1201D2DD7EFC0000002574455874536F667477617265004D6163726F6D656469
        612046697265776F726B73204D5820323030348776ACCF000000147445587443
        72656174696F6E2054696D6500392F382F303433881C6D000005264944415478
        9CB5D55D889C5719C0F1FF79CF7967DEF9DAD999353B6932DD4D7693D262976A
        8B184483A8175E5804295810A55EB4508B14AA57166D15AA5E581011A514AD37
        4A0A4529145A05F5C2D09ADAC436314D6BE836C97E7533BB3B3B9FEFCC7B3E1E
        2F82816D46AFF4B93D0FE7C739E779CEA34484FF6798FFB470F24915D911C9D8
        316B1D0BD671C4C3EDCEA1AD435907A27807CD5F82E7CC033F1137691FF5FE13
        FCFD174ABB8C459B717796A94F62CC47A2D834A25C112FE0338F7501EF029DF6
        885ECF8D047EE61CDF79E8E732F8AFC0AB4F2B85E53EE07B7179BA5969DE4165
        FF8729541749CA3344B902E21D1252FCB8C5DA9B7FE4E5175EA23F0804E1391F
        B8EFE1A7F6227BAEC88E99C7F3A3FAC2D1FAFCC7BF4DB1F67940E3ED2ADEAD90
        8DD6C0A7886D019699E602B924417A4350DC2342FBC9AFAA87BEF18CD88980B7
        7C56C7BA7EF3B14728D6BE4CF7EA49DE3DFD349D8DBF62C73B880F4491A1502A
        529BFD0071A140963942002F1002F70BEAD4F7BFA47EF5AD5F8BDF03FCFE072A
        328A4F4C1D6C52DAF73906BBA779E5D9BB692DF72954AA14EB1AAD343673F477
        B7D9DDEAD2BCF52849B1C8A02F4408CE7A7CE009E025606D0FA063AAD990BBCA
        8D5B50D4B0E9F32CDEF5318EDDB344A93A85B80C371EE0C703EC6848DAEBA374
        CC52619A61BB8D1B7578EBEC0A1B1B432BC2F587BD0E78472504E6F295C3C00E
        959A904FEEA475E50A2BE7CEE0D201C15BBCCD400285A90A959906070ECFC3E1
        9B485BEFF28FD757089ED71EFD8DACDF008C86DC9CCB5330491D095DCEFFE904
        6FBFF237D26E46A4C118880C68A30185D28A2832541BFB59F8D0ED0CB7070C06
        6309C26B13AB28041603A0F0B8F4125B972E52DD77138796A6996E34886343A4
        15B97C8C1061C781CED636836E07DC986E7B80CD820017270320D642700E6497
        0F1E3F4EB95AC3394F96A6783BC26563BCCB50CA50AAD5995D388AC9E7196C2E
        F3F6990B646311209D0C783C80320522A34877B7593EFD06DBEB9BA483111202
        123CA86BF9F962C2F46C83D9C38BEC6B9448538FB3888A8826022E8089C08DB6
        B0699B0B2F9F62FBBD218592A654A9904BF2985813E7F34814214118F47AAC5F
        BC40313942A415019412EC6440D0CA831DB7F1B643636E3F87966A4CD5EB985C
        0EA5142201934B880B254C611A3145D24E87306C51AEAC12C744E38CC64400C1
        8D4730EEEFA0B563FFA126447976AEEED06F77B15986CF3282409C4F30498999
        E63CF5838728CC1CA071E032716E45A543FB51E0991B0011FEE9043AEF5D2657
        4CD8D9DC61F9FC32FDDD2108280DC64424E50A30C4FB16AB6FBD4952AC71E0B6
        5B68CECD325D2BD0EDD84F3FFE45557FFC59D9D90364192DA5186DADAD272EEB
        E383C2E4F22CDC314769AA4AA53E8531061DE751DAA04C820B9AC16E8FC880D2
        81B9B932AB577A0B209F029E7B7F1F6C479AD75B5787C736CEBFCAC12347A84E
        C5E4CB456C161876DB8410502A426943BE58A45AAF31D52CE1AC23EB6ED3988D
        D15A4512E4C1EFDEAB9E7FEC84D8EBC0033F95C1535F5767ACE3D8D993A7B875
        698EDDCD4DAEB62CBD5EC628B5382F88401045A4352697A3562F519F49A84D09
        BD76972082521C073E03BCB8E7BB0E9E1704BEB67279978DB51E2108CE058207
        11F001245C2B6909E0C390D5CB1DA248116985F7F2EF363180DE5B4580F3FC59
        297E2BC2179CF5085C42F122703608EB402A0A0594056680DBBC973BBD9325A0
        8E02A510E009E00F306126FFF87EB50F7854C1B208BF43B381109C43BEF9CB6B
        C93FFC8A5241A1C411659672145107E68126700E38F7D8896B03E706E07F1DFF
        02A472A00B33A0D07F0000000049454E44AE426082}
      WordWrap = False
      TabOrder = 9
      TabStop = True
      OnClick = btnDigitalizacionClick
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
    object btnFax: TAdvGlowButton
      Left = 220
      Top = 427
      Width = 131
      Height = 27
      Anchors = [akLeft, akBottom]
      Caption = '&Formularios Fax'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      Picture.Data = {
        89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
        F80000000473424954080808087C086488000000097048597300000B1200000B
        1201D2DD7EFC0000002574455874536F667477617265004D6163726F6D656469
        612046697265776F726B73204D5820323030348776ACCF000000157445587443
        72656174696F6E2054696D6500392F31382F3034734EA2DF0000054149444154
        789CB5945F885C7715C73FBFFB7F66EEFCD9C96E763389BB3BBB69B75B6BCA66
        830F6A108442C0D652F5A5042150D4544CD537112D583054EC83926222529156
        C407FBE46B0C2282A2AD695243239A6EB676ED6EB6C9EEFCBB73EFEFFEFEF830
        93710226E883070EF79E1FFCCEE77ECF39F7086B2DF7B25F3D23FC9BEF510FEB
        DE5C58730EE64644DD9E75A4528975CC852F9DB39BF7BA2FEE0638FF9C1051C8
        037E1C3E1D4E4E7F26281F6C78D114060F6D241B575F63EDEADA6B3BBB3CF5F5
        9FD9CB77037877252B9A51A3F46A63E5F8F2E4F21731B687B0EFA2FB9B047E82
        EF7558BBFA8F23BEA75E3D73523C71EA9CFDCBFF043042AC54668F2E37569FE7
        EA6F5F60ED4F67F1A32256F7A84F4FE2F83141A1889B760E2A65BF79F6B3E2A9
        A77F697BFF15E0F4B7BEFAE08395E689C2C441E01A417489C50F7F94A81093A7
        5D944C703D9FC31F0BD8B8768D37DF928FFCD5FBE00AF0BB7B025E78FEDB222F
        1D79389858FC85F51B4BD58990E4E61BBC7FED0AFD8E40881C8C010451B9CA7D
        0F37B1E9266FAE37EBD6FFC8D9CF9D7CF6F82BE79EBBA31FCE78D0EEF6634F6F
        7C6FEF9EDAD27455E3BA7DBA5B6FA1921DA6F64FB26F7E3F07EE6FD27CE801A6
        0E3490FD1EEFBDBBC3D2A1A32C2ECC3D14DA9BDF78ECD14F16EFAAA0D3CBDC4A
        5D7E3C2CD459DF5E62E3378AA85623713FCDDFDF9124AD3600856A9530AEA2D2
        167F7BBBC5F44248B95CA210068F8651C11FCF391AD3975FF9B9BBBDFDFE49A5
        D48BBD5E9BED5D43D24D49D3149C08D058044A69F22C2597126DA11887D87C87
        3DB502615800C4A97ABD74F6F477BEABEF50B0BBBB7BC27178D1F31CBA9D2EA1
        6388AA0EB6ECA24D8AD10663345A6B4C6C318661DC25B5864EA74B1C5791529E
        D9D9E9F58197463DF8FE0FCE4C49294F974A25161616D1C6208483B5066D86C9
        2C182B066E18BAC05A705D176B6175F530535393E4797EFAF35F38D91801D234
        FB94526A6FB339CFECEC1CDD6E176B2DC618AC35A3E7C0ED980FCE1CC7A1D369
        B3D09C67656505047B8D314F8C00799E3FEE791EFBF63570C4E0B2520A630CC6
        D811ECB60FA0B7CF2D5A6B8423F05C8FD90FCC52295730C63C360228951F705D
        97308C004B1485E4798ED666E87A2CE9BFD50C62C8F39CB814E307016114522A
        16B1D64E8F2950B9E338445148542852ADD6B875EBD6B00C1A6B2D5A5B6090D0
        18466512023637B76834F653ABD708C390A81061AD95A329522A1760715D9738
        8E397C78958D8D0D6EDCD8220C4360D0CCF17E28A5504AD1EFF7999999E1D8B1
        6354E2329D6E0FCF0B00EC08608C254D07B3EDFB3ECD6693279F3CCEE5CB1759
        5F7F8756AB3D54E20083A92A148AD4EB7B989F9FE343870E71DFE2229994F493
        843CCF705DD71F57F04F297394D64C4C4CE03A2E3333D3D4EB9F404A49B7DB25
        4912840033DC45711C1304014110508A4BF49284C844F4D3942C931863B6C715
        5CDADDDD79BCD36EB3B830CFF2F2FDF492842C9328A5C8B26CF43E68B8450881
        100E8E2B08FC905231A252A9B0B5B545ABD54208F1C71140082E48299F3DFFEB
        0BB43B1D9ACD26A5628172B984E7FB082B60F8F54A698CD2645222738994922C
        93ECB6DA5CBFBECEEB7F7E9D344D715DF7FCB8828B207EBAB6F6F689EBD7D708
        82905AAD42B55A238ECB94CB654AA5C192B41672296977DAF4921EDD4E8F4EA7
        4D9AA668AD49D3D408215E1642BC71C7B23BF5CCD78A4AE547ADB5478D318F58
        6B578D31EEA0E6B76B0F42082C164738C332095CD7DD012E1A632E08217EEF38
        CE1F7E74EE87C91D80DBF6E5535F71B32C2D8398038E0821968125601FA087FF
        4E0E5C01AE586B2F01EB799EDF701CA7FF93977EACFFE3BAFE7FD9BF00936408
        54DA59C8570000000049454E44AE426082}
      WordWrap = False
      TabOrder = 10
      TabStop = True
      OnClick = btnFaxClick
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
    object btnABMAceptar: TAdvGlowButton
      Left = 506
      Top = 427
      Width = 75
      Height = 27
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      WordWrap = False
      TabOrder = 11
      TabStop = True
      OnClick = btnABMAceptarClick
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
    object btnABMCancelar: TAdvGlowButton
      Left = 582
      Top = 427
      Width = 75
      Height = 27
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      WordWrap = False
      TabOrder = 12
      TabStop = True
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
    object btnImpoExpo: TAdvGlowButton
      Left = 352
      Top = 427
      Width = 112
      Height = 27
      Anchors = [akLeft, akBottom]
      Caption = '&ImpoExpo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      Picture.Data = {
        89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
        F80000000473424954080808087C086488000000097048597300000B1200000B
        1201D2DD7EFC0000002574455874536F667477617265004D6163726F6D656469
        612046697265776F726B73204D5820323030348776ACCF000000147445587443
        72656174696F6E2054696D6500392F352F3034C1E2C4B00000067A4944415478
        9CB596598C1C571586BF5BF7565577F5744FCFEA59F032B6C7CB8C83BC2818E3
        601B2C128833C85284104189E2E40112A1409E9090B18C08890489501E580404
        0811C10E20258618A2C48BB0C08E3D2118DB781DCF9E59BAA77BBA7ABABBAA6B
        B93CD83821E495231D1DE93C9CFFFC473AFA7FA1B5E6FF19EA839A773FFA7DD1
        B85036C24A55959399ACA9EB8D22C60C34FD1A9DD29A48E858C6E80503712112
        D28F755C566154F085888EFFFE895B5B8BF732B8F3E1EFC9641CA602436E8FA2
        78BD88E3FE18FA3C69AD0AD076A46CA492E848031A1585185E15330A5CB41E46
        735CA3DF880DF1C6F103DFF2FE0B60D7C3CF482DC51722AD1F0B85BCDD4BA5A9
        675B48A5D364320D641D0B3BE9E0C59A7A10510F42743DC02D1629952BE85A8D
        C47C8E44CD4547D12F89F423C70EEEF7DE3D9169DC1149F5C25C731B8DBDABD9
        DDD7C5879AD32CC406177255264B35264A35F20B15E220240C03A220A086454B
        A2CC864EC555FA999F2ED0343AF46054F35F015E7E17C0525F9CCD34D1BEEDE3
        7CAEB79DC17C899F9F9DE4F25C05ED47E007500FA05E8728B8993146BDCA0F3B
        5EE3B3CE30CF5C5FC6D39D0F9072F3286F76E72D805D7BBE9B209BDE34AF0529
        B7C8536FE6B85E72219120E928846360C426440A02491C9A081D130A838CA759
        DF6C40AEC2E6D973185D150ACAA20B6EDBF1C9AF251480CA667ABD5A7D654335
        47E5ED33B42A496B10E30AC5BC94D49C049E6D43C2C248DA988EC250125B8127
        97B26FF2C3EC4E35F29493A538E5B3687A168DE8219B6E520031AC89E338F3D5
        81DBD9D8D3454A39E4F31E45B7CCF05481F1428D4BB93986AB458A9645CDB4F1
        2D0B614A3482E7FD25FC2A5C42B79767A03E439C696276766AB19130930AC0AB
        79CB5A3B5BD833B015A9E1B27B11A3B588135759E91BAC2A35726FB88C7AD9E6
        DCE81823B9198AB53AB101220C91D4E94E5BF4F775D3DAB7814367C6997C7554
        5846E2C6A3057EB8A4B3B99BE1E23407CE3FCBDBA5415229F0EA11F3B519FC6A
        85E5E9ADDCBDF631766ED8865EF009AA5514313A8E89B42692098C5403B9C820
        AA0F810601CBE5DFC71689284C3C946C73FB2E667F80CCB8ECE8D9CEDADE55F4
        F6ACA021D54C45FA1CBBF6270E9DFA3555AF8DC696CDBC1324990D1C66758ABC
        4E315EB7195F105403C88D8E327EED0ACA340F1B53BF784424B29578B2ED6774
        B7B4705FDF9768EA3239397A92838307C999E3B47776B1EDA37721DB7C9E3BF1
        658E5FF8039E07B932E45D285440C7E028684C82652B6EFEEF39D5B66ECE2AAF
        78A565CBA636B62C1DE0A5FC8F385BFD1BA78ECED05D5FC750E1383A031DD64A
        B28BBBC9E7C77879F0EBAC68FD0429BB812806D384C4CD541282BA0F08D0BA62
        E4EFBDA7295E34BC7E63D79DBC3AF15B0E1F3A4FEDC44AE46C3B7BB73DC957DA
        9EC41DD29C1A7E0B2FF268EC701899B9C8D8DC594C7963A0AD206941D2064380
        5B286218868B10A842FAF4DA7599F5CD23D130A7C7DF648BBD9B073F763FE58F
        CCB376C56A32F15D38669AA72F7E075797B06C07CC2AF9D225CCE55BB1C48DC1
        8E758349A512F2CED828CA946340499971C3928A57E774EE04E5A0C29AD5CBB8
        AD670D00152AB846810736DD4FBA23C5B7FFB99F9C518418B4AED090046940C2
        BE512D1B26C74B1467E7B06CF32DAD719508CDB8B0502276354EB29123BCC4F8
        B573685FB135F329762CDEC9E0C2698ECF1DA3C5696761CE0317DA9BDB694C41
        AC4119E0340012FE7AE4C47F94E0C4B103FB6255F5EBE70DD742561D1AB359E6
        83127F9E384CD9ADD2DABB04AB6CF1DC859FE2C73EA63059982EA19216ABBBD7
        937240C81B0C728598BFBC7E86F383FF402AA3ACB53E0AA072D5CA0569DA2717
        A6FC2DEDD9343D4E371DA687E7F8E48D19FE38364243228D8A6C46AE8F337D75
        964F6F7E880DABD6502CC2D4C41443972E3374718C91ABD7D13A4629F9ACD68C
        DC129C457B339F493B99C34B572D63F9CA5E9A532D28C3228802FCC0C3AD94B9
        72F90A67CF9F815223039DFB6908B314DD32B54A95F27C89280A9152CE4BA57E
        6C18F289232FEEADDC02508F1BB2C94EEFB113899F742CEA108B3A3B483829C2
        20C02DB94C4D4E31313D812CB5B0AAB68B4CB49820AA838E35425C03FE250447
        9594BFD388C2D1DFECF3FE4793D5A3429A4A6DB794F5B86D26EFB1944D184554
        FD2A5ECD2FA830FD5A7FF5F3D79AC31ECB170B15601C180386A4943943CAFAEB
        2F7C237CBF8110EFB72DC680704487B11AA1FB35983AD6D3D4E5E58DEE1D135D
        E67D9100CA6A1243287DE4C56FC61FE44ADE1BFF0637381CA18452A9B3000000
        0049454E44AE426082}
      WordWrap = False
      TabOrder = 13
      TabStop = True
      OnClick = btnImpoExpoClick
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
    object edNotas: TMemo
      Left = 72
      Top = 252
      Width = 575
      Height = 104
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 14
    end
  end
  object pnlTotales: TPanel [7]
    Left = 0
    Top = 647
    Width = 1160
    Height = 25
    Align = alBottom
    BevelInner = bvLowered
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    ExplicitTop = 448
    ExplicitWidth = 692
    object Panel2: TPanel
      Left = 2
      Top = 2
      Width = 8
      Height = 21
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
    end
    object pnlCantidadTickets: TPanel
      Left = 92
      Top = 2
      Width = 3
      Height = 21
      Align = alLeft
      AutoSize = True
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object lbTotal: TLabel
        Left = 0
        Top = 4
        Width = 3
        Height = 13
        Alignment = taCenter
        Transparent = True
      end
    end
    object Panel3: TPanel
      Left = 1150
      Top = 2
      Width = 8
      Height = 21
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
      ExplicitLeft = 682
    end
    object Panel4: TPanel
      Left = 101
      Top = 2
      Width = 43
      Height = 21
      Align = alLeft
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 3
      object Label12: TLabel
        Left = 0
        Top = 4
        Width = 43
        Height = 13
        Caption = ' usuarios'
        Transparent = True
      end
    end
    object pnlViendo: TPanel
      Left = 10
      Top = 2
      Width = 76
      Height = 21
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 4
      object lbTickets1: TLabel
        Left = 0
        Top = 4
        Width = 79
        Height = 13
        Caption = 'Ud. est'#225' viendo '
        Transparent = True
      end
    end
    object Panel1: TPanel
      Left = 86
      Top = 2
      Width = 6
      Height = 21
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 5
    end
    object Panel5: TPanel
      Left = 95
      Top = 2
      Width = 6
      Height = 21
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 6
    end
  end
  inherited FormStorage: TFormStorage
    Left = 16
    Top = 192
  end
  inherited XPMenu: TXPMenu
    Left = 44
    Top = 192
  end
  inherited ilByN: TImageList
    Left = 16
    Top = 220
    Bitmap = {
      494C01011F002100100010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000008000000001002000000000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000393939003939390039393900393939003939390039393900393939003939
      3900393939000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000003939
      3900737373006363630063636300636363006363630063636300636363006363
      6300636363003939390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000313131003131
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000004A4A
      4A00A5A5A500A5A5A500B5B5B500FFFFFF0063636300FFFFFF00B5B5B500B5B5
      B500A5A5A5007373730039393900000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000031313100A5A5
      A500424242000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000000000000000000021212100A5A5
      A500C6C6C600DEDEDE00FFFFFF00636363006363630063636300FFFFFF00CECE
      CE00B5B5B5009C9C9C0039393900000000000000000000000000000000000000
      000000000000313131003131310031313100313131003131310031313100DEDE
      DE00A5A5A5004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000084848400000000000000000084848400000000000000
      000000000000000000008484840000000000000000003939390063636300B5B5
      B500D6D6D600F7F7F70063636300FFFFFF0063636300FFFFFF0063636300E7E7
      E700C6C6C600B5B5B50063636300393939000000000000000000000000000000
      0000000000004242420094949400A5A5A500B5B5B500DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00A5A5A50042424200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000008484840084848400000000000000000084848400848484000000
      000000000000000000008484840000000000000000003939390063636300B5B5
      B500D6D6D600F7FFFF00FFFFFF00FFFFFF006363630063636300FFFFFF00F7F7
      F700CECECE00B5B5B50063636300393939000000000000000000000000000000
      00000000000042424200424242005A5A5A005A5A5A005A5A5A005A5A5A00A5A5
      A500949494004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000848484008484840084848400000000000000000084848400848484008484
      840000000000000000008484840000000000000000003939390063636300B5B5
      B500D6D6D600F7F7F700FFFFFF006363630063636300FFFFFF00FFFFFF00EFEF
      EF00D6D6D600B5B5B50063636300393939000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005A5A5A009494
      9400424242000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400848484008484840084848400000000000000000084848400848484008484
      84008484840000000000848484000000000000000000000000004A4A4A00A5A5
      A500CECECE00EFEFEF0063636300FFFFFF0063636300FFFFFF0063636300E7E7
      E700C6C6C6009C9C9C004A4A4A00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005A5A5A005A5A
      5A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484000000000084848400000000000000000000000000393939008484
      8400B5B5B500D6D6D600FFFFFF00636363006363630063636300FFFFFF00CECE
      CE00B5B5B5008484840039393900000000000000000000000000000000000000
      0000313131003131310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000848484008484840084848400000000000000000084848400848484008484
      8400000000000000000084848400000000000000000000000000000000004242
      42009C9C9C00B5B5B500C6C6C600FFFFFF0063636300FFFFFF00CECECE00B5B5
      B5009C9C9C003939390000000000000000000000000000000000000000004242
      4200A5A5A5003131310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000008484840084848400000000000000000084848400848484000000
      0000000000000000000084848400000000000000000000000000000000000000
      000039393900636363009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C007373
      730039393900000000000000000000000000000000000000000042424200A5A5
      A500DEDEDE005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000084848400000000000000000084848400000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000031313100636363005A5A5A005A5A5A00313131000000
      0000000000000000000000000000000000000000000042424200A5A5A500DEDE
      DE00DEDEDE00DEDEDE00B5B5B500A5A5A500949494005A5A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      000000000000000000004A4A4A007373730094949400848484004A4A4A000000
      0000000000000000000000000000000000000000000000000000424242009494
      9400A5A5A5003131310031313100313131005A5A5A005A5A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000003939390094949400B5B5B500A5A5A500DEDEDE00848484003939
      3900000000000000000000000000000000000000000000000000000000004242
      4200949494003131310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000006363630084848400C6C6C600B5B5B500B5B5B500848484004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      0000313131003131310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006363630039393900636363003939390063636300393939006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000010101000949494009494940000313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000010101000949494001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010009494940010101000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400A5A5A500B5B5B50094949400003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400A5A5A5001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000010101000A5A5A50094949400101010000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001010100094949400A5A5A500B5B5B500C6C6C600C6C6C600949494000031
      3100000000000000000000000000000000000000000000000000000000000000
      00001010100094949400A5A5A500B5B5B5001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000010101000B5B5B500A5A5A500949494001010
      1000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001010
      100094949400A5A5A500B5B5B500C6C6C600E7E7E700C6C6C600C6C6C6009494
      9400003131000000000000000000000000000000000000000000000000001010
      100094949400A5A5A500B5B5B500C6C6C6001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000010101000C6C6C600B5B5B500A5A5A5009494
      9400101010000000000000000000000000000000000084848400000000000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000000000008484840000000000000000000000000000000000101010009494
      9400A5A5A500B5B5B500C6C6C600C6C6C600E7E7E700E7E7E700DEDEDE00DEDE
      DE00949494000031310000000000000000000000000000000000101010009494
      9400A5A5A500B5B5B500C6C6C600C6C6C6001010100010101000101010001010
      1000101010001010100010101000101010001010100010101000101010001010
      100010101000101010001010100010101000C6C6C600C6C6C600B5B5B500A5A5
      A500949494001010100000000000000000000000000084848400848484000000
      0000000000000000000084848400000000008484840000000000000000000000
      000084848400848484000000000000000000000000001010100094949400A5A5
      A500B5B5B500C6C6C600C6C6C600C6C6C600E7E7E700DEDEDE00F7F7F700DEDE
      DE00DEDEDE00949494000031310000000000000000001010100094949400A5A5
      A500B5B5B500C6C6C600C6C6C600C6C6C6009494940094949400949494009494
      9400949494009494940094949400003131000031310094949400949494009494
      940094949400949494009494940094949400C6C6C600C6C6C600C6C6C600B5B5
      B500A5A5A5009494940010101000000000000000000084848400848484008484
      8400000000000000000084848400000000008484840000000000000000008484
      8400848484008484840000000000000000001010100094949400A5A5A500B5B5
      B500C6C6C600C6C6C600C6C6C600CECECE00E7E7E700DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE0094949400003131001010100094949400A5A5A500B5B5
      B500C6C6C600C6C6C600C6C6C600CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE000031310000313100CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00C6C6C600C6C6C600C6C6
      C600B5B5B500A5A5A50094949400101010000000000084848400848484008484
      8400848484000000000084848400000000008484840000000000848484008484
      8400848484008484840000000000000000001010100010101000101010001010
      1000101010001010100094949400CECECE00E7E7E700DEDEDE00003131000031
      3100003131000031310000313100003131000031310094949400B5B5B500C6C6
      C600E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E700C6C6C600C6C6C6000031310000313100C6C6C600C6C6C600E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700C6C6C600B5B5B50094949400003131000000000084848400848484008484
      8400848484000000000084848400000000008484840000000000848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      000000000000000000000000000000000000000000000031310094949400C6C6
      C600C6C6C600E7E7E700DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE000031310000313100DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00E7E7E700C6C6
      C600C6C6C6009494940000313100000000000000000084848400848484008484
      8400000000000000000084848400000000008484840000000000000000008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000000000000000000000003131009494
      9400C6C6C600DEDEDE00F7F7F700DEDEDE000031310000313100003131000031
      3100003131000031310000313100003131000031310000313100003131000031
      310000313100003131000031310000313100DEDEDE00F7F7F700DEDEDE00C6C6
      C600949494000031310000000000000000000000000084848400848484000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000848484008484840000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000000000000000000000000000000031
      310094949400DEDEDE00DEDEDE00DEDEDE000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000313100DEDEDE00DEDEDE00DEDEDE009494
      9400003131000000000000000000000000000000000084848400000000000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000031310094949400DEDEDE00DEDEDE000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000313100DEDEDE00DEDEDE00949494000031
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00C6C6C600DEDEDE00003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000031310094949400DEDEDE000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000313100DEDEDE0094949400003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00C6C6C600DEDEDE00003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000313100949494000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000003131009494940000313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100000313100003131000031310000313100003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000003131000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000003131000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100000313100003131000031310000313100003131000000
      0000000000000000000000000000000000004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00C6C6C600DEDEDE00003131000000
      0000000000000000000000000000000000004A4A4A00A5A5A500A5A5A5004A4A
      4A00C6C6C600D6D6D600D6D6D600D6D6D6004A4A4A00A5A5A500A5A5A5004A4A
      4A004A4A4A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000636363006363630063636300636363006363
      6300636363000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00C6C6C600DEDEDE00003131000000
      0000000000000000000000000000000000004A4A4A00A5A5A500A5A5A5004A4A
      4A00C6C6C600C6C6C600C6C6C600D6D6D6004A4A4A00A5A5A500A5A5A5004A4A
      4A00CECECE004A4A4A000000000000000000000000000000000063636300CECE
      CE00949494009494940094949400949494009494940094949400949494009494
      9400949494009494940000000000000000000000000000000000000000000000
      000000000000000000004A4A4A00000000000000000000000000000000006363
      6300949494006363630000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000004A4A4A00A5A5A500A5A5A5004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A00A5A5A500A5A5A5004A4A
      4A00CECECE00CECECE004A4A4A0000000000000000000000000063636300CECE
      CE00B5B5B500C6C6C600B5B5B5009C9C9C00B5B5B5009C9C9C00B5B5B5009494
      9400B5B5B5009494940000000000000000000000000000000000000000000000
      0000000000005A5A5A0000000000000000000000000000000000000000000000
      0000636363009494940063636300000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000004A4A4A00A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A5004A4A
      4A00CECECE00CECECE004A4A4A00000000000000000063636300CECECE00B5B5
      B500CECECE00B5B5B500C6C6C600B5B5B5009C9C9C00B5B5B5009C9C9C00B5B5
      B500848484000000000094949400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000636363009494940063636300000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000004A4A4A00A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A5004A4A
      4A00CECECE00CECECE004A4A4A00000000000000000063636300CECECE00CECE
      CE00B5B5B500CECECE00B5B5B500C6C6C600B5B5B5009C9C9C00B5B5B5009C9C
      9C00B5B5B5000000000094949400000000000000000084848400B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B5000000000000000000636363000000
      0000636363009494940063636300000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000004A4A4A00A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A5004A4A
      4A00CECECE00CECECE004A4A4A000000000063636300CECECE00C6C6C600B5B5
      B500CECECE00B5B5B500CECECE00B5B5B500C6C6C600B5B5B5009C9C9C00B5B5
      B50000000000B5B5B50094949400000000000000000084848400C6C6C6005252
      5200525252005252520052525200B5B5B5000000000000000000636363006363
      6300636363009494940063636300000000001010100010101000101010001010
      1000101010001010100094949400CECECE00E7E7E700DEDEDE00003131000031
      3100003131000031310000313100003131004A4A4A00A5A5A500A5A5A5004A4A
      4A004A4A4A00A5A5A500A5A5A5004A4A4A004A4A4A00A5A5A500A5A5A5004A4A
      4A00CECECE00CECECE004A4A4A000000000063636300CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00000000009494940094949400000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700B5B5B5000000000000000000636363009C9C
      9C00636363006363630063636300000000001010100094949400A5A5A500B5B5
      B500C6C6C600C6C6C600C6C6C600CECECE00E7E7E700DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE009494940000313100000000004A4A4A00A5A5A5004A4A
      4A00CECECE004A4A4A00A5A5A5004A4A4A00CECECE004A4A4A00A5A5A5004A4A
      4A00CECECE00CECECE004A4A4A00000000006363630063636300636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      63009C9C9C00B5B5B50094949400000000000000000084848400C6C6C6006363
      6300636363006363630063636300B5B5B5000000000000000000636363009C9C
      9C00B5B5B500636363000000000000000000000000001010100094949400A5A5
      A500B5B5B500C6C6C600C6C6C600C6C6C600E7E7E700DEDEDE00F7F7F700DEDE
      DE00DEDEDE0094949400003131000000000000000000000000004A4A4A004A4A
      4A00CECECE00CECECE004A4A4A004A4A4A00CECECE00CECECE004A4A4A004A4A
      4A00CECECE00CECECE004A4A4A00000000000000000063636300CECECE00B5B5
      B500C6C6C600B5B5B500C6C6C600B5B5B500C6C6C600B5B5B500B5B5B5009C9C
      9C00B5B5B5009C9C9C0094949400000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700B5B5B5000000000000000000636363006363
      6300636363006363630063636300000000000000000000000000101010009494
      9400A5A5A500B5B5B500C6C6C600C6C6C600E7E7E700E7E7E700DEDEDE00DEDE
      DE00949494000031310000000000000000000000000000000000000000004A4A
      4A00CECECE00CECECE00CECECE004A4A4A00CECECE00CECECE00CECECE004A4A
      4A00CECECE00CECECE004A4A4A00000000000000000063636300CECECE00C6C6
      C600B5B5B500C6C6C600B5B5B500C6C6C600B5B5B500E7E7E700CECECE00CECE
      CE00CECECE00CECECE00CECECE00000000000000000084848400C6C6C6008484
      84008484840084848400C6C6C600B5B5B5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001010
      100094949400A5A5A500B5B5B500C6C6C600E7E7E700C6C6C600C6C6C6009494
      9400003131000000000000000000000000000000000000000000000000000000
      00004A4A4A00CECECE004A4A4A00000000004A4A4A00CECECE004A4A4A000000
      00004A4A4A00CECECE004A4A4A00000000000000000063636300CECECE00B5B5
      B500C6C6C600B5B5B500CECECE00B5B5B5009C9C9C0063636300636363006363
      6300636363006363630063636300636363000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001010100094949400A5A5A500B5B5B500C6C6C600C6C6C600949494000031
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A004A4A4A0000000000000000004A4A4A004A4A4A000000
      0000000000004A4A4A004A4A4A0000000000000000000000000063636300CECE
      CE00CECECE00CECECE00CECECE009C9C9C006363630000000000000000000000
      0000000000000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E70084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400A5A5A500B5B5B50094949400003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A000000000000000000000000004A4A4A000000
      000000000000000000004A4A4A00000000000000000000000000000000006363
      6300636363006363630063636300636363000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000010101000949494009494940000313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484008484
      840084848400848484008484840084848400D6D6D600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600EFEF
      EF00D6D6D600B5B5B500C6C6C600C6C6C600000000004A4A4A00525252006363
      6300424242000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006363630063636300636363006363
      6300636363006363630063636300636363005A5A5A0000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      840084848400848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400C6C6C60094949400949494009494
      94009C9C9C009C9C9C00F7F7F700B5B5B5009C9C9C009C9C9C00B5B5B500FFFF
      FF00B5B5B500949494009C9C9C009C9C9C00000000004A4A4A00525252008484
      8400636363004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006363630073737300737373007373
      730063636300C6C6C600636363005A5A5A005A5A5A0000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF0084848400848484008484
      84008484840084848400FFFFFF0084848400C6C6C60094949400949494009C9C
      9C009494940094949400F7F7F700B5B5B5009494940094949400CECECE00DEDE
      DE00949494009C9C9C0094949400B5B5B5000000000000000000525252008484
      84008484840084848400B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B5000000000000000000737373000000000084848400848484008484
      8400C6C6C600B5B5B500A5A5A500848484005A5A5A00A5A5A500949494006363
      63005A5A5A0084848400000000000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF0084848400FFFFFF008484840084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400C6C6C60094949400949494009494
      9400949494009C9C9C00F7F7F700B5B5B5009C9C9C0094949400F7F7F700B5B5
      B500949494009C9C9C009C9C9C009C9C9C000000000000000000848484005252
      5200848484008484840042424200E7E7E700C6C6C600E7E7E700C6C6C600E7E7
      E700B5B5B500000000007373730042424200000000000000000084848400C6C6
      C600B5B5B500A5A5A50084848400848484005A5A5A005A5A5A00C6C6C6006363
      63005A5A5A0084848400000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF00FFFFFF00848484008484
      840084848400FFFFFF00FFFFFF0084848400D6D6D600C6C6C600CECECE00CECE
      CE00B5B5B50094949400F7F7F700C6C6C600B5B5B500DEDEDE00DEDEDE009494
      9400949494009C9C9C00949494009C9C9C00000000000000000084848400E7E7
      E70052525200949494004242420052525200525252005252520052525200C6C6
      C600B5B5B5006363630042424200000000000000000000000000848484008484
      8400C6C6C6008484840084848400848484005A5A5A00C6C6C600B5B5B500A5A5
      A5008484840000000000000000000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008484840084848400FFFFFF0084848400F7F7F700CECECE00C6C6C600CECE
      CE00F7F7F700D6D6D600F7F7F700DEDEDE00DEDEDE00EFEFEF00D6D6D600B5B5
      B500F7F7F7009C9C9C00949494009C9C9C00000000000000000084848400E7E7
      E700C6C6C600525252006363630042424200C6C6C600E7E7E700C6C6C600E7E7
      E700636363004242420000000000000000000000000084848400848484008484
      8400C6C6C600D6D6D600D6D6D600C6C6C60084848400B5B5B500A5A5A5008484
      84008484840000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400FFFFFF008484840084848400FFFF
      FF008484840084848400FFFFFF0084848400C6C6C600949494009C9C9C009494
      9400B5B5B500FFFFFF00FFFFFF00B5B5B5009494940094949400C6C6C600F7F7
      F700F7F7F7009C9C9C0094949400B5B5B500000000000000000084848400E7E7
      E700636363006363630052525200636363004242420063636300636363006363
      6300424242000000000000000000000000008484840084848400848484008484
      8400C6C6C600D6D6D600D6D6D600C6C6C60084848400A5A5A500848484008484
      84008484840000000000000000000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00848484008484840084848400FFFFFF00FFFFFF00848484008484
      840084848400FFFFFF00FFFFFF0084848400C6C6C60094949400949494009494
      940094949400EFEFEF00FFFFFF00B5B5B500949494009494940094949400FFFF
      FF00F7F7F700B5B5B5009C9C9C009C9C9C00000000000000000084848400E7E7
      E700C6C6C600E7E7E700C6C6C600525252006363630042424200636363004242
      4200B5B5B5000000000000000000000000008484840084848400848484008484
      8400C6C6C600D6D6D600CECECE00CECECE00C6C6C60084848400D6D6D600D6D6
      D600C6C6C60084848400000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400C6C6C60094949400949494009494
      9400B5B5B500FFFFFF00FFFFFF00B5B5B5009494940094949400B5B5B500FFFF
      FF00F7F7F7009C9C9C009C9C9C009C9C9C00000000000000000084848400E7E7
      E70073737300737373007373730073737300525252006363630042424200C6C6
      C600B5B5B5000000000000000000000000008484840084848400848484008484
      840084848400D6D6D600D6D6D6005A5A5A0084848400D6D6D600D6D6D600D6D6
      D600C6C6C60084848400000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF008484840084848400FFFF
      FF008484840084848400FFFFFF0084848400C6C6C6009494940094949400C6C6
      C600F7F7F700C6C6C600FFFFFF00C6C6C600C6C6C600CECECE00EFEFEF00DEDE
      DE00F7F7F7009C9C9C00949494009C9C9C00000000000000000084848400E7E7
      E700E7E7E700E7E7E700C6C6C600848484006363630042424200636363004242
      4200B5B5B5000000000000000000000000008484840084848400848484008484
      840084848400C6C6C600D6D6D600D6D6D60084848400C6C6C600D6D6D600CECE
      CE00CECECE00C6C6C60084848400000000008484840084848400848484008484
      840084848400848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400C6C6C600B5B5B500EFEFEF00EFEF
      EF00B5B5B5009C9C9C00CECECE00D6D6D600D6D6D600CECECE00C6C6C6009C9C
      9C00F7F7F7009C9C9C0094949400B5B5B500000000000000000084848400E7E7
      E7008484840084848400848484006363630042424200C6C6C600E7E7E7006363
      6300424242000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400C6C6C600C6C6C60084848400D6D6D600D6D6
      D6005A5A5A0084848400000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484008484840084848400848484008484
      840084848400848484008484840084848400D6D6D600F7F7F700C6C6C6009494
      94009C9C9C0094949400949494009C9C9C00949494009C9C9C009C9C9C009C9C
      9C00F7F7F7009C9C9C00949494009C9C9C00000000000000000084848400E7E7
      E7004A4A4A004A4A4A006363630042424200C6C6C600E7E7E700848484000000
      0000636363004242420000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400C6C6C600D6D6
      D600D6D6D60084848400000000000000000084848400FFFFFF00848484008484
      840084848400848484008484840084848400FFFFFF00FFFFFF00848484008484
      840084848400FFFFFF00C6C6C60084848400FFFFFF00C6C6C600949494009494
      9400949494009C9C9C0094949400949494009494940094949400949494009494
      9400F7F7F7009C9C9C009C9C9C009C9C9C0000000000000000004A4A4A004A4A
      4A00848484006363630042424200E7E7E700E7E7E700E7E7E70084848400FFFF
      FF00000000006363630042424200000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C600848484000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60084848400FFFFFF00C6C6C6009C9C9C009494
      9400949494009C9C9C00949494009C9C9C00949494009C9C9C009C9C9C009494
      9400F7F7F700B5B5B5009C9C9C009C9C9C00000000004A4A4A00848484008484
      84006363630042424200E7E7E700E7E7E700E7E7E700E7E7E700848484000000
      0000000000000000000073737300424242000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840084848400DEDEDE00F7F7F700B5B5B5009C9C
      9C00B5B5B500B5B5B50094949400949494009C9C9C00D6D6D600D6D6D600CECE
      CE00FFFFFF00D6D6D600D6D6D600DEDEDE004A4A4A0084848400737373006363
      6300424242008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600CECECE00F7F7F700E7E7
      E700F7F7F700CECECE009C9C9C009C9C9C009C9C9C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007373730052525200525252007373
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484008484
      840084848400000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100313131000000
      0000000000004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006363630084848400636363000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000031313100C6C6C600FFFFFF00C6C6C6000000
      0000424242007373730084848400000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840084848400000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600636363009494940073737300636363000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000031313100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF004242
      420073737300C6C6C600B5B5B5004242420084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400F7F7F700848484008484
      84008484840084848400636363009C9C9C0073737300C6C6C600737373006363
      6300000000000000000000000000000000000000000000000000000000003131
      3100C6C6C600FFFFFF00FFFFFF00FFFFFF00CECECE009C9C9C00424242007373
      7300A5A5A500C6C6C600424242000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60084848400000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C000000000084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F7007373730073737300F7F7F700C6C6C600737373006363
      630000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00CECECE009C9C9C00CECECE004242420073737300A5A5
      A500B5B5B50042424200000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600848484004A4A4A0000000000000000000000
      00004A4A4A00000000004A4A4A000000000000000000000000004A4A4A000000
      00004A4A4A0000000000000000004A4A4A0084848400F7F7F700A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500F7F7F700C6C6C600000000007373
      730063636300000000000000000000000000000000000000000000000000FFFF
      FF00CECECE009C9C9C00CECECE009C9C9C004242420073737300A5A5A500B5B5
      B5004242420000000000000000000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00FFFFFF00C6C6C600848484004A4A4A009C9C9C009C9C9C009C9C
      9C004A4A4A009C9C9C004A4A4A009C9C9C009C9C9C009C9C9C004A4A4A009C9C
      9C004A4A4A009C9C9C009C9C9C004A4A4A0084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C600000000007373
      7300636363000000000000000000000000000000000031313100DEDEDE004242
      42004242420042424200424242004242420084848400A5A5A500B5B5B5004242
      4200FFFFFF0031313100000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600848484004A4A4A0000000000000000000000
      00004A4A4A00000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      00004A4A4A0000000000000000004A4A4A0084848400F7F7F700949494009494
      940094949400949494009494940094949400F7F7F700C6C6C60000000000C6C6
      C6007373730063636300000000000000000000000000FFFFFF0042424200CECE
      CE00D6D6D600C6C6C600C6C6C600424242004242420084848400424242009C9C
      9C00CECECE00C6C6C600000000000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00848484008484840084848400FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00FFFFFF00C6C6C600848484004A4A4A009C9C9C009C9C9C009C9C
      9C004A4A4A009C9C9C004A4A4A009C9C9C009C9C9C009C9C9C004A4A4A009C9C
      9C009C9C9C004A4A4A004A4A4A000000000084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C600737373006363630000000000000000000000000042424200CECECE00D6D6
      D600D6D6D600C6C6C600C6C6C600C6C6C6004242420042424200CECECE009C9C
      9C009C9C9C00FFFFFF00313131000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600848484004A4A4A00000000004A4A4A000000
      00004A4A4A00000000004A4A4A000000000000000000000000004A4A4A000000
      0000000000004A4A4A004A4A4A000000000084848400F7F7F700B5B5B500B5B5
      B500B5B5B500C6C6C600F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C6000000000073737300636363000000000042424200CECECE00F7F7F700E7E7
      E700D6D6D600C6C6C600C6C6C600C6C6C600C6C6C600424242009C9C9C00CECE
      CE009C9C9C00CECECE00C6C6C6000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00FFFFFF00C6C6C600848484004A4A4A004A4A4A009C9C9C004A4A
      4A004A4A4A009C9C9C009C9C9C004A4A4A009C9C9C004A4A4A009C9C9C009C9C
      9C004A4A4A009C9C9C009C9C9C004A4A4A0084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C6000000000000000000737373006363630042424200D6D6D600E7E7E700E7E7
      E700D6D6D600C6C6C600C6C6C600C6C6C600C6C6C60042424200CECECE00CECE
      CE00FFFFFF00FFFFFF00FFFFFF00313131008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      84008484840084848400C6C6C600848484004A4A4A0000000000000000000000
      00004A4A4A000000000000000000000000004A4A4A0000000000000000000000
      00004A4A4A0000000000000000004A4A4A0084848400F7F7F7009C9C9C009C9C
      9C00C6C6C600F7F7F700F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C6000000000000000000000000007373730042424200D6D6D600D6D6D600D6D6
      D600C6C6C600C6C6C600C6C6C600A5A5A500A5A5A50042424200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6003131310084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60084848400000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C000000000084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C6000000000000000000000000000000000042424200C6C6C600CECECE00CECE
      CE00C6C6C600C6C6C600C6C6C60084848400A5A5A5004242420094949400DEDE
      DE00C6C6C60031313100000000000000000084848400FFFFFF00848484008484
      840084848400848484008484840084848400FFFFFF00FFFFFF00848484008484
      840084848400FFFFFF00C6C6C600848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      840084848400848484008484840084848400848484008484840000000000C6C6
      C600000000000000000000000000000000000000000042424200B5B5B500B5B5
      B500C6C6C600C6C6C600C6C6C6008484840042424200DEDEDE00B5B5B5001818
      18006363630000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60084848400000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C0000000000000000000000000084848400F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6
      C60000000000000000000000000000000000000000000000000042424200C6C6
      C600C6C6C6009494940094949400424242008484840084848400848484003131
      3100000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000004242
      4200424242004242420042424200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00525252006363
      6300424242000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00525252008484
      8400636363004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000525252008484
      84008484840084848400B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B5000000000000000000737373009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484005252
      5200848484008484840042424200E7E7E700C6C6C600E7E7E700C6C6C600E7E7
      E700B5B5B5000000000073737300424242009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700F7F7F700A5A5A500A5A5A500A5A5A500F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004A4A4A004A4A4A0000000000000000000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E70052525200949494004242420052525200525252005252520052525200C6C6
      C600B5B5B5006363630042424200000000009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600A5A5A500848484008484840084848400A5A5A500D6D6
      D600D6D6D600D6D6D600F7F7F7009C9C9C000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A004A4A4A004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A004A4A4A004A4A4A00000000000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E700C6C6C600525252006363630042424200C6C6C600E7E7E700C6C6C600E7E7
      E700636363004242420000000000000000009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700A5A5A500F7F7F700F7F7F700F7F7F700A5A5A500F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C000000000000000000000000000000
      00000000000000000000000000004A4A4A004A4A4A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E700636363006363630052525200636363004242420063636300636363006363
      6300424242000000000000000000000000009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600A5A5A500848484008484840084848400A5A5A500D6D6
      D600D6D6D600D6D6D600F7F7F7009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A0000000000000000000000000000000000000000000000000084848400E7E7
      E700C6C6C600E7E7E700C6C6C600525252006363630042424200636363004242
      4200B5B5B5000000000000000000000000009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700A5A5A500F7F7F700F7F7F700F7F7F700A5A5A500F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C00000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E70073737300737373007373730073737300525252006363630042424200C6C6
      C600B5B5B5000000000000000000000000009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600A5A5A500848484008484840084848400A5A5A500D6D6
      D600D6D6D600D6D6D600F7F7F7009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E700E7E7E700E7E7E700C6C6C600848484006363630042424200636363004242
      4200B5B5B5000000000000000000000000009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700A5A5A500F7F7F700F7F7F700F7F7F700A5A5A500F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C00000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A0000000000000000000000000000000000000000000000000084848400E7E7
      E7008484840084848400848484006363630042424200C6C6C600E7E7E7006363
      6300424242000000000000000000000000009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600A5A5A500848484008484840084848400A5A5A500D6D6
      D600D6D6D600D6D6D600F7F7F7009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E7004A4A4A004A4A4A006363630042424200C6C6C600E7E7E700848484000000
      0000636363004242420000000000000000009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700F7F7F700A5A5A500A5A5A500A5A5A500F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C000000000000000000000000000000
      00000000000000000000000000004A4A4A004A4A4A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A004A4A4A004A4A4A00000000000000
      00000000000000000000000000000000000000000000000000004A4A4A004A4A
      4A00848484006363630042424200E7E7E700E7E7E700E7E7E70084848400FFFF
      FF00000000006363630042424200000000009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A004A4A4A004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004A4A4A004A4A4A0000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00848484008484
      84006363630042424200E7E7E700E7E7E700E7E7E700E7E7E700848484000000
      0000000000000000000073737300424242009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D6009C9C9C00D6D6D600D6D6D600D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600D6D6D6009C9C9C000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A4A4A0084848400737373006363
      6300424242008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A0000000000000000000000000000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000007373730052525200525252007373
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006363630063636300636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363006363630063636300636363000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600292929003131310000000000000000000000
      0000000000000000000000000000000000009494940094949400949494009494
      94009494940094949400949494009494940063636300CECECE00949494009494
      9400949494009494940094949400636363000000000000000000000000008484
      8400B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CECECE00C6C6C6008484840000000000000000004A4A4A00525252000000
      0000000000000000000000000000000000009494940094949400949494009494
      94009494940094949400949494009494940063636300CECECE00A5A5A5009494
      9400949494009494940094949400636363000000000000000000000000008484
      8400E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000084848400B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500000000000000000000000000000000000000000000000000DEDEDE00D6D6
      D6008484840084848400C6C6C600292929003131310000000000000000005A5A
      5A00636363000000000000000000000000009494940094949400949494009494
      94009494940094949400949494009494940063636300CECECE00A5A5A500A5A5
      A500949494009494940094949400636363000000000000000000000000008484
      8400E7E7E7005252520052525200525252005252520052525200525252005252
      5200C6C6C600B5B5B50000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600000000000000
      000000000000000000000000000000000000000000008484840084848400A5A5
      A500CECECE00C6C6C600C6C6C60029292900313131004A4A4A00525252000000
      0000000000007373730000000000000000000000000000000000000000000000
      000000000000E7E7E700E7E7E700E7E7E70063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000000000000000000000000000008484
      8400E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000084848400E7E7E7005252
      5200525252005252520000000000000000000000000000000000000000005A5A
      5A005A5A5A005A5A5A00000000006363630084848400A5A5A500DEDEDE00D6D6
      D600CECECE00C6C6C600C6C6C60029292900313131004A4A4A00525252005A5A
      5A00636363000000000000000000000000000000000000000000000000000000
      00000000000063636300636363006363630063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000000000000000000000000000008484
      8400E7E7E7006363630063636300636363006363630063636300636363006363
      6300C6C6C600B5B5B50000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C60000000000000000008484840084848400848484006363
      63006363630063636300000000008484840084848400FFFFFF00DEDEDE00D6D6
      D600CECECE00C6C6C600FFFFFF0029292900313131004A4A4A00525252005A5A
      5A00636363007373730084848400000000000000000000000000000000006363
      63000000000084848400848484008484840063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000000000000000000000000000008484
      8400E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000084848400E7E7E7006363
      6300636363006363630000000000949494000000000000000000B5B5B500B5B5
      B5008484840084848400000000009494940084848400FFFFFF00DEDEDE00D6D6
      D600FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C6004A4A4A00525252005A5A
      5A00636363007373730084848400000000000000000000000000000000006363
      6300A5A5A50084848400848484008484840063636300CECECE0042424200A5A5
      A500424242000000000000000000000000000000000000000000000000008484
      8400E7E7E7007373730073737300737373007373730073737300737373007373
      7300C6C6C600B5B5B50000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C60000000000C6C6C6009494940000000000C6C6C600C6C6
      C6000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00D6D6D600CECECE006363630073737300C6C6C600C6C6C600C6C6C6005A5A
      5A00636363007373730084848400000000000000000000000000000000006363
      6300CECECE00A5A5A500848484008484840063636300CECECE00FFFFFF00A5A5
      A500424242000000000000000000000000000000000000000000000000008484
      8400E7E7E700E7E7E700E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000084848400E7E7E7007373
      730073737300737373007373730000000000C6C6C60094949400000000000000
      00000000000000000000000000000000000084848400FFFFFF00DEDEDE00D6D6
      D600525252004A4A4A00D6D6D600CECECE00CECECE0084848400848484000000
      0000C6C6C600737373008484840000000000A5A5A500A5A5A500A5A5A500A5A5
      A500CECECE00CECECE00A5A5A5008484840063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000000000000000000000000000006363
      6300E7E7E7008484840084848400848484008484840084848400C6C6C600E7E7
      E700E7E7E700B5B5B50000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700C6C6C600E7E7E700C6C6C6000000000000000000949494000000
      000000000000000000000000000000000000000000008484840084848400FFFF
      FF00DEDEDE00C6C6C600D6D6D6008484840084848400C6C6C600C6C6C6000000
      0000DEDEDE00000000000000000000000000CECECE00E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E700CECECE006363630063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000000000000063636300000000006363
      6300E7E7E70063636300E7E7E700E7E7E700E7E7E700C6C6C600E7E7E7008484
      8400000000000000000000000000000000000000000084848400E7E7E7008484
      840084848400848484008484840084848400C6C6C600E7E7E700E7E7E7009494
      9400000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF0084848400C6C6C600C6C6C600C6C6C600D6D6D600CECE
      CE00000000000000000000000000000000006363630063636300636363006363
      6300E7E7E700CECECE00636363008484840063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000000000000000000000636363006363
      630063636300E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E7008484
      8400E7E7E7000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700C6C6C600E7E7E70084848400000000000000
      0000949494000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400C6C6C600CECECE00CECECE00CECECE00D6D6
      D600CECECE000000000000000000000000000000000000000000000000006363
      6300CECECE0063636300848484008484840063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000006363630063636300636363008484
      8400636363006363630063636300E7E7E700E7E7E700E7E7E700E7E7E7008484
      8400000000000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400FFFFFF000000
      0000000000009494940000000000000000000000000000000000000000000000
      000000000000000000000000000094949400D6D6D600CECECE00D6D6D600CECE
      CE00F7FFFF00F7FFFF0000000000000000000000000000000000000000006363
      63006363630084848400848484008484840084848400E7E7E700A5A5A500A5A5
      A500424242000000000000000000000000000000000000000000636363006363
      6300636363008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949400D6D6D600F7FFFF00F7FF
      FF00949494009494940000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400E7E7E700A5A5
      A500424242000000000000000000000000000000000063636300000000006363
      6300000000006363630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5B5B500B5B5B500B5B5
      B500000000000000000000000000000000000000000000000000000000000000
      000000000000848484008484840084848400848484008484840084848400E7E7
      E700424242000000000000000000000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000525252000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000636363006363630000000000000000000000
      000000000000000000000000000000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      0000737373000000000000000000000000008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400000000000000000000000000525252005252
      5200525252005252520052525200000000000000000000000000000000005252
      5200525252000000000000000000000000000000000000000000000000000000
      0000000000000000000063636300E7E7E700A5A5A50063636300000000000000
      000000000000000000000000000000000000000000004A4A4A004A4A4A000000
      000000000000000000004A4A4A00000000000000000000000000000000007373
      73007373730073737300000000000000000084848400DEDEDE00C6C6C600C6C6
      C600C6C6C600848484008484840084848400848484008484840000000000C6C6
      C600DEDEDE00C6C6C600848484000000000000000000525252005A5A5A005A5A
      5A005A5A5A005A5A5A0052525200000000000000000000000000000000008484
      8400525252000000000000000000000000000000000000000000000000000000
      00000000000063636300E7E7E700A5A5A500E7E7E700A5A5A500636363000000
      00000000000000000000000000000000000000000000000000004A4A4A004A4A
      4A00000000000000000000000000000000000000000000000000000000007373
      73007373730073737300000000000000000084848400D6D6D600C6C6C600C6C6
      C600C6C6C6008484840000000000C6C6C600848484008484840000000000C6C6
      C600DEDEDE00C6C6C60084848400000000005A5A5A0073737300737373007373
      73005A5A5A005252520000000000000000000000000018181800848484008484
      8400848484005252520052525200000000000000000000000000000000000000
      00000000000000848400A5A5A500E7E7E700CECECE00D6D6D600B5B5B5006363
      6300000000000000000000000000000000000000000000000000000000004A4A
      4A004A4A4A000000000000000000000000000000000000000000737373007373
      73007373730073737300737373000000000084848400DEDEDE00C6C6C600C6C6
      C600C6C6C6008484840000000000C6C6C600848484008484840000000000C6C6
      C600DEDEDE00C6C6C60084848400000000005A5A5A00DEDEDE00848484003131
      3100525252000000000000000000000000001818180084848400848484008484
      8400848484008484840063636300525252000000000000000000000000000000
      000063636300B5B5B500E7E7E700CECECE00D6D6D600E7E7E700A5A5A500E7E7
      E700636363000000000000000000000000000000000000000000000000000000
      00004A4A4A004A4A4A0000000000000000000000000000000000737373007373
      73007373730073737300737373000000000084848400D6D6D600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C60084848400000000005A5A5A00DEDEDE00636363005252
      52000000000000000000000000005A5A5A0084848400C6C6C600A5A5A5008484
      8400848484008484840063636300525252000000000000000000000000008484
      840063636300E7E7E700CECECE00D6D6D600E7E7E700A5A5A500E7E7E700A5A5
      A500C6C6C600636363000000000000000000000000004A4A4A00000000000000
      0000000000004A4A4A004A4A4A00000000000000000000000000000000000000
      00007373730000000000000000000000000084848400DEDEDE00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400000000005A5A5A00DEDEDE00737373006363
      630018181800000000000000000084848400EFEFEF00DEDEDE00C6C6C600A5A5
      A500848484008484840063636300525252000000000000000000000000008484
      840063636300CECECE00D6D6D600E7E7E700A5A5A500E7E7E700A5A5A500C6C6
      C600C6C6C600B5B5B5006363630000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      00007373730000000000000000000000000084848400D6D6D600C6C6C600C6C6
      C600848484008484840084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C60084848400000000005A5A5A00DEDEDE00949494007373
      73006363630052525200000000000000000084848400EFEFEF00DEDEDE00C6C6
      C600A5A5A5008484840052525200525252000000000000000000000000008484
      84008484840063636300B5B5B500A5A5A500E7E7E700A5A5A500C6C6C600C6C6
      C600B5B5B5000063630021212100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007373730000000000000000000000000084848400DEDEDE00C6C6C6008484
      8400DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00C6C6C60084848400000000005A5A5A00DEDEDE00EFEFEF009494
      940073737300636363004A4A4A004A4A4A004A4A4A0084848400EFEFEF00DEDE
      DE00C6C6C600848484006363630052525200000000000000000000000000A5A5
      A500A5A5A5008484840063636300E7E7E700B5B5B500C6C6C600C6C6C600A5A5
      A50063636300393939000000000000000000000000004A4A4A004A4A4A004A4A
      4A00000000004A4A4A004A4A4A004A4A4A000000000000000000000000000000
      00007373730000000000000000000000000084848400D6D6D600C6C6C6008484
      8400DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6
      D600DEDEDE00C6C6C60084848400000000005A5A5A00EFEFEF00949494004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A0084848400EFEF
      EF004A4A4A00B5B5B5006363630052525200000000000000000000000000A5A5
      A500B5B5B500B5B5B5008484840063636300B5B5B500319C9C00636363006363
      63000000000000000000000000000000000000000000737373004A4A4A000000
      000000000000000000004A4A4A00737373000000000000000000000000000000
      00007373730000000000000000000000000084848400DEDEDE00C6C6C6008484
      8400DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00C6C6C60084848400000000005A5A5A00DEDEDE004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A008484
      84004A4A4A004A4A4A006363630052525200000000000000000094949400C6C6
      C600B5B5B500B5B5B50084848400848484006363630063636300000000000000
      00000000000000000000000000000000000000000000000000004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      00007373730000000000000000000000000084848400D6D6D600C6C6C6008484
      8400DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6
      D600DEDEDE00C6C6C60084848400000000005A5A5A0094949400737373004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A0094949400313131000000000094949400B5B5B5008484
      8400949494000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000737373004A4A
      4A00000000004A4A4A0073737300000000000000000000000000000000000000
      00007373730000000000000000000000000084848400DEDEDE00C6C6C6008484
      8400DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00C6C6C6008484840000000000000000005A5A5A00949494007373
      73004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A0073737300525252000000000094949400A5A5A500848484009494
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A4A
      4A004A4A4A004A4A4A0000000000000000000000000000000000000000000000
      00007373730000000000000000000000000084848400D6D6D600C6C6C6008484
      8400DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6
      D600DEDEDE0000000000848484000000000000000000000000005A5A5A005A5A
      5A005A5A5A005252520052525200525252005252520052525200525252005252
      5200525252005252520000000000000000008484840084848400949494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007373
      73004A4A4A007373730000000000000000000000000000000000000000000000
      00007373730000000000000000000000000084848400DEDEDE00C6C6C6008484
      8400DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A000000000000000000000000000000000000000000000000000000
      0000737373000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000424D3E000000000000003E000000
      2800000040000000800000000100010000000000000400000000000000000000
      000000000000000000000000FFFFFF00FFFFF007FFFF0000BFFDE003FFCF0000
      BFFDE001FFC70000BFFDC001F8030000BDBD8000F8010000B99D8000F8030000
      B18D8000FFC70000A185C001FFCF0000A185C001F3FF0000B18DE003E3FF0000
      B99DF007C03F0000BDBDFC1F803F0000BFFDFC1FC03F0000BFFDF80FE3FF0000
      BFFDF80FF3FF0000FFFFF80FFFFF0000FE7FFE7FFE7FFFFFFC3FFC7FFE3FFD7F
      F81FF87FFE1FFD7FF00FF07FFE0FFD7FE007E07FFE07BD7BC003C00000039D73
      8001800000018D6300000000000085430000000000008543F81F800000018D63
      F81FC00000039D73F81FE07FFE07BD7BF81FF07FFE0FFD7FF81FF87FFE1FFD7F
      F81FFC7FFE3FFD7FF81FFE7FFE7FFFFFFFFFFFFFFFFFF81F000FFFFFFFFFF81F
      0007E000FE07F81F0003C000FDE3F81F0001C000FBF1F81F000180008071F81F
      000180008051F81F000100008041000000010000804100008001000080438001
      C00180008041C003E0018000807FE007F1118000807FF00FF999C07F80FFF81F
      FDDDE0FF81FFFC3FFFFFFFFFFFFFFE7FFE00000087FF007F000000008003007F
      00000000C002800300000000C000C00300000000C001C00700000000C0038007
      00000000C003000700000000C003000300000000C003000300000000C0030001
      00000000C003000300000000C003800300000000C001800100000000800CC001
      00000000001FFC01FFFF00000FFFFE078001FFBFFF18FFFFFFFF001FFC000000
      8001001FF0000000FFFF0007C001000080010007C003000075D60007C0030000
      00000007800300007416000300010000000100038001000055D9000100000000
      000000040000000077760006000000008001000700010000FFFF000780030000
      8001C007C0070000FFFFC007E00FFFFF87FFFFFFFFFFFFFF8003FFFFFFFF8001
      C0020000F00FFFFFC0000000F81FFE7FC0010000FC3FFC3FC0030000FE7FF81F
      C0030000FFFFF00FC00300008001FFFFC0030000FFFFFFFFC00300008001F00F
      C0030000FFFFF81FC0030000FE7FFC3FC0010000FC3FFE7F800C0000F81FFFFF
      001F0000F00F80010FFFFFFFFFFFFFFFFC7F0000E001FFFFF01F0000E0018007
      C0070000E001800780010000E00180008001F807E00180000001F807E0018000
      0000E807E00180000000E007E00180000000E007E001800700000007E0018007
      80010007A0018007E0070007C0038003F803E0070007800BFE00E007C00F801F
      FF03F807ABFF803FFF8FF807EFFFFFFFFFFFFFFFFFFF8001FFF7FE7F81F70000
      C1E7FC3F9DE3000081C7F81FCFE300000381F80FE7C100000700F007F3C10000
      0E00E003B9F700000600E00181F700000300E001FFF700000000E00388F70000
      0000E00F9CF700000000C03FC1F70000000087FFC9F7000080010FFFE3F70000
      C0031FFFE3F70000FFFFFFFFF7F7800100000000000000000000000000000000
      000000000000}
  end
  inherited ilColor: TImageList
    Left = 44
    Top = 220
    Bitmap = {
      494C01011F002100100010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000008000000001002000000000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003131
      3100008484000084840000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A4A
      4A0094ADAD0094ADAD0094ADAD00E7E7E70084840000E7E7E70094ADAD0094AD
      AD0094ADAD000084840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084000000FFCE
      3100840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002121210094AD
      AD009CCECE00E7E7E700EFEFEF00848400008484000084840000FFFFFF00C6C6
      C6009CCECE0094ADAD0021212100000000000000000000000000000000000000
      0000000000009C0000008400000084000000840000008400000084000000FFFF
      9C00FFCE31008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484009CCE
      CE009CCECE00F7F7F70084840000FFFFFF0084840000FFFFFF0084840000D6D6
      D6009CCECE009CCECE0000848400000000000000000000000000000000000000
      00000000000084000000FFCE3100FFCE3100FFFF9C00FFFF9C00FFFF9C00FFFF
      9C00FFFF9C00FFCE310084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484009CCE
      CE009CCECE00F7FFFF00EFEFEF00FFFFFF008484000084840000FFFFFF00F7F7
      F7009CCECE009CCECE0000848400000000000000000000000000000000000000
      00000000000084000000840000009C0000009C0000009C0000009C000000FFCE
      3100FFCE31009C00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484009CCE
      CE009CCECE00E7E7E700FFFFFF008484000084840000FFFFFF00FFFFFF00EFEF
      EF009CCECE009CCECE0000848400000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C000000FFCE
      31009C0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004A4A4A0094AD
      AD009CCECE00E7E7E70084840000FFFFFF0084840000FFFFFF0084840000E7E7
      E7009CCECE0094ADAD004A4A4A00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C0000009C00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000101010000084
      840094ADAD00C6C6C600EFEFEF00848400008484000084840000EFEFEF00D6D6
      D60094ADAD00009C9C0010101000000000000000000000000000000000000000
      0000840000009C00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004242
      420094ADAD0094ADAD0094ADAD00E7E7E70084840000E7E7E700D6D6D60094AD
      AD0094ADAD004242420000000000000000000000000000000000000000008400
      0000FFCE31009C00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000021212100009C9C00639C9C00639C9C00639C9C00639C9C00639C9C00009C
      9C0021212100000000000000000000000000000000000000000084000000FFCE
      3100FFFF9C008400000084000000840000008400000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000031313100009C9C000084840000848400313131000000
      0000000000000000000000000000000000000000000084000000FFCE3100FFFF
      9C00FFFF9C00FFFF9C00FFFF9C00FFCE3100FFCE310084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A00009C9C0094ADAD00009C9C004A4A4A000000
      00000000000000000000000000000000000000000000000000009C000000FFCE
      3100FFCE31009C0000009C0000009C0000008400000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100000CECE009CCECE0094ADAD0094ADAD0000CECE001010
      1000000000000000000000000000000000000000000000000000000000009C00
      0000FFCE31009C00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000009C9C00009C9C009CCECE009CCECE0094ADAD0000CECE004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      00009C0000009C00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000009C9C0021212100009C9C0042424200009C9C0021212100009C
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000010101000008484000084840000313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000010101000008484001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010000084840010101000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100000848400009C9C0000CECE0000848400003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100000848400009C9C001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000010101000009C9C0000848400101010000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001010100000848400009C9C0000CECE0000FFFF0000FFFF00008484000031
      3100000000000000000000000000000000000000000000000000000000000000
      00001010100000848400009C9C0000CECE001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001010100000CECE00009C9C00008484001010
      1000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001010
      100000848400009C9C0000CECE0000FFFF00F7FFFF0031FFFF0031FFFF000084
      8400003131000000000000000000000000000000000000000000000000001010
      100000848400009C9C0000CECE0000FFFF001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001010100000FFFF0000CECE00009C9C000084
      8400101010000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000101010000084
      8400009C9C0000CECE0000FFFF0000FFFF00F7FFFF00F7FFFF00CEFFFF00CEFF
      FF00008484000031310000000000000000000000000000000000101010000084
      8400009C9C0000CECE0000FFFF0000FFFF001010100010101000101010001010
      1000101010001010100010101000003131000031310010101000101010001010
      10001010100010101000101010001010100000FFFF0000FFFF0000CECE00009C
      9C00008484001010100000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001010100000848400009C
      9C0000CECE0000FFFF0000FFFF0031FFFF00F7FFFF00CEFFFF00F7FFFF00CEFF
      FF00CEFFFF00008484000031310000000000000000001010100000848400009C
      9C0000CECE0000FFFF0000FFFF0031FFFF000084840000848400008484000084
      8400008484000084840000848400003131000031310000848400008484000084
      84000084840000848400008484000084840031FFFF0000FFFF0000FFFF0000CE
      CE00009C9C000084840010101000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001010100000848400009C9C0000CE
      CE0000FFFF0000FFFF0031FFFF0063FFFF00F7FFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF0000848400003131001010100000848400009C9C0000CE
      CE0000FFFF0000FFFF0031FFFF0063FFFF0063FFFF0063FFFF0063FFFF0063FF
      FF0063FFFF0063FFFF0063FFFF00003131000031310063FFFF0063FFFF0063FF
      FF0063FFFF0063FFFF0063FFFF0063FFFF0063FFFF0031FFFF0000FFFF0000FF
      FF0000CECE00009C9C0000848400101010000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001010100010101000101010001010
      100010101000101010000084840063FFFF00F7FFFF00CEFFFF00003131000031
      310000313100003131000031310000313100003131000084840000CECE0000FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF009CFFFF0000313100003131009CFFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF0000FFFF0000CECE0000848400003131000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      00000000000000000000000000000000000000000000003131000084840000FF
      FF0031FFFF00F7FFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF00CEFFFF000031310000313100CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00F7FFFF0031FF
      FF0000FFFF000084840000313100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000000000000003131000084
      840031FFFF00CEFFFF00F7FFFF00CEFFFF000031310000313100003131000031
      3100003131000031310000313100003131000031310000313100003131000031
      310000313100003131000031310000313100CEFFFF00F7FFFF00CEFFFF0031FF
      FF00008484000031310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000000000000000000000031
      310000848400CEFFFF00CEFFFF00CEFFFF000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000313100CEFFFF00CEFFFF00CEFFFF000084
      8400003131000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000031310000848400CEFFFF00CEFFFF000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000313100CEFFFF00CEFFFF00008484000031
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000031310000848400CEFFFF000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000313100CEFFFF0000848400003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF009CFFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000313100008484000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000003131000084840000313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000031310000313100003131000031310000313100003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000003131000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000003131000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000031310000313100003131000031310000313100003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF009CFFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000084848400848484000000
      000000CECE0000CECE0000CECE0000CECE000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000CE000000CE000000CE000000CE000000
      CE000000CE000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000084848400848484000000
      000000CECE0000CECE0000CECE0000CECE000000000084848400848484000000
      0000C6C6C6000000000000000000000000000000000000000000006363009CFF
      FF00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009C
      CE00009CCE00009CCE0000000000000000000000000000000000000000000000
      000000000000000000000000CE00000000000000000000000000000000000000
      CE000000FF000000CE0000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000C6C6C600C6C6C60000000000000000000000000000000000006363009CFF
      FF0000CEFF0031CEFF0000CEFF0000CEFF0000CEFF00009CCE0000CEFF00009C
      CE0000CEFF00009CCE0000000000000000000000000000000000000000000000
      0000000000000000CE0000000000000000000000000000000000000000000000
      00000000CE000000FF000000CE00000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000C6C6C600C6C6C600000000000000000000000000006363009CFFFF0000CE
      FF0063FFFF0000CEFF0031CEFF0000CEFF0000CEFF0000CEFF00009CCE0000CE
      FF00009CCE0000000000009CCE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000CE000000FF000000CE00000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000C6C6C600C6C6C600000000000000000000000000006363009CFFFF009CFF
      FF0000CEFF0063FFFF0000CEFF0031CEFF0000CEFF0000CEFF0000CEFF00009C
      CE0000CEFF0000000000009CCE00000000000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C60000000000000000000000CE000000
      00000000CE000000FF000000CE00000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000C6C6C600C6C6C6000000000000000000006363009CFFFF00CEFFFF0000CE
      FF009CFFFF0000CEFF0063FFFF0000CEFF0031CEFF0000CEFF0000CEFF0000CE
      FF000000000000CEFF00009CCE000000000000000000848484009CFFFF00CE31
      0000CE310000CE310000CE310000C6C6C60000000000000000000000CE000000
      CE000000CE000000FF000000CE00000000001010100010101000101010001010
      100010101000101010000084840063FFFF00F7FFFF00CEFFFF00003131000031
      3100003131000031310000313100003131000000000084848400848484000000
      0000000000008484840084848400000000000000000084848400848484000000
      0000C6C6C600C6C6C6000000000000000000006363009CFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFF
      FF0000000000009CCE00009CCE00000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF00C6C6C60000000000000000000000CE000000
      FF000000CE000000CE000000CE00000000001010100000848400009C9C0000CE
      CE0000FFFF0000FFFF0031FFFF0063FFFF00F7FFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF0000848400003131000000000000000000848484000000
      0000C6C6C600000000008484840000000000C6C6C60000000000848484000000
      0000C6C6C600C6C6C60000000000000000000063630000636300006363000063
      6300006363000063630000636300006363000063630000636300006363000063
      6300009CCE0000CEFF00009CCE000000000000000000848484009CFFFF00FF00
      0000FF000000FF000000FF000000C6C6C60000000000000000000000CE000000
      FF00847BFF000000CE000000000000000000000000001010100000848400009C
      9C0000CECE0000FFFF0000FFFF0031FFFF00F7FFFF00CEFFFF00F7FFFF00CEFF
      FF00CEFFFF000084840000313100000000000000000000000000000000000000
      0000C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600000000000000
      0000C6C6C600C6C6C600000000000000000000000000006363009CFFFF0000CE
      FF009CFFFF0000CEFF0063FFFF0000CEFF0031CEFF0000CEFF0000CEFF0000CE
      FF0000CEFF00009CCE00009CCE00000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF00C6C6C60000000000000000000000CE000000
      CE000000CE000000CE000000CE00000000000000000000000000101010000084
      8400009C9C0000CECE0000FFFF0000FFFF00F7FFFF00F7FFFF00CEFFFF00CEFF
      FF00008484000031310000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C60000000000C6C6C600C6C6C600C6C6C6000000
      0000C6C6C600C6C6C600000000000000000000000000006363009CFFFF00CEFF
      FF0000CEFF009CFFFF0000CEFF0063FFFF0000CEFF0031CEFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF000000000000000000848484009CFFFF00FF63
      3100FF633100FF6331009CFFFF00C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001010
      100000848400009C9C0000CECE0000FFFF00F7FFFF0031FFFF0031FFFF000084
      8400003131000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600000000000000000000000000C6C6C600000000000000
      000000000000C6C6C600000000000000000000000000006363009CFFFF0000CE
      FF00CEFFFF0000CEFF009CFFFF0000CEFF009CCECE0000636300006363000063
      6300006363000063630000636300006363000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001010100000848400009C9C0000CECE0000FFFF0000FFFF00008484000031
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000006363009CFF
      FF009CFFFF009CFFFF009CFFFF009CCECE000063630000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100000848400009C9C0000CECE0000848400003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000063
      6300006363000063630000636300006363000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000010101000008484000084840000313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CECE9C00CE9C6300CE9C6300CE9C
      6300CE9C6300CE9C6300FFFFFF00CE9C6300CE9C6300CE9C6300CE9C6300FFEF
      CE00CECE9C00CE9C3100CE9C6300CE9C6300000000000000000000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000CE9C63009C6300009C6300009C63
      0000CE630000CE630000F7F7F700CE633100CE630000CE630000CE633100FFFF
      FF00CE6331009C630000CE6300009C633100000000000000CE000000FF000000
      9C00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF0084000000FF000000FF000000FF00
      000084000000C6C6C60084000000FF0000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF0000000000000000000000
      00000000000000000000FFFFFF0000000000CE9C63009C6300009C630000CE63
      00009C6300009C630000F7F7F700CE6331009C6300009C630000CE9C9C00F7CE
      A5009C630000CE6300009C630000CE633100000000000000CE000063FF000000
      FF0000009C00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE000000000000000000000000000000000084000000840000008400
      0000C6C6C600B5B5B500A5A5A50000000000000084000000FF000000CE000000
      9C000000840000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF0084848400FFFFFF000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000CE9C63009C6300009C6300009C63
      00009C630000CE630000F7F7F700CE633100CE6300009C630000EFEFEF00CE9C
      31009C630000CE630000CE6300009C633100000000000000CE00319CFF000063
      FF0000009C00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFF
      FF00CECECE00000000000000FF0000000000000000000000000084848400C6C6
      C600B5B5B500A5A5A50000000000000000000000840000008400C6C6C6000000
      9C000000840000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF00FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF0000000000CECE9C00CE9C6300CECE6300CECE
      6300CE6331009C630000F7F7F700CE9C6300CE9C3100CECECE00CECECE009C63
      00009C630000CE6300009C6300009C63310000000000000000000000CE00319C
      FF000000CE0000009C00CE310000CE310000CE310000CE310000CE3100009CFF
      FF00CECECE000000FF0000009C00000000000000000000000000000000000000
      0000C6C6C60000000000000000000000000000008400C6C6C600B5B5B500A5A5
      A5000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000FFFFFF0000000000EFEFEF00CE9C9C00CE9C6300CE9C
      9C00F7F7F700CECE9C00F7F7F700F7CEA500F7CEA500DEDEDE00CECE9C00CE63
      3100EFEFEF009C6331009C6300009C6331000000000000000000848484000000
      CE000063FF0000009C009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFF
      FF000000FF0000009C0000000000000000000000000000000000000000000000
      0000C6C6C600D6D6D600D6D6D600C6C6C60000000000B5B5B500A5A5A5000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400FFFFFF000000000000000000FFFF
      FF000000000000000000FFFFFF0000000000CE9C63009C630000CE6300009C63
      0000CE633100FFFFFF00FFFFFF00CE6331009C6300009C630000CE9C6300EFEF
      EF00F7F7F7009C6331009C630000CE633100000000000000000084848400FFFF
      FF000000CE000000FF0000009C00FF000000FF000000FF000000FF0000000000
      FF0000009C000000000000000000000000000000000000000000000000000000
      0000C6C6C600D6D6D600D6D6D600C6C6C60000000000A5A5A500000000000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C60084848400FF00000084848400FFFFFF00FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF0000000000CE9C63009C6300009C6300009C63
      00009C630000FFEFCE00FFFFFF00CE6331009C6300009C6300009C630000FFFF
      FF00F7F7F700CE633100CE6300009C633100000000000000000084848400FFFF
      FF009CFFFF000000CE000000FF0000009C009CFFFF00FFFFFF000000FF000000
      9C00CECECE000000000000000000000000000000000000000000000000000000
      0000C6C6C600D6D6D600CECECE00CECECE00C6C6C60000000000D6D6D600D6D6
      D600C6C6C60000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000CE9C63009C6300009C6300009C63
      0000CE633100FFFFFF00FFFFFF00CE6331009C6300009C630000CE633100FFFF
      FF00F7F7F7009C633100CE6300009C633100000000000000000084848400FFFF
      FF00FF000000FF0000000000CE000000FF0000009C000000FF0000009C009CFF
      FF00CECECE000000000000000000000000000000000000000000000000000000
      000000000000D6D6D600D6D6D600FF00000000000000D6D6D600D6D6D600D6D6
      D600C6C6C60000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF000000000000000000FFFF
      FF000000000000000000FFFFFF0000000000CE9C63009C6300009C630000CE9C
      6300F7F7F700CE9C6300FFFFFF00CE9C6300CE9C6300CE9C9C00E7E7E700F7CE
      A500EFEFEF009C6331009C6300009C633100000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF009CFFFF000000CE000000FF0000009C009CFFFF00FFFF
      FF00CECECE000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600D6D6D600D6D6D60000000000C6C6C600D6D6D600CECE
      CE00CECECE00C6C6C60000000000000000008484840084848400848484008484
      840084848400848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000CE9C6300CE9C3100E7E7E700FFCE
      CE00CE9C3100CE630000CE9C9C00CECE9C00CECE9C00CE9C9C00CE9C6300CE63
      0000F7F7F7009C6331009C630000CE633100000000000000000084848400FFFF
      FF00FF633100FF6331000000CE000000FF0000009C000000CE0000009C00FFFF
      FF00CECECE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C600C6C6C60000000000D6D6D600D6D6
      D600FF00000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484008484840084848400848484008484
      840084848400848484008484840000000000CECE9C00F7F7F700CE9C63009C63
      0000CE6300009C6300009C630000CE6300009C630000CE630000CE630000CE63
      0000F7F7F7009C6331009C6300009C633100000000000000000084848400FFFF
      FF000000CE000000CE000000FF0000009C009CFFFF00FFFFFF000000CE000000
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600D6D6
      D600D6D6D60000000000000000000000000084848400FFFFFF00000000000000
      000000000000000000000000000084848400FFFFFF00FFFFFF00000000000000
      000084848400FFFFFF00C6C6C60000000000FFFFFF00CE9C63009C6300009C63
      00009C630000CE6300009C6300009C6300009C6300009C6300009C6300009C63
      0000F7F7F7009C633100CE6300009C63310000000000000000000000CE000000
      CE000063FF000000FF0000009C00FFFFFF00FFFFFF00FFFFFF00848484000000
      CE0000009C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60000000000FFFFFF00CE9C6300CE6300009C63
      00009C630000CE6300009C630000CE6300009C630000CE630000CE6300009C63
      0000F7F7F700CE633100CE6300009C633100000000000000CE00319CFF000063
      FF000000CE0000009C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484000000
      00000000CE0000009C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840084848400F7CEA500EFEFEF00CE9C31009C63
      3100CE633100CE6331009C6300009C630000CE630000CECE9C00CECE9C00B5B5
      B500FFFFFF00CECE9C00CECE9C00F7CEA5000000CE00319CFF000063FF000000
      CE0000009C008484840084848400848484008484840084848400848484000000
      000000000000000000000000CE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE9C6300CECE6300F7F7F700D6D6
      D600EFEFEF00CECE6300CE630000CE630000CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000CE000000CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000009C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100313131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000009C000000FF0000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000031313100C6C6C600FFFFFF00C6C6C6000000
      00000000000031636300639CCE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000009C000000FF000000CE0000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000031313100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000316363009CCECE00C6D6EF000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00CE310000CE31
      0000CE310000CE31000000009C00319CFF000000CE00C6C6C6000000CE000000
      9C00000000000000000000000000000000000000000000000000000000003131
      3100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFCECE00FF636300000000003163
      6300639CCE00C6D6EF00000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C000000000084848400FFFFFF009CFFFF00FFFF
      FF009CFFFF00FFFFFF000000CE000000CE009CFFFF00C6C6C6000000CE000000
      9C0000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFCECE00FF636300FFCECE000000000031636300639C
      CE00C6D6EF0000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FF000000FF00
      0000FF000000FF000000FF000000FF000000FFFFFF00C6C6C600000000000000
      CE0000009C00000000000000000000000000000000000000000000000000FFFF
      FF00FFCECE00FF636300FFCECE00FF6363000000000031636300639CCE009CCE
      CE000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C6000000000000000000FF9C9C00FF9C9C00FF9C
      9C0000000000FF9C9C0000000000FF9C9C00FF9C9C00FF9C9C0000000000FF9C
      9C0000000000FF9C9C00FF9C9C000000000084848400FFFFFF009CFFFF00FFFF
      FF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00C6C6C600000000000000
      CE0000009C000000000000000000000000000000000031313100DEDEDE000000
      000000000000000000000000000000000000639CCE00319CCE00C6D6EF000000
      0000FFFFFF0031313100000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FF633100FF63
      3100FF633100FF633100FF633100FF633100FFFFFF00C6C6C60000000000C6C6
      C6000000CE0000009C00000000000000000000000000FFFFFF0000000000CECE
      3100FFFF9C00CECE3100CECE31000000000000000000319CCE0000000000FF63
      6300FFCECE00C6C6C600000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C60084848400FF00000084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C6000000000000000000FF9C9C00FF9C9C00FF9C
      9C0000000000FF9C9C0000000000FF9C9C00FF9C9C00FF9C9C0000000000FF9C
      9C00FF9C9C0000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00C6C6C60000000000C6C6
      C6000000CE0000009C0000000000000000000000000000000000CECE3100FFFF
      9C00FFFF9C00CECE3100CECE3100CECE31000000000000000000FFCECE00FF63
      6300FF636300FFFFFF00313131000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00000084000000
      84000000840000008400FFFFFF009CFFFF00FFFFFF00C6C6C60000000000C6C6
      C600000000000000CE0000009C000000000000000000FFFFCE00FFFFFF00FFEF
      CE00FFFF9C00CECE6300CECE3100CECE3100CECE310000000000FF636300FFCE
      CE00FF636300FFCECE00C6C6C6000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000FF9C9C000000
      000000000000FF9C9C00FF9C9C0000000000FF9C9C0000000000FF9C9C00FF9C
      9C0000000000FF9C9C00FF9C9C000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009CFFFF00C6C6C60000000000C6C6
      C60000000000000000000000CE000000840000000000FFFF9C00FFEFCE00FFEF
      CE00FFFF9C00CECE6300CECE3100CECE3100CECE310000000000FFCECE00FFCE
      CE00FFFFFF00FFFFFF00FFFFFF00313131008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      84008484840084848400C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF003100FF003100
      FF0000008400FFFFFF00FFFFFF009CFFFF00FFFFFF00C6C6C60000000000C6C6
      C6000000000000000000000000000000FF0000000000FFFF9C00FFFF9C00FFFF
      9C00FFCE6300CECE3100CECE3100CE9C3100CE9C310000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6003131310084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000C6C6
      C6000000000000000000000000000000000000000000FFFF3100FFCE9C00FFCE
      9C00FFCE6300CECE3100CECE31009C9C3100CE9C31000000000094949400DEDE
      DE00C6C6C60031313100000000000000000084848400FFFFFF00000000000000
      000000000000000000000000000084848400FFFFFF00FFFFFF00000000000000
      000084848400FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      840084848400848484008484840084848400848484008484840000000000C6C6
      C600000000000000000000000000000000000000000000000000CECE6300CECE
      6300CECE3100CECE3100CECE31009C9C310000000000DEDEDE00B5B5B5001818
      18006363630000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C0000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C60000000000000000000000000000000000000000000000000000000000CECE
      3100CECE3100CE9C3100CE9C3100000000008484840084848400848484003131
      3100000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE000000FF000000
      9C00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE000063FF000000
      FF0000009C00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE00319CFF000063
      FF0000009C00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFF
      FF00CECECE00000000000000FF000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000CE00319C
      FF000000CE0000009C00CE310000CE310000CE310000CE310000CE3100009CFF
      FF00CECECE000000FF0000009C000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C6000000FF000000840000008400000084000000FF00C6C6
      C600C6C6C600C6C6C600FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      CE000063FF0000009C009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFF
      FF000000FF0000009C00000000000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF000000CE000000FF0000009C00FF000000FF000000FF000000FF0000000000
      FF0000009C0000000000000000000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C6000000FF000000840000008400000084000000FF00C6C6
      C600C6C6C600C6C6C600FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF009CFFFF000000CE000000FF0000009C009CFFFF00FFFFFF000000FF000000
      9C00CECECE0000000000000000000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FF000000FF0000000000CE000000FF0000009C000000FF0000009C009CFF
      FF00CECECE0000000000000000000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C6000000FF000000840000008400000084000000FF00C6C6
      C600C6C6C600C6C6C600FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF009CFFFF000000CE000000FF0000009C009CFFFF00FFFF
      FF00CECECE0000000000000000000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FF633100FF6331000000CE000000FF0000009C000000CE0000009C00FFFF
      FF00CECECE0000000000000000000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C6000000FF000000840000008400000084000000FF00C6C6
      C600C6C6C600C6C6C600FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF000000CE000000CE000000FF0000009C009CFFFF00FFFFFF000000CE000000
      9C000000000000000000000000000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000CE000000
      CE000063FF000000FF0000009C00FFFFFF00FFFFFF00FFFFFF00848484000000
      CE0000009C000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE00319CFF000063
      FF000000CE0000009C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484000000
      00000000CE0000009C00000000000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C60084848400C6C6C600C6C6C600C6C6C60084848400C6C6
      C600C6C6C600C6C6C600C6C6C600848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000CE00319CFF000063FF000000
      CE0000009C008484840084848400848484008484840084848400848484000000
      000000000000000000000000CE00000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE000000CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600313131003939390000000000000000000000
      000000000000000000000000000000000000FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100FF63310084000000FFCE3100FF633100FF63
      3100FF633100FF633100FF633100840000000000000000000000000000008484
      8400CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CECECE00C6C6C6008484840000000000000000004A4A4A00525252000000
      000000000000000000000000000000000000FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100FF63310084000000FFCE3100FF9C0000FF63
      3100FF633100FF633100FF633100840000000000000000000000000000008484
      8400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00000000000000000000000000000000000000000000000000DEDEDE00D6D6
      D6008484840084848400C6C6C600313131003939390000000000000000005A5A
      5A0063636300000000000000000000000000FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100FF63310084000000FFCE3100FF9C0000FF9C
      0000FF633100FF633100FF633100840000000000000000000000000000008484
      8400FFFFFF00CE310000CE310000CE310000CE310000CE310000CE310000CE31
      00009CFFFF00CECECE0000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00000000000000
      000000000000000000000000000000000000000000008484840084848400A5A5
      A500CECECE00C6C6C600C6C6C60031313100393939004A4A4A00525252000000
      0000000000007373730000000000000000000000000000000000000000000000
      000000000000FFFF9C00FFFF9C00FFFF9C0084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400FFFFFF00CE31
      0000CE310000CE31000000000000000000000000000000000000000000006363
      9C0063639C0063639C0000000000FF00000084848400A5A5A500DEDEDE00D6D6
      D600CECECE00C6C6C600C6C6C60031313100393939004A4A4A00525252005A5A
      5A00636363000000000000000000000000000000000000000000000000000000
      00000000000084000000840000008400000084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FF000000FF000000FF000000FF000000FF000000FF000000FF00
      00009CFFFF00CECECE0000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00000000000000000094ADAD0094ADAD0094ADAD00639C
      9C00639C9C0094ADAD0000000000FF31310084848400FFFFFF00DEDEDE00D6D6
      D600CECECE00C6C6C600FFFFFF0031313100393939004A4A4A00525252005A5A
      5A00636363007373730084848400000000000000000000000000000000008400
      00000000000084848400848484008484840084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400FFFFFF00FF00
      0000FF000000FF0000000000000000FFFF00000000000000000094ADAD0094AD
      AD0094ADAD0094ADAD0000000000FF63630084848400FFFFFF00DEDEDE00D6D6
      D600FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C6004A4A4A00525252005A5A
      5A00636363007373730084848400000000000000000000000000000000008400
      00008484000084848400848484008484840084000000FFCE310000000000FF9C
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FF000000FF000000FF000000FF000000FF000000FF000000FF00
      00009CFFFF00CECECE0000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF0000000000C6C6C60000FFFF0000000000C6C6C600C6C6
      C6000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00D6D6D600CECECE003131FF0000000000C6C6C600C6C6C600C6C6C6005A5A
      5A00636363007373730084848400000000000000000000000000000000008400
      0000FFCE310084840000848484008484840084000000FFCE3100FFFFFF00FF9C
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400FFFFFF00FF00
      0000FF000000FF000000FF00000000000000C6C6C60000FFFF00000000000000
      00000000000000000000000000000000000084848400FFFFFF00DEDEDE00D6D6
      D6009CFF9C0000FF0000D6D6D600CECECE00CECECE0084848400848484000000
      0000C6C6C6007373730084848400000000008484000084840000848400008484
      0000FFCE3100FFCE3100848400008484840084000000FFCE3100FF9C0000FF9C
      00000000000000000000000000000000000000000000000000000000000031CE
      FF00FFFFFF00FF633100FF633100FF633100FF633100FF6331009CFFFF00FFFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00000000000000000000FFFF000000
      000000000000000000000000000000000000000000008484840084848400FFFF
      FF00DEDEDE00C6C6C600D6D6D60084848400848484009CFFFF009CFFFF000000
      0000DEDEDE00000000000000000000000000FFCE3100FFFF9C00FFFF9C00FFFF
      9C00FFFF9C00FFFF9C00FFCE31008400000084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000031CEFF000000000031CE
      FF00FFFFFF0031CEFF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF008484
      8400000000000000000000000000000000000000000084848400FFFFFF00FF63
      3100FF633100FF633100FF633100FF6331009CFFFF00FFFFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF00848484009CFFFF009CFFFF009CFFFF00CEFFFF00CEFF
      FF00000000000000000000000000000000008400000084000000840000008400
      0000FFFF9C00FFCE3100840000008484840084000000FFCE3100FF9C0000FF9C
      000000000000000000000000000000000000000000000000000031CEFF0031CE
      FF0031CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400FFFFFF000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF0084848400000000000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      00000000000084848400848484009CFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF000000000000000000000000000000000000000000000000008400
      0000FFCE310084000000848484008484840084000000FFCE3100FF9C0000FF9C
      00000000000000000000000000000000000031CEFF0031CEFF0031CEFF008484
      840031CEFF0031CEFF0031CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF000000
      00000000000000FFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000094949400CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00F7FFFF00F7FFFF0000000000000000000000000000000000000000008400
      00008400000084848400848484008484840084848400FFFF9C00FF9C0000FF9C
      000000000000000000000000000000000000000000000000000031CEFF0031CE
      FF0031CEFF008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949400CEFFFF00F7FFFF00F7FF
      FF00949494009494940000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400FFFF9C00FF9C
      0000000000000000000000000000000000000000000031CEFF000000000031CE
      FF000000000031CEFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5B5B500B5B5B500B5B5
      B500000000000000000000000000000000000000000000000000000000000000
      000000000000848484008484840084848400848484008484840084848400FFFF
      9C000000000000000000000000000000000000000000000000000000000031CE
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002942420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000018180000FFFF0063A5A50031525200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84008400000084848400000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400848484008484840000000000C6C6
      C600FFFFFF00C6C6C60084848400000000000000000000000000FF633100FF63
      3100FF633100FF6331000000000000000000000000000000000000000000FF63
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A0000FFFF0000ADAD0000F7F70000A5A500183131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      00008400000084000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C6008484840000000000C6C6C600848484008484840000000000C6C6
      C600FFFFFF00C6C6C6008484840000000000FF633100FF9C3100FF9C3100FF9C
      3100FF6331000000000000000000000000000000000029292900FF633100FF9C
      3100FF6331000000000000000000000000000000000000000000000000000000
      0000000000000073730000A5A50000FFFF0000DEDE0000D6D600A5BDBD000018
      1800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008400
      00008400000084000000848484000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C6008484840000000000C6C6C600848484008484840000000000C6C6
      C600FFFFFF00C6C6C6008484840000000000FF633100FFFF9C00FFCE31009C31
      00000000000000000000000000000000000029292900FF633100FF9C3100FF9C
      3100FF9C3100CE6300009C310000000000000000000000000000000000000000
      00003939390000CECE0000F7F70000DEDE0000CECE0000F7F70010B5B50000E7
      E700294A4A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      00008400000084000000840000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C60084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C6008484840000000000FF633100FFFF9C009C3100000000
      0000000000000000000000000000FF633100FF633100FFCE3100FFCE3100FF9C
      3100FF9C3100CE6300009C310000000000000000000000000000000000000000
      00000031310000EFEF0000CECE0000D6D60000EFEF0000C6C60010FFFF004AC6
      C60063BDBD003152520000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C6008484840000000000FF633100FFFF9C00FF9C31009C31
      0000292929000000000000000000FF633100FFFFCE00FFFF9C00FFCE3100FFCE
      3100FF9C3100CE6300009C31000000000000000000000000000000000000BDA5
      A500005252006BD6D60000DEDE0000FFFF0000BDBD0010FFFF005AB5B50000EF
      EF0000E7E70018CECE0021212100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600848484008484840084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C6008484840000000000FF633100FFFF9C00FFCE3100FF9C
      31009C310000292929000000000000000000FF633100FFFFCE00FFFF9C00FFCE
      3100FFCE3100CE9C3100CE630000000000000000000000000000000000008C00
      0000A54A0000004242009CCECE000094940000FFFF0052BDBD0000F7F70000F7
      F7007BDEDE00005A5A0021212100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C6008484840000000000FF633100FFFF9C00FFFFCE00FFCE
      3100FF9C31009C310000000000000000000000000000FF633100FFFFCE00FFFF
      9C00FFCE3100CE9C3100CE630000000000000000000000000000BD9C9C00FFFF
      0000F7F731008C4A4A001042420000FFFF0039CECE0000E7E70018DEDE0010B5
      B500003131003939390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C6008484840000000000FF633100FFFFCE00FFCE31000000
      0000000000000000000000000000000000000000000000000000FF633100FFFF
      CE0000000000FFCE3100CE630000000000000000000000000000BD9C9C00FFFF
      0000B5B58C00C69473007B310000004A4A0029C6C60031848400004242005252
      5200000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C6008484840000000000FF633100FFFF9C00000000000000
      000000000000000000000000000000000000000000000000000000000000FF63
      31000000000000000000CE9C31000000000000000000C6BDBD00B5631000FFFF
      F700BDADAD008473000084000000942121002121210021212100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C6008484840000000000FF633100FFCE3100FF9C31000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFCE31009C31000000000000C6841000FFFFE7008C8C
      2100B5848400C6B5B500C6B5B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000084848400000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C600848484000000000000000000FF633100FFCE3100FF9C
      3100000000000000000000000000000000000000000000000000000000000000
      000000000000FF9C3100CE6300000000000094393900F7F76B009C843900AD84
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF000000000084848400000000000000000000000000FF633100FF63
      3100FF633100CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE6300000000000000000000943939007B7B0000AD6B6B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000008484840000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000424D3E000000000000003E000000
      2800000040000000800000000100010000000000000400000000000000000000
      000000000000000000000000FFFFFF00FFFFF007FFFF0000BFFDE003FFCF0000
      BFFDE001FFC70000BFFDC001F8030000BDBD8000F8010000B99D8000F8030000
      B18D8000FFC70000A185C001FFCF0000A185C001F3FF0000B18DE003E3FF0000
      B99DF007C03F0000BDBDFC1F803F0000BFFDFC1FC03F0000BFFDF80FE3FF0000
      BFFDF80FF3FF0000FFFFF80FFFFF0000FE7FFE7FFE7FFFFFFC3FFC7FFE3FFD7F
      F81FF87FFE1FFD7FF00FF07FFE0FFD7FE007E07FFE07BD7BC003C00000039D73
      8001800000018D6300000000000085430000000000008543F81F800000018D63
      F81FC00000039D73F81FE07FFE07BD7BF81FF07FFE0FFD7FF81FF87FFE1FFD7F
      F81FFC7FFE3FFD7FF81FFE7FFE7FFFFFFFFFFFFFFFFFF81F000FFFFFFFFFF81F
      0007E000FE07F81F0003C000FDE3F81F0001C000FBF1F81F000180008071F81F
      000180008051F81F000100008041000000010000804100008001000080438001
      C00180008041C003E0018000807FE007F1118000807FF00FF999C07F80FFF81F
      FDDDE0FF81FFFC3FFFFFFFFFFFFFFE7FFE000000DFFF007F000000008002007F
      0000000080038003000000008001C00300000000C001C00700000000C0038007
      00000000C003000700000000C003000300000000C003000300000000C0030001
      00000000C003000300000000C003800300000000C0078001000000008003C001
      00000000001DFC01FFFF00009FFFFE078001FFBFFF18FFFFFFFF001FFC000000
      8001001FF0000000FFFF0007C001000080010007C003000075D60007C0030000
      00000007800300007416000300010000000100038001000055D9000100000000
      000000040000000077760006000000008001000700010000FFFF000780030000
      8001C007C0070000FFFFC007E00FFFFFDFFFFFFFFFFFFFFF8002FFFFFFFF8001
      80030000F00FFFFF80010000F81FFE7FC0010000FC3FFC3FC0030000FE7FF81F
      C0030000FFFFF00FC00300008001FFFFC0030000FFFFFFFFC00300008001F00F
      C0030000FFFFF81FC0030000FE7FFC3FC0070000FC3FFE7F80030000F81FFFFF
      001D0000F00F80019FFFFFFFFFFFFFFFFC7F0000E001FFFFF01F0000E0018007
      C0070000E001800780010000E00180008001F807E00180000001F807E0018000
      0000E807E00180000000E007E00180000100E007E001800700000007E0018007
      80010007A0018007E0070007C0038003F803E0070007800BFE00E007C00F801F
      FF03F807ABFF803FFF8FF807EFFFFFFFFFFFFFFFFFFF8001FFF7FE7F81F70000
      C1E7FC3F9DE3000081C7F81FCFE300000381F80FE7C100000700F007F3C10000
      0E00F003B9F700000600E00181F700000300E001FFF700000000C00388F70000
      0000C00F9CF700000000803FC1F70000000081FFC9F7000080010FFFE3F70000
      C0031FFFE3F70000FFFFFFFFF7F7800100000000000000000000000000000000
      000000000000}
  end
  inherited IconosXP: TImageList
    Left = 72
    Top = 220
    Bitmap = {
      494C010130003200100010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000D0000000010020000000000000D0
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000525A420008313900000008002118
      31005A4A4A0084636300846B63007B3129000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5736300BD737B007B52730042316B0018217300081852000010
      73004A5294008C94AD00EFEFF700000000000000000000000000000000003921
      2900633929007B422100733918004A29080073391000633921004A3129002921
      4A005252840000000000000000000000000031526300E7F7FF005ACEFF0031B5
      E700108CB500085A7300185A6300317B8400429CAD005AC6D6006BDEE70073E7
      F700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8C00C64A39000829A5000829A5001831A50010299C0000104A00425294000021
      A5000818940000188400001873000000000000000000BDA58400944A10008C4A
      10008C521800844A1800844208008463420039210800844A10007B4A10007339
      08006B3908006331100000000000000000001084AD008CD6EF0073DEFF0073DE
      FF007BDEFF007BE7FF006BD6FF004AC6EF001094BD00106B8C00215A63003973
      7B0052B5BD00A5E7FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C524A009431
      1800842110002131BD006373D6006B7BDE00314AD600636BB5005A7BF7001021
      73001831CE001029B500001884000000000000000000AD733900B57B3900BD8C
      5200C68C5A00BD7B42004A311800E7AD73009C735200B56B2100AD6B21009C5A
      1800844A10006331080000000000000000001084B50031B5DE00B5F7FF007BE7
      FF007BE7FF007BE7FF007BE7FF007BE7FF0084E7FF0084EFFF007BE7FF0052CE
      EF003163630073D6DE0000000000000000000000000000000000B5EFFF0073D6
      EF006BC6DE006BC6D6006BBDD6006BBDD6006BC6DE007BD6EF007BE7FF000000
      000000000000000000000000000000000000000000007B524A008C2918008421
      100084211000522963007384E700737BDE00212973008C9CFF006B84EF005263
      B5001829D6001029B50000218C00000000000000000094633900CE9C6300DEB5
      8C00D6AD7B00C6844200BD9C7300EFC68C00D69C63005A422100C6843100B573
      2900945218006B3108000000000000000000108CBD0039BDEF00EFFFFF0084EF
      FF008CEFFF008CEFFF008CEFFF008CEFFF008CEFFF008CEFFF008CEFFF0084E7
      FF00188CAD002139520000000000000000000000000039A5D60073737B00635A
      63008C6B6B00A5737300A5737300A57373006B5A5A0042525A00396B73006BBD
      CE00188CAD00000000000000000000000000297B9C008C2918008C2918008C31
      18009431210094392100215A94002942DE00185A84004AADD60031ADE700085A
      8400082973000021A5009C312100000000000000000000000000C6945200DEB5
      8400D6A56B0052422900EFC68C00EFBD8C00DEA57300BD946B00BD732100AD63
      21008C4A100029296B0000000000000000001894BD0052C6F7008CCEE7008CF7
      FF0094F7FF0094F7FF0094FFFF008CF7FF0084EFFF008CF7FF0094FFFF007BE7
      FF008CEFF700292121002121210000000000107BA5008C7B7B00F7E7E700F7DE
      DE00FFE7E700FFEFEF00FFFFFF00FFEFEF00FFEFEF00FFFFFF00D6949400424A
      52005A9CA50029212100212121000000000084312900943118009C392100A542
      2900AD5239009C5A3900086B100000526B0084D6F70084D6F7004ABDEF001094
      D6001084BD003918180031420000D6CEC60000000000000000009C392100C68C
      4200C6843900185A7B0042A5CE004ABDEF0021A5DE000873A500394239009C52
      10005A635A00000000000000000000000000189CCE0063CEFF0039B5E700BDFF
      FF0094FFFF009CFFFF006BD6FF0063CEFF0063C6FF006BD6FF006BCEFF0084EF
      FF00CEFFFF00086384005A52520000000000BDADAD00E7BDBD00AD7B7B00CEB5
      B500A57B7B00BD949400B5848400D69C9C00FFADAD00FFADAD00FFA5A500FFD6
      D6006352520000213100292929004A4242009C311800A5422100AD4A3100BD5A
      3900C6634A0084733900080808006BCEF70094DEF70094D6F70063C6F700319C
      DE002984BD0010527300002100005A3918000000000000000000000000004221
      1000005A84007BD6F70084D6F70063CEF70031ADE7000894D600108CC6002173
      94002173AD0000000000000000000000000039ADD6006BD6FF0063CEFF00ADDE
      EF00EFFFFF00BDF7FF0094E7FF00B5FFFF00ADEFFF00E7FFFF0084CEFF0073DE
      FF00D6FFFF0084D6EF004A4A4A0042292900E7C6C6008C7394005A73E7008C6B
      7B00DEC6C600D6BDBD00A57B7B00B58C8C00C6ADAD00E7DEDE00B58C8C00C684
      8400FFE7E700FFE7E700FFDEDE0021101000B54A2900BD523100C65A4200D66B
      4A006BA54200184210002929290063B5DE008CD6F70084D6F70052BDEF00399C
      DE00318CBD0021526B00000000003131000000000000000000006B3121000000
      000073CEF7008CDEF70094DEF7007BD6F70042B5EF002194D6002184C6002184
      B500000000000000000000000000000000004AB5D6007BE7FF007BE7FF007BE7
      FF0063BDD6006B9CAD0073C6C600CEEFF700BDFFFF0094FFFF00F7FFFF008CCE
      FF007BD6FF00FFFFFF0018526B00392929004AA5C600737B7B00D6CECE00D6BD
      BD00BD8C6B00D6842900CEB5B5009C636300AD84840084846300B58C8C00C68C
      8C00CE8C8C00FFB5B500B57B7B0039212100CE633900D66B4A00DE7B5A0063C6
      390039E7100029211800393939004273840073CEF70063C6F7004AB5EF004AAD
      E7004AA5CE000818210000000000214A00000000000000000000101010001010
      100073CEF70094DEF70094D6F70073CEF7004AB5EF00399CD6002984BD003994
      BD00000000000010100000000000000000006BC6E7008CF7FF008CF7FF008CF7
      FF009CB5B500CEBD9C00FFF7BD00D6E7BD006BC6DE00ADDEF700CEEFFF00EFFF
      FF00B5EFFF00FFFFFF006BC6DE0042313100528C9C00738C9400739494004A7B
      84005A636300736363009C8C8C00BDADAD00DEC6C600C6A5A500F7C6C600D69C
      9C00F7BDBD00A58C8C0063BDDE0000000000D67B4A00E78C6B009CBD63004AD6
      08004AFF0000395A290031313100393939003963730021212100101010000000
      0000295A73000000000000000000393908000000000000000000212121003131
      31006BCEF70084D6F70084D6F7005AC6EF004AB5EF00399CD600398CC600398C
      B500000000000000000000000000000000008CD6EF0094FFFF009CFFFF009CFF
      FF00BDC6C600BDBDB500FFFFEF00FFFFCE00ADA58400D6AD8400F7CE9400DEF7
      EF006B949C00215A6B002984A500735252009CA5AD0063A5A5007BD6D6008CCE
      CE009C9C9C009C9C9400D6D6CE00FFFFCE000000000000000000F7CE9400DEF7
      E7006B949C00000000000000000000000000DE845A00E79C730052DE29007BF7
      39009CFF39009CE742002121210063636300848484007B7B7B004A4A4A000808
      0800000000000000000000290000734231000000000000000000292929003939
      3900529CBD006BCEF7006BC6F70052BDEF004AB5EF004AADDE004AA5D6002952
      6B000000000000000000000000000000000039ADCE00A5FFFF009CFFFF009CFF
      FF00BDCECE00D6C6B500FFFFFF00FFFFE700B5B59C0029292900C6B59400F7EF
      E70084848C00292121004A393100000000006BB5CE00C6C6C600B5BDBD00A5BD
      BD00ADADAD0094948C0084848400EFEFD6000000000000000000000000000000
      000000000000000000000000000000000000AD948400ADAD5A0039DE180084FF
      3900ADFF6300C6FF73007BAD4A003939390084848400737373004A4A4A000808
      08000000000000000000086B00007B5252000000000000000000181818004242
      4200313939004A94AD00213131001010100008080800081821004294B5000000
      0000000000000000000000000000000000000073A500CEEFF700D6FFFF00D6FF
      FF00C6D6CE00CEBDAD00FFFFFF00FFFFF700FFFFE700DEDEBD0063524A00FFFF
      D6008484840039212100735A5A0000000000000000000000000000000000A5C6
      C6009C9C9C009C9C9400BDBDBD00F7F7EF000000000000000000000000000000
      0000000000000000000000000000000000000073A5009CBD520018D6080073F7
      42009CFF5A00CEFF9400FFF7EF00CEB5AD002921210021212100181818000000
      00000831000000B500008C422100000000000000000000000000081008004242
      42005A5A5A006B6B6B006B6B6B004A4A4A002121210000000000000000000000
      0000000000000084000000000000000000000000000000000000E7F7FF00C6E7
      EF00A5D6E700F7F7F700EFD6BD00FFFFFF00FFFFFF00FFFFE700B5B59400C6B5
      94008C8C8C00292110000000000000000000000000000000000000000000D6DE
      DE009CCEDE00F7EFEF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000319CBD008CD6520039F7
      10007BFF5A00D6FFB500FFF7D600BDF78C0063FF52007BFF3900FF843100FF5A
      0800DE3900005A520000000000000000000000000000000000006BA539002929
      2900636363008C8C8C008C8C8C00636363003939390000000000000000000000
      0000100000000000000000000000000000000000000000000000000000000000
      0000000000004A84A500F7F7F700CEB59C00D6D6CE00F7E7CE00BDAD9400B5B5
      B500295A7B006B524A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000528CA500F7CE
      AD00F7DEB500FFDEBD0094F763005AEF52005ADE5A0052F74A00FF7B3100F752
      0800AD4218000000000000000000000000000000000000000000000000007363
      5200313131006B6B6B006B6B6B005A5A5A002929290000000000000000000000
      0000AD4218000000000000000000000000000000000000000000000000000000
      000000000000000000006BCEDE00C6CECE00DEDEDE00CED6D600A5ADAD005AB5
      C60063DEEF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDDED600FFDEBD00F7D694009CE74200A5CE4200EF8C3900E76B390073A5
      9C00000000000000000000000000000000000000000000000000000000000000
      000094ADAD0021212100212121002121210008080800000000004A2110000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B59494009C3939006329310000000000000000000000
      0000000000000000000000000000000000006B52310010100800000029004242
      7300947B8400BD9C9C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010100800000021004239
      6B00947B84000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006B52310018100800100818003931
      5200735A5A0094736B008C6B6B007B3129005221210018213100293142001008
      4200C6BDB500CECECE00F7F7F700FFFFFF000000000000000000000000000000
      0000DED6D600B55A5A00E79C9C00EFADA500ADA5A500AD847B0084426B000000
      0000000000000000000000000000000000005A393100D69C9C00D69C9C00846B
      6B00525252005A2929009C6B6B00CE8C8C00A5949400AD847B0084426B000000
      00000000000000000000000000000000000052393100734A42006B3939004229
      2900211818004A292900000000000000000000000000AD7B7B007B426B005A73
      F700FFFFFF000000000000000000000000004A3129009CCEEF0021ADD60029B5
      DE0031BDDE0039C6E70042CEE70052D6EF005AD6EF0063DEEF006BE7F70073EF
      F70084F7FF0063524A00B5B5B500F7F7F7000000000000000000E7E7E700C673
      7300E7BDB500EFBDBD00EFB5AD00EF948C00B57B7B00BD949400C68C8C009CAD
      8400FFFFFF00000000000000000000000000D6CECE00E7AD9C00FFCE9C00FFCE
      9C00F7BD9C00E7AD9C00D6A59C00A57373005A393900523939007B525A007B8C
      6B00E7E7E700FFFFFF00FFFFFF0000000000AD5A5A00B5636300C6737300EF8C
      8C00C68484004A393100CE9C9400000000005239390029212100292929002929
      21005A5A5A00E7E7E7000000000000000000187BAD009CFFFF0021A5CE006BE7
      F7006BE7F7006BE7F7006BE7F7006BE7F7006BE7F7006BE7F7006BE7F7006BE7
      F7006BE7F700ADE7FF00736B6B00E7E7E700CECECE00BD848C00DEBDB500EFD6
      D600EFC6C600EF949400EF7B7B00EFA59C00BD737300BD4A4200BD736B00CE84
      840084948C00DEDEDE00FFFFFF0000000000CECECE00FFCE9C00E7AD9C00FFE7
      AD00FFDEAD00FFD6A500FFCE9C00FFCE9C00F7BD9C00E7B59C00D6A59C00AD84
      84005A524A005A5A5A00ADADAD00FFFFFF007B4242009C5A5A008C4A4A007339
      3900DE84840073424200CEAD7B00F7C6940063636300C6C6C600BDBDBD00DEDE
      DE006B6B6B00181818009C9C9C0000000000187BAD009CFFFF00187BA500BDFF
      FF00B5FFFF00B5FFFF00B5FFFF00ADFFFF00ADFFFF00ADFFFF00A5FFFF00A5FF
      FF00A5FFFF007BE7EF00636B7300F7F7F700BD4A4A00EFEFEF00EFCECE00EF8C
      8C00EF9C9C00EFBDBD00EFADAD00EFA5A500BD524A00C6636300CE737300C652
      52005AC6730031944A00DEDEDE0000000000BD4A4A00FFE7B500FFDEAD00D6A5
      9C00FFF7C600FFEFBD00FFEFB500FFE7AD00FFDEAD00FFD6A500FFCE9C00FFCE
      9C00F7BD9C00CE9C9C0073737300FFFFFF00DE848400FFA5A500F7949400A55A
      5A008C4A4A00D67B7B00CEB58C004A4A420094949400B5B5B500CECECE00BDBD
      BD00DEDEDE007373730029292900FFFFFF00187BAD009CFFFF00C6FFFF00C6FF
      FF00C6FFFF00BDFFFF005AD6EF004AB5CE0039C6E7005AD6EF00B5FFFF00B5FF
      FF00ADFFFF00315A7B0029292900FFFFFF00B54A4A00EF8C8C00EFC6C600EFD6
      D600EFC6C600EFBDB500EFADAD00EFA5A500C6524A00EF7B7300EF737300CE5A
      52004AC66B0042BD6300C6C6C60000000000B54A4A00FFFFCE00FFF7C600FFEF
      BD00EFD6BD00FFFFCE00FFFFCE00FFFFCE00FFF7C600FFEFBD00FFEFB500FFE7
      AD00D6A59C00E7B59C0063636300FFFFFF00E78C8C00FFEFEF00FFADAD00C673
      73006B313100AD636300E7E7B500525252006B6B6B0084636300524A4A00CECE
      CE00BDBDBD00F7F7F70029292900E7E7E700187BAD009CFFFF00D6FFFF00D6FF
      FF00CEFFFF0094949400948C8C0094948400A5949400EFC6C60042BDD600BDFF
      FF00BDFFFF006B5A52002929210000000000BD525200EFE7E700EFD6D600EFCE
      CE00EFC6C600EFBDB500EFADAD00EFA5A500CE4A4A00C6524A00EF7B7300D652
      4A0052C67300319C52005A393900B5ADAD00BD525200FFFFD600FFFFD600FFFF
      CE00F7EFC600FFFFDE00FFFFDE00FFFFDE00FFFFD600FFFFCE00FFFFCE00DEBD
      AD00FFD69C00FFCE9C0029212100ADADAD0000000000E7848400FFA5A500BD6B
      6B007B3939005A393900106394004A4A4A00524A4A00736B6B00947373005A4A
      4A00D6D6D600B5B5B500737373006B6B6B00187BAD0094FFFF00DEFFFF00DEFF
      FF00ADADAD00EFDEAD00FFF7DE00FFEFCE00FFFFFF00F7E7BD00F7C6C6004ACE
      E700C6FFFF005A4A4200736B6B0000000000BD525200EFE7E700EFD6D600EFCE
      CE00EFC6C600EFBDB500EFADAD00EFA5A500CE4A4200D65A5A00E76B6B00D64A
      4A005ACE7B0039B55A00849C8400734A4A00CE7B7B00FFFFDE00FFFFDE00FFFF
      DE00FFFFD600DEB5AD00FFFFF700FFFFEF00FFFFE700FFFFE700EFDEC600FFEF
      BD00FFEFB500FFE7AD0042524200734A4A00000000000000000000000000F7E7
      C600B56B6B00294A6300399CFF0042424200636363009C9C9C007B7B7B009473
      7300B5B5B500A5A5A500A5A5A50042292900107BAD007BEFF700EFFFFF00ADB5
      B500DEC6A500FFF7BD00FFEFBD00FFEFB500FFDEAD00FFFFF700B5B59C007384
      8C00D6FFFF00524239009C9C9C0000000000B5525200EFE7E700EFD6D600EFCE
      CE00EFC6C600EFBDB500EFADAD00EFA5A500CE423900E7737300F77B7300D64A
      420063CE7B0039AD5A0084635A006B4A4A00BD7B7B00FFFFEF00FFFFE700FFFF
      DE00C6ADAD00ADF7FF00B5B5BD00E7C6C600F7E7E700EFDED600FFF7CE00FFFF
      CE00FFFFCE00FFFFC600423131006B4A4A000000000000000000000000000000
      0000FFA5A500217394008CEFFF003131310031313100CECECE009C9C9C006B63
      630094949400ADADAD00A5A5A5004A313100107BAD0063DEEF00F7FFFF00B5B5
      B500FFEFBD00FFFFD600FFFFCE009C846300DEBD9400FFD69C00FFEFC600CEAD
      AD00CEFFFF005A4239009C9C9C0000000000B5525200EFE7E700EFD6D600EFCE
      CE00EFC6C600EFBDB500EFADAD00EFA5A500F7393900F7423900E7393100DE42
      390052C6730039AD5A00946B6B007B5A5200CE949400FFFFF700DEB5AD00B5F7
      FF00F7FFFF00F7FFFF00EFFFFF00E7FFFF00C6F7FF00BDF7FF0094C6DE00FFFF
      D600FFFFD600FFFFD6004A3939007B5A5200000000000000000000000000B5E7
      EF00DE8C8C00ADC6CE0084DEE7006BBDCE003939390042424200737373003939
      39007B7B7B00949494004A4A4A0073524A00087BA50052CEE700FFFFFF00CECE
      CE00FFE7CE00FFFFFF00FFFFDE009C9C84007B6B5200FFE7B500F7E7BD00AD9C
      9C00EFFFFF00523931004A42420000000000BD524A00EFE7E700EFD6D600EFCE
      CE00EFC6C600EFBDBD00EFBDBD00F7D6D600FF9C9400F74A4200F7393100F742
      39006BCE840039AD5A00A57B7B007B525200BD636300CE9C9C00ADCEDE00FFFF
      FF00FFFFFF00FFFFFF00F7FFFF00EFFFFF00EFFFFF00E7FFFF00DEFFFF0094C6
      DE00FFFFDE00FFFFDE00524242007B525200000000000000000000000000D6A5
      A500BD6B6B00E7E7E700633939004AB5DE0021425A00393939004A4A4A005252
      5200636363007373730031292900000000000873A50039C6E700FFFFFF00D6D6
      D600C6BDB500FFFFFF00FFFFF700FFFFDE00E7E7B5007B6B520094948C00739C
      A500F7FFFF00423129003129290000000000C6635A00EFEFEF00EFCECE00EFBD
      BD00F7BDB500F7BDB500F7BDB500F7BDB500FFBDB500F7BDBD00DEADA500D642
      420039BD630039B55A009C7373007B52520000000000DECECE009CEFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7FFFF00B5DEF7008CC6EF006BAD
      E7008CA5D600FFFFE700523939007B525200000000000000000000000000B56B
      6B007B525200A55A5A008C4242006B737300000000008CADB500393939004242
      420042424200ADA59C0000000000000000000873A50021B5DE00FFFFFF00FFFF
      FF00CECECE00BDAD9C00FFFFFF00A5CEFF00FFFFCE00D6C6A5009C9C9C00FFFF
      FF00FFFFFF005A4239004A39310000000000B5ADA5008C5A5A00BD737300D66B
      6300E7737300DE6B6300C66B5A00AD735A00A59C8400ADD6B500B5E7BD0084D6
      9C0052C6730039B55A00A57B7B007B5252000000000000000000BD7B7B0063B5
      FF0052B5FF0073CEFF0094DEFF0094D6FF0094CEFF008CC6FF0084BDFF0094B5
      E700A5A5CE00C69C9C007B635A0000000000000000000000000000000000D694
      9400A5525200CE636300AD5252007BB5DE000000000000000000000000000000
      0000000000000000000000000000000000000073A50010A5D600FFFFFF00FFFF
      FF00FFFFFF00ADADAD00EFEFEF00D6D6D600D6D6D600A5A5A500FFFFFF00FFFF
      FF00FFFFFF0063423900735A5A0000000000000000000000000000000000B5E7
      BD0094DEA5008CDEA5008CD69C008CD69C008CDEA5008CD69C007BD6940042C6
      630031844200425A3900AD6363007B525200000000000000000000000000B5D6
      B500A5E7EF0094EFFF0094E7FF0094DEFF0094D6FF0094CEFF008CC6FF008CC6
      FF00BD949C0042523900000000000000000000000000000000009C9C9C00EFB5
      B50084424200AD5252008CB5CE00000000000000000000000000000000000000
      000000000000000000000000000000000000006BA500009CCE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00312918009C5A5A0000000000000000000000000000000000DEE7
      EF00CED6A500526B4A005A9C6B00528C63007B9C7B00A5A59C00CEBDBD00DECE
      CE00E7DEDE00EFCECE00DE9C9C007B4A4A000000000000000000000000000000
      0000CEC6A500A5EFEF0094F7FF0094EFFF0094E7FF0094D6FF00A5BDDE00B59C
      9C00E7DEDE000000000000000000000000000000000000000000EFD6D600BD7B
      7B006B4239009CE7E70000000000000000000000000000000000000000000000
      000000000000000000000000000000000000006BA500009CCE00297BAD00297B
      AD00297BAD00297BAD00297BAD00297BAD00297BAD00297BAD00297BAD00297B
      AD00297BAD006B524A00CE949400000000000000000000000000000000000000
      000000000000848484009C848400C69C9C00D6ADAD00D6ADAD00C69C9C009C73
      73008C6B6B0094848400B5ADAD00E7E7E7000000000000000000000000000000
      0000000000008C848400ADD6D6009CF7FF0094EFFF00C69C9C00B59494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001073A50000639C0063DEEF0063DE
      EF0063DEEF0063DEEF0063DEEF0063DEEF0063DEEF0063DEEF0063DEEF0063DE
      EF0063DEEF006B5A5A00ADA5A500000000006B52310021181000080000000808
      0800000800000818180000000000000000000000000000000000394A52001808
      08002910100042424A00293139005A5A52000000000000000000000031000000
      630000005200001031000018390000294A0000214A0010214200293952000000
      630000004A000808080000000000000000000000000000000000000000000000
      000008085A00847394009C848C00BD9C9C00BD9C9C009C848C00737384000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005A393100C6A5A500C6A5A500C69C
      9C003931310018393900000000000000000000000000000000004A424200C6A5
      A500C6A5A500C69C9C00422929001829290000000000000000003952FF006373
      FF005263FF003952FF003952FF00395AFF00425AFF003952FF004A63FF006373
      FF002942FF001010CE0000000000000000000000000000000000CEADAD00DED6
      D600E7E7E700DEDEDE00DEDEDE00DED6D600DECECE00D6CECE00C6ADAD00CEA5
      A500C69C9C004A63FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6CECE00F7F7F700CEADAD00AD84
      8400CE9C9C00BDCED60000000000000000000000000000000000D6CECE00F7F7
      F700CEADAD00AD848400CE9C9C004229210000000000000000004239DE000000
      FF000008F7000000B5000818BD002939CE001829C6000000AD000000CE000000
      BD0000006300A57B8400000000000000000000000000EFE7E700D6C6C600EFEF
      EF00F7F7F700EFEFEF00EFEFEF00DEDEDE00DED6D600D6ADAD00CEA5A500CEA5
      A500B58C8C00BD8C8C001818D600000000000000000000000000000000000000
      00000000000000000000CEB5B500947B7B00BD94940000000000000000000000
      000000000000000000000000000000000000CECECE00DE947300DE947300CE6B
      6B004A636300A5CEDE00B5BDC6007384840063635A00A5A59400BDCECE00DE94
      7300DE947300CE6B6B0052525200392921000000000000000000000000005229
      73003142DE004A4A84005A5A5A000000000084847B0039394A00525AB5000808
      A500CE8C730000000000000000000000000000000000CEADAD00D6C6C600F7F7
      F700FFFFFF00F7F7F700EFEFEF00DEDEDE00CEA5A500CE8C8C00CE8C8C00CE8C
      8C00B58C8C00BD8C940000000000000000000000000000000000000000000000
      0000E7E7E700636363008C8C8C007373730039292900736363004A52A5000000
      0000000000000000000000000000000000007394A500FFB53100FFBD4200FFBD
      4A00DE947300212121002121210021ADDE00186B84002121210042424200FFB5
      3100FFBD4200FFBD4A00DE9473002118080000000000000000004231A500394A
      DE006B6B6B00F7F7F700EFEFEF00EFEFEF00D6D6D600DEDEDE00ADA5A5004A52
      84000008AD00EFB54A000000000000000000000000000000000000000000DED6
      D600CE949400D6ADAD00E7DEDE00D6BDBD00CE9C9C00CE6B6B00CE6B6B00CE7B
      7B00BD94940000000000000000000000000000000000EFAD3100ADA5A5008C63
      63004A4A4A00F7F7F7008CD6A5009C9C9C00AD9C9C0084737300313129002929
      4A00EFEFEF00000000000000000000000000D6B5B500FFCE6300FFCE6B00FFCE
      6300DE9473009C9C9C009C9C9C0029ADD60029ADD6009C9C9C00D6B5B500FFCE
      6300FFCE6B00FFCE6300DE9473001008000000000000BD948C000821F7009C9C
      9C00FFFFFF00DEDEDE00CECECE00B5B5B500ADADAD00ADADAD00C6C6C600C6C6
      C6003942A500080894000000000000000000000000000000000000000000847B
      D600BD848400FFA51000F7AD6300CE949400C6737300B54A4A00B54A4A00BD7B
      7B0094AD9400B5BDB50000000000000000007B6B6B008C8C8C00636363007373
      7300DEDEDE00E7E7E700D6D6D600CECECE00B5A5A500BD9C9C00C69C9C008463
      6300424242009C9C9C00F7F7F70000000000D6B5B500FFDE8C00FFEFA500FFE7
      9400DE947300A5A5A500000000009C9C9C0021212100ADADB500D6B5B500FFDE
      8C00FFEFA500FFE79400DE94730018080000000000001008F7005263E7008484
      7B00FFFFFF00E7E7E700D6D6D600C6C6C600ADADAD009C9C9C009C9C9C00CECE
      CE008C8C8C000000AD00AD737B0000000000000000000000000000000000CEA5
      A500D69C9400FFB52900FFB53100FFB53100FFB53100D6A55200A58C5A00BD6B
      6B00BDADAD0031B54A002984310000000000DEDEDE00DEDEDE00DEDEDE00EFEF
      EF00E7E7E700E7DED600FFDEB500FFFFFF00F7D6AD00B5ADAD00AD9C9C00D69C
      9C00E79C9C00946363004A4A4A00CECECE00D6B5B500D6B5B500D6C6AD00EFD6
      A500DE947300009C7B00000000009C9C9C009C9C9C004273E700D6B5B500D6B5
      B500D6C6AD00EFD6A500DE94730018080000000000000010FF00CED6F700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE00B5B5B5009C9C9C00B5B5
      B500DEDEDE000000BD0042298C0000000000000000000000000000000000C69C
      9C00E7A55200FFBD4200FFBD4A00FFC64A00FFC64A005A841800088C1800D6AD
      3900187B10004AE7840031B5520000000000EFEFEF00F7F7F700F7DEC600F7CE
      A500F7EFE700F7E7D600FFDEB500FFFFFF00FFD6A500F7BD7B00EFA55A00AD8C
      6B008C848400EF949400CE848400BDBDBD000000000000000000000000000000
      0000319C4200219C10008C9C9C00847B7B006352630042424A009CA5AD00DEDE
      DE000000000000000000C6BDBD0021100000000000000829FF0063635200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000212121008C8C8C00C6C6
      C600D6D6D60000009C000808A50000000000000000000000000000000000B58C
      8400FFC64A00FFC65A00FFCE6300FFCE6300FFCE6B005A8C2100088C180029C6
      520031CE630039DE73001084180000000000000000001029F70094848400ADAD
      AD00C6C6BD00F7E7D600FFDEB500FFFFFF00FFD6A500F7BD7B00EFA55A00DE8C
      3900C6732100736B5A009C7373009C9C9C000000000000000000000000000000
      000000000000CEBDBD00EFEFEF00E7DEDE00D6CECE00BD9C9C00734A1800EF9C
      210000000000000000000000000000000000000000002139FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00F7F7F700DEDEDE00E7E7
      E700FFFFFF000008BD001810AD0000000000000000004A6BF7008C8C9400948C
      8C00A59C9400AD9C9400BDA5A500A5947B00F7D67B005A942900088C080018B5
      390021BD420000730800B5C6AD00000000000000000000000000000000000000
      0000000000007B7363009C948400A5A5A500DEB59400C69C73006B6B63004A4A
      4A00C6848400EF9C9C00946B6B00FFFFFF000000000000000000000000000000
      00000000000000000000CEBDBD00E7D6D600C68C8C00C68C8C00B57331000000
      00000000000000000000000000000000000000000000425AFF00848CE700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000AD00421873000000000000000000ADADAD00DEC6A500FFF7
      CE00FFEFC600FFF7D600FFFFF700ADA59400D6B5B5005A943900007B00000894
      1000089C180018A53100108C2100EFF7EF000000000000000000000000000000
      0000F7F7EF008C8C7B005A524200212921003131310073636300CE9C9C00CE9C
      9C0084737300FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000CE9C8C00FFAD2100DE947300CE6B6B004A7B84000000
      000000000000000000000000000000000000000000006384FF000818BD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF006B6B6B00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF005263BD000000DE009CA5BD0000000000B5ADAD00F7E7B500FFFFCE00FFFF
      CE00FFFFC600FFEFBD00FFE7B500FFFFF700D6CEAD00BDB59400FFEFAD00FFE7
      9C00FFE79400DEB5B50000000000000000000000000000000000CEC69C00635A
      4A0031313100525252009C9C9C00D6D6D600C6C6C600A59C9C00736B6B00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EFBD8400FFC65A00FFCE5A00FFBD4A00426373000000
      000000000000000000000000000000000000000000008CEFFF00637BFF000010
      8C00D6D6D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBDBD00BDBD
      E7000000C6001818CE000000000000000000C6C6C6008CC6F700FFFFFF00FFFF
      DE00B5A58400423939004A4A4200FFE7C6006384EF00A59C9400FFF7BD00FFEF
      AD00FFE79C00EFDEDE0000000000000000000000000063636300BDBDBD00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00E7E7E70084846B00DEAD8400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000039BDDE00EFC66B00FFDE8400FFDE8C00FFD67300526B73000000
      00000000000000000000000000000000000000000000000000008CD6FF006B84
      FF00000084009C9CBD00FFFFFF0039393100FFFFFF00FFFFFF00101873000008
      D6000008FF00000000000000000000000000C6CECE00FFF7EF00FFFFFF00FFFF
      EF00FFFFE700ADAD94005A524A00FFFFD600D6C6A500ADA59400E7D6B500FFEF
      AD00FFEFA500ADADC600000000000000000000000000CECECE009C9C9C00A59C
      9C009C525200AD847B008C848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000639CAD00E7CE8400FFEFAD00FFF7B500FFE79400215A6B000000
      00000000000000000000000000000000000000000000000000000000000094E7
      FF008494FF005A73FF001831DE001029D6000010C6001831F7002942FF001039
      E7000000000000000000000000000000000000000000EFEFEF00E7CEB500FFFF
      FF00FFFFFF00E7F7EF00FFFFCE00B5A58C00ADADAD00C6A5A500BD9C9C00AD84
      8400AD848400314AFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004AC6E7006BBDD600CEADAD00CEADAD00295A39000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A94BD006B9CF7006B84FF006B7BF7008484DE00295A4A000000
      0000000000000000000000000000000000000000000063A5BD00B5BDC600DEDE
      DE00CEC6BD00BDBDB500CECECE009CADB50063ADF70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000100808001008
      0800000000000800000008080000101010000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000080800001821000029310000394A00003942001039420039525A002108
      1000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000100808001008
      0800080808000818210000293100003942000031420010313900394A52002108
      1000391818006B637B0031394A005A5A5A004A29080073390800523931008C6B
      6B00AD8C8C00846363004A394200214A5A00428CB500426B8400000000000000
      0000000000000000000000000000000000000000000000000000423931000063
      7300009CB50000B5D60000ADCE00009CBD000094AD00008CAD0000739400005A
      730008394200000000000000000000000000000000005A422100423931000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042313100184A
      520021424200214A4A0021424A00214242002139390021393900213131002129
      2900212118003118100039180800213131006B4A3900DEDEDE00E7E7E700DED6
      D600DECECE00D6B5B500BDA5A500CE9C9C004A393900295A7300000000000000
      000000000000000000000000000000000000000000009CB5BD005AC6DE007BEF
      FF0008DEFF0000B5DE0000ADCE00009CBD00008CAD000084A500008CAD00007B
      9C00006B8C0000394A000000000000000000000000007B949C00397B84003173
      7B0008CEE7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006B4A39007394940039737B00A552
      2100DEEFEF00DEEFEF00DEEFEF00DEEFEF00DEEFEF00DEEFEF00DEEFEF00DEEF
      EF00DEEFEF00DEEFEF00CECEC6004A312900E7E7E700EFEFEF00EFEFEF00E7E7
      E700DED6D600E7D6D600CEADAD00C69C9C00CE9C9C0039180800213139000000
      00000000000000000000292121004A3939000000000052BDDE008CE7F700219C
      B50000ADDE0000BDF70000BDFF0000A5DE000094C6000084A500006B8400005A
      730000637B00005A6B000000000000000000000000000000000000000000218C
      9C0039737B00186B7B0021BDF70042A5C6005294AD0029849400000000000000
      000000000000000000000000000000000000CECED600428C9C006BA5AD00A552
      2100BDE7F700B5E7F700DEEFEF00DEEFEF00DEDEC600DEDECE00DEEFEF00BDD6
      F700B5CEF700DEEFEF00CECEC60042292100E7DEDE00F7FFFF00FFFFFF00E7E7
      E700D6C6C600D6ADAD00CE949400BD848400CE9C9C00BD845200000000000000
      0000E7B5940084635A0018291800211818000000000021A5C6006BE7FF0094F7
      FF0000F7FF0000D6FF0000A5E700008CB5000084B50000A5D60000ADDE00009C
      BD0000738C0000394A0000000000000000000000000000000000000000000000
      000000000000738C8C00316373009CB5B5009CADAD008CA5A500849C9400529C
      A5000000000000000000000000000000000073ADBD0018ADDE0010738C00A552
      210021D6FF00C6A53900DEEFEF00DEEFEF0063EF4A00FFA52100DEEFEF00425A
      DE005A4A8C00DEEFEF00CECEC600291810008C635A00D6BDB500CE8C9400DEC6
      C600CEA5A500CE737300CE737300BD737300C6843900E7A56B00393129002931
      420031522900108C2900007308000000000000000000108CA500BDFFFF0063FF
      FF0029C6E70010BDDE0000BDE700009CC60000739400006B8400005A6B00007B
      9C000094B50000637B0000000000000000000000000000000000000000000000
      000039BDD60094A5A500B5CECE00316B7B00B5C6C600BDCECE00B5CEC600A5B5
      B500849C9C0000000000000000000000000039738C0084DEFF0073D6FF00A552
      210021D6FF0021CEF700DEEFEF00DEEFEF00FFA52100E7CE9C00DEEFEF00426B
      FF00395AF700DEEFEF00CECEC6001808000000000000BD847300FFA50000FFBD
      5A00DE9C9400C6636300BD5252008C5A5200A59C8C009C633900214A290018A5
      390021AD4200188C29004AB56B0000000000000000006B84840094F7FF007BFF
      FF0052D6EF005AE7FF0021DEFF0000C6F7000073A500005A7B00004A5A000073
      940000849C000073840000000000000000000000000000000000000000000000
      00006BBDCE009CB5B500BDCECE00C6D6D600396B7B009CADAD00C6D6D600BDCE
      CE00A5B5B50073949400000000000000000031738C009CE7FF007BE7FF00A552
      2100CECECE00C6C6CE00D6E7EF00DEEFEF00C6B5BD00CED6DE00DEEFEF00CECE
      CE00C6C6CE00D6E7EF00CECEC600180800008C635A00C6949C00FFAD2100FFB5
      3100FFB52900FFBD4200EF9C5200BD6B6B002931290031C65A00189C39004ADE
      7B00106310007352520000000000000000000000000000000000C6AD4A004294
      940000CEF70084D6E7005AE7FF0008D6FF000084B500005A7B00005A73000073
      8C00086B4A000000000000000000000000000000000000000000000000000000
      00004AB5C6009CB5B500BDCECE00C6D6D600C6D6D600316B7B00A5B5B500C6D6
      D600BDCECE0094ADAD0073525200000000001884AD00A5EFFF0084EFFF00A552
      210021A5210000AD8C00DEEFEF00DEEFEF00AD6373004A84FF00DEEFEF00D6D6
      D6009C8C9400DEEFEF00CECEC6002110000084635200CE9C8400FFBD4200FFBD
      4A00FFC64A00FF9C0000E78400005A42210021CE520031B5520063E78400527B
      4200E79C5A000000000000000000000000000000000000000000000000000000
      000000000000BDA55A006BEFFF0018D6FF000073A500004A6300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D6B56B009CADAD00BDCECE00BDCECE00C6D6D600D6E7E700316B7B00C6DE
      DE00D6EFEF00B5CECE006B737300000000004294B500C6F7FF008CF7FF00A552
      210021A5390021A51800DEEFEF00DEEFEF005263D600B5B5C600DEEFEF00DEDE
      DE008C8CB500DEEFEF00CECEC600211000008C6B6300D69C6300FFC65A00FFCE
      6300DE840800C6843900FFEFD600EFC69C00D6DED60021732100393918007B52
      2900000000000000000000000000000000000000000000000000000000000000
      000000000000C6844A007BEFFF0018DEFF00008CB50000525A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000094A5A500B5C6C600CEDEDE00BDCECE00C6DEDE00B5C6C600426B
      7300CEDEDE00BDCED60094ADB5000000000029ADDE00BDF7FF0094FFFF00C65A
      0000F7A52100F7A52100F7A52100F7A52100F7A52100F7A52100F7A52100F7A5
      2100F7A52100F7A52100DEA5630018081800AD949400F7BD6300FFD66B00D6B5
      52001884C600005A9400B5845200FFDE9C00B5845200734A3100293129000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000085A94001894AD00005A7B00004A6B00214A5200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000427B94009CADAD00BDCECE00CEDEDE00CEE7E700C6D6CE007394
      94009CADAD00C6D6D600ADBDBD00000000005AC6E700ADE7F7009CFFFF00AD52
      2100E7944200E7944200E7944200E7944200E7944200E7944200E7944200E794
      4200E7944200E7944200A539000010080800D6C6C600FFD66B00FFDE840063B5
      CE0063CEFF007BE7FF0042ADDE007B8C6B00E7AD730084522900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000C6EF0000B5DE000094C600006B9C0000426B00184242000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000739C9C009CB5B500B5C6C600CEDEDE00DEF7F700D6DE
      DE00316B7B00BDCECE00ADBDC6000000000063C6E70073CEE700D6FFFF00C6FF
      FF00BDFFFF00BDFFFF00BDFFFF00BDFFFF00BDFFFF00BDFFFF0094E7FF0031B5
      DE00314A5200B5BDBD00ADB5B50008000000CEC6C600FFDE7B00FFE79400FFF7
      A50094B5A5002994C60063BDE700FFE78C00CE947B00945A3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007BBDB50000DEFF0000E7FF0000C6F700009CCE00005A8C00004A6B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000738C94009CADAD00B5BDBD00C6D6CE00BDCE
      CE007B7373006B736B009C5A5A0000000000A5DEF7008CF7FF007BEFFF004ACE
      E70018ADD600EFFFFF00D6FFFF00D6FFFF00D6FFFF00D6FFFF009CE7FF0073CE
      E7004A524A006B6B6B000000000000000000ADA5A500AD9C8C00CEBD9400F7EF
      B500FFFFCE00FFFFCE00FFEFB500FFE79C00AD737300A55A2900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DEF7D60029E7FF0042EFFF0018EFFF0000B5F7000073AD00005273000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000739CA5008C9C9C0094A5A5003142
      5A008C8C8C00427B7B00A5B5B50000000000ADDEF7009CFFFF009CFFFF009CFF
      FF009CFFFF0039BDDE0039B5DE007BCEE700BDE7F700FFFFFF00C6EFFF00BDE7
      F7005A5A5A0042737B000000000000000000A5A5A500CEC6C600D6CECE00BDA5
      A500AD8C8C00AD848400BD9C8C00E7C694009C6B6300B5520000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A58C8C0063E7FF00A5F7FF0039E7FF0000B5F700007BBD00085A73000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001884B500738C94002942
      520084949400638484007B8C7B0000000000429CBD00A5FFFF009CFFFF009CFF
      FF00D6FFFF004AA5C6007BCEE700B5E7F700DEFFFF00C6FFFF0052C6E700106B
      8400738C8C0063847B0000000000000000000000000000000000000000000000
      00005A737B0073848C00A5949400C6A5A500A5847300CE9C5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000052A5B50039D6FF0008C6FF0000A5DE000894AD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000424A
      5A00B59C9C00C6B5B5000000000000000000B58C5A004AA5C60073C6E7009CDE
      EF00399CC6004A949C0039D6F70008C6F700009CD600108CA500396B4A00424A
      5A00B59C9C000000000000000000000000000000000000000000000000000000
      00000000000008000000000000005A5A5A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000010080800181810005A525200635A5A0063635A00636363000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000808000008080800101010002118180042423900636363000000
      0000000000000000000000000000000000000000000029181000100808001008
      0800000000000808000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A5848400AD5A210073392900080000001808000031180000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C7B7B009C735200AD9C9400A5948C006352420042291800392108003921
      000000000000000000000000000000000000000000000000000000000000735A
      5A003163A5004284B5004A8CB5005AC6FF0063C6FF0042738400100800003118
      0000000000000000000000000000000000004A2908009C521000633110002929
      29001021390021425A003163840052ADE7005AC6F70042738400000000000000
      000000000000000000000000000000000000000000000000000000000000B5AD
      AD00D65A1000FF6B3100FF8C1000FFA531004A312900212121006B6B6B000000
      000000000000000000000000000000000000000000000000000000000000B5AD
      AD00C67B4A00D6DECE0073A56300FFD6AD00EFC6AD00948C7B00635A52003921
      0800000000000000000000000000000000000000000000000000000000004A5A
      7B003173C6005A5A5A00528C9C0052B5FF0063C6F70063C6FF0063C6F7001008
      0000A59C9C0000000000000000000000000052311800B55A1000C67B4A00D68C
      6300AD4208007B310800422921002131420029526300397B9C0052A5CE001008
      000000000000000000000000000000000000BDB5B500636363006B6B6B00EF84
      1000C65A3100D6731800FF732100FF9C0000FFBD5A00734A3900292929001008
      000010080800424242002921210000000000000000000000000000000000E784
      1000EFE7CE00A5BD8C0029843100BDBDB5001052FF00EFE7CE00392921001810
      0000000000000000000000000000000000000000000000000000000000005A52
      5A003173C6004AADFF0052A5FF0084C6EF006B9CB5006373730063B5CE00314A
      5A0010080800000000000000000000000000BDB5B500CE6B1000CE846300FFE7
      C600FFE7C600FFE7BD00EFB58C00C67339009C31000063311000213139002942
      4A00000000000000000000000000000000008C525200FFF7E700F7EFE700F7EF
      DE00F7EFDE00F7EFD600F7DEAD00FF841000FFA52900FFC68400CEAD9400FFCE
      AD00FFCEAD00AD7B7B003931310000000000000000000000000000000000E7DE
      CE00DEB573004A944A0039735A007B9494002173FF00DE945A00634A3900EFBD
      9C00000000000000000000000000000000000000000000000000000000005A6B
      84003173C6006B846B0094B5940063847B00427BA5004AADFF0084ADEF00425A
      6300EFBD9C000000000000000000000000008C525200CE6B1800DEAD8C00FFE7
      CE00FFE7C600FFDEBD00FFDEB500FFD6B500FFC67300E7A56B0042312900394A
      52000000000000000000000000000000000094635A00FFF7EF00FFF7EF00F7F7
      E700F7EFE700F7EFDE00F7EFDE00F7DEAD00FF9C0000FFB55200FFD69C00FFEF
      BD00E7CEAD00AD7B7B005A424200000000000000000000000000F7F7EF00DED6
      CE00FFCE9C0021842900217384006B8C7300298CFF00526BD600846B5A00D6C6
      9C00E7CEAD000000000000000000000000000000000000000000000000005A63
      6B00317BCE006B846B00ADCE9C009CD6A500B5E7B500C6FFC6009CBD9C003952
      6300D6BDA5000000000000000000000000008C5A5200CE732100E7B59C00FFEF
      D600FFE7CE004AADCE00FFE7BD00FFDEB500FFAD3900E7A56B0042312900394A
      5A00000000000000000000000000000000009C6B6300FFFFF700FFF7F700FFF7
      EF00EFEFE700EFE7DE00EFE7DE00EFE7D600F7BD6B00FFA52100FFC67B00F7CE
      9C00EFE7C600AD7B7B0052CE7B00000000000000000000000000FFF7EF00DED6
      CE00BDD6B500298C29001894BD004A949C003994FF001052FF00BDB5AD00BD9C
      7300EFDEC6000000000000000000000000000000000000000000000000005A6B
      7B00317BCE006B846B00B5D6AD006B9C73007BAD840094C6940094BD94003952
      6300DECEB5000000000000000000000000008C635A00CE6B2100EFCEBD00FFEF
      DE00ADD6D60018A5CE00E7DEC600FFC67B00C6BDAD00DE945200313129002939
      4A00D6C6AD00000000000000000000000000AD7B6B00FFFFFF00FFFFF700FFF7
      F700FFF7F700FFF7F700FFF7F700E7D6AD00FF732100FF940000FFB54A00B57B
      5A00F7E7CE00AD7B7B007B525200000000000000000000000000FFF7F700E7E7
      DE00B5D6B500BDD69C008CE7DE008CB5AD00EFE7BD00CEB59C00CED6EF007B52
      4200EFDEC6000000000000000000000000000000000000000000000000005A5A
      6300397BCE006B846B00BDE7B5006B9C6B006B9C6B006B9C6B0084AD8400314A
      5A00DECEBD000000000000000000000000008C635A00CE6B2100FFEFE700B5D6
      DE0039ADCE00FFEFD60042ADCE00E7CEB5007B7B5200FFDEAD00E78C39006339
      08005A5A52007B5A52007352520008000000BD847300FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7EF00F7F7E700F7EFE700F7EFDE00F7EFDE00F7EFDE00F7EF
      DE00F7E7D600AD7B7B008C636300000000000000000000000000FFFFF700DEB5
      8C0039BD5A000063000000CEFF00186B8C00DE9C6300084AFF008494C6008C7B
      7300EFDECE000000000000000000000000000000000000000000000000005A63
      6B003984CE006B846B00C6F7C600ADD6A50094CE9C00A5D6A5008CAD8C00314A
      6300DECEBD0000000000000000000000000084635200CE6B2100FFF7EF00FFF7
      EF00FFF7E700FFF7DE00009CCE00FFEFCE00FFDEBD00D6843100FFD6B500FFE7
      BD00EFA55A00845221003121290000000000C6947B00FFFFFF00D65A3900CE7B
      6B00CEA59C00E7DED600EFEFEF00EFEFE700EFEFE700EFEFE700F7EFE700F7EF
      DE00F7EFDE00AD7B7B00946B6B00000000000000000000000000D65A3900CEAD
      8400AD4A4A005252210000D6FF00007BAD00EFC68C003173EF000018CE007363
      5A00E7D6CE000000000000000000000000000000000000000000000000005A6B
      73003984CE006B846B00CEFFCE00C6F7C6008CBD8C0094CE9C0084AD8400314A
      5A00D6C6BD00000000000000000000000000846B5A00C6630800FFFFFF00FFFF
      F700FFF7EF00FFF7E7007BC6D600DEDED600FFE7CE00D68452004A3921007B52
      2900F7B57B00E7EFF700084AD60000003100D6A57B00FFFFF700FF7B1800FF6B
      2900DE4A2100CEAD9C00FFFFFF00FFFFF700FFF7F700FFF7EF00FFF7E700735A
      73009C94B500AD7B7B008C636300000000000000000000000000FF7B1800BD6B
      4A00B55A5200D6A5630000D6FF00008CBD00EFDEC600639CF7000042FF003921
      3900847B9C00AD7B7B0000000000000000000000000000000000000000005A5A
      6B0042A5FF0073847300DEFFDE00CEFFCE0094C694008CBD8C007BA57B002942
      5A007B738C00000000000000000000000000846B5A00C65A0000FFFFFF00FFFF
      FF00FFFFF700FFF7EF00FFF7E70018A5CE00FFEFD600D68C5200293129002942
      5200000000009473730018219C0008000800DEAD8400FFCE9400FFAD3100FF9C
      0800FF841000C68C7300FFFFFF00FFFFFF00FFFFF700FFF7F700FFF7EF00427B
      E7006394E700AD7B7B00946B6B00000000000000000000000000F7A53100CEAD
      9400CE7352006342310039CEDE00008CBD00847B7300D6CEC6002163FF003139
      9400527BB500AD7B7B0000000000000000000000000000000000000000005A6B
      7B004AA5FF007B8C7B00E7FFE700DEFFDE00CEFFCE0084B58400739C73002942
      63005273AD000000000000000000000000007B635200BD4A0000FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFF7EF0031ADD600FFEFDE00CE7B4200293129002942
      5A0000000000000000000000000000000000EFB58C00FFAD3900FFFFFF00FFC6
      7B00FFB54A00FFA51800D6AD9C00F7F7F700EFEFEF00EFEFEF00EFEFEF00E7E7
      E700E7E7E700AD7B7B00A55A5A000000000000000000FFAD3900DED6D600DEB5
      B500DEAD8C007B4A100094ADBD006BA5C600948C8C00E7DEDE00DED6D6007B6B
      7300948C8400A57B730000000000000000000000000000000000000000006373
      84004AADFF008C948C00F7FFF700E7FFE700D6FFD60073A57B006B946B00314A
      63008C7B7B000000000000000000000000008C736300BD520000C6845A00E7C6
      B500FFFFFF00FFFFFF00FFFFFF00FFFFEF00FFF7E700CE7B4200293129002942
      5A0000000000000000000000000000000000000000000000000000000000F7C6
      8400FFDEA500FFCE8C00FFBD6300844A3100BD5A5200CE7342008C523900E7DE
      DE000000000000000000000000000000000000000000DEBD8400C6AD8C00C684
      8400C673730084634A00D6AD7300ADD6F700944A4200CE734200E7D6D600C67B
      7B007B635A00DECEC60000000000000000000000000000000000000000005A63
      730052ADFF0039526B0073847300ADC6AD00D6F7D6006B9C6B00638C6300314A
      6300735A5200000000000000000000000000847B7300C65A0000C65A0000C65A
      0000C65A0000BD520000B54A0000C67B4A00D6A58C00C6733100213129003142
      5A00000000000000000000000000000000000000000000000000000000000000
      0000BD8C7300FFEFBD00FFE7AD00FFD69C00D6844A00BD521000B59494000000
      00000000000000000000000000000000000000000000EFE7E7007B94BD001829
      84001842A5008C7B6B00F7D6A5004AC6FF00C67B4A00BD521000E7DED600AD7B
      73006B524A00CEB5A50000000000000000000000000000000000000000003952
      7B0052B5FF002173F7003163C600425A94002984FF002984EF003163A500314A
      6300634A42000000000000000000000000009C9C9C00BDB59400DEC69400F7BD
      7300E7943900CE6B1000C65A0000C65A0000CE630000CE630000182939003142
      5A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DEB58C00FFF7C600DEA573005A636300000000000000
      000000000000000000000000000000000000BD8C5A0073849400317BD600214A
      B5002173D6007B6B6B00D6AD8C00FFF7C600DEA573000000000073A59C00CE8C
      6B00BD9C9C00DEBDBD0000000000000000000000000000000000000000002142
      8C005A8C940073CEDE005AADD600428CD6003184EF00395A42005ACE8400424A
      5A00BD9C9C000000000000000000000000000000000000000000000000002142
      8C004A737B004A7B840063737B008C8C7B00BDB58C00D6A5630039734A00424A
      5A00000000000000000000000000000000000000000000000000000000000000
      000008000000080808000808000063635A0063635A0063636300636363002108
      1000000000000000000000000000000000000000000031211000181008001810
      1000000000000800000008080000635A5A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000181008001808
      10000000000008000000000800005A5A5A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7D6D600FFEF
      EF00EFDED6005A524A007B6B520073635200736352007B6B5A00736B6300635A
      5A002118100000000000000000000000000000000000CE949C00F7C6AD00FFBD
      9C00EF8C5A00AD6339007B42290031212100392929005A524200635A5200635A
      5A00000000000000000000000000000000004A29080042210800392108003921
      0800392108003921080039210000392100003921000039210000392100003921
      00000000000000000000000000000000000000000000392100004A292900846B
      6300BD9494009C7373005A393900181008002110000039180000000000000000
      000000000000000000000000000000000000CEA5A500EFF7F700CED6D600BDB5
      B5008C5A2100D66B1800D66B5200D66B5200DE735A00B5521800633110005A42
      3900ADA5A50042393900000000000000000000000000CE949C00F7FFF700C6F7
      C600A5EFAD00ADEFAD009CEF9400E7DEAD00F7C69400F7946300843921004A39
      310000000000000000000000000000000000522908004A290800848484008484
      84007B7B7B007B7B7B007B7B7B007373730073737300737373006B6B6B003921
      00000000000000000000000000000000000052311800DED6D600DEDEDE00DED6
      D600DECECE00C6A5A500B5848400D6ADAD00A5737300313131006B6B6B000000
      000000000000000000000000000000000000C6B5B500636B7B00424A5A00EFA5
      3900AD4A2100A539100073633900A5390800AD421800B5522900CE634A00AD52
      210042292100ADADA500312929000000000000000000CE949C00B5EFBD00A5E7
      A500DEBD6300DEAD5A00EFBD5A00FFD68C00EFDE9C00ADE78400735221006331
      1000312118009C9C9400000000000000000052310800522908009C9C9C009494
      9400949494008C8C8C008C8C8C005A4229005A423100737373006B6B6B003921
      000000000000000000000000000000000000DED6D600EFEFEF00EFEFEF00E7E7
      E700DED6D600DECECE00A58C8C00A58C8C00CEA5A500634A4A006B6B6B003118
      0000291810009C94940000000000000000007BA5C6000863B500AD9463009C31
      00009C310000A539000029630800844A0000A53900009C3100009C391000B552
      2900AD5229007B6B5A00635A5A000000000000000000CE949400ADEFAD00ADEF
      AD00DEAD5200DE9C6300C6944A00CE8C5200BD8C4200C6943900D6843900EFB5
      7300DEAD6B009C7B4A0052525200000000005A3108005A310800ADADAD00ADAD
      AD00ADADAD00A5A5A50084736B007B522100633910007B7B7B00737373003921
      000000000000000000000000000000000000E7DEDE00F7F7F700FFFFFF00EFEF
      EF00DEDEDE00DEC6C600B5848400B57B7B00CEA5A5006B52520052424200CE9C
      9C008C73730031291800424242003129210084FFFF004A5A63009C390000AD42
      0000BD520000C65A000063630000006B0000B55A00007BF7FF009C390000844A
      1800A5635200422110007B7373000000000000000000C6949400C6F7C600E7EF
      BD00EFAD5A00E7A55A00CE9C4A00CE9C4200B5943100B5943900BD6B3100CE8C
      6B00C6846300C6945A007B736B00000000006339080063390800C6C6C600C6C6
      C600C6C6C600948C840084522100B57331009C63290042290800737373003921
      0000000000000000000000000000000000006B421800EFE7E700BD737300DECE
      CE00CEADAD00CE949400C6737300C66B6B00C6949400D6BDBD00DEBDBD00D6B5
      B500ADA5A500ADA5A5006B525200000000006BEFFF0052EFFF0031CEEF00B55A
      0000CE630000D66B000000840800008400007BF7FF005AEFFF0031DEFF004A52
      3100636331008C3910006B5A52000800000000000000CE949400EFFFEF00FFD6
      AD00EFB55A00E7AD5200C6A53900C69C3900C69C3900CE9C4200C6733100D69C
      6B00DE9C6B006B4221006B5A5200000000006B3908006B390800D6D6D600D6D6
      D6008473630084522100C67B3900B59C8400C68C5A00946329005A5242003921
      0000000000000000000000000000000000000000000094634A00FF9C1000FFC6
      6B00DEADAD00C66B6B00CE636300C66B6B00E7CECE00DEC6C600D6A5A500CE9C
      9C009C6B6B00B59C9C006BFF9C00000000009C9C9C0039E7FF0021DEFF0008CE
      FF0000B5E7009C63100008A5E700E78400006BE7EF0039E7FF0010D6FF0000CE
      FF0000BDF7008C5218004A4239002910100000000000CE949C00EFFFF700EFBD
      6300EFBD5200DEB54200C6AD3100D6AD3900DEAD4200DEAD4A00D6843100E7A5
      6B00F7BD73006B42100000000000000000006B39080073390800D6D6CE006339
      0800B5733100D69C6B00CE844200BDB5B500D6CEBD00CE9452006B4218003921
      08000000000000000000000000000000000000000000C6949400FFAD2100FFB5
      2900CE944200FFB53100E7B59400CE7B7B00CE949400D6B5B500DEBDBD00CEAD
      AD00A57B7B00AD8484009C6B6B000800000000000000EFB5630010CEF70000CE
      FF0000B5FF0008A5FF001094F70084733900EF9C1000AD5A000031CEC60000BD
      FF0008ADFF0008A5FF00392921002910180000000000CE949400D6F7CE00E7BD
      5200DEBD4A00DEBD4200D6B53900EFB54A00EFB54A00F7B55200E78C3100EFB5
      6B00C6A56B00089CEF0000000000000000007342080073420800E7E7E700DED6
      CE00C6A58400EFCEAD007B421000CECECE00B5B5B500D6A57300B57331005231
      10000000000000000000000000000000000000000000D6B5B500FFBD3900EFAD
      4A001008940073527300FFBD4200FFBD4200F7AD5A00CE6B6B00DEBDBD00CEAD
      AD00BD8C8C00CE9C9C00AD7373000800000000000000FFE7A500DE73000010AD
      310008ADF7001094FF001884F7002173EF00FFAD2100FF94000073840000007B
      000018ADE7001094F7001084F7002921290000000000CE949400C6D67B00DECE
      6300E7C66300EFC66300E7BD5200F7C65A00FFBD5A00F7BD5200EF943100FFBD
      6B00527373001094F7000000000000000000734208007B421000F7F7F700F7F7
      F700F7F7F700B59C8C00BDAD9C00D6D6D600BDBDBD006B421000DEAD84009C63
      29005229100000000000000000000000000073420800CEA5A500EFB552000000
      9C00FFCE630000009C00FFCE6300FFC65A00FFBD4A00CE7B7B00DEBDBD00CEA5
      A500A5737300BD848400B58484000808080000000000E7BD9400E77B000021BD
      420031CE63001094EF002994CE00E7EFA500FFCE5A00FF9C00004A940000637B
      000000730000639CCE00187BF7002110180000000000C6949C00DEC66300EFD6
      8C00FFD68C00FFD68C00EFCE6B00FFCE7300F7C66300EFC65200EF9C3100FFC6
      7B00005A00000000000000000000000000007B4210007B421000F7F7F700F7F7
      F700F7F7F700EFEFEF00E7E7E700D6D6D600C6C6C600ADADAD00B57B4200D6A5
      6B00945A29004A2908001873EF000000000084522900CEA57B00FFCE6300FFD6
      7300FFD67B0052429400FFD67300FFCE6B00FFCE6300CE949400DEBDBD00CE9C
      9C00BD8C8C00A5737300AD7B7B000800000000000000000000005AB57B0029CE
      630052DE7B00E7E7AD00F7FFE700FFFFCE00ADCE6B006BAD2100EF8C0000637B
      0000397B0000086BC600395A9C001808080000000000CE949400F7D68400F7E7
      AD00FFDEA500FFDEA500EFD68400F7D67B00E7CE6B00E7CE6300E7A54200DEAD
      6B0031730000000000000000000000000000844A1000844A1000844A1000844A
      10007B4210007B42100073420800733908006B3908005A31080063310800DEAD
      7B00CE8C4200945A29006B42180000000000AD948400EFBD7300FFD67B00FFDE
      8C00FFE79400FFE7940063529400FFDE8400FFD67300D6A5A500DEBDBD00CE94
      9400AD737300CE949400B58484000000000000000000000000005AB55200BDC6
      5A0094CE6300EFDE8400BDF7B500FFE79C0031CE630084AD2100EF840000DE73
      0000638C8400638C9C00636363001008080000000000CE8C8C00FFEFBD00FFEF
      BD00F7E7AD00EFDEA500DED68400E7D68400E7D67B00E7CE7300EFAD52008C5A
      1800638C8400000000000000000000000000844A1000844A1000844A1000844A
      10007B4210007B42100073420800734208006B390800633908005A310800945A
      2900EFCEAD00BD7B39005A31080000000000D6CECE00FFD67300FFDE8C00FFEF
      9C00FFEFAD00FFEFAD0000009C00FFE79400FFDE8400DEB5B500DEBDBD00CE94
      9400CE6B6B00CE6B6B00BD6B6B000000000000000000000000000000000052D6
      7B00DEEFA500ADCE6B008CDE8C004AD6730029C6520042AD2100F7A52900C673
      1000427B0000636363005A3939000000000000000000D69C940084737B00FFF7
      CE008C94A500FFF7CE00949C9C00FFE7A500D6C6B500FFE7AD00EFA563007342
      0800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007342
      0800BD946B00E7C6A5005A31080000000000F7F7F700DEBD8400FFE79C00FFF7
      AD00FFFFC600FFFFC600BDBDB500ADA59C00EFC68C00F7E7E700F7E7E700F7E7
      E700F7E7E700F7DEDE00DE949400000000000000000000000000000000000000
      000000000000D6E7A500E7DEBD00EFD68C00BDC6940063AD5200E7840000E784
      00000000000000000000000000000000000000000000AD736300C68484009484
      9400C6847B0094849400BD848400A5949C00A58C9400E7A59400A5ADBD009C5A
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006B636300E7CEBD007342100000000000D6D6D600F7EFEF00CEC6C600BDA5
      A500A58C8C00C6A59C00E7CEAD00FFEFAD00DEAD8400DEB5B500D6ADAD00BD94
      8C008C737300D6B5AD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000073848C00738484008C8C
      840063ADA500BDB5630052C6CE005AB55A004ACEDE007B848C0073AD9C006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DEBDBD00A5734200000000000000000000000000000000008C8C
      8C00849C9C00C6ADA500DEBDBD00D6BDBD00BD8C8C006B6B7300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001000080021001000290010002900
      1000421818007B738C0031425200000000000000000000000000000000000000
      0000000000000000000000000000000000001800080029081000290810002908
      100042211800736B840031425200000000000000000000000000000000000000
      0000000000000000000000000000000000001000000018000800180808002108
      1000421818000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000636363006363630063636300636363000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BD949C00C6A5A500DED6D600DECECE00D6C6C600D6BD
      BD00C69C9C00734242005A21100010424A000000000000000000000000000000
      000000000000FFEFEF00B58C94008C737300635A52006B5A52006B5A52006352
      4A00523931004A2921005221100010394A000000000000000000000000000000
      0000FFEFEF00CEBDBD0084848400C6C6C600CECECE00CECECE00ADADAD006B6B
      6B00211810003921180052211000000000000000000000000000000000000000
      00000000000063636300C6C6C600FFFFFF00FFFFFF00DEDEDE00848484006363
      6300000000000000000000000000000000000000000000000000000000000000
      000000000000AD7B7B00DEDEDE00E7E7E700E7E7E700DED6D600CEBDBD00C6C6
      C6009C7B7B00D6ADAD00A56B6B005A4A5200000000000000000000000000DEDE
      DE00DED6D600A5737300948C8C00BDA5A500DEDEDE00DED6D600D6CECE00CEB5
      B500C6A5A500947373004A312100524242000000000000000000000000000000
      0000B5ADAD00C6C6C600EFEFEF00F7F7F700FFFFFF00FFFFFF00FFFFFF00F7F7
      F700C6C6C6004239390039211800000000000000000000000000000000000000
      000000000000DEDEDE00E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF009C9C
      9C00000000000000000000000000000000000000000000000000000000000000
      000000000000C69C9C00EFEFEF00F7F7F700EFEFEF00DEDEDE00BD949400B59C
      9C00AD848400D6ADAD00C69494005A4A52000000000000000000F7FFF700CEC6
      C6008C84840063423900BD9C9C00EFEFEF00EFEFEF00E7E7E700DECECE00DECE
      CE00CEB5B500C6949400846B6B0052393900000000000000000000000000C6C6
      C600BDBDBD00DEDEDE00EFEFEF00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C600312929004A3939000000000000000000000000000000
      0000ADB5B500E7E7E700E7E7E700E7E7E700DEDEDE00E7E7E700FFFFFF00E7E7
      E700636363000000000000000000000000000000000000000000000000000000
      000000000000D6B5B500EFEFEF00FFFFFF00F7F7F700E7E7E700CEA5A500B57B
      7B00BD7B7B00D6ADAD00AD7B7B00312931000000000000000000E7D6D6009494
      9400DEDEDE00ADADAD00BD9C9C00F7F7F700FFFFFF00EFEFEF00D6B5B500CE94
      9400CE8C8C00C6949400846B6B00392929000000000000000000000000008C8C
      8C00E7E7E700E7E7E700E7E7E700E7E7E700DEDEDE00E7E7E700EFEFEF00FFFF
      FF00FFFFFF00EFEFEF006363630031292100000000000000000000000000D684
      1800CED6D600FFFFFF00E7E7E700E7E7E700E7E7E700E7E7E700FFFFFF00E7E7
      E70063636300000000000000000000000000000000000000000000000000B56B
      9400A5738400A55A6300BD636300CE949400DEADAD00CE9C9C00CE9C9C00C66B
      6B00CE6B6B009C6B7300F7BDBD000000000000000000000000009C6B6300DEDE
      DE00DEDEDE00ADADAD00A58C8C00D6A5A500D6ADAD00CE9C9C00CE9C9C00CE6B
      6B00CE6B6B00947B7B00B5847B0000000000000000000000000000000000ADAD
      AD00FFFFFF00E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700DEDE
      DE00FFFFFF00FFFFFF008C8C8C00000000000000000000000000DE9439009C31
      0000E7E7E700FFFFFF00FFFFFF00E7E7E700E7E7E700E7E7E700E7E7E700CED6
      D6009C5A310063636300000000000000000000000000F7EFF700AD5A1000CE63
      2100CE6B4200CE63420094311800D6947300FFA51800FFAD2900EFC6B500C673
      7300BD52520073424A00EFADB500000000000000000000000000AD521000CECE
      CE00DEDEDE00ADADAD00A58C8C00C6848400FFA51800FFAD1800F7C69400CE7B
      7B00B552520042312900845A5A0008000000000000000000000000000000B5B5
      B500FFFFFF00F7F7F700EFEFEF00EFEFEF00EFEFEF00E7E7E700E7E7E700E7E7
      E700FFFFFF00FFFFFF007B7B7B000800000000000000000000009C310000A542
      0000E7E7E700FFFFFF00FFFFFF00FFFFFF00E7E7E700E7E7E700E7E7E700946B
      63008C6342009C5A3100000000000000000000000000DE842100AD421800A539
      10009C421000AD421000B55A4200DE945200FFB53100FFB53900FFB53900FFB5
      3900F7B56300CE8484007B3942002100080000000000D67B2100943918006B39
      2100DEDEDE00C69C9C00A58C8C00CEA5A500FFB53100FFB53900FFBD3900FFBD
      3900FFB54A00D68C84008463630029101000000000000000000000000000C6C6
      BD00FFFFFF00FFFFFF00F7F7F700F7F7F700EFEFEF00EFEFEF00E7E7E700E7E7
      E700F7F7F700F7F7F700524A4A002910100000000000DE9C4200B54A0000BD52
      0000CED6D600CED6D600FFFFFF00DEDEDE00FFFFFF00FFFFFF00DEDEDE009452
      0800736331009C5A31006363630000000000DEAD7300A5390000AD420000B54A
      000008630000AD4A0000BD7B6B00FFB54200FFBD4A00FFC65200FFC65200FFC6
      5200FFBD4A00FFBD4200FFB5390021001000D6A56B007B3108008C736B00B58C
      8C00BD8C8C007B6B6B00CE848400CEA5A500FFBD4A00FFC65200FFC65A00FFC6
      5A00FFC65200FFBD4200B56B6B0029101000000000000000000000000000CECE
      CE00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7F700EFEFEF00EFEFEF00E7E7
      E700EFEFEF00CECECE00845252000000000000000000C66B1800BD520000D66B
      0000DEDEDE00FFFFFF00CED6D600BD635A00C6C6C600DEDEDE00397B3900006B
      000039631800736331006363630000000000B5520800BD520000C66300008473
      0000007B000021730000D6BDBD00FFC65200FFCE6300FFCE6B00FFCE6B00FFCE
      6B00FFCE6300FFC65A00F7AD5200180008008C421000CECECE00E7E7E700C6C6
      C6009C9C9C00C69C9C00CE8C8C00CEA58400FFCE6300FFD67300FFD67300FFD6
      7300FFCE6B00FFCE5A009C6B6B0021080800000000000000000000000000A5A5
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7F700EFEFEF00E7E7
      E700E7E7E7008C847300946363000000000000000000C66B1800BD844A00BDAD
      A500399C4200DEDEDE00E7E7E700BDBDC600E7E7E700AD8C7300008400000073
      0000006B00004A6321006363630000000000BD520000D66B0000D67B00004A94
      000039940000E77B0000DECECE00FFCE6B00FFD67300FFDE8400FFDE8400FFDE
      8400FFD67B00FFD66B00E79C6B0010000800B5B5B500E7E7E700F7F7F700FFFF
      FF00FFFFFF00A5A5A500BDA5A500EFBD7300FFD67B00FFDE8C00FFE79400FFE7
      9400FFDE8400FFD673007B5A5A0018080800000000000000000000000000C6C6
      C600C6C6C600E7E7E700FFFFFF00FFFFFF00F7F7F700F7F7F700EFEFEF00EFEF
      EF00CECECE00CEAD5A00000000000000000000000000D6731000AD8C73004A9C
      4A00C6C6C60063A57300E7E7E700EFB55200FFA51800F78C0000528C00002173
      000021730000106308006363630000000000CE630000BD84000010AD210031AD
      2900FFAD2100FF9C0000C6B5B500FFD67B00FFDE8C00FFE79400FFE79C00FFE7
      9C00FFE78C00FFDE8400CE8C730008000000C6C6C600D6D6D600E7E7E700F7F7
      F700FFFFFF00FFFFFF00D6CECE00FFD67B00FFE79400FFEFA500FFF7AD00FFEF
      AD00FFE79C00FFDE840063524A0010080800000000000000000000000000B5B5
      B500FFFFFF00FFFFFF00DEDEDE008C6363009C636300BDBDBD00BDBDBD00BDBD
      BD009C8C6B00FFDE8400000000000000000000000000EFB56300EF7B00004AAD
      520052BD7300A5BDAD0052BD7300D6DE8400FFCE5A00FF9C0000738C08000084
      000000730000316300006363630000000000D673000042AD290029C65A0039CE
      6B009CD67B00CEAD7B00BDA59400FFDE8C00FFE79C00FFEFAD00FFF7B500FFF7
      B500FFEFA500FFE79400BD7373000000000094949400C6C6C600D6D6D6008484
      8400F7F7F700FFFFFF00EFEFEF009C949400BDA59400E7D6A500FFFFCE00FFFF
      C600FFEFAD00FFDE8C005A424200100808008C8C8C009C9C9C008C8C8C008484
      8400FFFFFF00FFFFFF00FFFFFF00AD5A5A008C848400F7F7F700EFEFEF009494
      8C00F7E7A50000000000000000000000000000000000D6DE840021A5210021BD
      52004AD67300FFE79C0073E79400FFFFD600EFCE7B00FFAD2900F78C00004284
      000000730000AD7B00006363630000000000CEE7A50021C64A005ADE8400BDEF
      AD00D6F7CE00C6BDB5009C949400CEB59400EFDEA500FFFFBD00FFFFCE00FFFF
      C600FFF7B500FFE79C00A5636B0000000000ADB58C00ADADAD00424242008C8C
      8C00E7E7E700F7F7F700FFFFFF00AD9C9C00BDB5B500D6C6C600C6B5B500AD8C
      8C00AD848400C69484005A393900080000008C947B00C6C6C600BDBDBD003939
      3900A5A5A500BDBDBD00EFEFEF00CECECE00FFFFFF00E7E7E70094949400A584
      8400000000000000000000000000000000000000000000000000D6DE840029CE
      630073E79400A5F7B500CEF7BD00FFF7B50031CE63004AB53100D6940000EF7B
      000042840000636363000000000000000000000000009CBD4A007BDE8C00CEF7
      B500D6EFAD006BB58400C6BDBD00E7DEDE00E7D6D600C6ADAD00AD8C8C00AD84
      8400D6B59C00F7DE9C008C525A0000000000000000007B846300ADADAD00BDBD
      BD00D6D6D600E7E7E700F7F7F700736B6300CEBDBD0000000000000000008C73
      73008C7B7300948484007B4A4A0000000000ADADAD00424231009C9C9C00D6D6
      D600525252007B7B7B00FFFFFF009C9C9C00BDADAD00C6ADAD00000000000000
      000000000000000000000000000000000000000000000000000000000000D6DE
      840063D67B00C6DE8C00D6E79C0073E7940031CE630018B53100F78C0000EF84
      0000636363000000000000000000000000000000000000000000D6DEA50084DE
      84005ADE840029C6520073AD2100D6A573000000000000000000B5ADAD00BDA5
      AD00CEADAD00DEBDBD00B59CA500000000000000000000000000A5AD8400A5A5
      A500BDBDBD00D6D6D6006B6B5200BD946B00C6848C0000000000000000000000
      000000000000000000000000000000000000BD8C5A0073848C006B735A009494
      9400E7E7E700EFEFEF009C9C9C00B58463000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D6DE8400CECE6B0094CE630052CE630039BD42004AB53100EFB563006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A392100311818003918
      1800391018003908180029081000291010002918100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003118
      1800080000000808080000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084420800733908006B3108007331
      080073390800843908000000000000000000218421008C6B6300D6CECE00DED6
      D600DECECE00D6C6C600D6B5B500B58484005A2121006B290800000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600848484008484
      840084848400000000000000000000000000000000009C7B7B00F7D6D600FFEF
      F700FFEFEF00FFEFEF00FFE7E700EFB5B5004242420000000000000000000000
      00000000000000000000000000000000000039B53900188C2100085A08000852
      3900085229001894210021AD290021631800734A21008C6B6300A5847B008C63
      5A005231180063310800A552100000000000C6ADAD00E7E7E700E7E7E700DEDE
      DE00DED6D600CEB5B5009C949400AD7B7B00CEA5A500633139009C7B7B000000
      0000522918000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C60084848400848484000000
      000000000000000000000000000000000000D6A5A500FFFFFF00EFEFEF00DEE7
      E700DEDEDE00B5848400948C8C00A5737300FFCECE0063636300000000000000
      0000000000000000000000000000000000007B8C6B00DED6D600DECECE00BD94
      9400C69C9C0010392100189C2900C6B5B500DEDEDE00DEDEDE00DECECE00B59C
      9C00B58C8C00BD9494006339080000000000E7E7E700F7F7F700F7F7F700E7E7
      E700DEDEDE00E7D6D600AD848400AD848400CEA5A50094636B00C6ADB500845A
      6300633142009C6B730063390800000000000000000000000000000000000000
      0000000000008484840084848400848484008484840000000000000000000000
      000000000000000000000000000000000000D6C6CE00F7FFFF00FFFFFF00EFEF
      EF00E7EFF700CEADAD009C7B7B009C7B7B00E7BDBD00D6A5A500000000006342
      4A0052293900000000000000000000000000EFEFEF00F7F7F700DEDEDE00C6B5
      B500B5949400C68C8C0018942900E7E7E700EFEFEF00EFEFEF00D6C6C600C6B5
      B500AD8C8C00CEA5A5006B42100000000000CEB5B500F7F7F700F7EFEF00EFEF
      EF00D6BDBD00D6ADAD00BD7B7B00BD737300CEA5A5008C636B00D6B5B500D6B5
      B500ADA5A500946B73004A181000313131000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484000000000000000000D6B5B500FFFFFF00F7EFEF00F7FF
      FF00E7EFEF00DEBDBD00AD6B6B00B5636300DEB5B500C6ADAD00FFEFEF00FFE7
      EF00FFDEDE00B58C8C000000000000000000B5C6A500D6A5A500D6B5B500C673
      7300C67B7B00217B290021AD290039733900735A5A00E7DEDE00CEA5A500BD7B
      7B00BD737300CE9C9C00CE8429000000000000000000C68C8C00F7C69400D69C
      9C00CE8C8C00C6737300C66B6B00CE6B6B00DECECE00DEC6C600DEBDBD00D6A5
      A500AD9C9C00B59C9C00A5AD9C003108180000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C600848484000000000000000000EFE7E700C6736300BD73
      9C00BD8C9C00CE7B7B00CE636300CE4A5200DEE7E700F7FFFF00E7E7E700CEB5
      B5009C9C9C00C6949400FFBDBD000000000052AD4A00FFAD1800FFB53100DEAD
      9C00845242002963290039B539003973390018630800B58C4A00D6A5A500CE6B
      6B00C66363009C8C4200E79C31000000000000000000D69C8400FFA51800FFAD
      2100FFB54A00DEADA500C6636300BD6B6B00DEC6C600CE9C9C00D6A5A500D6B5
      B500AD8484009C6B6B00B59494003108180000000000FFFFFF0000000000FF00
      0000FF000000FF000000FF0000000000000000000000FF000000FF000000FF00
      000084000000C6C6C600848484000000000000000000F7EFF700DE842100FFA5
      0000FFD64A00737B8C00BD4A630094293100FFFFFF00FFFFFF00EFFFFF00CEA5
      A500AD636B00CE9C9C00FFC6C60000000000B57B6B00FFBD4200FFC65200FFC6
      52008C8C21005A3921004210000039733900009C08005A391000E79C2900FFB5
      3100E7AD8400A55A5A004A4A4A001810100000000000D6B5B500FFB53100FFB5
      3900FFBD3900FFBD3900FFB53900EFB57B00CE7B7B00DEADAD00DEBDBD00CEAD
      AD00BD8C8C00AD7B7B00B58484003108100000000000FFFFFF0000000000FF00
      0000FF00000000000000C6C6C60000000000FF000000FF000000FF000000FF00
      000084000000C6C6C600848484000000000000000000E7CEE700FFA51000FFBD
      2100AD84290021636300FFE72900F7AD9400BD6B9400CE735200C694BD00BD73
      8400D65A6300DE9C9C000000000000000000D6C6C600FFCE6300FFD67300FFD6
      730031CE6B0029CE5A0021BD420010AD210008A51800009C080084632900FFBD
      5200FFBD4A00FFBD4200733939000810100000000000CEA5A500FFBD4A00FFC6
      5200FFC65200FFC65A00FFC65200FFBD4A00FFBD4200CE6B6B00DEBDBD00CEAD
      AD00BD8C8C00CE9C9C00B58484002908100000000000FFFFFF00000000000000
      0000C6C6C600FFFFFF00FFFFFF0000000000FF000000FF000000FF000000FF00
      000084000000C6C6C600848484000000000000000000D6ADD600FFC61800C68C
      210000C6F700295A42007B632900A56B1000E78C0000DE523100FFB50000FFDE
      42007B5A7300947B8C007373730000000000E7D6BD00FFDE8400FFE79400FFE7
      94004AE77B0031CE6B0029C65A0021BD420018B5310008A51800216B0800BD9C
      5200FFCE6B00FFC65A004A29290000181800D6C6AD00CEA58400FFCE5A00FFCE
      6B00FFD66B00FFD66B00FFCE6B00FFCE6300FFC65200CE848400DEBDBD00D6A5
      A500BD8C8C00AD7B7B00AD7373002908180000000000C6C6C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000FF000000FF00
      000084000000C6C6C600848484000000000000000000BD9CBD00FFD6290029F7
      FF0063EFF70073F7FF0073FFFF004AF7FF0018FFFF0000D6F700007B8400DE73
      0000009CBD00FFBD1000FFDE840000000000B5AD9C00DEC69400FFF7BD00FFFF
      BD005AF78C004AE77B0031CE6B0029C65A0021BD420018B5310008A518008C7B
      4A00FFDE8C00FFD673003918180000000000B59C9C00DEAD7300FFD67300FFDE
      7B00FFDE8400FFDE8C00FFDE8400FFD67B00FFCE6B00CE949400DEBDBD00D6A5
      A500BD8C8C00C68C8C00B584840029081800FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00
      000084000000C6C6C6008484840000000000F7F7F700B5949C00FFD65A0073B5
      7300BDFFFF005AE7F7005ADEF7007BF7FF0094F7FF00ADFFFF007BF7FF0039F7
      FF0018F7FF00AD732100FFD6730000000000000000006BB5DE00A5B5C600D6C6
      C60021BD310042DE6B004AE77B0031CE630029C65A0021BD4200109C1000EFDE
      A500FFEF9C00FFDE84003131180000000000CEBDBD00FFD67300FFDE8400FFE7
      9400FFEF9C00FFEFA500FFE79C00FFDE8C00FFD67B00D6ADAD00DEBDBD00CE94
      9400C6737300AD6B6B00AD73730031081800FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00
      000084000000C6C6C6008484840000000000EFE7E700BD947300FFDE7300FFE7
      73007BFFFF00D6A55200FFEF8400FFDE7300FFEF5200B552420063C69C0039DE
      F70084F7FF0039AD9C00FFBD9400000000000000000000000000000000000000
      00000000000000000000E7E7E70042DE7B0031CE6300109C1800D6CEAD00FFFF
      C600FFEFAD00EFBD84000842000000000000F7EFEF00FFDE7B00FFE79400FFEF
      AD00FFF7B500FFF7BD00FFF7AD00FFEF9C00FFDE8C00E7C6C600EFDEDE00FFFF
      FF00DEADAD00CE6B6B00CE6B6B0039102100FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000FF00
      000084000000C6C6C6008484840000000000EFEFF700DEBD6300FFE78C00FFEF
      A5007BCEAD00F7DE9400FFF7B500FFEF9C00FFF78C00D69C7B00FFF79C00E7DE
      8C0084F7FF00FFE76B00E7949400000000000000000000000000000000000000
      000000000000000000000000000052F78C0021941800BD9C7B00D6B5A500DEC6
      C600D6B5B500BD8C8C00005A000000000000EFEFEF009C949400B5A59400DEC6
      A500FFFFCE00FFFFCE00FFFFBD00FFEFAD00EFC68C00EFD6D600EFD6D600EFD6
      D600EFD6D600E7CECE00CEA5A5007B737B0084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600848484008484
      840084848400C6C6C6008484840000000000F7EFF70094847B00D6B58C00FFFF
      B500FFFFD600FFFFDE00FFFFCE00FFF7AD00FFE78C00B59C9400F7EFB50073E7
      CE00FFFFBD00FFFFAD00CE8C9C00000000000000000000000000000000000000
      000000000000000000000000000029941000EF9C310000000000000000000000
      000000000000000000000000000000000000DEDEDE00BDBDBD00C6BDBD00DED6
      D600DECECE00BDA5A500AD848400BD948C00C69C8400BD847300D68C4A00EF9C
      310000000000000000000000000000000000000000008484840084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C6C6C60084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008484840000000000C6C6C600F7EFF700DED6D600AD9C
      A5008C63730084526300B5948C00EFDEA500F7CE8C00D6D6DE00EFDEE700C694
      9C009C637300BD847B00AD8C9400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CE844A00C6947B00BD8C8C00DE842900000000000000
      000000000000000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF00000000000000000000000000000000000000
      0000C6C6C600D6CECE00E7CECE00CEADAD00CE848C0094949400000000000000
      000000000000D6D6D600F7F7F700000000000000000000000000000000000000
      0000000000000000000000000000291810003929180000000000000000000000
      00000000000000000000000000000000000000000000634A2900423121005239
      29004A3921000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000735231004A392100312118004231
      2100393118003929180018100800181008002921100031211000392918004A31
      18004A392100848CA500314252005A5A5A000000000000000000000000000000
      0000000000000000000039313100313142003931310029212900211818000000
      000000000000000000000000000000000000735A390018394A00212929002121
      2100292929002121210031292900313139000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002121210031293100313139003931310029212900000000000000
      00000000000000000000000000000000000021842100317B2100317B2100317B
      2100317B210031731800317B21004A5A18008442080084390800843908008439
      080084390800843908008442080010424A000000000000000000000000000000
      0000000000005A4A4A001818390031293900636B730031293900392931003931
      290021181800000000000000000000000000422918004A6BB5003984DE00218C
      DE000094C600215A6B0018182100101018003139390021182900312929003931
      290000000000000000000000000000000000000000000000000000000000218C
      D600088CB500294A5A0029212100211818003939390029212900392929003931
      29002118180021080000000000000000000039BD390021B5290008A510000894
      6B001084420021AD290021AD2900216B2100CE732100C66B1800C66B1800C66B
      1800C66B1800C66B1800B5631800737373000000000000000000000000000000
      0000527BBD00181831002129520029316300525A73008C9CA5006B6B7B003931
      4200393129006B63630073635A0000000000393939004A63AD00427BD6003984
      DE003984E700398CEF003194F7001894E7000884AD00214A5A00292929001810
      1800211818005A52520000000000000000000000000000000000427BCE00426B
      B5006B6B7B00F7EFEF00EFDEDE00B5A59C006B635A0031292100392921002921
      1800292118005A524A00736352008C8C8C0039BD390021843900E79418007BB5
      940008ADB500188C4A0021AD290052731800DE943100DE7B2100DE7B2100DE7B
      2100DE7B2100DE7B2100C67318006B6B6B00000000000000000000000000848C
      9C002118310031396B00293163002931630029316B00424A6B00CEEFEF00949C
      A50063637300312131004231290042524A004A5A63004A6BB5004273CE00427B
      D6003984DE003984E700398CEF003194F7003194FF00319CFF00299CFF00109C
      DE00107B9C00181018000000000000000000000000004A6BB50042639C00A57B
      7B00D69C9C00F7E7E700E7CECE00D6ADAD00D6A5A500D6A5A500D6A5A500DECE
      C6008C7B73003929210042292100424A420039BD390010844200DEB5180063AD
      5A0042FF7B00087B520021AD290042732100EFA53900EF942900EF942900EF94
      2900EF942900EF942900D6842100313939000000000000000000217BFF003931
      390021214A00394273008CB5EF0029316B00293163002931630039396300CEF7
      FF00ADC6CE0084949C00393142002121180029526300426BBD004273C6004273
      CE00427BD6003984DE003984E700398CEF003194F7003194FF00319CFF00319C
      FF00089CDE00424A5200000000000000000029525A0042528400C6848400C67B
      7B00CE848400EFDEDE00E7CECE00D6ADAD00009C0000D6A5A500D6A5A500D6A5
      A500D6A5A500D6A5A500DECECE003129210042C6420010A521001052F7001829
      FF00108C210021A5310021AD2900396B1800FFBD4A00F7A53100F7A53100F7A5
      3100F7A53100F7A53100E79429002121180000000000B5CEDE00634A29002931
      63002939730029396B0029396B0084ADDE003142730029316300213163002929
      5200CEF7F700B5D6D6004252730021181800294A5A004273BD004A6BBD004273
      C6004273CE00427BD6003984DE003984E700398CEF003194F7003194FF00319C
      FF00089CDE005A7373000000000000000000424A5200C67B7B00C67B7B000000
      9C00C67B7B00E7CECE00E7CECE00D6ADAD00D6A5A500109C0800D6A5A500D6A5
      A500D6A5A500DEB5B500FFF7F7003121180042CE420052DE520063EF6B005ADE
      5A006BF76B0063EF630042CE42004A732100FFDE6300FFDE6300FFDE6B00FFE7
      6B00FFDE6B00FFE76B00F7A531002921180000000000295A940018214A002931
      6B0031428400394A8C0031427B0029316B0094C6E700425A8C00212952002931
      63002121520073848C00426B94000000000021638C00427BCE004A63B5004A6B
      BD004273C6004273CE00427BD6003984DE003984E700398CEF003194F7003194
      FF00089CDE0039424A000000000000000000CE9C9C00C67B7B00C67B7B008452
      8400C67B7B00DEB5B500EFD6D600DEB5B500D6A5A500CEA5A5004A9C3900D6A5
      A500D6A5A500E7C6C600A5A5A500181810009C3100009C3100009C3100009C31
      00009C3100009C3100009C3100009C3100009C3100009C3100009C3100009C31
      0000A5848400000000000000000000000000736B730018214A00293963002931
      6B00314284004252A5004252AD00424A9C0031397B005273A500739CCE002129
      630029316B00312942007363630000000000296B8C004284D600425A8C00394A
      6B003139420039527B004273C600427BD6003984DE003984E700398CEF003194
      F700089CDE00181021000000000000000000DEBDBD002118940063398C006339
      8C00C67B7B00D6A5A500EFD6D600DEB5B500D6A5A500D6A5A50084A56B0084A5
      6B00D6A5A500EFD6D6005242390008101000FFFFFF00FFEFEF00FFFFFF00F7EF
      E700F7EFE700FFEFEF00FFFFFF0094947B00A54A1800C68C6300D69C8400A539
      0000A584840000000000000000000000000018213900212952008CB5E7004A5A
      8C0029317300394A94004252AD004252A50039428C0029316B004A5A8C00739C
      CE0029294A006BADEF000000000000000000318CBD00426BA500426BBD00426B
      BD00426BBD00426BBD00426BBD005A9CCE0039527B0031424A00315A8400397B
      CE000894D600314A6300524A4A00000000007BADC600CE8C8C00BD7B7B002110
      9400C67B7B00CE8C8C00EFDEDE00DEB5B500D6A5A500D6A5A500429C3100009C
      0000D6A5A500F7E7E7004A42390000211800FFFFFF00FFFFFF00FFFFF700F7E7
      DE00F7EFE700FFF7EF00FFFFFF00B5521000B5520800B5520800B5521000B552
      0800A5848400000000000000000000000000212142002931630021295A006B84
      B5007394C600293173003142840039428C0031397B002931630021295A003942
      6300318CE7000000000000000000000000003194BD00394A7300427BCE00427B
      CE00427BCE00427BCE00427BCE007BE7FF007BE7FF00427BCE00427BCE00427B
      CE00427BCE0029211800844231000000000000000000D6ADAD00945A84002110
      9400C67B7B00C6848400EFD6D600DEBDBD00D6A5A500D6A5A500D6A5A500D6A5
      A500DEB5B500B5ADAD007B42310008292900FFFFFF00FFFFFF00F7EFE700F7E7
      D600F7EFE700FFFFFF00FFFFFF00A5B59400BD844200C66B2100CE732900C663
      1000AD8C8C000000000000000000000000000000000039395A0029316B002129
      5A00526B9C0084ADDE0029316B0029396B0029316B006B8CB5004A639400A5C6
      DE000000000000000000000000000000000042ADDE0039394A007BADE7003984
      DE003984DE003984DE003984DE003984DE003984DE003984DE003984DE003984
      DE003984DE00212110005A633100000000000000000094949400C67B8400C67B
      7B00C67B7B00EFDEDE00DEB5B500D6A5A500D69C9C00CE8C8C00D69C9C00EFD6
      D600FFF7F700423129005A5A31000000000052CEFF0052CEFF0052CEFF0052CE
      FF0052CEFF0029BDFF00C6EFFF00D6731800D6731800D6731800D6731800D673
      1800C6BDBD0000000000000000000000000000000000000000004A425A002931
      6B0029316B00394A840084B5DE002129630029316B0029295A00D6DEE7000000
      000000000000000000000000000000000000315A84003973BD00398CEF00398C
      EF006BB5F700ADDEFF00D6FFFF00A5E7FF0073BDF7004294EF00398CEF00398C
      EF00398CEF000831080010630800000000000000000000000000DEADAD00F7E7
      E700E7CECE00E7C6C600CE6B0000CE630000CE630000D69C9C00CE949400CE8C
      8C008C7B8C00103108001063080000000000BDF7FF00EFFFFF00FFFFFF00F7EF
      E700FFF7EF00FFFFFF00FFFFFF00D6944A00DE842100E78C3100DE842100DE84
      21006B636B000000000000000000000000000000000000000000000000009484
      8C0029316B0029316B0031396B0084ADE700394A7B00298C420063C6D6000000
      000000000000000000000000000000000000000000000000000000000000524A
      4A001039B5002929310031394A00315A8C002973D6003194FF0052B5FF006BCE
      FF0084DEE7000063000000000000000000000000000000000000F7DECE007B73
      73005263AD008C848400B5A5A500D6BDBD008C8CA5004284D60052A5EF006BC6
      F7007BD6E700006300000000000000000000EFF7EF00F7FFF700F7E7DE00F7E7
      DE00F7EFE700FFFFFF00FFFFFF00C6BD8400EF942900F7BD7300EFAD5A00EF94
      290063ADB5000000000000000000000000000000000000000000000000000000
      0000CEC6BD00293163002931630021295A0084AD8C0052D67B00000000000000
      0000000000000000000000000000000000000000000000000000000000008C84
      84001852D6002939520031313100292929000018840021294200739C7B000000
      0000000000000000000000000000000000000000000000000000000000008C84
      84001852D6002939520031313100292929000818840021294200000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E7AD5200F79C3100F79C3100F79C3100F79C
      3100399431000000000000000000000000000000000000000000000000000000
      000000000000FFF7F70029315A009C949C0094A5B50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400529CCE00185AD6001852CE001042BD001031A50029314A0073BD7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DE8429004294BD00E78C2900E78C
      2900DE8C2900E78C2900E78C2900DE8C2900DE842900DE842900EF943100B59C
      390018B539000000000000000000000000000000000000000000000000000000
      000000000000634A2900292110003121100042311800392918004A3118005A42
      2100000000000000000000000000000000000000000000000000000000005242
      29004A3921006342290021181000292110004231180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004231180000000000000000003929180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000211810002921100039291800392918004A3121005A42
      2100000000000000000000000000000000000000000000000000000000001863
      8C00312929004A4A4A00313131002921180039312900B5A5A500291818001810
      0800392110000808210000000000000000000000000021638C00105273007373
      73002929290029292900BDADAD00212118001810100094848400291818000000
      0000000000000000000000000000000000000000000000000000000000005252
      52004A4A4A00313131004242420031292900B5A5A50031313100100808001810
      0000000000000000000000000000000000000000000000000000000000005252
      52004A4A4A003131310042393900313131008473730031313100211818001810
      080039211000000000000000000000000000000000007B310800632108003131
      3100EFEFEF00EFEFEF00B5B5B500BDADAD007B6B6B007B7B7B00D6D6D600F7F7
      F70042393900291000006B31100000000000632908004A4A4200FFFFFF00E7E7
      E700BDBDBD00635252005A5A5A00BDBDBD00E7E7E70063636300737373000000
      000000000000000000000000000000000000000000004A42420042424200EFEF
      EF00EFEFEF00B5B5B500BDADAD007B6B6B007B7B7B00D6D6D600F7F7F7005A5A
      5A0018181000210800000000000000000000000000000000000042424200C6C6
      C600948C8C006352520052423900423131004A5A840042393100423129004239
      390021181800210800006B31100000000000000000006B737300C6C6C600F7F7
      F700EFEFEF00E7E7E700ADADAD00B5B5B5006B6B6B005A5A5A007B7B7B009C9C
      9C00C6C6C600FFFFFF007B6B5A0000000000DEDEDE00FFFFFF00FFFFFF00A5A5
      A5009C9C9C00C6C6C600ADADAD008C8C8C006B636300949494004A4A4A000000
      0000000000000000000000000000000000006B6B6B00C6C6C600F7F7F700EFEF
      EF00E7E7E700ADADAD00B5B5B5006B6B6B005A5A5A007B7B7B009C9C9C00C6C6
      C600FFFFFF009C9C9C0000000000000000000000000000000000E7E7E7008494
      A5005A84C600737BBD00A56B7B00D6847300DE9C8400BD949C004A6BAD003921
      100063524A0073736B0073635A008C8C8C0000000000D6D6D600F7F7F700EFEF
      EF00E7E7E700737373007B7B7B00A5A5A500B5B5B500B5B5B500B5B5B5009494
      9400313131007B7B7B008C73630000000000EFEFEF00ADADAD00A5A5A500D6D6
      D6009C9C9C00848484007B7B7B00ADADAD00BDC6C600739C8400525252005252
      5200212121006B6B6B008C73630000000000D6D6D600F7F7F700EFEFEF00E7E7
      E700737373007B7B7B00A5A5A500B5B5B500B5B5B500B5B5B500949494003131
      31007B7B7B004A4A4A00000000000000000000000000F7F7F70073B5F700848C
      A500FFD6A500FFDEB500FFE7C600FFEFCE00D69C7B00D68C5A00FFEFD6001863
      FF0039211800312118005A4A420042524A0000000000CECECE00E7E7E7007373
      7300CECECE00D6D6D6009C9C9C00A5A5A5008484840073737300A5A5A500BDBD
      BD0073A58400737373008C735A0000000000B5B5B500EFEFEF00D6D6D600E7E7
      E700CECECE00E7E7E700D6D6D600C6C6C600948C8C00ADADAD00DEDEDE00E7E7
      E700C6C6C600636363003931290010292100CECECE00E7E7E70073737300CECE
      CE00D6D6D6009C9C9C00A5A5A5008484840073737300A5A5A500BDBDBD0073A5
      84007373730042424200000000000000000000000000DEDEDE00217BFF00EFB5
      9400FFD6AD00FFE7C600FFF7D600EFBDA500D68C5A00FFDEAD00FFF7EF00FFFF
      FF008CB5FF005263840031181000212121000000000073737300E7E7E700DEDE
      DE00D6D6D600DEDEDE00E7E7E700EFEFEF00DEDEDE00B5B5B500B5B5B5009494
      9400636363007B7B7B008C735A0000000000EFEFEF00DEDEDE00DEDEDE00D6D6
      D600FFFFFF00EFEFEF00DEDEDE00C6C6C600D6D6D600EFEFEF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00A5A5A5000810100073737300E7E7E700DEDEDE00D6D6
      D600DEDEDE00E7E7E700EFEFEF00DEDEDE00B5B5B500B5B5B500949494006363
      63007B7B7B00B5B5B500000000000000000000000000B5CEE700FFAD3100FFEF
      CE00FFDEC600FFF7EF00FFFFF700D6B5B500D68C5A00FFE7C600FFFFFF00FFFF
      F700FFFFFF00CEE7FF005AA5F7002118180000000000E7E7E700DEDEDE00D6D6
      D600CECECE00D6D6D600EFEFEF00EFEFEF00BDBDBD00BDBDBD00E7E7E700E7E7
      E700CECECE008C8C8C00A58C6B0000000000C6DEDE009C9C9C00CED6D6009494
      9400A5A5A500B5ADAD00BDBDBD00CECECE00EFEFEF00E7E7E700DEDEDE00DEDE
      DE00EFEFEF00FFFFFF00EFEFEF0000080000E7E7E700DEDEDE00D6D6D600CECE
      CE00D6D6D600EFEFEF00EFEFEF00BDBDBD00BDBDBD00E7E7E700E7E7E700CECE
      CE008C8C8C00C6C6C6000000000000000000E7E7E700319CFF00DE945A00FFF7
      E700FFFFF700FFFFFF00EFC6A500E79C6B00EFBDA500FFF7E700FFFFFF00FFFF
      FF00FFFFFF004AE76B00527BAD0010100800000000008C8C8C00D6D6D600D6D6
      D600B5B5B500D6D6D600F7F7F700EFEFEF00EFEFEF00EFEFEF00E7E7E700DEDE
      DE00ADADAD005A5A5A00E7BD940000000000000000008C8C8C00FFC6AD00FFCE
      BD00FFDECE00EFDED600DEE7E700B5B5B500FFFFFF00EFEFEF00EFEFEF00E7E7
      E700E7E7E700EFEFEF00FFFFFF00000808008C8C8C00D6D6D600D6D6D600B5B5
      B500D6D6D600F7F7F700EFEFEF00EFEFEF00EFEFEF00E7E7E700DEDEDE00ADAD
      AD0052525200BDBDBD0000000000000000008C8C8C0000DEFF00F7EFD600FFEF
      D600FFFFFF00FFFFFF00D6B5B500D68C5A00FFDEB500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0010CE31007B6B6300081008000000000000000000BDCECE00EFEF
      EF00EFEFEF00ADADAD00BDBDBD00ADADAD008C8C8C00A5A5A500E7E7E700B5B5
      B5007B7B7B00DEE7EF00000000000000000000000000D6D6DE00FFEFC600FFE7
      BD00FFE7BD00FFE7C6005A4A4A00CECECE00FFFFFF00F7F7F700F7F7F700EFEF
      EF00E7E7E700E7E7E700F7F7F7000018180000000000B5BDBD00EFEFEF00EFEF
      EF00ADADAD00BDBDBD00ADADAD008C8C8C00A5A5A500E7E7E700B5B5B5007B7B
      7300C6634200A55231006B6B6B0000000000A5D6EF00188C6300FFFFFF00FFFF
      FF00FFFFFF00EFC6A500D68C5A00E79C6B00FFE7C600FFF7E700FFFFFF00FFFF
      FF008CC6FF007BBDFF005A52520000181800000000000000000000000000BDB5
      B500FFB5A500FFC6BD00FFE7DE00EFEFEF00D6D6D600D6D6D6006B6B6B00CED6
      D6000000000000000000000000000000000000000000B5A5A500FFF7DE00FFEF
      D600FFEFD600FFFFDE008C7B7B00D6D6D600FFFFFF00FFFFFF00F7F7F700F7F7
      F700EFEFEF00E7E7E700A5A5A500083931000000000000000000BDB5B500FFB5
      A500FFC6BD00FFE7DE00EFEFEF00D6D6D600D6D6D6005A423100A54A08002163
      0000AD420000A53908009C523100082929004AADEF00ADC67300FFFFFF00FFFF
      FF00FFFFFF0094B5FF006B8CD600FFE7CE00FFFFF700FFFFFF00FFFFFF00FFFF
      FF00399CFF0052291000944A310000000000000000000000000000000000AD8C
      8C00FFDEB500FFDEB500FFDEB500FFDEB500FFD6B50063525200DEEFEF000000
      000000000000000000000000000000000000E7FFFF00CEB5AD00FFFFEF00FFF7
      EF00FFF7EF00EFDED600DEBD9C00C6C6C600D6D6D600FFFFFF00FFFFFF00FFFF
      FF00F7F7F700EFEFEF00AD8C6300000000000000000000000000BD949400FFDE
      B500FFDEB500FFDEB500FFDEB500FFD6B50063312100CE6300007B7B00000084
      0000CE6B0000735A000063633100212929002994FF00DED6CE0073ADFF00ADB5
      CE00F7D6B500FFDEB500FFDEB500317BFF00FFFFFF00FFFFFF00FFFFFF00BDE7
      FF005ABDFF005A4210006363310000000000000000000000000000000000BD94
      8C00FFE7CE00FFE7CE00FFE7CE00FFE7CE00FFE7CE006B6B5A00000000000000
      000000000000000000000000000000000000C6BDB500D6C6C600DECECE00EFDE
      DE00EFE7E700D6B5A500EFD6BD00C6BDBD00FFFFFF00EFF7F700C6424200C6CE
      CE00D6D6D60084847B00F7BD7300000000000000000000000000BD948C00FFE7
      CE00FFE7CE00FFE7CE00FFE7CE00FFE7CE0073390000429C080029AD1800EF9C
      0000D68C0000007B000010630800393939009CB5CE00CEC6BD00BD948C00FFE7
      C600000000000000000000000000000000006B4A310073BDFF00FFFFFF004AB5
      FF00735A31000873080010630800000000000000000000000000B55A0000F7DE
      CE00FFEFDE00FFEFDE00FFEFDE00FFEFDE00F7DECE00944A0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6BDAD0094949400635A5200DEDEDE00FFFFFF00B5ADAD00FFFF
      FF00A59C9400735A5A0000000000000000000000000000000000F7DECE00FFEF
      DE00FFEFDE00FFEFDE00FFEFDE00F7DECE00C66B000021C64A0042D67300CEDE
      7B00FFAD1800008C0000007300007B7B7B000000000000000000000000000000
      000000000000000000000000000000000000000000000000000063C6D60052BD
      FF00EF9C2100008C000000000000000000000000000000000000AD6B3900FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00A57B7300D67B1000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5B5B5009C948C00D6D6D6004A393900FFFFFF00946331000000
      00000000000000000000000000000000000000000000B5734200FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00A584840094B56B0052D67B00B5F7BD00BDF7
      B5004ABD4200DE840000737B0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DE8C2900EFE7DE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000873AD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EFE7E700BDBDBD00FFF7F70094ADB50094633100000000000000
      00000000000000000000000000000000000000000000EFE7DE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EFEFEF0000000000BDCE84008CE794005ADE
      840018B53900DE94290000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006B52310042311800312110004A3121005A422100634A29000000
      00000000000000000000000000000000000084633900634A2900423121005A4A
      31006B5231006B4A290042311800312110004231180052392100523921005A42
      2100634A2900ADB5D60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A009C9C9C00F7D6D600A58C8C0031312900313129009484
      73000000000000000000000000000000000084633900296B9C00189CDE00216B
      9C00524A42005252520084847B008C5A2900AD521000B56329008C4210004A29
      10004A2910000808210000637300000000007B5A390021638C00188CCE001863
      8C004A4239004A4A4A007B736B00845221009C4A1000AD5A29007B3910004229
      10004229100008082100005A6B00185263000000000000000000000000000000
      0000000000000000000000000000000000000000000018212100636352000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008C8C8C00848484003131310094848400FFCECE00212121008C7B
      6B00000000000000000000000000000000006B6B5200299CD600217BB50021A5
      E7002173A50042424200DE7B1800B54A21007B633900AD421800B5522900CE63
      4200BD63420029312900217B8400FFFFFF007B3108007B3108007B3108007B31
      08007B3108007B3108007B3108007B3108007B3108007B3108007B3108007B31
      08007B3108007B3108008C421800949494000000000000000000000000000000
      000000000000524A420073847B00317B7300088C8400088C840008948C000063
      5A0000636B00187B8C0000000000000000000000000000000000000000000000
      000000000000A5A5A5008C8C8C00635A5A007B7373006363630018292900005A
      5A0000000000000000000000000000000000736B520031A5D6004284AD00317B
      D6004294C6009C6B31009C310000A5420000315A080094420000A53900009C31
      0000B54A2100AD5A310021214200F7F7F700E7FFFF00E7FFFF00E7FFFF00E7FF
      FF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00E7FFFF00E7FF
      FF00E7FFFF00E7FFFF00DEBDA500948C8C0000000000CEC6BD0073A59C001084
      8C0000948C00009C9C0000ADA50000A5A50008ADA50000948C0008A59C000094
      8C0000847B0000736B00085A52008CADAD000000000000000000000000000000
      000000000000B5B5B5008C8C8C004A4A4A005A5A5A004A4A4A0018313100008C
      8400000000000000000000000000000000008C6B420039A5CE004A6363000000
      000063948400636B5200BD520000C65A00003173000000730000BD5A0000B54A
      0000944200008C634200292118007B949400E7FFFF00DEEFEF00DEEFEF00DEEF
      F700EFF7F700EFD6B500637BCE005A5A9C00E7EFEF00EFDEBD00DEE7E700DEEF
      F700DEEFEF00DEEFF700DEBD9C004A5A520000B5AD0000B5B50000B5A50010A5
      94005AA5630094A54A00D6BD6300B59C310000FFFF0008CEC60008DED60008E7
      DE0008948C00008C8400006B6300185252000000000000000000000000000000
      000000000000B5B5B500949494006B6B6B007B7B7B004A4A4A001839390008DE
      CE000000000000000000000000000000000008A59C0021738400216363000000
      0000C684390010293900D66B0000DE730000008C00008C7B0000D6730000526B
      0000106300004A6321006B310800214A4200E7FFFF00DEEFEF00DEEFF700E7F7
      F7000029A5007B6B94004AB5E7004AB5DE008C637B000029B500FFE7B500DEEF
      F700DEEFF700DEEFF700E7BD9C0010292100A5B55A00E7BD6300F7DE9400FFEF
      B500F7E7AD00EFDEA500DEC67300F7CE7B0029FFEF0008EFDE0008EFE70008DE
      DE00004A4A000039390000948C00104239000000000000000000000000000000
      000000000000BDBDBD00BDBDBD007B7B7B005A5A5A004A4A4A001839390008D6
      CE00000000000000000000000000000000004A7B7B0021ADEF00AD9C73000000
      0000D67B2100D66B0000848C0000DE940000CE9C0000FF940000EF8C00001884
      000000730000216300007B4A080018393100E7FFFF00DEEFF700DEEFF700FFF7
      CE0084F7FF0052ADDE0063CEF70052CEF700319CD60021D6FF00FFCE7B00E7E7
      DE00DEEFEF00DEEFF700E7BD9C001021180052BD7B00FFE7AD00DEC67300E7CE
      8400F7E7A500DECE7B00F7E7AD00FFEFB5008C9C5A0000DED60008D6D600007B
      7300005A5A0000948C00008C8400083931000000000000000000000000000000
      000000000000C6C6C600BDBDBD0039D66B004AE77B0052CE7B00183939000073
      6B0000000000000000000000000000000000189CDE0031637B006B634200C6B5
      7300D69C4200E77B000018B5310031BD4A008CC65A00FFC65200FF9C0800DE8C
      0000107B0000006B0000734A100010392900E7FFFF00DEEFF700E7F7F7000031
      A5004A9CD6006BD6F7005ACEF70052BDE7004ACEEF0039ADDE000039AD00FFF7
      DE00DEEFF700DEEFF700E7BD94000821180000E7DE00A5A54A00FFE7AD00FFEF
      B500F7DE9C00C6CE84008CE7C60031DECE00006B6B0008E7D60008FFF70008F7
      F70008DED60008BDB500005A5200003931000000000000000000000000000000
      000000000000C6C6C600BDBDBD004AE7840031CE6B004AE77B001839390008EF
      EF0000000000000000000000000000000000108CBD00187BF700215A8C006B5A
      4A00DED6B5005AA5210029CE5A007BDE7B005ADE8400FFEFAD00FFBD3900EF94
      000063840000007300003142210008393100E7FFFF00DEEFF700E7EFF70084E7
      FF007BDEFF005ACEF700F7DEDE004A3129002194E70021BDE70008BDEF00F7EF
      EF00DEEFF700DEEFF700EFC694000021180008D6C60010ADA500008C84000063
      6300006B63000084840008B5B50010FFFF0010FFFF0008FFEF0008D6CE0008FF
      FF0008FFFF000063630000292900084A4A000000000000000000000000000000
      000000000000CECECE00BDBDBD0063FF940042DE730031CE6B001839310008F7
      F7000000000000000000000000000000000000ADE700089CEF00187BF700086B
      A5002142420073D6730042D6730094EFA500E7FFCE00E7EFAD0073C64A00BD94
      0000DE7300008C8C080008292100084A4200E7FFFF00DEEFF700E7EFF700E7F7
      F700527BC60052CEF700E7DEDE00423129004AE7FF00299CD600F7EFDE00E7EF
      F700DEEFF700E7EFF700EFC694000029290008BDB50008EFE70010FFFF0021FF
      FF0042FFFF0073FFFF0094FFFF00B5FFFF00B5FFFF0084FFFF0000BDAD0008FF
      F70008FFEF0008D6CE0008A59C00186B63000000000000000000000000000000
      000000000000D6D6D600BDBDBD0052CE63004AE77B0029C652001831310008EF
      EF000000000000000000000000000000000063C6DE0042D6FF0008ADFF00087B
      D60039ADAD00D6D6D600BDDE8400C6CE6B00BDE7940052D67B0021BD4A00EF8C
      0000D694210010B5AD0008A59C0000000000E7FFFF00E7EFF700E7EFF700E7EF
      F7009CE7F70063D6F700CEBDBD00292121007BE7FF0052CEEF00E7EFF700E7EF
      F700E7EFF700E7EFF700F7C6940008393900089C940008DED60094FFFF00BDFF
      FF008CFFFF0084FFFF0084FFF70063FFF70063FFF70018E7D60000C6B50008AD
      A50008BDB50008A59C0008948C00ADCEC6000000000000000000000000000000
      000000000000DEDEDE00BDBDBD007B7B7B0084848400737373001831310008A5
      9C00000000000000000000000000000000001084A50042E7FF0031D6FF00294A
      63005A949400C6C6C600A5A5A500A5A59C00CECE9C00E7C66300949C7B003994
      7B0008B5AD0008A59C000000000000000000E7FFFF00E7EFF700E7EFF700E7EF
      F700E7EFF700EFF7F700D6CEBD005A636300EFFFFF00E7EFF700E7EFF700E7EF
      F700E7EFF700E7F7F700F7C69400637373005A735A0008C6B50010C6BD0029CE
      C60021C6BD0010C6BD0008BDB50008B5A50008B5AD0008A59C00089C94000894
      8C0010948C00218C8C004A423100000000000000000000000000000000000000
      000000000000DEDEDE00B5B5B500737373008484840094949400183939000894
      8C000000000000000000000000000000000052735200187BAD0063EFFF0008C6
      F70021425200635A5A00086BA50029425A00524A520084848400183939000000
      000000000000000000000000000000000000DEDED600DED6BD00DED6BD00DED6
      BD00DED6BD00DED6BD00DED6BD00DED6BD00DED6BD00DED6BD00DED6BD00DED6
      BD00DED6BD00DED6BD00F7BD73009494940000000000ADDEDE00429C9C0063A5
      A50084B5B50094BDBD00ADC6CE00BDD6D6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006B73730021101000424A4A00848C8C00A5ADAD00D6DEE7000000
      00000000000000000000000000000000000000000000ADD6D600187BAD007BEF
      FF0010D6FF001894D600007BBD00187BF7002152840052525200C6CED6000000
      000000000000000000000000000000000000BD5A0000B55A0000B55A0000B55A
      0000B55A0000B55A0000B55A0000B55A0000B55A0000B55A0000B55A0000C673
      1800CE7B29007B5A5A00DE841000ADADAD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A57B4A00393131006B4A21000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B58442003184
      AD00DEFFFF0021D6FF0008C6FF00088CD600187BF70031526300AD7B42000000
      000000000000000000000000000000000000DE841800E7841800E7841800E784
      1800DE841000E7841800E7841800E7841800E7841800DE841000DE7B0800DE7B
      0800DE7B0000E7840800C6731000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CE84310039313100BD7318000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E78C
      2100847B6B001884AD0052E7FF0029CEFF00088CD600A5632100EF9C4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFD6CE00D6949C0084527B004A3973002931840021316B00394A
      9C006373AD00ADB5D600FFFFFF00000000000000000000000000EFEFEF00CECE
      CE00CECECE00F7CEC60000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084633900846339007B5A31007352
      3100735231006B5231006B4A2900634A2900634A2900634A2900634A2900634A
      2900634A29000000000042526B0063636300000000006B4A29004A3921006B4A
      2900000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E7A5
      9C00C64A39000829A5000829A5001831A50010299C0000104A00425294000021
      A5000818940000188400001873000000000000000000FFFFFF0073635A007373
      73009C84A5001018520008299C00000000000000000000000000000000000000
      0000000000000000000000000000000000008C633900CEBDA500C6B59C00BDAD
      9400ADA58C00A59C8400A5947B009C8C73007B6B5A00736B5A00847363009484
      7300634A29000000290000637B00185A6B00000000006B849400A58CB500524A
      42009C8C7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD5A4A009431
      1800842110002131BD006373D6006B7BDE00314AD600636BB5005A7BF7001021
      73001831CE001029B500001884000000000000000000FFFFFF006342390052BD
      FF003973CE00A58CA500393963006373D6000000000000000000000000000000
      0000000000000000000000000000000000008C6B3900D6C6B500CEBDA500C6B5
      9C00B5AD9400ADA58C00A59484009C947B0021211800211818006B6352009484
      73000018390008738400218C9C00000000000000000052C6FF00397BDE009C84
      AD00524A4200A594840000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD6352008C2918008421
      100084211000522963007384E700737BDE00212973008C9CFF006B84EF005263
      B5001829D6001029B50000218C0000000000FFFFFF009C5A4A00631810004A39
      420052C6FF003973CE00A58CA50042426B002129730000000000000000000000
      0000000000000000000000000000000000008C6B3900DECEBD00D6C6B500CEBD
      AD00C6B5A500BDAD9400ADA58C00A5948400736B5A00000000007B7363000010
      3100007B8C00187B9400000000000000000000000000D6CEBD005AC6FF003184
      E7009C8CAD005A4A42009C947B00000000000000000000000000000000000000
      000000000000000000000000000000000000EFD6D6008C2918008C2918008C31
      18009431210094392100215A94002942DE00185A84004AADD60031ADE700085A
      8400082973000021A500AD39310000000000AD390800CE421800E7523100F763
      4A0084525A0052C6FF003973CE00AD8CAD00103952004294B500297B9C000842
      6300082163000021A5000000000000000000946B4200E7D6CE00DED6C600D6CE
      B500B5946B009C5A2100944A08009C6B3900393129006B635A0052637300004A
      6300106B7B0000000000000000000000000000000000DED6C600CECEBD0052C6
      FF003184E7009484AD005A310800734A29002118180039313100313942000042
      5A00106B7B0000219C00A539310000000000A5423100943118009C392100A542
      2900AD5239009C5A3900086B100000526B0084D6F70084D6F7004ABDEF001094
      D6001084BD003918180031420000EFE7DE00C6421000EF5A4200FF6B5A00FF7B
      6300DE6B4200847B7B0052C6FF006B84AD007B5A4A009C736B00D6B59400E7CE
      B5009C7B730029181000294200000000000094734200EFE7D600E7D6BD008C42
      0000A55A1000AD732100A56B2100B5732100944A0000844A100000C6FF00529C
      AD00634A29000000000000000000000000000000000094391000943910009439
      100052ADE70094949400A5848400F7D6AD00FFFFDE00FFFFDE00E7CEBD004A29
      2100843910009442100029210800000000009C311800A5422100AD4A3100BD5A
      3900C6634A0084733900080808006BCEF70094DEF70094D6F70063C6F700319C
      DE002984BD001052730000210000A5846300A5310000FF6B5200FF846300FF94
      7300E7A57300FFD6A500B55A4A009C7B7300EFB59400FFFFCE00FFFFD600FFFF
      DE00FFFFEF00E7CEC600001000009C8463009C734200F7EFE7008C420000D68C
      3100DE9C39003121080042291000BD843100D6943100A55A10008C5218009C8C
      7B00634A290000000000000000000000000000000000DEFFFF00DEF7FF00DEF7
      FF00E7F7F700BDADAD00FFEFB500FFFFC600FFFFDE00FFFFEF00FFFFFF00F7E7
      DE0063636B00E7FFFF001808000000000000B54A2900BD523100C65A4200D66B
      4A006BA54200184210002929290063B5DE008CD6F70084D6F70052BDEF00399C
      DE00318CBD0021526B00000000004A4A18009C422100CE4A2100FF8C7300BD4A
      1800FFC69400FFCE9400BD522900CE9C8C00FFFFCE00FFF7BD00FFFFDE00FFFF
      EF00FFFFFF00FFFFF700AD7B7300424218009C7342008C420000C6843100DEA5
      5200DEAD5A00312110007B5A2900B5843100AD7B2900DE943100944A00009C8C
      7B00634A290000000000000000000000000000000000DEF7FF00B5BDC600ADBD
      BD00ADBDBD00CEB59C00C6BDA500C6C6AD00CECEBD00CECEC600D6D6D600E7EF
      CE00846B6B00CEE7EF005231210000000000CE633900D66B4A00DE7B5A0063C6
      390039E7100029211800393939004273840073CEF70063C6F7004AB5EF004AAD
      E7004AA5CE00081821000000000029520800C6633900945231005A1800000008
      6B000821840000086B0084391800F7D6B500FFE7AD00FFEFBD00FFFFD600FFFF
      EF00FFFFEF00FFFFDE00EFD6B500183108009C7342008C420000E7AD6300E7BD
      7B00EFBD840031291800AD8C520000000000A57B3100DE943100BD7321009463
      3900634A290000000000000000000000000000000000DEF7FF00D6E7EF00D6E7
      EF00C6CED600EFDEB500CEB59400CEC6A500CED6B500CED6C600D6DEC600DEDE
      C600BDA58C00C6DEE7006B4A390000000000D67B4A00E78C6B009CBD63004AD6
      08004AFF0000395A290031313100393939003963730021212100101010000000
      0000295A73000000000000000000636331003921100008080800000000001039
      A5001042AD001042A50021215A00F7DEBD00FFDEAD00FFEFB500FFFFCE00FFFF
      D600FFFFDE00FFFFD600EFD6AD00394221009C7342008C420000EFBD8400EFCE
      A500F7D6AD0031292100A58C6B0010100800CE9C5200DE9C3900D6943100944A
      08006B4A290000000000000000000000000000000000DEF7FF00DEEFF700DEEF
      F700DEEFF700EFDEB500FFEFC600FFE7B500FFFFC600FFFFD600FFFFD600FFFF
      CE00A5847300DEF7FF006B5239000000000000000000A5A5A5009C9C9C009494
      9400949494009CE742002121210063636300848484007B7B7B004A4A4A000808
      0800000000000000000000290000CEAD9C00101010001818180010398C00185A
      BD00185AC600185AC600184AA500DEB59C00FFFFEF00FFEFCE00FFE7B500FFEF
      BD00FFF7BD00FFFFCE00C6948400AD9484009C7342008C420000EFCEA500E7D6
      B500EFE7CE00000000000808080063524200E7B56B00DEA54A00CE842900945A
      21006B52310000000000000000000000000000000000E7F7FF00B5C6C600B5BD
      C600B5C6C600B5A59C00D6DEDE00D6D6CE00DEC6A500DEC69C00E7D6AD00EFDE
      B50084848400EFFFFF00633929000000000000000000BDBDBD001010BD003131
      A5009C9C9C00C6FF73007BAD4A003939390084848400737373004A4A4A000808
      08000000000000000000086B0000FFFFFF00212121002929290018529C002173
      DE00297BE7002973DE00216BD6005A424200FFF7EF00FFFFFF00FFE7BD00FFDE
      A500FFF7C600FFD6AD0010290800FFF7F7009C7342008C420000EFD6AD009C94
      8C00CECEC600FFF7EF00F7E7CE00EFCEA500E7B57300DEA55200A55A1000AD8C
      6B007352310000000000000000000000000000000000E7F7FF00BDCECE00BDCE
      CE00BDCECE00BDC6CE00BDA59C00E7E7D600EFEFC600EFE7BD00EFDEB5009C7B
      7B00CEDEDE00EFFFFF002918000000000000000000004A4AEF00A5A5E7001818
      DE008484A500CEFF9400FFF7EF00CEB5AD002921210021212100181818000000
      00000831000000B50000C68C730000000000292929003939390000101800319C
      FF00319CFF00319CFF00298CF700525A6B004A393100D6AD9C00F7E7B500FFDE
      B500EFBDA50010420800B57B6B00000000009C734200B58C5A00A56329000000
      0000DED6D600F7EFE700F7E7CE00EFCE9C00E7B57300D69C42008C420000C6BD
      B500735A310000000000000000000000000000000000E7F7FF00E7F7F700E7F7
      F700E7F7F700E7F7F700E7F7F700CEBDBD00AD8C8C00C6A5A500CECED600E7F7
      F700E7EFF700E7FFFF00633121000000000000000000F7F7F700E7E7E700C6C6
      D6001818DE00B5DEB500FFF7D600BDF78C0063FF52007BFF3900FF843100FF5A
      0800DE390000736B21000000000000000000080808004A4A4A00525252001818
      1800082163001852D6001852A5009CC66B005AF74A0063CE3100B55A2100B542
      0000BD290000736B180000000000000000009C734200FFFFFF006B3910008452
      2100C6B5A500F7E7CE00F7D6B500EFC68C00CE944A008C420000D6C6BD00CEC6
      C6007B5A310000000000000000000000000000000000E7FFFF00C6D6DE00C6D6
      DE00C6D6DE00C6D6DE00C6D6DE00CED6DE00CED6DE00CEDEDE00D6DEE700D6E7
      E700D6E7E700EFFFFF007B635200000000002929290000000000000000000000
      0000B5B5E7005A52CE0094F763005AEF52005ADE5A0052F74A00FF7B3100F752
      0800DE6B390000000000000000000000000018181800424242006B6B6B008C8C
      8C00BDBDBD006B6B6B000808080052DE52000000000000000000000000000000
      0000000000000000000000000000000000009C734200FFFFFF0000000000B58C
      5A008C4200008C4200008C4200008C4200008C420000E7E7E700DEDED600D6D6
      CE008463390000000000000000000000000000000000BD8C4A00BD844200BD84
      4200BD844200BD844200BD844200BD844200BD844200BD844200BD844200BD84
      4200BD844200C68C4A007B6B5200000000000000000000000000000000000000
      0000FFEFDE00847BDE00F7D694009CE74200A5CE4200EF8C3900F77B4A00F7DE
      CE0000000000000000000000000000000000FFFFFF00BDBDBD00181818007B7B
      7B005A5A5A0008080800D6BD8400000000000000000000000000000000000000
      0000000000000000000000000000000000009C7342009C7342009C7342009C73
      42009C7342009C7342009C7342009C734200946B42008C6B42008C6B39008C63
      39008463390000000000000000000000000000000000DE8C2900E78C2100E78C
      2100E78C2900E78C2100E78C2100E78C2100E7841800E7841800F7A54A00EF94
      2900DE8C3900AD8473009C8C840000000000424D3E000000000000003E000000
      2800000040000000D00000000100010000000000800600000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000FFFFFFF801E007000FFFFFE0018003
      0003FFFFC00180030003C01F80018003000380070001C003000100010000C007
      000100000000E007000000000000C007000000000000C003000000010000C003
      000000C70000C003000100FF0000C0030001E0FF0001C003C003E3FF8003C007
      F803FFFFC007E007FC07FFFFF00FF01FFC7F03FF87FF0000F01F001F03870000
      C007000101030000000100000001000000010000000000000001000000000001
      000000008000000100000000E000000100000000F000000100000000E0000001
      00000000E001000100008000E08300010000C001E0FF0001E000E003C1FF0001
      E000F007C3FF0001F800F81FFFFF000103C0C003F01FFFFF03C0C003C003FFFF
      03C0C0038001FC7F0000E0078003F01F0000C003E007800700008003E0030001
      02008001E001000002008001E0010000F00C8001E0018000F80F80018001F800
      FC1F80018000F003FC1F80010003C00FFC1F80030003803FF81FC007000381FF
      F81FE00F8003FFFFFC1FF81F807FFFFFC0FFF00FFFFFC000003FC0079FFFC000
      003F800387FF0000001C8003E03F000000308003F80F000000008003F0070000
      80018003F00300000003C007F00100000007F83FF0010000000FF83FF8010000
      001FF83FF8010000003FF81FFC010000003FF01FFE010003003FF01FFF010003
      003FF01FFF810003F03FF83FFFE30007F8FFF01FF01F83FFF03FF00FE00F003F
      E01FE00FE007000F0001E00FE007000F0001E00FE007000F0001C007E007000F
      0001C007E00700070001C007E00700000001C007E00700000001C007E0070000
      0001C003E00700080001C003E007000F00018003E007000FE00F8003E007000F
      F01F8003E007000FFC3F0043E007E00FF00F80FFFFFFC0FFC007800F000F803F
      0003800F000F001F00018003000F000300018001000F000000008001000F0000
      00008001000F800000008003000F800080008003000F80008000800300070000
      8000800700010000C000800700010000C000800700010000E001800FFFE10000
      F80F800FFFF10003FFFF800FFFF9E03FFE01FC01FC07FE1FFC00F800F001F80F
      F800E000F001F80FF800C000E000F007F800C000E000E007E001C000E000C003
      8001C000E000C00380008000E000800100000000E001800100000000E0018001
      00000000E003800100000000E0038001000000000007800100000000000FC003
      80008060003FE007C0C0C07F00FFF00FFFFF807FF00FE0FFFF03003FE007807F
      00010017E007003F00010001F81F000700010000800100010001800080008000
      0001800080008001000080008000800300008000800080010000000080008000
      00010000000000018001000000000001FC01000000000001FE01000000000001
      FE7F000F80000001FFFFFC3FC000F039FE7F87FFFFFF0000FC1F00FFF83F0000
      F807000FE0030000F0010003C0000000E000000380000000C000000300000000
      8000000300000000800100030000000700010003000000070003000100000007
      0007000180000007800F000180010007C01F0001C0010007E01FE003C0030007
      F03FE01FE03F0007F87FE01FFFFF0007F80FE07FFB7FFC0FE003801FE00FE007
      8001001F8003C0018001001F0003C00080010001000380008001000000038000
      800100000003800080010000000300008001800000030000C003800080010000
      E00F8000C0000001E01F0001C0000001E03F0001C0000F01C03FF803C000FFC3
      C03FF81F8001FFFF807FF83F8083FFFFFFFFF81F0003FFFFFFFFF80F00010000
      FF9FF80F00000000F803F80F000000008000F80F100000000000F80F10000000
      0000F80F100000000000F80F000000000000F80F000000000000F80F00000000
      0000F80F000100000000F80F000300000001F80F001F000080FFF81F801F0000
      FFFFF8FFC01F0000FFFFF8FFE01FFFFFF801C3FF00048FFFE00181FF000087FF
      C00180FF000183FF8001007F000381FF00010003000780010000000100078001
      0000000000078001000000000007800100000000000780010000000000078001
      0000000000078001000000000007800100010001000780010003000300078001
      000700FF00078001F00F01FF0007800100000000000000000000000000000000
      000000000000}
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqDatosAfterOpen
    AfterClose = sdqDatosAfterClose
    SQL.Strings = (
      
        'SELECT SE_ID, SE_USUARIO, SE_NOMBRE, SE_PERFIL, PF_DESCRIPCION, ' +
        'PF_FECHABAJA, SE_FECHAMOD,'
      
        '       SE_TIEMPOESPERA, SE_SECTOR, SC_DESCRIPCION, SE_DELEGACION' +
        ', SC_FECHABAJA, EL_NOMBRE,'
      
        '       SE_CARGO, TB_DESCRIPCION, SE_FECHABAJA, SE_FECHAALTA, SE_' +
        'ACCESOSEGURIDAD, SE_USUARIOGENERICO, SE_INTERNO,'
      
        '       SE_IDSECTOR, SE_MAIL, (SELECT COUNT(*) FROM ARCHIVO.RAU_T' +
        'IPOARCHIVOUSUARIO WHERE AU_FECHABAJA IS NULL AND AU_USUARIO = SE' +
        '_USUARIO) PERFILES,'
      
        '       (SELECT SECTOR.SE_DESCRIPCION FROM COMPUTOS.CSE_SECTOR SE' +
        'CTOR WHERE SECTOR.SE_ID = SE_IDSECTOR) as SECTOR_INTRANET,'
      
        '       (SELECT SECTOR.SE_FECHABAJA FROM COMPUTOS.CSE_SECTOR SECT' +
        'OR WHERE SECTOR.SE_ID = SE_IDSECTOR) as BAJA_SECTOR_INTRANET,   ' +
        '    '
      
        '       EQ_DESCRIPCION, SE_PC, SE_RESPONDEA, SE_CONTRATO, RU_DETA' +
        'LLE,'
      
        '       (SELECT JEFE.SE_NOMBRE FROM ART.USE_USUARIOS JEFE WHERE J' +
        'EFE.SE_USUARIO = USUARIO.SE_RESPONDEA) as JEFE,'
      
        '       (SELECT COUNT(PU_IDPROCESO) FROM IMPOEXPO.IPU_PROCESOUSUA' +
        'RIO WHERE PU_USUARIO = SE_USUARIO) IMPOEXPO,'
      '       SE_IDNIVELAUTORIZA, NA_DESCRIPCION, SE_NOTAS'
      
        '  FROM COMPUTOS.CEQ_EQUIPO, ART.CTB_TABLAS, ZNA_NIVELAUTORIZACIO' +
        'N, ART.USE_USUARIOS USUARIO, ART.USC_SECTORES,'
      
        '       ART.UPF_PERFILES, ART.DEL_DELEGACION, COMUNES.CRU_RELACIO' +
        'NLABORALUSUARIO'
      ' WHERE SC_CODIGO = SE_SECTOR'
      '   AND PF_PERFIL = SE_PERFIL'
      '   AND EL_ID = SC_DELEGACION'
      '   AND TB_CLAVE (+) = '#39'USCAR'#39
      '   AND TB_CODIGO (+) = SE_CARGO'
      '   AND SE_PC = EQ_ID(+) '
      '   AND SE_CONTRATO = RU_ID(+)'
      '   AND SE_IDNIVELAUTORIZA = NA_ID (+)')
    Left = 20
    Top = 52
    object sdqDatosSE_USUARIO: TStringField
      FieldName = 'SE_USUARIO'
      Required = True
    end
    object sdqDatosSE_NOMBRE: TStringField
      FieldName = 'SE_NOMBRE'
      Size = 50
    end
    object sdqDatosSE_PERFIL: TStringField
      FieldName = 'SE_PERFIL'
      Required = True
      Size = 8
    end
    object sdqDatosPF_DESCRIPCION: TStringField
      FieldName = 'PF_DESCRIPCION'
      Size = 50
    end
    object sdqDatosPF_FECHABAJA: TDateTimeField
      FieldName = 'PF_FECHABAJA'
    end
    object sdqDatosSE_FECHAMOD: TDateTimeField
      FieldName = 'SE_FECHAMOD'
    end
    object sdqDatosSE_TIEMPOESPERA: TFloatField
      FieldName = 'SE_TIEMPOESPERA'
    end
    object sdqDatosSE_SECTOR: TStringField
      FieldName = 'SE_SECTOR'
      Size = 8
    end
    object sdqDatosSC_DESCRIPCION: TStringField
      FieldName = 'SC_DESCRIPCION'
      Size = 60
    end
    object sdqDatosSE_DELEGACION: TStringField
      DisplayWidth = 4
      FieldName = 'SE_DELEGACION'
      Required = True
      Size = 4
    end
    object sdqDatosSC_FECHABAJA: TDateTimeField
      FieldName = 'SC_FECHABAJA'
    end
    object sdqDatosEL_NOMBRE: TStringField
      FieldName = 'EL_NOMBRE'
      Size = 50
    end
    object sdqDatosSE_CARGO: TStringField
      FieldName = 'SE_CARGO'
      Size = 10
    end
    object sdqDatosTB_DESCRIPCION: TStringField
      FieldName = 'TB_DESCRIPCION'
      Size = 150
    end
    object sdqDatosSE_FECHABAJA: TDateTimeField
      FieldName = 'SE_FECHABAJA'
    end
    object sdqDatosSE_ACCESOSEGURIDAD: TStringField
      FieldName = 'SE_ACCESOSEGURIDAD'
      Required = True
      Size = 1
    end
    object sdqDatosSE_USUARIOGENERICO: TStringField
      FieldName = 'SE_USUARIOGENERICO'
      Required = True
      Size = 1
    end
    object sdqDatosSE_INTERNO: TStringField
      DisplayWidth = 50
      FieldName = 'SE_INTERNO'
      Size = 50
    end
    object sdqDatosSE_MAIL: TStringField
      FieldName = 'SE_MAIL'
      Size = 100
    end
    object sdqDatosPERFILES: TFloatField
      FieldName = 'PERFILES'
    end
    object sdqDatosSE_IDSECTOR: TFloatField
      FieldName = 'SE_IDSECTOR'
    end
    object sdqDatosSECTOR_INTRANET: TStringField
      FieldName = 'SECTOR_INTRANET'
      Size = 50
    end
    object sdqDatosSE_PC: TFloatField
      FieldName = 'SE_PC'
    end
    object sdqDatosSE_RESPONDEA: TStringField
      FieldName = 'SE_RESPONDEA'
    end
    object sdqDatosEQ_DESCRIPCION: TStringField
      FieldName = 'EQ_DESCRIPCION'
      Size = 50
    end
    object sdqDatosSE_CONTRATO: TFloatField
      FieldName = 'SE_CONTRATO'
      Required = True
    end
    object sdqDatosRU_DETALLE: TStringField
      DisplayLabel = 'Relaci'#243'n Laboral'
      FieldName = 'RU_DETALLE'
      Size = 40
    end
    object sdqDatosSE_FECHAALTA: TDateTimeField
      FieldName = 'SE_FECHAALTA'
    end
    object sdqDatosIMPOEXPO: TFloatField
      DisplayLabel = 'I/O'
      FieldName = 'IMPOEXPO'
    end
    object sdqDatosSE_IDNIVELAUTORIZA: TFloatField
      FieldName = 'SE_IDNIVELAUTORIZA'
    end
    object sdqDatosNA_DESCRIPCION: TStringField
      DisplayLabel = 'Nivel Cobranzas'
      FieldName = 'NA_DESCRIPCION'
      Size = 60
    end
    object sdqDatosSE_ID: TFloatField
      FieldName = 'SE_ID'
    end
    object sdqDatosBAJA_SECTOR_INTRANET: TDateTimeField
      FieldName = 'BAJA_SECTOR_INTRANET'
    end
    object sdqDatosJEFE: TStringField
      FieldName = 'JEFE'
      Size = 50
    end
    object sdqDatosSE_NOTAS: TStringField
      FieldName = 'SE_NOTAS'
      Size = 2000
    end
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 48
    Top = 52
  end
  object Seguridad: TSeguridad
    AfterExecute = SeguridadAfterExecute
    AutoEjecutar = True
    Claves = <>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = False
    Left = 20
    Top = 80
  end
  object FormPlacement: TFormPlacement
    UseRegistry = True
    Left = 48
    Top = 80
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        OnShortCutPress = tbRefrescarClick
        LinkControl = tbRefrescar
      end
      item
        Key = 16462
        OnShortCutPress = tbNuevoClick
        LinkControl = tbNuevo
      end
      item
        Key = 13
        OnShortCutPress = tbModificarClick
        LinkControl = tbModificar
      end
      item
        Key = 46
        OnShortCutPress = tbEliminarClick
        LinkControl = tbEliminar
      end
      item
        Key = 114
        OnShortCutPress = tbBuscarClick
        LinkControl = tbBuscar
      end
      item
        Key = 16454
        OnShortCutPress = tbFiltrosClick
        LinkControl = tbFiltros
      end
      item
        Key = 16463
        OnShortCutPress = tbOrdenarClick
        LinkControl = tbOrdenar
      end
      item
        Key = 16453
        OnShortCutPress = tbExportarClick
        LinkControl = tbExportar
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16467
        OnShortCutPress = tbSalirClick
        LinkControl = tbSalir
      end>
    Left = 76
    Top = 52
  end
  object SortDialog: TSortDialog
    Caption = 'Orden'
    DataSet = sdqDatos
    SortFields = <>
    IniStorage = FormPlacement
    FixedRows = 0
    Left = 76
    Top = 80
  end
  object pmnuNuevos: TPopupMenu
    Images = ImageList
    OwnerDraw = True
    Left = 20
    Top = 136
    object mnuNuevoUsuario: TMenuItem
      Caption = 'Nuevo Usuario'
      ImageIndex = 2
      OnClick = tbNuevoClick
    end
    object mnuCrearCopia: TMenuItem
      Caption = 'Crear Copia'
      ImageIndex = 3
      OnClick = tbNuevoClick
    end
  end
  object ImageList: TImageList
    Left = 20
    Top = 108
    Bitmap = {
      494C0101040009000C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      31000000310000009C00000084000000FF000000CE000000CE0000009C000000
      8400000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C3131009C3131009C3131009C3131009C3131009C3131000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000009C0000009C0000009C0000009C0000009C0000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF0000009C000000840094949400A5A5A50084848400636363000000
      0000000000000000000000000000000000000000000084000000FF000000FF00
      0000FF000000840000006363630084000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000212121006331
      31009C6331009C6331009C6331009C6331009C6331009C3131009C3131009C31
      3100633131000000000000000000000000000000000000000000000031000000
      9C000000CE000000CE000000CE000000CE000000CE000000CE0000009C000000
      9C00000084000000000000000000000000000000000000000000000000000000
      00000000840094949400C6C6C600B5B5B500A5A5A50084848400000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      00008400000063636300A5A5A500848484000000000000008400000084000000
      84000000840000008400000000000000000000000000633131009C633100CE63
      3100CE633100CE633100CE633100CE633100CE6331009C6331009C3131009C31
      31009C31310063313100000000000000000000000000000084000000CE003100
      FF003100FF003100FF003100FF003100FF003100FF003100FF000000CE000000
      CE0000009C000000840000000000000000000000000000000000000000000000
      000000000000CECECE00C6C6C600B5B5B500A5A5A50084848400000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400C6C6C600A5A5A5008484840000000000000000000000840000008400DEDE
      DE00000084000000FF0000000000000000000000000063313100CE9C9C00CE9C
      6300CE633100CE633100CE633100CE633100CE633100CE633100CE6331009C63
      31009C3131009C313100000000000000000000000000000084000063FF003131
      FF003100FF003100FF003100FF003100FF003100FF003100FF003100FF003100
      FF000000CE0000009C0000000000000000000000000000000000000000000000
      00001818180000000000C6C6C600B5B5B500A5A5A50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60000000000000000000000000000008400DEDEDE00DEDE
      DE00C6C6C60000000000000000000000000063313100CE9C9C00CE9C6300CE63
      3100CE633100CE633100FFFFFF00FFFFFF00CE9C9C00CE633100CE633100CE63
      31009C3131009C3131009C31310000000000000084006363FF000031FF003100
      FF00CECEFF00FFFFFF00CECEFF003100FF003100FF00CECEFF00FFFFFF00CECE
      FF000000CE0000009C0000009C00000000000000000000000000000000001818
      1800181818000000000000000000C6C6C600CECECE00CECECE00CECECE00CECE
      CE00C6C6C6000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600C6C6C600C6C6C60000000000DEDEDE00C6C6
      C6000000000000000000000000000000000063313100CE9C9C00CE9C9C00CE63
      3100CE9C6300FFFFFF00FFFFFF00EFEFEF00FFFFFF00CE9C9C00CE633100CE63
      31009C6331009C3131009C31310000000000000084006363FF003163FF003100
      FF003100FF00CECEFF00FFFFFF00CE9CFF00CE9CFF00FFFFFF00CECEFF003100
      FF003100FF000000CE0000009C00000000000000000000000000181818001818
      180018181800000000000000000000000000DEDEDE00D6D6D600D6D6D600CECE
      CE00C6C6C6000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600C6C6C600C6C6C60000000000EFEFEF000000
      00000000000000000000000000000000000063313100CE9C9C00CE9C9C00CE9C
      6300EFEFEF00FFFFFF00CECE9C00CE9C6300EFEFEF00FFFFFF00CE9C9C00CE63
      3100CE6331009C6331009C31310000000000000084006363FF003163FF003100
      FF003100FF003100FF00CE9CFF00FFFFFF00FFFFFF00CE9CFF003100FF003100
      FF003100FF000000CE0000009C00000000000000000000000000212121001818
      1800000000000000000000000000C6C6C600DEDEDE00DEDEDE00D6D6D600CECE
      CE00C6C6C6000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000CECE
      CE00CECECE00C6C6C600000000000000000063313100CE9C9C00F7CEA500CE9C
      6300CE9C9C00CE9C9C00CE633100CE633100CE9C6300EFEFEF00FFFFFF00CECE
      9C00CE6331009C6331009C31310000000000000084006363FF003163FF003131
      FF003100FF003100FF00CE9CFF00FFFFFF00FFFFFF00CE9CFF003100FF003100
      FF003100FF000000CE0000009C00000000000000000000000000181818001818
      18000000000000000000C6C6C600EFEFEF00EFEFEF00DEDEDE00D6D6D600D6D6
      D600CECECE00C6C6C60000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600FF00000000000000EFEFEF00EFEF
      EF00DEDEDE00DEDEDE00000000000000000063313100CE9C9C00F7CEA500CE9C
      6300CE633100CE633100CE633100CE633100CE633100CE9C6300FFFFFF00FFFF
      FF00CECE9C009C6331009C31310000000000000084006363FF00319CFF003131
      FF003100FF00CECEFF00FFFFFF00CE9CFF00CE9CFF00FFFFFF00CECEFF003100
      FF003100FF000000CE0000009C000000000000000000000000001818180031CE
      FF00000000000000000000000000C6C6C600DEDEDE00DEDEDE00DEDEDE00FF00
      0000EFEFEF0000000000000000000000000000000000000000000000000031CE
      FF000000000000000000C6C6C600C6C6C600C6C6C60000000000C6C6C600EFEF
      EF00EFEFEF00EFEFEF00C6C6C6000000000063313100CE9C6300FFCECE00F7CE
      A500CE633100CE633100CE633100CE633100CE633100CE633100CE633100CE63
      3100CE6331009C6331009C31310000000000000084006363CE00319CFF000063
      FF00C6D6EF00FFFFFF00CECEFF003100FF003100FF00CECEFF00FFFFFF00CECE
      FF003100FF000000CE0000009C00000000000000000031CEFF002121210031CE
      FF001818180031CEFF00000000000000000000000000DEDEDE00DEDEDE000000
      0000000000000000000000000000000000000000000031CEFF000000000031CE
      FF000000000031CEFF000000000000000000C6C6C600C6C6C60000000000DEDE
      DE00EFEFEF00FF00000000000000000000000000000063313100CE9C9C00F7CE
      A500CE9C9C00CE633100CE633100CE633100CE633100CE633100CE633100CE63
      3100CE6331009C633100000000000000000000000000000084006363FF003163
      FF000063FF003100FF003100FF003100FF003100FF003100FF003100FF003100
      FF003100FF000000CE000000000000000000000000000000000031CEFF0031CE
      FF0031CEFF0000000000000000000000000000000000C6C6C600DEDEDE00DEDE
      DE00CECECE00000000000000000000000000000000000000000031CEFF0031CE
      FF0031CEFF00000000000000000000000000000000000000000000000000DEDE
      DE00DEDEDE00EFEFEF0000000000000000000000000063313100CE9C6300F7CE
      A500F7CEA500CE9C9C00CE9C6300CE636300CE633100CE633100CE633100CE63
      3100CE63310063313100000000000000000000000000000084003163CE00319C
      FF003163FF000063FF003131FF003131FF003100FF003100FF003100FF003100
      FF003100FF0000009C00000000000000000031CEFF0031CEFF0031CEFF001818
      180031CEFF0031CEFF0031CEFF00000000000000000000000000C6C6C600DEDE
      DE00CECECE0000000000000000000000000031CEFF0031CEFF0031CEFF008484
      000031CEFF0031CEFF0031CEFF00000000000000000000000000000000000000
      000000000000C6C6C600C6C6C60000000000000000000000000063313100CE9C
      6300CE9C9C00F7CEA500F7CEA500CE9C9C00CE9C6300CE633100CE633100CE63
      3100633131002121210000000000000000000000000000000000000084003163
      CE006363FF00319CFF00319CFF003163FF000031FF003100FF003100FF003100
      FF0000009C00000031000000000000000000000000000000000031CEFF0031CE
      FF0031CEFF002121210018181800212121001818180000000000000000000000
      000000000000000000000000000000000000000000000000000031CEFF0031CE
      FF0031CEFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006331
      310063313100CE9C6300CE9C9C00CE9C9C00CE9C9C00CE9C9C009C6331006331
      3100633131000000000000000000000000000000000000000000000000000000
      8400000084006363CE006363FF006363FF006363FF005252FF000000CE000000
      8400000084000000000000000000000000000000000031CEFF000000000031CE
      FF001818180031CEFF0018181800181818001818180000000000000000000000
      0000000000001818180000000000000000000000000031CEFF000000000031CE
      FF000000000031CEFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006331310063313100633131006331310063313100633131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000840000008400000084000000840000008400000084000000
      00000000000000000000000000000000000000000000000000000000000031CE
      FF00000000002121210018181800212121001818180018181800181818001818
      18001818180000000000000000000000000000000000000000000000000031CE
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000F81FF81FE007803FE007E007F00F803F
      C003C003F01FC00180018001F007E00180018001E003E00300000000E003C003
      00000000C003800300000000C001800100000000C003800100000000C0038000
      000000008003800180018001C003C0018001800100030000C003C003C003C000
      E007E007A003AA00F81FF81FE807EF0300000000000000000000000000000000
      000000000000}
  end
  object ExportDialog: TExportDialog
    Caption = 'Exportar Usuarios Seleccionados'
    DataSet = sdqDatos
    Fields = <>
    OutputFile = 'Usuarios.txt'
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    Left = 48
    Top = 108
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <>
    DataSource = dsDatos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Usuarios'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -11
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = 14737632
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLinesWidth = 0
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Color = 14079702
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Color = 12961221
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    PageOrientation = pxLandscape
    OnGetCellParams = QueryPrintGetCellParams
    Left = 76
    Top = 108
  end
  object pmuImpoExpo: TPopupMenu
    OwnerDraw = True
    Left = 48
    Top = 136
    object mnuSeleccionarTodos: TMenuItem
      Caption = 'Seleccionar todos'
      OnClick = mnuSeleccionarTodosClick
    end
    object mnuNoSeleccionarNinguno: TMenuItem
      Caption = 'No seleccionar ninguno'
      OnClick = mnuNoSeleccionarNingunoClick
    end
  end
  object ImgColor2: TImageList
    Left = 48
    Top = 164
    Bitmap = {
      494C01010F0013000C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      000000000000000000000000000000000000000000003131CE003131CE000000
      FF0000009C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000636300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003131CE003131CE000063
      FF000000FF0000009C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000031636300639CCE00000000000000000000000000000000000000
      0000000000000000000000000000CECE00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003131CE00319C
      FF000063FF000000CE0000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000316363009CCECE00C6D6EF00000000000000000000000000000000000000
      00000000000000000000CECE6300CECE63006363000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003131
      CE00319CFF000000FF0000009C00000000000000000000000000000000000000
      000000000000000000000000FF0000009C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003163
      6300639CCE00C6D6EF0000000000000000000000000000000000000000000000
      000000000000CECE6300FFFF6300CECE6300CECE310063630000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000CE000063FF0000009C00000000000000000000000000000000000000
      0000000000000000FF0000009C00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000031636300639C
      CE00C6D6EF000000000000000000000000000000000000000000000000000000
      0000CECE6300FFFF6300FFFF9C00CECE6300CECE3100CECE3100636300000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000CE000000FF0000009C000000000000000000000000000000
      00000000FF0000009C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031636300639CCE009CCE
      CE0000000000000000000000000000000000000000000000000000000000CECE
      6300CECE63006363310063633100636331006363310063633100636331006363
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000CE000000FF0000009C0000000000000000000000
      FF0000009C000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000639CCE00319CCE00C6D6EF000000
      0000000000000000000000000000000000000000000000000000313100003131
      00009C9C9C009C9C9C00B5B5B500B5B5B500DEDEDE0052525200313100003131
      0000313100000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000CE000000FF0000009C000000FF000000
      9C0000000000000000000000000000000000000000000000000000000000CECE
      3100FFFF9C00CECE3100CECE31000000000000000000319CCE00000000000000
      0000000000000000000000000000000000000000000063630000848400006363
      31009C9C9C00B5B5B500B5B5B500C6C6C600C6C6C60073737300525252006363
      0000636300006363000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000CE000000FF0000009C000000
      0000000000000000000000000000000000000000000000000000CECE3100FFFF
      9C00FFFF9C00CECE3100CECE3100CECE31000000000000000000000000000000
      0000000000000000000000000000000000000000000084840000636300009C9C
      9C009C9C9C00B5B5B500B5B5B500C6C6C60084848400B5B5B500A5A5A5003131
      0000636300006363000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000CE000000FF0000009C000000CE000000
      9C000000000000000000000000000000000000000000FFFFCE00FFFFFF00FFEF
      CE00FFFF9C00CECE6300CECE3100CECE3100CECE310000000000000000000000
      0000000000000000000000000000000000000000000031310000636331009C9C
      9C00B5B5B500B5B5B500C6C6C600DEDEDE0084848400DEDEDE00A5A5A5005252
      5200636300003131000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000CE000000FF0000009C0000000000000000000000
      CE0000009C0000000000000000000000000000000000FFFF9C00FFEFCE00FFEF
      CE00FFFF9C00CECE6300CECE3100CECE3100CECE310000000000000000000000
      00000000000000000000000000000000000000000000000000009C9C9C009C9C
      9C00B5B5B500B5B5B500C6C6C600C6C6C60063636300DEDEDE00B5B5B500A5A5
      A500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000CE000000CE000000FF0000009C000000000000000000000000000000
      00000000CE0000009C00000000000000000000000000FFFF9C00FFFF9C00FFFF
      9C00FFCE6300CECE3100CECE3100CE9C3100CE9C310000000000000000000000
      00000000000000000000000000000000000000000000393939009C9C9C00B5B5
      B500FFFFFF00848484008484840039393900EFEFEF00DEDEDE00DEDEDE00B5B5
      B500212121000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000CE000000
      CE00319CFF000000FF0000009C00000000000000000000000000000000000000
      0000000000000000CE0000009C000000000000000000FFFF3100FFCE9C00FFCE
      9C00FFCE6300CECE3100CECE31009C9C3100CE9C310000000000000000000000
      0000000000000000000000000000000000000000000039393900424242005252
      520052525200CECECE0084848400FFFFFF00C6C6C60063636300848484008484
      8400313131000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE00319CFF000063
      FF000000FF0000009C0000000000000000000000000000000000000000000000
      000000000000000000000000CE0000009C000000000000000000CECE6300CECE
      6300CECE3100CECE3100CECE31009C9C31000000000000000000000000000000
      000000000000000000000000000000000000000000008484840094949400A5A5
      A500B5B5B500CECECE006363630063636300C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000CE00319CFF000063FF000000
      FF0000009C000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      3100CECE3100CE9C3100CE9C3100000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000052525200A5A5
      A500B5B5B500DEDEDE00DEDEDE00DEDEDE00FFFFFF00FFFFFF00FFFFFF008484
      8400393939000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000063639C000000CE000000CE006363
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000063636300DEDEDE00DEDEDE00DEDEDE00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF313100FF636300FF636300FF9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100313131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF31
      3100FF636300FF636300FF9C9C00FF9C9C000000000000000000000000000000
      000000000000000000000000000031313100C6C6C600FFFFFF00C6C6C6000000
      00000000000031636300639CCE00000000000000000000000000000000000000
      00000000000000000000000000000000000084000000FF000000CE0000006331
      31006331310084000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400848484008484840000000000C6C6
      C600FFFFFF00C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF313100FF63
      6300FF636300FF9C9C00FF9C9C00FF9C9C000000000000000000000000000000
      00000000000031313100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000316363009CCECE00C6D6EF00000000000000000000000000000000000000
      0000000000000000000000000000000000003100000063313100B5B5B500DEDE
      DE006363630000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C6008484840000000000C6C6C600848484008484840000000000C6C6
      C600FFFFFF00C6C6C60084848400000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF313100FF636300FF63
      6300FF9C9C00FF9C9C00FF9C9C00000000000000000000000000000000003131
      3100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFCECE00FF636300000000003163
      6300639CCE00C6D6EF0000000000000000009C9C9C00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE008484840063636300DEDEDE008484
      84002121210000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C6008484840000000000C6C6C600848484008484840000000000C6C6
      C600FFFFFF00C6C6C60084848400000000000000000000000000000000000000
      000000000000000000000000000000000000FF313100FF636300FF636300FF9C
      9C00FF9C9C00FF9C9C000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFCECE00FF636300FFCECE000000000031636300639C
      CE00C6D6EF000000000000000000000000009C9C9C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000009C9C9C00CECE
      CE00CECECE00CECECE00000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C60084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000FF313100FF636300FF636300FF9C9C00FF9C
      9C00FF9C9C00000000000000000000000000000000000000000000000000FFFF
      FF00FFCECE00FF636300FFCECE00FF6363000000000031636300639CCE009CCE
      CE00000000000000000000000000000000009C9C9C00FFCECE00FF636300FF63
      6300FF636300FF636300FF63630039393900000000000000000031313100DEDE
      DE00DEDEDE00CECECE00000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C6008484840000000000000000000000000000000000FF31
      3100FF313100FF313100FF313100FF636300FF636300FF9C9C00FF9C9C00FF9C
      9C00000000000000000000000000000000000000000031313100DEDEDE000000
      000000000000000000000000000000000000639CCE00319CCE00C6D6EF000000
      0000FFFFFF003131310000000000000000009C9C9C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00949494000000000084848400FFFFFF00C6C6C600C6C6
      C600848484008484840084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C60084848400000000000000000000000000FF636300FFCE
      CE00FFCECE00FFCECE00FFCECE00FF636300FF9C9C00FF9C9C00F7CEA5000000
      00000000000000000000000000000000000000000000FFFFFF0000000000CECE
      3100FFFF9C00CECE3100CECE31000000000000000000319CCE0000000000FF63
      6300FFCECE00C6C6C60000000000000000009C9C9C00FFCECE00FF636300FF63
      6300FF636300FF636300FF636300000000000000000000000000393939009C9C
      9C00DEDEDE0063313100313131000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C600848484000000000000000000FF9C9C00FFCECE00FFCE
      CE0000000000000000000000000000000000FF313100F7CEA500000000000000
      0000000000000000000000000000000000000000000000000000CECE3100FFFF
      9C00FFFF9C00CECE3100CECE3100CECE31000000000000000000FFCECE00FF63
      6300FF636300FFFFFF0031313100000000009C9C9C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00009C9C9C00DEDEDE00313131000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C600848484000000000000000000FFCECE00FFCECE000000
      000000000000000000000000000000000000FF313100F7CEA500000000000000
      00000000000000000000000000000000000000000000FFFFCE00FFFFFF00FFEF
      CE00FFFF9C00CECE6300CECE3100CECE3100CECE310000000000FF636300FFCE
      CE00FF636300FFCECE00C6C6C600000000009C9C9C00FFCECE00FF636300FF63
      6300FF636300FF636300FF636300848484000000000000000000000000000000
      00000000000063636300313131000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C600848484000000000000000000FFCECE00000000000000
      000000000000000000000000000000000000FF313100F7CEA500000000000000
      00000000000000000000000000000000000000000000FFFF9C00FFEFCE00FFEF
      CE00FFFF9C00CECE6300CECE3100CECE3100CECE310000000000FFCECE00FFCE
      CE00FFFFFF00FFFFFF00FFFFFF00313131009C9C9C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003939390000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C600848484000000000000000000FFCECE00000000000000
      000000000000000000000000000000000000FF313100F7CEA500000000000000
      00000000000000000000000000000000000000000000FFFF9C00FFFF9C00FFFF
      9C00FFCE6300CECE3100CECE3100CE9C3100CE9C310000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600313131009C9C9C00FFCECE00FF636300FF63
      6300FF636300FF636300FF636300FFCECE00FFCECE00FFFFFF00636363000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000FF313100FF313100F7CEA500000000000000
      00000000000000000000000000000000000000000000FFFF3100FFCE9C00FFCE
      9C00FFCE6300CECE3100CECE31009C9C3100CE9C31000000000094949400DEDE
      DE00C6C6C6003131310000000000000000009C9C9C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840084848400636363000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF000000000084848400000000000000000000000000000000000000
      00000000000000000000FF313100FF313100F7CEA50000000000000000000000
      0000000000000000000000000000000000000000000000000000CECE6300CECE
      6300CECE3100CECE3100CECE31009C9C310000000000DEDEDE00B5B5B5001818
      1800636363000000000000000000000000009C9C9C00FFCECE00FF636300FF63
      6300FF636300FF636300FFCECE00FFFFFF00C6C6C600C6C6C600212121000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C6008484840000000000000000000000000000000000FFCE
      CE00FFCECE00FFCECE00FFCECE00FFCECE000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      3100CECE3100CE9C3100CE9C3100000000008484840084848400848484003131
      3100000000000000000000000000000000009C9C9C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009494940021212100000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C004242420000000000000000000000
      000000000000000000000000000000000000000000000000000000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE000000FF000000
      9C00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600313131003939390000000000000000000000
      000000000000000000000000000000000000000000000000CE000063FF000000
      FF0000009C00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400840000008484840000000000000000000000000000000000000000000000
      0000CECECE00C6C6C6008484840000000000000000004A4A4A00525252000000
      000000000000000000000000000000000000000000000000CE00319CFF000063
      FF0000009C00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFF
      FF00CECECE00000000000000FF00000000000000000000000000FF633100FF63
      3100FF633100FF6331000000000000000000000000000000000000000000FF63
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000000000000000000000000000000000000DEDEDE00D6D6
      D6008484840084848400C6C6C600313131003939390000000000000000005A5A
      5A006363630000000000000000000000000000000000000000000000CE00319C
      FF000000CE0000009C00CE310000CE310000CE310000CE310000CE3100009CFF
      FF00CECECE000000FF0000009C0000000000FF633100FF9C3100FF9C3100FF9C
      3100FF6331000000000000000000000000000000000029292900FF633100FF9C
      3100FF6331000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008400
      000084000000840000008484840000000000000000008484840084848400A5A5
      A500CECECE00C6C6C600C6C6C60031313100393939004A4A4A00525252000000
      0000000000007373730000000000000000000000000000000000848484000000
      CE000063FF0000009C009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFF
      FF000000FF0000009C000000000000000000FF633100FFFF9C00FFCE31009C31
      00000000000000000000000000000000000029292900FF633100FF9C3100FF9C
      3100FF9C3100CE6300009C310000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      00008400000084000000840000000000000084848400A5A5A500DEDEDE00D6D6
      D600CECECE00C6C6C600C6C6C60031313100393939004A4A4A00525252005A5A
      5A0063636300000000000000000000000000000000000000000084848400FFFF
      FF000000CE000000FF0000009C00FF000000FF000000FF000000FF0000000000
      FF0000009C00000000000000000000000000FF633100FFFF9C009C3100000000
      0000000000000000000000000000FF633100FF633100FFCE3100FFCE3100FF9C
      3100FF9C3100CE6300009C310000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00DEDEDE00D6D6
      D600CECECE00C6C6C600FFFFFF0031313100393939004A4A4A00525252005A5A
      5A0063636300737373008484840000000000000000000000000084848400FFFF
      FF009CFFFF000000CE000000FF0000009C009CFFFF00FFFFFF000000FF000000
      9C00CECECE00000000000000000000000000FF633100FFFF9C00FF9C31009C31
      0000292929000000000000000000FF633100FFFFCE00FFFF9C00FFCE3100FFCE
      3100FF9C3100CE6300009C310000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00DEDEDE00D6D6
      D600FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C6004A4A4A00525252005A5A
      5A0063636300737373008484840000000000000000000000000084848400FFFF
      FF00FF000000FF0000000000CE000000FF0000009C000000FF0000009C009CFF
      FF00CECECE00000000000000000000000000FF633100FFFF9C00FFCE3100FF9C
      31009C310000292929000000000000000000FF633100FFFFCE00FFFF9C00FFCE
      3100FFCE3100CE9C3100CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00D6D6D600CECECE003131FF00FF00FF00C6C6C600C6C6C600C6C6C6005A5A
      5A0063636300737373008484840000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF009CFFFF000000CE000000FF0000009C009CFFFF00FFFF
      FF00CECECE00000000000000000000000000FF633100FFFF9C00FFFFCE00FFCE
      3100FF9C31009C310000000000000000000000000000FF633100FFFFCE00FFFF
      9C00FFCE3100CE9C3100CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00DEDEDE00D6D6
      D6009CFF9C0000FF0000D6D6D600CECECE00CECECE0084848400848484000000
      0000C6C6C600737373008484840000000000000000000000000084848400FFFF
      FF00FF633100FF6331000000CE000000FF0000009C000000CE0000009C00FFFF
      FF00CECECE00000000000000000000000000FF633100FFFFCE00FFCE31000000
      0000000000000000000000000000000000000000000000000000FF633100FFFF
      CE0000000000FFCE3100CE630000000000000000000084848400000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      000084000000000000000000000000000000000000008484840084848400FFFF
      FF00DEDEDE00C6C6C600D6D6D60084848400848484009CFFFF009CFFFF000000
      0000DEDEDE00000000000000000000000000000000000000000084848400FFFF
      FF000000CE000000CE000000FF0000009C009CFFFF00FFFFFF000000CE000000
      9C0000000000000000000000000000000000FF633100FFFF9C00000000000000
      000000000000000000000000000000000000000000000000000000000000FF63
      31000000000000000000CE9C3100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF00848484009CFFFF009CFFFF009CFFFF00CEFFFF00CEFF
      FF000000000000000000000000000000000000000000000000000000CE000000
      CE000063FF000000FF0000009C00FFFFFF00FFFFFF00FFFFFF00848484000000
      CE0000009C00000000000000000000000000FF633100FFCE3100FF9C31000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFCE31009C3100000000000000000000848484000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      00000000000084848400848484009CFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00000000000000000000000000000000000000CE00319CFF000063
      FF000000CE0000009C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484000000
      00000000CE0000009C00000000000000000000000000FF633100FFCE3100FF9C
      3100000000000000000000000000000000000000000000000000000000000000
      000000000000FF9C3100CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000094949400CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00F7FFFF00F7FFFF0000000000000000000000CE00319CFF000063FF000000
      CE0000009C008484840084848400848484008484840084848400848484000000
      000000000000000000000000CE00000000000000000000000000FF633100FF63
      3100FF633100CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE63000000000000000000000000000000000000000000008484
      8400000000008484840000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949400CEFFFF00F7FFFF00F7FF
      FF0094949400949494000000000000000000000000000000CE000000CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5B5B500B5B5B500B5B5
      B500000000000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100FF63310084000000FFCE3100FF633100FF63
      3100FF633100FF633100FF633100840000000000000000000000000000000000
      0000000000000000000000000000000000002942420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100FF63310084000000FFCE3100FF9C0000FF63
      3100FF633100FF633100FF633100840000000000000000000000000000000000
      000000000000000000000018180000FFFF0063A5A50031525200000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE0000000000000000000000000000000000FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100FF63310084000000FFCE3100FF9C0000FF9C
      0000FF633100FF633100FF633100840000000000000000000000000000000000
      0000000000005A5A5A0000FFFF0000ADAD0000F7F70000A5A500183131000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00CE310000CE310000CE310000CE310000CE310000CE310000CE31
      00009CFFFF00CECECE0000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF9C00FFFF9C00FFFF9C0084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000073730000A5A50000FFFF0000DEDE0000D6D600A5BDBD000018
      1800000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400FFFFFF00CE31
      0000CE310000CE31000000000000000000000000000000000000000000006363
      9C0063639C0063639C0000000000FF0000000000000000000000000000000000
      00000000000084000000840000008400000084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000000000000000000000000
      00003939390000CECE0000F7F70000DEDE0000CECE0000F7F70010B5B50000E7
      E700294A4A000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FF000000FF000000FF000000FF000000FF000000FF000000FF00
      00009CFFFF00CECECE0000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00000000000000000094ADAD0094ADAD0094ADAD00639C
      9C00639C9C0094ADAD0000000000FF3131000000000000000000000000008400
      00000000000084848400848484008484840084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000000000000000000000000
      00000031310000EFEF0000CECE0000D6D60000EFEF0000C6C60010FFFF004AC6
      C60063BDBD003152520000000000000000000000000000000000000000008484
      8400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400FFFFFF00FF00
      0000FF000000FF0000000000000000FFFF00000000000000000094ADAD0094AD
      AD0094ADAD0094ADAD0000000000FF6363000000000000000000000000008400
      00008484000084848400848484008484840084000000FFCE310000000000FF9C
      000000000000000000000000000000000000000000000000000000000000BDA5
      A500005252006BD6D60000DEDE0000FFFF0000BDBD0010FFFF005AB5B50000EF
      EF0000E7E70018CECE0021212100000000000000000000000000000000008484
      8400FFFFFF00FF000000FF000000FF000000FF000000FF000000FF000000FF00
      00009CFFFF00CECECE0000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF0000000000C6C6C60000FFFF0000000000C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000008400
      0000FFCE310084840000848484008484840084000000FFCE3100FFFFFF00FF9C
      0000000000000000000000000000000000000000000000000000000000008C00
      0000A54A0000004242009CCECE000094940000FFFF0052BDBD0000F7F70000F7
      F7007BDEDE00005A5A0021212100000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400FFFFFF00FF00
      0000FF000000FF000000FF00000000000000C6C6C60000FFFF00000000000000
      0000000000000000000000000000000000008484000084840000848400008484
      0000FFCE3100FFCE3100848400008484840084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000000000000BD9C9C00FFFF
      0000F7F731008C4A4A001042420000FFFF0039CECE0000E7E70018DEDE0010B5
      B5000031310039393900000000000000000000000000000000000000000031CE
      FF00FFFFFF00FF633100FF633100FF633100FF633100FF6331009CFFFF00FFFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00000000000000000000FFFF000000
      000000000000000000000000000000000000FFCE3100FFFF9C00FFFF9C00FFFF
      9C00FFFF9C00FFFF9C00FFCE31008400000084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000000000000BD9C9C00FFFF
      0000B5B58C00C69473007B310000004A4A0029C6C60031848400004242005252
      5200000000000000000000000000000000000000000031CEFF000000000031CE
      FF00FFFFFF0031CEFF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF008484
      8400000000000000000000000000000000000000000084848400FFFFFF00FF63
      3100FF633100FF633100FF633100FF6331009CFFFF00FFFFFF00FFFFFF0000FF
      FF00000000000000000000000000000000008400000084000000840000008400
      0000FFFF9C00FFCE3100840000008484840084000000FFCE3100FF9C0000FF9C
      00000000000000000000000000000000000000000000C6BDBD00B5631000FFFF
      F700BDADAD008473000084000000942121002121210021212100000000000000
      000000000000000000000000000000000000000000000000000031CEFF0031CE
      FF0031CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400FFFFFF000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF0084848400000000000000
      000000FFFF000000000000000000000000000000000000000000000000008400
      0000FFCE310084000000848484008484840084000000FFCE3100FF9C0000FF9C
      00000000000000000000000000000000000000000000C6841000FFFFE7008C8C
      2100B5848400C6B5B500C6B5B500000000000000000000000000000000000000
      00000000000000000000000000000000000031CEFF0031CEFF0031CEFF008484
      840031CEFF0031CEFF0031CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF000000
      00000000000000FFFF0000000000000000000000000000000000000000008400
      00008400000084848400848484008484840084848400FFFF9C00FF9C0000FF9C
      00000000000000000000000000000000000094393900F7F76B009C843900AD84
      7B00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000031CEFF0031CE
      FF0031CEFF008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400FFFF9C00FF9C
      000000000000000000000000000000000000943939007B7B0000AD6B6B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031CEFF000000000031CE
      FF000000000031CEFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000848484008484840084848400848484008484840084848400FFFF
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000031CE
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0087FFFFF8FC7F000083FFFFF0FC7F0000
      C3FEFFE0F83F0000E1FCFFC1F01F0000F1F9FF83E00F0000F8F3FF07C0070000
      FC67E00F80030000FE0FC01F00010000FF1F803F00010000FE0F003F80030000
      FC67003F80070000F0F3003F80070000C1F9003F8003000083FC807F00030000
      07FFC0FF800700000FFFE1FFE01F00008001FFE0FF18FF830000FFC0FC00FF01
      0000FF80F00000030000FF00C00100030000FE01C00300010000E003C0030001
      0000C007800300000000800F000100010000001F8001000100000E1F00000000
      00001E1F0000000000001E1F0000000300003C1F0001000F0000E03F8003001F
      0000C07FC007003F8001C0FFE00F007FDFFFFFFFFFFFFC7F8002FFF781F7F01F
      8003C1E79DE3C007800181C7CFE38001C0010381E7C18001C0030700F3C10001
      C0030E00B9F70000C003060081F70000C0030300FFF70000C003000088F70000
      C00300009CF78001C0030000C1F7E007C0070000C9F7F80380038001E3F7FE00
      001DC003E3F7FF039FFFFFFFF7F7FF8F0000FFFFE001FFFF0000FE7FE0018007
      0000FC3FE00180070000F81FE0018000F807F80FE0018000F807F007E0018000
      E807F003E0018000E007E001E0018000E007E001E00180070007C003E0018007
      0007C00FA00180070007803FC0038003E00781FF0007800BE0070FFFC00F801F
      F8071FFFABFF803FF807FFFFEFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object imgBN2: TImageList
    Left = 20
    Top = 164
    Bitmap = {
      494C01010F0013000C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      000000000000000000000000000000000000000000004A4A4A00525252006363
      6300424242000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000636363000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00525252008484
      8400636363004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000424242007373730084848400000000000000000000000000000000000000
      0000000000000000000000000000737373000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000525252008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000737373000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004242
      420073737300C6C6C600B5B5B500424242000000000000000000000000000000
      0000000000000000000073737300737373006363630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005252
      5200848484008484840042424200000000000000000000000000000000000000
      0000000000000000000073737300424242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000424242007373
      7300A5A5A500C6C6C60042424200000000000000000000000000000000000000
      0000000000007373730084848400737373007373730063636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000525252009494940042424200000000000000000000000000000000000000
      0000000000006363630042424200000000000000000000000000000000000000
      000000000000000000000000000000000000000000004242420073737300A5A5
      A500B5B5B5004242420000000000000000000000000000000000000000000000
      0000737373008484840084848400737373007373730073737300636363000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005252520063636300424242000000000000000000000000000000
      0000636363004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004242420073737300A5A5A500B5B5
      B500424242000000000000000000000000000000000000000000000000007373
      7300737373006363630063636300636363006363630063636300636363006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000052525200636363004242420000000000000000006363
      6300424242000000000000000000000000000000000000000000000000004242
      42004242420042424200424242004242420084848400A5A5A500B5B5B5004242
      4200000000000000000000000000000000000000000000000000393939003939
      39009C9C9C009C9C9C00B5B5B500B5B5B500DEDEDE0052525200393939003939
      3900393939000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000525252006363630042424200636363004242
      420000000000000000000000000000000000000000000000000042424200CECE
      CE00D6D6D600C6C6C600C6C6C600424242004242420084848400424242000000
      000000000000000000000000000000000000000000005A5A5A00636363005A5A
      5A009C9C9C00B5B5B500B5B5B500C6C6C600C6C6C60073737300525252006363
      6300636363006363630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005252520063636300424242000000
      0000000000000000000000000000000000000000000042424200CECECE00D6D6
      D600D6D6D600C6C6C600C6C6C600C6C6C6004242420042424200000000000000
      00000000000000000000000000000000000000000000636363005A5A5A009C9C
      9C009C9C9C00B5B5B500B5B5B500C6C6C60084848400B5B5B500A5A5A5003939
      3900636363006363630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484006363630042424200636363004242
      42000000000000000000000000000000000042424200CECECE00F7F7F700E7E7
      E700D6D6D600C6C6C600C6C6C600C6C6C600C6C6C60042424200000000000000
      00000000000000000000000000000000000000000000313100005A5A5A009C9C
      9C00B5B5B500B5B5B500C6C6C600DEDEDE0084848400DEDEDE00A5A5A5005252
      5200636363003131000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400636363004242420000000000000000006363
      63004242420000000000000000000000000042424200D6D6D600E7E7E700E7E7
      E700D6D6D600C6C6C600C6C6C600C6C6C600C6C6C60042424200000000000000
      00000000000000000000000000000000000000000000000000009C9C9C009C9C
      9C00B5B5B500B5B5B500C6C6C600C6C6C60063636300DEDEDE00B5B5B500A5A5
      A500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A004A4A4A0063636300424242000000000000000000000000000000
      00006363630042424200000000000000000042424200D6D6D600D6D6D600D6D6
      D600C6C6C600C6C6C600C6C6C600A5A5A500A5A5A50042424200000000000000
      00000000000000000000000000000000000000000000393939009C9C9C00B5B5
      B500FFFFFF00848484008484840039393900EFEFEF00DEDEDE00DEDEDE00B5B5
      B500212121000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004A4A4A004A4A
      4A00848484006363630042424200000000000000000000000000000000000000
      00000000000063636300424242000000000042424200C6C6C600CECECE00CECE
      CE00C6C6C600C6C6C600C6C6C60084848400A5A5A50042424200000000000000
      0000000000000000000000000000000000000000000039393900424242005252
      520052525200CECECE0084848400FFFFFF00C6C6C60063636300848484008484
      8400313131000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00848484008484
      8400636363004242420000000000000000000000000000000000000000000000
      0000000000000000000073737300424242000000000042424200B5B5B500B5B5
      B500C6C6C600C6C6C600C6C6C600848484004242420000000000000000000000
      000000000000000000000000000000000000000000008484840094949400A5A5
      A500B5B5B500CECECE006363630063636300C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A4A4A0084848400737373006363
      6300424242000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042424200C6C6
      C600C6C6C6009494940094949400424242000000000000000000000000000000
      000000000000000000000000000000000000000000000000000052525200A5A5
      A500B5B5B500DEDEDE00DEDEDE00DEDEDE00FFFFFF00FFFFFF00FFFFFF008484
      8400393939000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007373730052525200525252007373
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004242
      4200424242004242420042424200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000063636300DEDEDE00DEDEDE00DEDEDE00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000636363008484840084848400A5A5A5000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100313131000000
      0000000000004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100313131003131
      3100313131003131310000000000000000008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006363
      63008484840084848400A5A5A5009C9C9C000000000000000000000000000000
      000000000000000000000000000031313100C6C6C600FFFFFF00C6C6C6000000
      0000424242007373730084848400000000000000000000000000000000000000
      0000000000000000000000000000000000004A4A4A0084848400737373004A4A
      4A004A4A4A0073737300313131000000000084848400DEDEDE00C6C6C600C6C6
      C600C6C6C600848484008484840084848400848484008484840000000000C6C6
      C600DEDEDE00C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000636363008484
      840084848400A5A5A500A5A5A500A5A5A5000000000000000000000000000000
      00000000000031313100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF004242
      420073737300C6C6C600B5B5B500424242003131310031313100313131003131
      310031313100313131003131310031313100310000004A4A4A00B5B5B500DEDE
      DE006363630031313100000000000000000084848400D6D6D600C6C6C600C6C6
      C600C6C6C6008484840000000000C6C6C600848484008484840000000000C6C6
      C600DEDEDE00C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300848484008484
      8400A5A5A5009C9C9C00A5A5A500000000000000000000000000000000003131
      3100C6C6C600FFFFFF00FFFFFF00FFFFFF00CECECE009C9C9C00424242007373
      7300A5A5A500C6C6C600424242000000000073737300DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE008484840063636300DEDEDE008484
      84003131310031313100000000000000000084848400DEDEDE00C6C6C600C6C6
      C600C6C6C6008484840000000000C6C6C600848484008484840000000000C6C6
      C600DEDEDE00C6C6C60084848400000000000000000000000000000000000000
      000000000000000000000000000000000000636363008484840084848400A5A5
      A500A5A5A500A5A5A5000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00CECECE009C9C9C00CECECE004242420073737300A5A5
      A500B5B5B50042424200000000000000000073737300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0031313100313131009C9C9C00CECE
      CE00CECECE00CECECE00313131000000000084848400D6D6D600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000636363008484840084848400A5A5A5009C9C
      9C00A5A5A500000000000000000000000000000000000000000000000000FFFF
      FF00CECECE009C9C9C00CECECE009C9C9C004242420073737300A5A5A500B5B5
      B5004242420000000000000000000000000073737300E7E7E700A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A50039393900313131003131310031313100DEDE
      DE00DEDEDE00CECECE00313131000000000084848400DEDEDE00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400000000000000000000000000000000006363
      63006363630063636300636363008484840084848400A5A5A500A5A5A500A5A5
      A500000000000000000000000000000000000000000031313100DEDEDE004242
      42004242420042424200424242004242420084848400A5A5A500B5B5B5004242
      4200FFFFFF0031313100000000000000000073737300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00313131003131310031313100DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00949494003131310084848400D6D6D600C6C6C600C6C6
      C600848484008484840084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C6008484840000000000000000000000000063636300CECE
      CE00D6D6D600CECECE00D6D6D60084848400A5A5A5009C9C9C00B5B5B5000000
      00000000000000000000000000000000000000000000FFFFFF0042424200CECE
      CE00D6D6D600C6C6C600C6C6C600424242004242420084848400424242009C9C
      9C00CECECE00C6C6C600000000000000000073737300E7E7E700A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500313131003131310031313100393939009C9C
      9C00DEDEDE004A4A4A00313131000000000084848400DEDEDE00C6C6C6008484
      8400DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00C6C6C60084848400000000000000000084848400D6D6D600D6D6
      D6000000000000000000000000000000000063636300B5B5B500000000000000
      0000000000000000000000000000000000000000000042424200CECECE00D6D6
      D600D6D6D600C6C6C600C6C6C600C6C6C6004242420042424200CECECE009C9C
      9C009C9C9C00FFFFFF00313131000000000073737300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00313131003131310031313100313131003131
      31009C9C9C00DEDEDE00313131000000000084848400D6D6D600C6C6C6008484
      8400DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6
      D600DEDEDE00C6C6C600848484000000000000000000CECECE00D6D6D6000000
      00000000000000000000000000000000000073737300B5B5B500000000000000
      00000000000000000000000000000000000042424200CECECE00F7F7F700E7E7
      E700D6D6D600C6C6C600C6C6C600C6C6C600C6C6C600424242009C9C9C00CECE
      CE009C9C9C00CECECE00C6C6C6000000000073737300E7E7E700A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500E7E7E7003131310031313100313131003131
      31003131310063636300313131003131310084848400DEDEDE00C6C6C6008484
      8400DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00C6C6C600848484000000000000000000D6D6D600000000000000
      00000000000000000000000000000000000063636300B5B5B500000000000000
      00000000000000000000000000000000000042424200D6D6D600E7E7E700E7E7
      E700D6D6D600C6C6C600C6C6C600C6C6C600C6C6C60042424200CECECE00CECE
      CE00FFFFFF00FFFFFF00FFFFFF003131310073737300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003939390031313100313131003131
      31003131310031313100313131003131310084848400D6D6D600C6C6C6008484
      8400DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6
      D600DEDEDE00C6C6C600848484000000000000000000CECECE00000000000000
      00000000000000000000000000000000000073737300B5B5B500000000000000
      00000000000000000000000000000000000042424200D6D6D600D6D6D600D6D6
      D600C6C6C600C6C6C600C6C6C600A5A5A500A5A5A50042424200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6003131310073737300E7E7E700B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500E7E7E700E7E7E700FFFFFF00636363003131
      31003131310031313100000000000000000084848400DEDEDE00C6C6C6008484
      8400DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00C6C6C60084848400000000000000000000000000000000000000
      00000000000000000000000000007373730063636300B5B5B500000000000000
      00000000000000000000000000000000000042424200C6C6C600CECECE00CECE
      CE00C6C6C600C6C6C600C6C6C60084848400A5A5A5004242420094949400DEDE
      DE00C6C6C60031313100000000000000000073737300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840084848400636363003131
      31000000000000000000000000000000000084848400D6D6D600C6C6C6008484
      8400DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6
      D600DEDEDE000000000084848400000000000000000000000000000000000000
      000000000000000000007373730063636300B5B5B50000000000000000000000
      0000000000000000000000000000000000000000000042424200B5B5B500B5B5
      B500C6C6C600C6C6C600C6C6C6008484840042424200DEDEDE00B5B5B5001818
      18006363630000000000000000000000000073737300E7E7E700B5B5B500B5B5
      B500B5B5B500B5B5B500E7E7E700FFFFFF00C6C6C600C6C6C600313131000000
      00000000000000000000000000000000000084848400DEDEDE00C6C6C6008484
      8400DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00C6C6C6008484840000000000000000000000000000000000D6D6
      D600D6D6D600D6D6D600D6D6D600D6D6D6000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042424200C6C6
      C600C6C6C6009494940094949400424242008484840084848400848484003131
      31000000000000000000000000000000000073737300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009494940031313100000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004242
      4200424242004242420042424200000000000000000000000000000000000000
      0000000000000000000000000000000000007373730073737300737373007373
      7300737373007373730073737300737373003131310000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00525252006363
      6300424242000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00525252008484
      8400636363004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000052525200000000000000000000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      0000737373000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600292929003131310000000000000000000000
      0000000000000000000000000000000000000000000000000000525252008484
      84008484840084848400B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B5000000000000000000737373000000000000000000525252005252
      5200525252005252520052525200000000000000000000000000000000005252
      520052525200000000000000000000000000000000004A4A4A004A4A4A000000
      000000000000000000004A4A4A00000000000000000000000000000000007373
      7300737373007373730000000000000000000000000000000000000000000000
      0000CECECE00C6C6C6008484840000000000000000004A4A4A00525252000000
      0000000000000000000000000000000000000000000000000000848484005252
      5200848484008484840042424200E7E7E700C6C6C600E7E7E700C6C6C600E7E7
      E700B5B5B50000000000737373004242420000000000525252005A5A5A005A5A
      5A005A5A5A005A5A5A0052525200000000000000000000000000000000008484
      84005252520000000000000000000000000000000000000000004A4A4A004A4A
      4A00000000000000000000000000000000000000000000000000000000007373
      7300737373007373730000000000000000000000000000000000DEDEDE00D6D6
      D6008484840084848400C6C6C600292929003131310000000000000000005A5A
      5A0063636300000000000000000000000000000000000000000084848400E7E7
      E70052525200949494004242420052525200525252005252520052525200C6C6
      C600B5B5B5006363630042424200000000005A5A5A0073737300737373007373
      73005A5A5A005252520000000000000000000000000018181800848484008484
      8400848484005252520052525200000000000000000000000000000000004A4A
      4A004A4A4A000000000000000000000000000000000000000000737373007373
      730073737300737373007373730000000000000000008484840084848400A5A5
      A500CECECE00C6C6C600C6C6C60029292900313131004A4A4A00525252000000
      000000000000737373000000000000000000000000000000000084848400E7E7
      E700C6C6C600525252006363630042424200C6C6C600E7E7E700C6C6C600E7E7
      E700636363004242420000000000000000005A5A5A00DEDEDE00848484003131
      3100525252000000000000000000000000001818180084848400848484008484
      8400848484008484840063636300525252000000000000000000000000000000
      00004A4A4A004A4A4A0000000000000000000000000000000000737373007373
      73007373730073737300737373000000000084848400A5A5A500DEDEDE00D6D6
      D600CECECE00C6C6C600C6C6C60029292900313131004A4A4A00525252005A5A
      5A0063636300000000000000000000000000000000000000000084848400E7E7
      E700636363006363630052525200636363004242420063636300636363006363
      6300424242000000000000000000000000005A5A5A00DEDEDE00636363005252
      52000000000000000000000000005A5A5A0084848400C6C6C600A5A5A5008484
      840084848400848484006363630052525200000000004A4A4A00000000000000
      0000000000004A4A4A004A4A4A00000000000000000000000000000000000000
      00007373730000000000000000000000000084848400FFFFFF00DEDEDE00D6D6
      D600CECECE00C6C6C600FFFFFF0029292900313131004A4A4A00525252005A5A
      5A0063636300737373008484840000000000000000000000000084848400E7E7
      E700C6C6C600E7E7E700C6C6C600525252006363630042424200636363004242
      4200B5B5B5000000000000000000000000005A5A5A00DEDEDE00737373006363
      630018181800000000000000000084848400EFEFEF00DEDEDE00C6C6C600A5A5
      A50084848400848484006363630052525200000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      00007373730000000000000000000000000084848400FFFFFF00DEDEDE00D6D6
      D600FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C6004A4A4A00525252005A5A
      5A0063636300737373008484840000000000000000000000000084848400E7E7
      E70073737300737373007373730073737300525252006363630042424200C6C6
      C600B5B5B5000000000000000000000000005A5A5A00DEDEDE00949494007373
      73006363630052525200000000000000000084848400EFEFEF00DEDEDE00C6C6
      C600A5A5A5008484840052525200525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007373730000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00D6D6D600CECECE006363630073737300C6C6C600C6C6C600C6C6C6005A5A
      5A0063636300737373008484840000000000000000000000000084848400E7E7
      E700E7E7E700E7E7E700C6C6C600848484006363630042424200636363004242
      4200B5B5B5000000000000000000000000005A5A5A00DEDEDE00EFEFEF009494
      940073737300636363004A4A4A004A4A4A004A4A4A0084848400EFEFEF00DEDE
      DE00C6C6C600848484006363630052525200000000004A4A4A004A4A4A004A4A
      4A00000000004A4A4A004A4A4A004A4A4A000000000000000000000000000000
      00007373730000000000000000000000000084848400FFFFFF00DEDEDE00D6D6
      D600525252004A4A4A00D6D6D600CECECE00CECECE0084848400848484000000
      0000C6C6C600737373008484840000000000000000000000000084848400E7E7
      E7008484840084848400848484006363630042424200C6C6C600E7E7E7006363
      6300424242000000000000000000000000005A5A5A00EFEFEF00949494004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A0084848400EFEF
      EF004A4A4A00B5B5B500636363005252520000000000737373004A4A4A000000
      000000000000000000004A4A4A00737373000000000000000000000000000000
      000073737300000000000000000000000000000000008484840084848400FFFF
      FF00DEDEDE00C6C6C600D6D6D6008484840084848400C6C6C600C6C6C6000000
      0000DEDEDE00000000000000000000000000000000000000000084848400E7E7
      E7004A4A4A004A4A4A006363630042424200C6C6C600E7E7E700848484000000
      0000636363004242420000000000000000005A5A5A00DEDEDE004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A008484
      84004A4A4A004A4A4A00636363005252520000000000000000004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      0000737373000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF0084848400C6C6C600C6C6C600C6C6C600D6D6D600CECE
      CE000000000000000000000000000000000000000000000000004A4A4A004A4A
      4A00848484006363630042424200E7E7E700E7E7E700E7E7E70084848400FFFF
      FF00000000006363630042424200000000005A5A5A0094949400737373004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A0094949400313131000000000000000000737373004A4A
      4A00000000004A4A4A0073737300000000000000000000000000000000000000
      0000737373000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400C6C6C600CECECE00CECECE00CECECE00D6D6
      D600CECECE00000000000000000000000000000000004A4A4A00848484008484
      84006363630042424200E7E7E700E7E7E700E7E7E700E7E7E700848484000000
      000000000000000000007373730042424200000000005A5A5A00949494007373
      73004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A007373730052525200000000000000000000000000000000004A4A
      4A004A4A4A004A4A4A0000000000000000000000000000000000000000000000
      0000737373000000000000000000000000000000000000000000000000000000
      000000000000000000000000000094949400D6D6D600CECECE00D6D6D600CECE
      CE00F7FFFF00F7FFFF0000000000000000004A4A4A0084848400737373006363
      6300424242008484840084848400848484008484840084848400848484000000
      00000000000000000000000000000000000000000000000000005A5A5A005A5A
      5A005A5A5A005252520052525200525252005252520052525200525252005252
      5200525252005252520000000000000000000000000000000000000000007373
      73004A4A4A007373730000000000000000000000000000000000000000000000
      0000737373000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949400D6D6D600F7FFFF00F7FF
      FF00949494009494940000000000000000007373730052525200525252007373
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A000000000000000000000000000000000000000000000000000000
      0000737373000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5B5B500B5B5B500B5B5
      B500000000000000000000000000000000004242420042424200424242004242
      4200424242004242420042424200424242004242420042424200424242004242
      4200424242004242420042424200424242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006363630063636300636363006363
      63006363630063636300636363006363630042424200B5B5B500636363006363
      6300636363006363630063636300424242000000000000000000000000000000
      0000000000000000000000000000636363006363630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007373730073737300737373007373
      73007373730073737300737373007373730042424200B5B5B500848484007373
      7300737373007373730073737300424242000000000000000000000000000000
      0000000000000000000063636300E7E7E700A5A5A50063636300000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000084848400B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500000000000000000000000000000000008484840084848400848484008484
      84008484840084848400848484008484840042424200B5B5B500848484009494
      9400848484008484840084848400424242000000000000000000000000000000
      00000000000063636300E7E7E700A5A5A500E7E7E700A5A5A500636363000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400E7E7E7005252520052525200525252005252520052525200525252005252
      5200C6C6C600B5B5B50000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5B5B500B5B5B500B5B5B50042424200B5B5B500848484009494
      9400424242000000000000000000000000000000000000000000000000000000
      00000000000000848400A5A5A500E7E7E700CECECE00D6D6D600B5B5B5006363
      6300000000000000000000000000000000000000000000000000000000008484
      8400E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000084848400E7E7E7005252
      5200525252005252520000000000000000000000000000000000000000005A5A
      5A005A5A5A005A5A5A0000000000636363000000000000000000000000000000
      00000000000042424200424242004242420042424200B5B5B500848484009494
      9400424242000000000000000000000000000000000000000000000000000000
      000063636300B5B5B500E7E7E700CECECE00D6D6D600E7E7E700A5A5A500E7E7
      E700636363000000000000000000000000000000000000000000000000008484
      8400E7E7E7006363630063636300636363006363630063636300636363006363
      6300C6C6C600B5B5B50000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C60000000000000000008484840084848400848484006363
      6300636363006363630000000000848484000000000000000000000000006363
      6300000000005A5A5A005A5A5A005A5A5A0042424200B5B5B500848484009494
      9400424242000000000000000000000000000000000000000000000000008484
      840063636300E7E7E700CECECE00D6D6D600E7E7E700A5A5A500E7E7E700A5A5
      A500C6C6C6006363630000000000000000000000000000000000000000008484
      8400E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000084848400E7E7E7006363
      6300636363006363630000000000949494000000000000000000B5B5B500B5B5
      B500848484008484840000000000949494000000000000000000000000006363
      6300A5A5A50063636300636363006363630042424200B5B5B500424242009494
      9400424242000000000000000000000000000000000000000000000000008484
      840063636300CECECE00D6D6D600E7E7E700A5A5A500E7E7E700A5A5A500C6C6
      C600C6C6C600B5B5B50063636300000000000000000000000000000000008484
      8400E7E7E7007373730073737300737373007373730073737300737373007373
      7300C6C6C600B5B5B50000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C60000000000C6C6C6009494940000000000C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000006363
      6300CECECE00A5A5A500636363006363630042424200B5B5B500B5B5B5009494
      9400424242000000000000000000000000000000000000000000000000008484
      84008484840063636300B5B5B500A5A5A500E7E7E700A5A5A500C6C6C600C6C6
      C600B5B5B5000063630021212100000000000000000000000000000000008484
      8400E7E7E700E7E7E700E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000084848400E7E7E7007373
      730073737300737373007373730000000000C6C6C60094949400000000000000
      000000000000000000000000000000000000A5A5A500A5A5A500A5A5A500A5A5
      A500CECECE00CECECE00A5A5A5006363630042424200B5B5B500848484009494
      940042424200000000000000000000000000000000000000000000000000A5A5
      A500A5A5A5008484840063636300E7E7E700B5B5B500C6C6C600C6C6C600A5A5
      A500636363003939390000000000000000000000000000000000000000006363
      6300E7E7E7008484840084848400848484008484840084848400C6C6C600E7E7
      E700E7E7E700B5B5B50000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700C6C6C600E7E7E700C6C6C6000000000000000000949494000000
      000000000000000000000000000000000000CECECE00E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E700CECECE005252520042424200B5B5B500848484009494
      940042424200000000000000000000000000000000000000000000000000A5A5
      A500B5B5B500B5B5B5008484840063636300B5B5B500319C9C00636363006363
      6300000000000000000000000000000000000000000063636300000000006363
      6300E7E7E70063636300E7E7E700E7E7E700E7E7E700C6C6C600E7E7E7008484
      8400000000000000000000000000000000000000000084848400E7E7E7008484
      840084848400848484008484840084848400C6C6C600E7E7E700E7E7E7009494
      9400000000000000000000000000000000006363630063636300636363006363
      6300E7E7E700CECECE00636363006363630042424200B5B5B500848484009494
      940042424200000000000000000000000000000000000000000094949400C6C6
      C600B5B5B500B5B5B50084848400848484006363630063636300000000000000
      0000000000000000000000000000000000000000000000000000636363006363
      630063636300E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E7008484
      8400E7E7E7000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700C6C6C600E7E7E70084848400000000000000
      0000949494000000000000000000000000000000000000000000000000006363
      6300CECECE0063636300737373007373730042424200B5B5B500848484009494
      9400424242000000000000000000000000000000000094949400B5B5B5008484
      8400949494000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006363630063636300636363008484
      8400636363006363630063636300E7E7E700E7E7E700E7E7E700E7E7E7008484
      8400000000000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400FFFFFF000000
      0000000000009494940000000000000000000000000000000000000000006363
      63006363630073737300737373007373730073737300B5B5B500848484009494
      94004242420000000000000000000000000094949400A5A5A500848484009494
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000636363006363
      6300636363008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400B5B5B5009494
      9400424242000000000000000000000000008484840084848400949494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300000000006363
      6300000000006363630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000848484008484840084848400848484008484840084848400B5B5
      B500424242000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0087FFFFF8FC7F000083FFFFF0FC7F0000
      C3FEFFE0F83F0000E1FCFFC1F01F0000F1F9FF83E00F0000F8F3FF07C0070000
      FC67E00F80030000FE0FC01F00010000FF1F803F00010000FE0F003F80030000
      FC67003F80070000F0F3003F80070000C1F9003F8003000083FC807F00030000
      07FFC0FF800700000FFFE1FFE01F00008001FFE0FF18FF830000FFC0FC00FF01
      0000FF80F00000030000FF00C00100030000FE01C00300010000E003C0030001
      0000C007800300000000800F000100010000001F8001000100000E1F00000000
      00001E1F0000000000001E1F0000000300003C1F0001000F0000E03F8003001F
      0000C07FC007003F8001C0FFE00F007F87FFFFFFFFFFFC7F8003FFF781F7F01F
      C002C1E79DE3C007C00081C7CFE38001C0010381E7C18001C0030700F3C10001
      C0030E00B9F70000C003060081F70000C0030300FFF70000C003000088F70000
      C00300009CF78001C0030000C1F7E007C0010000C9F7F803800C8001E3F7FE00
      001FC003E3F7FF030FFFFFFFF7F7FF8F0000FFFFE001FFFF0000FE7FE0018007
      0000FC3FE00180070000F81FE0018000F807F80FE0018000F807F007E0018000
      E807E003E0018000E007E001E0018000E007E001E00180070007E003E0018007
      0007E00FA00180070007C03FC0038003E00787FF0007800BE0070FFFC00F801F
      F8071FFFABFF803FF807FFFFEFFFFFFF00000000000000000000000000000000
      000000000000}
  end
end
