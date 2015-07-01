inherited frmClasificacionActivos: TfrmClasificacionActivos
  Left = 197
  Top = 154
  Caption = 'Clasificaci'#243'n de Activos'
  ClientHeight = 523
  ClientWidth = 732
  Constraints.MinWidth = 740
  Font.Name = 'Tahoma'
  ExplicitWidth = 740
  ExplicitHeight = 550
  PixelsPerInch = 96
  TextHeight = 13
  object JvOutlookSplitter1: TJvOutlookSplitter [0]
    Left = 0
    Top = 425
    Width = 732
    Height = 6
    AutoSnap = True
    Color = 16774371
    ParentColor = False
    ColorFrom = 16765615
    ColorTo = 15587784
    ExplicitTop = 423
    ExplicitWidth = 730
  end
  inherited pnlFiltros: TPanel
    Width = 732
    Height = 101
    Visible = True
    ExplicitWidth = 732
    ExplicitHeight = 101
    DesignSize = (
      732
      101)
    object Label8: TLabel
      Left = 284
      Top = 4
      Width = 38
      Height = 13
      Caption = 'Soporte'
    end
    object Label16: TLabel
      Left = 12
      Top = 8
      Width = 42
      Height = 13
      Caption = 'Gerencia'
    end
    object Label17: TLabel
      Left = 12
      Top = 52
      Width = 31
      Height = 13
      Caption = 'Sector'
    end
    object Label18: TLabel
      Left = 284
      Top = 52
      Width = 67
      Height = 13
      Caption = 'Tipo de activo'
    end
    object Label19: TLabel
      Left = 444
      Top = 4
      Width = 77
      Height = 13
      Caption = 'Plazo de guarda'
    end
    object Label20: TLabel
      Left = 444
      Top = 52
      Width = 44
      Height = 13
      Caption = 'Criticidad'
    end
    inline fraCA_IDSOPORTE: TfraCodDesc
      Left = 280
      Top = 22
      Width = 157
      Height = 23
      TabOrder = 2
      ExplicitLeft = 280
      ExplicitTop = 22
      ExplicitWidth = 157
      DesignSize = (
        157
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 28
        Width = 129
        ExplicitLeft = 28
        ExplicitWidth = 129
      end
      inherited edCodigo: TPatternEdit
        Width = 24
        ExplicitWidth = 24
      end
      inherited Propiedades: TPropiedadesFrame
        CodigoType = ctInteger
        FieldBaja = 'SA_FECHABAJA'
        FieldCodigo = 'SA_ID'
        FieldDesc = 'SA_DESCRIPCION'
        FieldID = 'SA_ID'
        IdType = ctInteger
        OrderBy = 'SA_ID'
        TableName = 'COMUNES.CSA_SOPORTEACTIVOS'
        Left = 60
      end
    end
    inline fraIDGERENCIA: TfraCodDesc
      Left = 8
      Top = 24
      Width = 269
      Height = 23
      TabOrder = 0
      ExplicitLeft = 8
      ExplicitTop = 24
      ExplicitWidth = 269
      DesignSize = (
        269
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 204
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'se_nivel'
            Title.Caption = 'Nivel'
            Visible = False
          end>
        ExplicitWidth = 204
      end
      inherited Propiedades: TPropiedadesFrame
        CodigoType = ctInteger
        ExtraCondition = 'and se_nivel = 2'
        ExtraFields = ', se_nivel'
        FieldBaja = 'se_fechabaja'
        FieldCodigo = 'se_id'
        FieldDesc = 'se_descripcion'
        FieldID = 'se_id'
        IdType = ctInteger
        OrderBy = 'se_descripcion'
        TableName = 'computos.cse_sector'
        OnChange = fraIDGERENCIAPropiedadesChange
        Left = 103
      end
    end
    inline fraIDSECTOR: TfraCodDesc
      Left = 8
      Top = 68
      Width = 269
      Height = 23
      TabOrder = 1
      ExplicitLeft = 8
      ExplicitTop = 68
      ExplicitWidth = 269
      DesignSize = (
        269
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 204
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'se_nivel'
            Title.Caption = 'Nivel'
            Visible = False
          end>
        OnDropDown = VerificoGerencia
        ExplicitWidth = 204
      end
      inherited Propiedades: TPropiedadesFrame
        CodigoType = ctInteger
        ExtraCondition = 'and se_nivel = 4'
        ExtraFields = 
          ', se_nivel, (SELECT ger.se_id FROM computos.cse_sector ger WHERE' +
          ' ger.se_id = (SELECT jef.se_idsectorpadre FROM computos.cse_sect' +
          'or jef WHERE jef.se_id = computos.cse_sector.se_idsectorpadre)) ' +
          'as idgerencia'
        FieldBaja = 'se_fechabaja'
        FieldCodigo = 'se_id'
        FieldDesc = 'se_descripcion'
        FieldID = 'se_id'
        IdType = ctInteger
        OrderBy = 'se_descripcion'
        TableName = 'computos.cse_sector'
        Left = 103
      end
    end
    inline fraCA_IDTIPOACTIVO: TfraCodDesc
      Left = 280
      Top = 68
      Width = 157
      Height = 23
      TabOrder = 3
      ExplicitLeft = 280
      ExplicitTop = 68
      ExplicitWidth = 157
      DesignSize = (
        157
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 28
        Width = 129
        ExplicitLeft = 28
        ExplicitWidth = 129
      end
      inherited edCodigo: TPatternEdit
        Width = 24
        ExplicitWidth = 24
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'TA_FECHABAJA'
        FieldCodigo = 'TA_ID'
        FieldDesc = 'TA_DESCRIPCION'
        FieldID = 'TA_ID'
        OrderBy = 'TA_DESCRIPCION'
        TableName = 'COMUNES.CTA_TIPOACTIVOS'
        Left = 60
      end
    end
    inline fraCA_IDPLAZOGUARDA: TfraCodDesc
      Left = 440
      Top = 20
      Width = 157
      Height = 23
      TabOrder = 4
      ExplicitLeft = 440
      ExplicitTop = 20
      ExplicitWidth = 157
      DesignSize = (
        157
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 28
        Width = 129
        ExplicitLeft = 28
        ExplicitWidth = 129
      end
      inherited edCodigo: TPatternEdit
        Width = 24
        ExplicitWidth = 24
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'PG_FECHABAJA'
        FieldCodigo = 'PG_ID'
        FieldDesc = 'PG_DESCRIPCION'
        FieldID = 'PG_ID'
        OrderBy = 'PG_ID'
        TableName = 'COMUNES.CPG_PLAZOGUARDA'
        Left = 60
      end
    end
    object cmbCRITICIDAD_NRO: TComboBox
      Left = 440
      Top = 68
      Width = 108
      Height = 21
      Style = csDropDownList
      DropDownCount = 4
      TabOrder = 5
      Items.Strings = (
        'Baja'
        'Media'
        'Alta')
    end
    object chkBajas: TCheckBox
      Left = 554
      Top = 68
      Width = 129
      Height = 22
      Caption = 'No ver dados de baja'
      Checked = True
      State = cbChecked
      TabOrder = 6
    end
    object pnlStyle2: TPanel
      Left = 672
      Top = 4
      Width = 53
      Height = 21
      Anchors = [akTop, akRight]
      BevelInner = bvLowered
      Caption = 'Alta'
      Color = 11513816
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
    end
    object pnlStyle1: TPanel
      Left = 672
      Top = 25
      Width = 53
      Height = 21
      Anchors = [akTop, akRight]
      BevelInner = bvLowered
      Caption = 'Media'
      Color = 12910591
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
    end
    object pnlStyle0: TPanel
      Left = 672
      Top = 46
      Width = 53
      Height = 21
      Anchors = [akTop, akRight]
      BevelInner = bvLowered
      Caption = 'Baja'
      Color = 14155735
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
    end
  end
  inherited CoolBar: TCoolBar
    Top = 101
    Width = 732
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 728
      end>
    ExplicitTop = 101
    ExplicitWidth = 732
    inherited ToolBar: TToolBar
      Width = 719
      ExplicitWidth = 719
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 130
    Width = 732
    Height = 295
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'CA_ID'
        Width = 21
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_DESCRIPCION'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_SUBDIVISION'
        Title.Caption = 'Subdivisi'#243'n'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GERENCIA'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SECTOR'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_NOMBRE'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TA_DESCRIPCION'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SA_DESCRIPCION'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PG_DESCRIPCION'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_CRITICIDAD'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_CONFIDENCIALIDAD'
        Width = 18
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_INTEGRIDAD'
        Width = 17
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_DISPONIBILIDAD'
        Width = 17
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_USUALTA'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_FECHAALTA'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_USUBAJA'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_FECHABAJA'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VIGENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Wingdings'
        Font.Style = []
        Title.Caption = 'Vigente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_COMENTARIOS'
        Title.Caption = 'Comentarios'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_FORMADESTRUCCION'
        Title.Caption = 'Forma de destrucci'#243'n'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_CONDICIONESPRESERVACION'
        Title.Caption = 'Condiciones preservaci'#243'n'
        Width = 101
        Visible = True
      end>
  end
  object clbDetalleUsuarios: TARTCheckListBox [4]
    Left = 0
    Top = 431
    Width = 732
    Height = 92
    Align = alBottom
    BevelEdges = []
    BorderStyle = bsNone
    Columns = 1
    ItemHeight = 13
    Sorted = True
    TabOrder = 5
    AutoAjustarColumnas = True
    Locked = False
  end
  inherited fpAbm: TFormPanel
    Left = 28
    Top = 120
    Width = 693
    Height = 361
    OnShow = fpAbmShow
    ExplicitLeft = 28
    ExplicitTop = 120
    ExplicitWidth = 693
    ExplicitHeight = 361
    DesignSize = (
      693
      361)
    inherited BevelAbm: TBevel
      Top = 325
      Width = 685
      ExplicitTop = 325
      ExplicitWidth = 685
    end
    object Label3: TLabel [1]
      Left = 12
      Top = 12
      Width = 103
      Height = 13
      Caption = 'Activo de informaci'#243'n'
    end
    object Label1: TLabel [2]
      Left = 12
      Top = 56
      Width = 67
      Height = 13
      Caption = 'Tipo de activo'
    end
    object Label2: TLabel [3]
      Left = 416
      Top = 56
      Width = 31
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Sector'
    end
    object Label4: TLabel [4]
      Left = 416
      Top = 100
      Width = 42
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Gerencia'
    end
    object Label5: TLabel [5]
      Left = 416
      Top = 12
      Width = 84
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Propietario actual'
    end
    object Label6: TLabel [6]
      Left = 416
      Top = 148
      Width = 60
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Comentarios'
    end
    object Label27: TLabel [7]
      Left = 16
      Top = 192
      Width = 39
      Height = 13
      Caption = 'Vigencia'
    end
    object Label7: TLabel [8]
      Left = 212
      Top = 56
      Width = 38
      Height = 13
      Caption = 'Soporte'
    end
    object Label9: TLabel [9]
      Left = 105
      Top = 211
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
    object Label10: TLabel [10]
      Left = 12
      Top = 100
      Width = 77
      Height = 13
      Caption = 'Plazo de guarda'
    end
    object Label11: TLabel [11]
      Left = 212
      Top = 100
      Width = 145
      Height = 13
      Caption = 'Plazo de guarda recomendado'
    end
    object Label12: TLabel [12]
      Left = 12
      Top = 148
      Width = 78
      Height = 13
      Caption = 'Confidencialidad'
    end
    object Label13: TLabel [13]
      Left = 146
      Top = 148
      Width = 50
      Height = 13
      Caption = 'Integridad'
    end
    object Label14: TLabel [14]
      Left = 280
      Top = 148
      Width = 116
      Height = 13
      Caption = 'Disponibilidad (Afecci'#243'n)'
    end
    object Label15: TLabel [15]
      Left = 216
      Top = 192
      Width = 44
      Height = 13
      Caption = 'Criticidad'
    end
    object Label21: TLabel [16]
      Left = 232
      Top = 12
      Width = 53
      Height = 13
      Caption = 'Subdivisi'#243'n'
    end
    object Label22: TLabel [17]
      Left = 16
      Top = 280
      Width = 210
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Condiciones de preservaci'#243'n recomendadas'
    end
    object Label23: TLabel [18]
      Left = 16
      Top = 236
      Width = 152
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Forma de destrucci'#243'n del activo'
    end
    object lbAccesoUsuarios: TLabel [19]
      Left = 416
      Top = 236
      Width = 104
      Height = 13
      Cursor = crHandPoint
      Hint = 
        'Haga click aqu'#237' para administrar los usuarios relacionados al ac' +
        'tivo'
      Anchors = [akTop, akRight]
      Caption = 'Usuarios relacionados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = lbAccesoUsuariosClick
    end
    inherited btnAceptar: TButton
      Left = 538
      Top = 331
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 19
      ExplicitLeft = 538
      ExplicitTop = 331
    end
    inherited btnCancelar: TButton
      Left = 613
      Top = 331
      ModalResult = 0
      TabOrder = 20
      OnClick = btnCancelarClick
      ExplicitLeft = 613
      ExplicitTop = 331
    end
    object edCA_DESCRIPCION: TEdit
      Left = 8
      Top = 29
      Width = 213
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 255
      TabOrder = 0
    end
    inline fraTipoActivos: TfraCodDesc
      Left = 8
      Top = 72
      Width = 196
      Height = 23
      TabOrder = 3
      ExplicitLeft = 8
      ExplicitTop = 72
      ExplicitWidth = 196
      DesignSize = (
        196
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 28
        Width = 167
        ExplicitLeft = 28
        ExplicitWidth = 167
      end
      inherited edCodigo: TPatternEdit
        Width = 24
        ExplicitWidth = 24
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'TA_FECHABAJA'
        FieldCodigo = 'TA_ID'
        FieldDesc = 'TA_DESCRIPCION'
        FieldID = 'TA_ID'
        OrderBy = 'TA_DESCRIPCION'
        TableName = 'COMUNES.CTA_TIPOACTIVOS'
        Left = 60
      end
    end
    inline fraSectorAsociado: TfraCodDesc
      Left = 412
      Top = 72
      Width = 269
      Height = 23
      Anchors = [akTop, akRight]
      TabOrder = 5
      ExplicitLeft = 412
      ExplicitTop = 72
      ExplicitWidth = 269
      DesignSize = (
        269
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 204
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'se_nivel'
            Title.Caption = 'Nivel'
            Visible = False
          end>
        ExplicitWidth = 204
      end
      inherited Propiedades: TPropiedadesFrame
        CodigoType = ctInteger
        ExtraCondition = 'and se_nivel = 4'
        ExtraFields = 
          ', se_nivel, (SELECT ger.se_id FROM computos.cse_sector ger WHERE' +
          ' ger.se_id = (SELECT jef.se_idsectorpadre FROM computos.cse_sect' +
          'or jef WHERE jef.se_id = computos.cse_sector.se_idsectorpadre)) ' +
          'as idgerencia'
        FieldBaja = 'se_fechabaja'
        FieldCodigo = 'se_id'
        FieldDesc = 'se_descripcion'
        FieldID = 'se_id'
        IdType = ctInteger
        OrderBy = 'se_descripcion'
        TableName = 'computos.cse_sector'
        OnChange = fraSectorAsociadoPropiedadesChange
        Left = 103
      end
    end
    inline fraGerenciaAsociada: TfraCodDesc
      Left = 412
      Top = 116
      Width = 269
      Height = 23
      Anchors = [akTop, akRight]
      TabOrder = 8
      ExplicitLeft = 412
      ExplicitTop = 116
      ExplicitWidth = 269
      DesignSize = (
        269
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 204
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'se_nivel'
            Title.Caption = 'Nivel'
            Visible = False
          end>
        ExplicitWidth = 204
      end
      inherited Propiedades: TPropiedadesFrame
        CodigoType = ctInteger
        ExtraCondition = 'and se_nivel = 2'
        ExtraFields = ', se_nivel'
        FieldBaja = 'se_fechabaja'
        FieldCodigo = 'se_id'
        FieldDesc = 'se_descripcion'
        FieldID = 'se_id'
        IdType = ctInteger
        OrderBy = 'se_descripcion'
        TableName = 'computos.cse_sector'
        Left = 103
      end
    end
    inline fraPropietario: TfraCodDesc
      Left = 412
      Top = 28
      Width = 269
      Height = 23
      Anchors = [akTop, akRight]
      TabOrder = 2
      ExplicitLeft = 412
      ExplicitTop = 28
      ExplicitWidth = 269
      DesignSize = (
        269
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 204
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SE_INTERNO'
            Title.Caption = 'Interno'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SECTOR'
            Title.Caption = 'Sector'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PC'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'JEFE'
            Title.Caption = 'Responde a'
            Visible = True
          end>
        ExplicitWidth = 204
      end
      inherited edCodigo: TPatternEdit
        MaxLength = 20
      end
      inherited Propiedades: TPropiedadesFrame
        ExtraCondition = 
          '  and ((se_fechabaja is null) or (se_fechabaja > art.actualdate ' +
          '- 360)) and se_usuariogenerico = '#39'N'#39'  '
        ExtraFields = 
          ', se_interno, (SELECT se_nombre || '#39' (int. '#39' || se_interno || '#39')' +
          #39' FROM art.use_usuarios jefes WHERE jefes.se_usuario = use_usuar' +
          'ios.se_respondea) as jefe, (SELECT se_descripcion FROM computos.' +
          'cse_sector sec WHERE sec.se_id = se_idsector) as sector, se_sect' +
          'or, se_pc, (SELECT eq_descripcion FROM computos.ceq_equipo WHERE' +
          ' eq_id = se_pc) as pc, (SELECT ger.se_descripcion FROM computos.' +
          'cse_sector ger WHERE ger.se_id = (SELECT jef.se_idsectorpadre FR' +
          'OM computos.cse_sector jef WHERE jef.se_id = (SELECT sec.se_idse' +
          'ctorpadre FROM computos.cse_sector sec WHERE sec.se_id = se_idse' +
          'ctor))) as gerencia, se_idsector  '
        FieldBaja = 'SE_FECHABAJA'
        FieldCodigo = 'SE_USUARIO'
        FieldDesc = 'SE_NOMBRE'
        FieldID = 'SE_ID'
        IdType = ctInteger
        OrderBy = 'SE_USUARIO'
        ShowBajas = True
        TableName = 'ART.USE_USUARIOS'
        OnChange = fraPropietarioChange
      end
    end
    object edCA_COMENTARIOS: TMemo
      Left = 414
      Top = 164
      Width = 265
      Height = 65
      Anchors = [akTop, akRight]
      MaxLength = 255
      TabOrder = 17
    end
    inline fraSoporte: TfraCodDesc
      Left = 208
      Top = 72
      Width = 196
      Height = 23
      TabOrder = 4
      ExplicitLeft = 208
      ExplicitTop = 72
      ExplicitWidth = 196
      DesignSize = (
        196
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 28
        Width = 167
        DropCount = 3
        ExplicitLeft = 28
        ExplicitWidth = 167
      end
      inherited edCodigo: TPatternEdit
        Width = 24
        ExplicitWidth = 24
      end
      inherited Propiedades: TPropiedadesFrame
        CodigoType = ctInteger
        FieldBaja = 'SA_FECHABAJA'
        FieldCodigo = 'SA_ID'
        FieldDesc = 'SA_DESCRIPCION'
        FieldID = 'SA_ID'
        IdType = ctInteger
        OrderBy = 'SA_ID'
        TableName = 'COMUNES.CSA_SOPORTEACTIVOS'
        Left = 60
      end
    end
    inline fraPlazoGuarda: TfraCodDesc
      Left = 8
      Top = 116
      Width = 196
      Height = 23
      TabOrder = 6
      ExplicitLeft = 8
      ExplicitTop = 116
      ExplicitWidth = 196
      DesignSize = (
        196
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 28
        Width = 168
        ExplicitLeft = 28
        ExplicitWidth = 168
      end
      inherited edCodigo: TPatternEdit
        Width = 24
        ExplicitWidth = 24
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'PG_FECHABAJA'
        FieldCodigo = 'PG_ID'
        FieldDesc = 'PG_DESCRIPCION'
        FieldID = 'PG_ID'
        OrderBy = 'PG_ID'
        TableName = 'COMUNES.CPG_PLAZOGUARDA'
        Left = 60
      end
    end
    inline fraPlazoGuardaRecomendado: TfraCodDesc
      Left = 208
      Top = 116
      Width = 196
      Height = 23
      TabOrder = 7
      ExplicitLeft = 208
      ExplicitTop = 116
      ExplicitWidth = 196
      DesignSize = (
        196
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 28
        Width = 168
        ExplicitLeft = 28
        ExplicitWidth = 168
      end
      inherited edCodigo: TPatternEdit
        Width = 24
        ExplicitWidth = 24
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'PG_FECHABAJA'
        FieldCodigo = 'PG_ID'
        FieldDesc = 'PG_DESCRIPCION'
        FieldID = 'PG_ID'
        OrderBy = 'PG_ID'
        TableName = 'COMUNES.CPG_PLAZOGUARDA'
        Left = 60
      end
    end
    object cmbConfidencialidad: TComboBox
      Left = 12
      Top = 164
      Width = 128
      Height = 21
      Style = csDropDownList
      DropDownCount = 4
      TabOrder = 9
      OnChange = CalculoCriticidad
      Items.Strings = (
        '0 - P'#250'blica'
        '1 - Uso interno'
        '2 - Confidencial'
        '3 - Secreta')
    end
    object cmbIntegridad: TComboBox
      Left = 144
      Top = 164
      Width = 128
      Height = 21
      Style = csDropDownList
      DropDownCount = 4
      TabOrder = 10
      OnChange = CalculoCriticidad
      Items.Strings = (
        '0 - F'#225'cil recuperaci'#243'n'
        '1 - Costosa recuperaci'#243'n'
        '2 - Dif'#237'cil recuperaci'#243'n'
        '3 - Imposible recuperaci'#243'n')
    end
    object cmbDisponibilidad: TComboBox
      Left = 276
      Top = 164
      Width = 128
      Height = 21
      Style = csDropDownList
      DropDownCount = 4
      TabOrder = 11
      OnChange = CalculoCriticidad
      Items.Strings = (
        '0 - Ninguna'
        '1 - Mayor a 1 semana'
        '2 - Mayor a 1 d'#237'a'
        '3 - Mayor a 1 hora')
    end
    object cmbCriticidad: TComboBox
      Left = 216
      Top = 208
      Width = 109
      Height = 21
      Style = csDropDownList
      DropDownCount = 4
      TabOrder = 14
      Items.Strings = (
        'Baja'
        'Media'
        'Alta')
    end
    object edVigenciaDesde: TDateEdit
      Left = 12
      Top = 208
      Width = 89
      Height = 21
      Color = clWhite
      GlyphKind = gkCustom
      Glyph.Data = {
        76050000424D760500000000000036000000280000001C0000000C0000000100
        2000000000004005000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF008080800080808000808080008080800080808000808080008080
        800080808000808080008080800080808000FF00FF00FF00FF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FF00FF00FF00FF000000000000000000800000000000
        0000800000008000000000000000800000000000000000000000800000008080
        8000FF00FF008080800080808000808080008080800080808000808080008080
        80008080800080808000808080008080800080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
        FF00FFFFFF00FFFFFF00FFFFFF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FF00
        FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF0000000000000000000000
        0000FFFFFF00000000000000000000000000C0C0C000FFFFFF00800000008080
        8000FF00FF0080808000FFFFFF00808080008080800080808000FF00FF008080
        80008080800080808000FF00FF00FFFFFF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0
        C00000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
        FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFF
        FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00800000008080
        8000FF00FF0080808000FFFFFF00FF00FF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF0080808000FF00FF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
        0000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
        FF0080808000FFFFFF00FF00FF00808080008080800080808000FF00FF00FF00
        FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF000000000000000000FFFF
        FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
        8000FF00FF0080808000FFFFFF008080800080808000FFFFFF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
        000000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
        FF0080808000FF00FF00FF00FF0080808000808080008080800080808000FF00
        FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
        8000FF00FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0080808000FFFFFF00FF00FF00FF00FF000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF008080800080808000808080008080800080808000808080008080
        80008080800080808000808080008080800080808000FF00FF00}
      NumGlyphs = 2
      TabOrder = 12
    end
    object edVigenciaHasta: TDateEdit
      Left = 120
      Top = 208
      Width = 89
      Height = 21
      Color = clWhite
      GlyphKind = gkCustom
      Glyph.Data = {
        76050000424D760500000000000036000000280000001C0000000C0000000100
        2000000000004005000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF008080800080808000808080008080800080808000808080008080
        800080808000808080008080800080808000FF00FF00FF00FF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FF00FF00FF00FF000000000000000000800000000000
        0000800000008000000000000000800000000000000000000000800000008080
        8000FF00FF008080800080808000808080008080800080808000808080008080
        80008080800080808000808080008080800080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
        FF00FFFFFF00FFFFFF00FFFFFF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FF00
        FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF0000000000000000000000
        0000FFFFFF00000000000000000000000000C0C0C000FFFFFF00800000008080
        8000FF00FF0080808000FFFFFF00808080008080800080808000FF00FF008080
        80008080800080808000FF00FF00FFFFFF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0
        C00000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
        FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFF
        FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00800000008080
        8000FF00FF0080808000FFFFFF00FF00FF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF0080808000FF00FF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
        0000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
        FF0080808000FFFFFF00FF00FF00808080008080800080808000FF00FF00FF00
        FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF000000000000000000FFFF
        FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
        8000FF00FF0080808000FFFFFF008080800080808000FFFFFF00FF00FF008080
        8000FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
        000000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
        FF0080808000FF00FF00FF00FF0080808000808080008080800080808000FF00
        FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
        8000FF00FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0080808000FFFFFF00FF00FF00FF00FF000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF008080800080808000808080008080800080808000808080008080
        80008080800080808000808080008080800080808000FF00FF00}
      NumGlyphs = 2
      TabOrder = 13
    end
    object edCA_SUBDIVISION: TEdit
      Left = 228
      Top = 29
      Width = 173
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 255
      TabOrder = 1
    end
    object edCA_FORMADESTRUCCION: TEdit
      Left = 12
      Top = 253
      Width = 389
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 255
      TabOrder = 15
    end
    object edCA_CONDICIONESPRESERVACION: TEdit
      Left = 12
      Top = 297
      Width = 389
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 255
      TabOrder = 16
    end
    object lbUsuariosRelacionados: TListBox
      Left = 412
      Top = 252
      Width = 265
      Height = 65
      Anchors = [akTop, akRight]
      ItemHeight = 13
      Sorted = True
      TabOrder = 18
    end
  end
  object fpSeleccionUsuarios: TFormPanel [6]
    Left = 272
    Top = 372
    Width = 533
    Height = 246
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsNone
    Position = poOwnerFormCenter
    Constraints.MaxHeight = 446
    Constraints.MaxWidth = 533
    Constraints.MinHeight = 246
    Constraints.MinWidth = 533
    inline fraSeleccionUsuarios: TfrmSeleccionUsuarios
      Left = 0
      Top = 0
      Width = 533
      Height = 246
      Align = alClient
      Color = 13421772
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      ExplicitWidth = 533
      inherited pnlFondo: TPanel
        Width = 533
        ExplicitWidth = 533
        DesignSize = (
          533
          220)
        inherited lsUsuariosAsignar: TListBox
          Width = 233
          ExplicitWidth = 233
        end
        inherited btnAceptar: TAdvGlowButton
          Left = 375
          ExplicitLeft = 375
        end
        inherited btnCancelar: TAdvGlowButton
          Left = 451
          ExplicitLeft = 451
        end
      end
      inherited AdvToolBarPager: TAdvToolBarPager
        Width = 533
        ExplicitWidth = 533
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      'SELECT *'
      
        '  FROM (SELECT cca.*, pg_descripcion, pg_fechabaja, ta_descripci' +
        'on, ta_fechabaja,'
      
        '               sa_descripcion, sa_fechabaja, NVL(ca_idsector, US' +
        'E.se_idsector) AS idsector,'
      
        '               jef.se_idsectorpadre AS idgerencia, se_usuario, s' +
        'e_nombre, USE.se_fechabaja,'
      '               (SELECT se_descripcion'
      '                  FROM computos.cse_sector'
      
        '                 WHERE se_id = jef.se_idsectorpadre) AS gerencia' +
        ', sec.se_descripcion AS sector,'
      
        '               GREATEST(0, GREATEST(ca_confidencialidad, GREATES' +
        'T(ca_integridad, ca_disponibilidad)) - 1) AS criticidad_nro,'
      '               CASE GREATEST(ca_confidencialidad,'
      
        '                             GREATEST(ca_integridad, ca_disponib' +
        'ilidad))'
      '                 WHEN 3 THEN '#39'Alta'#39
      '                 WHEN 2 THEN '#39'Media'#39
      '                 WHEN 1 THEN '#39'Baja'#39
      '                 WHEN 0 THEN '#39'Baja'#39
      '               END AS ca_criticidad,'
      '               CASE'
      
        '                 WHEN  (sysdate between ca_vigenciadesde AND ca_' +
        'vigenciahasta)'
      
        '                   OR ((sysdate > ca_vigenciadesde) AND (ca_vige' +
        'nciahasta IS NULL)) THEN '#39#252#39
      '                 ELSE '#39#251#39
      '               END AS vigente'
      
        '          FROM computos.cse_sector jef, computos.cse_sector sec,' +
        ' art.use_usuarios USE,'
      
        '               comunes.csa_soporteactivos, comunes.cpg_plazoguar' +
        'da, comunes.cta_tipoactivos,'
      '               comunes.cca_clasificacionactivos cca'
      '         WHERE ca_idplazoguarda = pg_id'
      '           AND ca_idtipoactivo = ta_id'
      '           AND ca_idsoporte = sa_id'
      '           AND ca_idpropietarioactual = USE.se_id'
      '           AND NVL(ca_idsector, USE.se_idsector) = sec.se_id'
      '           AND sec.se_idsectorpadre = jef.se_id)'
      ' WHERE 1 = 1')
    Left = 4
    Top = 196
    object sdqConsultaCA_ID: TFloatField
      DisplayLabel = 'Id'
      FieldName = 'CA_ID'
      Required = True
    end
    object sdqConsultaCA_DESCRIPCION: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'CA_DESCRIPCION'
      Required = True
      Size = 255
    end
    object sdqConsultaCA_FECHAALTA: TDateTimeField
      DisplayLabel = 'Fecha de alta'
      FieldName = 'CA_FECHAALTA'
      Required = True
    end
    object sdqConsultaCA_USUALTA: TStringField
      DisplayLabel = 'Usuario de alta'
      FieldName = 'CA_USUALTA'
      Required = True
    end
    object sdqConsultaCA_FECHABAJA: TDateTimeField
      DisplayLabel = 'Fecha de baja'
      FieldName = 'CA_FECHABAJA'
    end
    object sdqConsultaCA_USUBAJA: TStringField
      DisplayLabel = 'Usuario de baja'
      FieldName = 'CA_USUBAJA'
    end
    object sdqConsultaCA_IDTIPOACTIVO: TFloatField
      FieldName = 'CA_IDTIPOACTIVO'
      Required = True
    end
    object sdqConsultaCA_VIGENCIADESDE: TDateTimeField
      FieldName = 'CA_VIGENCIADESDE'
      Required = True
    end
    object sdqConsultaCA_VIGENCIAHASTA: TDateTimeField
      FieldName = 'CA_VIGENCIAHASTA'
    end
    object sdqConsultaCA_IDPROPIETARIOACTUAL: TFloatField
      FieldName = 'CA_IDPROPIETARIOACTUAL'
      Required = True
    end
    object sdqConsultaCA_IDSOPORTE: TFloatField
      FieldName = 'CA_IDSOPORTE'
      Required = True
    end
    object sdqConsultaCA_IDPLAZOGUARDA: TFloatField
      FieldName = 'CA_IDPLAZOGUARDA'
      Required = True
    end
    object sdqConsultaCA_IDPLAZOGUARDARECOMENDADO: TFloatField
      FieldName = 'CA_IDPLAZOGUARDARECOMENDADO'
    end
    object sdqConsultaCA_CONFIDENCIALIDAD: TFloatField
      DisplayLabel = 'Co'
      FieldName = 'CA_CONFIDENCIALIDAD'
      Required = True
    end
    object sdqConsultaCA_INTEGRIDAD: TFloatField
      DisplayLabel = 'In'
      FieldName = 'CA_INTEGRIDAD'
      Required = True
    end
    object sdqConsultaCA_DISPONIBILIDAD: TFloatField
      DisplayLabel = 'Di'
      FieldName = 'CA_DISPONIBILIDAD'
      Required = True
    end
    object sdqConsultaCA_COMENTARIOS: TStringField
      FieldName = 'CA_COMENTARIOS'
      Size = 255
    end
    object sdqConsultaPG_DESCRIPCION: TStringField
      DisplayLabel = 'Plazo de guarda'
      FieldName = 'PG_DESCRIPCION'
      Required = True
      Size = 255
    end
    object sdqConsultaPG_FECHABAJA: TDateTimeField
      FieldName = 'PG_FECHABAJA'
    end
    object sdqConsultaTA_DESCRIPCION: TStringField
      DisplayLabel = 'Tipo de activo'
      FieldName = 'TA_DESCRIPCION'
      Required = True
      Size = 255
    end
    object sdqConsultaTA_FECHABAJA: TDateTimeField
      FieldName = 'TA_FECHABAJA'
    end
    object sdqConsultaSA_DESCRIPCION: TStringField
      DisplayLabel = 'Soporte'
      FieldName = 'SA_DESCRIPCION'
      Required = True
      Size = 255
    end
    object sdqConsultaSA_FECHABAJA: TDateTimeField
      FieldName = 'SA_FECHABAJA'
    end
    object sdqConsultaIDSECTOR: TFloatField
      FieldName = 'IDSECTOR'
    end
    object sdqConsultaIDGERENCIA: TFloatField
      FieldName = 'IDGERENCIA'
      Required = True
    end
    object sdqConsultaGERENCIA: TStringField
      DisplayLabel = 'Gerencia'
      FieldName = 'GERENCIA'
      Size = 50
    end
    object sdqConsultaSE_USUARIO: TStringField
      FieldName = 'SE_USUARIO'
      Required = True
    end
    object sdqConsultaSE_NOMBRE: TStringField
      DisplayLabel = 'Propietario'
      FieldName = 'SE_NOMBRE'
      Size = 50
    end
    object sdqConsultaSECTOR: TStringField
      DisplayLabel = 'Sector'
      FieldName = 'SECTOR'
      Required = True
      Size = 50
    end
    object sdqConsultaCA_CRITICIDAD: TStringField
      DisplayLabel = 'Criticidad'
      FieldName = 'CA_CRITICIDAD'
      Size = 5
    end
    object sdqConsultaCA_SUBDIVISION: TStringField
      FieldName = 'CA_SUBDIVISION'
      Size = 255
    end
    object sdqConsultaCA_CONDICIONESPRESERVACION: TStringField
      FieldName = 'CA_CONDICIONESPRESERVACION'
      Size = 255
    end
    object sdqConsultaCA_FORMADESTRUCCION: TStringField
      FieldName = 'CA_FORMADESTRUCCION'
      Size = 255
    end
    object sdqConsultaVIGENTE: TStringField
      FieldName = 'VIGENTE'
      Size = 2
    end
    object sdqConsultaCRITICIDAD_NRO: TFloatField
      FieldName = 'CRITICIDAD_NRO'
    end
    object sdqConsultaCA_IDSECTOR: TFloatField
      FieldName = 'CA_IDSECTOR'
    end
    object sdqConsultaSE_FECHABAJA: TDateTimeField
      FieldName = 'SE_FECHABAJA'
    end
  end
  inherited dsConsulta: TDataSource
    Left = 32
    Top = 196
  end
  inherited SortDialog: TSortDialog
    Left = 4
    Top = 224
  end
  inherited ExportDialog: TExportDialog
    Left = 32
    Top = 224
  end
  inherited QueryPrint: TQueryPrint
    Left = 32
    Top = 252
  end
  inherited Seguridad: TSeguridad
    Left = 4
    Top = 168
  end
  inherited FormStorage: TFormStorage
    Left = 32
    Top = 168
  end
  inherited PrintDialog: TPrintDialog
    Left = 4
    Top = 252
  end
  inherited ShortCutControl: TShortCutControl
    Left = 60
    Top = 168
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
    Left = 60
    Top = 196
  end
  object ShortCutControlHijo: TShortCutControl
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
    Left = 60
    Top = 168
  end
  object sdqAsociarUsuario: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'DECLARE'
      '  dummy INTEGER;'
      'BEGIN'
      '  BEGIN'
      '    SELECT 1'
      '      INTO dummy'
      '      FROM comunes.cau_activosusuarios'
      '     WHERE au_idactivo = :idactivo'
      '       AND au_idusuario = :idusuario;'
      ''
      '    UPDATE comunes.cau_activosusuarios'
      '       SET au_usubaja = NULL,'
      '           au_fechabaja = NULL'
      '     WHERE au_idactivo = :idactivo'
      '       AND au_idusuario = :idusuario;'
      '  EXCEPTION'
      '    WHEN NO_DATA_FOUND THEN'
      '      INSERT INTO comunes.cau_activosusuarios'
      
        '                  (au_idactivo, au_idusuario, au_usualta, au_fec' +
        'haalta)'
      
        '           VALUES (:idactivo, :idusuario, art.getosuser, art.act' +
        'ualdate);'
      '  END;'
      'END;')
    Left = 4
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idactivo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idusuario'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idactivo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idusuario'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idactivo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idusuario'
        ParamType = ptInput
      end>
    object FloatField1: TFloatField
      DisplayLabel = 'Id'
      FieldName = 'CA_ID'
      Required = True
    end
    object StringField1: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'CA_DESCRIPCION'
      Required = True
      Size = 255
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Fecha de alta'
      FieldName = 'CA_FECHAALTA'
      Required = True
    end
    object StringField2: TStringField
      DisplayLabel = 'Usuario de alta'
      FieldName = 'CA_USUALTA'
      Required = True
    end
    object DateTimeField2: TDateTimeField
      DisplayLabel = 'Fecha de baja'
      FieldName = 'CA_FECHABAJA'
    end
    object StringField3: TStringField
      DisplayLabel = 'Usuario de baja'
      FieldName = 'CA_USUBAJA'
    end
    object FloatField2: TFloatField
      FieldName = 'CA_IDTIPOACTIVO'
      Required = True
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'CA_VIGENCIADESDE'
      Required = True
    end
    object DateTimeField4: TDateTimeField
      FieldName = 'CA_VIGENCIAHASTA'
    end
    object FloatField3: TFloatField
      FieldName = 'CA_IDPROPIETARIOACTUAL'
      Required = True
    end
    object FloatField4: TFloatField
      FieldName = 'CA_IDSOPORTE'
      Required = True
    end
    object FloatField5: TFloatField
      FieldName = 'CA_IDPLAZOGUARDA'
      Required = True
    end
    object FloatField6: TFloatField
      FieldName = 'CA_IDPLAZOGUARDARECOMENDADO'
    end
    object FloatField7: TFloatField
      DisplayLabel = 'Co'
      FieldName = 'CA_CONFIDENCIALIDAD'
      Required = True
    end
    object FloatField8: TFloatField
      DisplayLabel = 'In'
      FieldName = 'CA_INTEGRIDAD'
      Required = True
    end
    object FloatField9: TFloatField
      DisplayLabel = 'Di'
      FieldName = 'CA_DISPONIBILIDAD'
      Required = True
    end
    object StringField4: TStringField
      FieldName = 'CA_COMENTARIOS'
      Size = 255
    end
    object StringField5: TStringField
      DisplayLabel = 'Plazo de guarda'
      FieldName = 'PG_DESCRIPCION'
      Required = True
      Size = 255
    end
    object DateTimeField5: TDateTimeField
      FieldName = 'PG_FECHABAJA'
    end
    object StringField6: TStringField
      DisplayLabel = 'Tipo de activo'
      FieldName = 'TA_DESCRIPCION'
      Required = True
      Size = 255
    end
    object DateTimeField6: TDateTimeField
      FieldName = 'TA_FECHABAJA'
    end
    object StringField7: TStringField
      DisplayLabel = 'Soporte'
      FieldName = 'SA_DESCRIPCION'
      Required = True
      Size = 255
    end
    object DateTimeField7: TDateTimeField
      FieldName = 'SA_FECHABAJA'
    end
    object FloatField10: TFloatField
      FieldName = 'IDSECTOR'
    end
    object FloatField11: TFloatField
      FieldName = 'IDGERENCIA'
      Required = True
    end
    object StringField8: TStringField
      DisplayLabel = 'Gerencia'
      FieldName = 'GERENCIA'
      Size = 50
    end
    object StringField9: TStringField
      FieldName = 'SE_USUARIO'
      Required = True
    end
    object StringField10: TStringField
      DisplayLabel = 'Propietario'
      FieldName = 'SE_NOMBRE'
      Size = 50
    end
    object StringField11: TStringField
      DisplayLabel = 'Sector'
      FieldName = 'SECTOR'
      Required = True
      Size = 50
    end
    object StringField12: TStringField
      DisplayLabel = 'Criticidad'
      FieldName = 'CA_CRITICIDAD'
      Size = 5
    end
    object FloatField12: TFloatField
      FieldName = 'CRITICIDAD'
    end
    object StringField13: TStringField
      FieldName = 'CA_SUBDIVISION'
      Size = 255
    end
    object StringField14: TStringField
      FieldName = 'CA_CONDICIONESPRESERVACION'
      Size = 255
    end
    object StringField15: TStringField
      FieldName = 'CA_FORMADESTRUCCION'
      Size = 255
    end
    object StringField16: TStringField
      FieldName = 'VIGENTE'
      Size = 2
    end
  end
end
