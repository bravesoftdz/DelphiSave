inherited frmManCMV_MOTIVOEMPRESAVIP: TfrmManCMV_MOTIVOEMPRESAVIP
  Left = 238
  Top = 166
  Width = 780
  Height = 480
  Caption = 'Motivos de inclusi'#243'n de Grandes Cuentas'
  Constraints.MinHeight = 480
  Constraints.MinWidth = 780
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 772
  end
  inherited CoolBar: TCoolBar
    Width = 772
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 768
      end>
    inherited ToolBar: TToolBar
      Width = 755
    end
  end
  inherited Grid: TArtDBGrid
    Width = 772
    Height = 372
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'MV_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 226
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUALTA'
        Title.Caption = 'Usuario de alta'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MV_FECHAALTA'
        Title.Caption = 'Fecha de alta'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUMODIF'
        Title.Caption = 'Usuario de modificaci'#243'n'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MV_FECHAMODIF'
        Title.Caption = 'Fecha de modificaci'#243'n'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUBAJA'
        Title.Caption = 'Usuario de baja'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MV_FECHABAJA'
        Title.Caption = 'Fecha de baja'
        Width = 68
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 184
    Top = 180
    Width = 329
    Height = 105
    inherited BevelAbm: TBevel
      Left = 12
      Top = 65
      Width = 307
    end
    object Label1: TLabel [1]
      Left = 12
      Top = 16
      Width = 54
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    inherited btnAceptar: TButton
      Left = 171
      Top = 71
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited btnCancelar: TButton
      Left = 246
      Top = 71
    end
    object edDescripcion: TEdit
      Left = 12
      Top = 36
      Width = 307
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT mv_id, mv_descripcion, mv_usualta, mv_fechaalta, mv_usumo' +
        'dif, mv_fechamodif, mv_usubaja, mv_fechabaja,'
      
        '       usu_alta.se_nombre usualta, usu_modif.se_nombre usumodif,' +
        ' usu_baja.se_nombre usubaja'
      
        '  FROM art.use_usuarios usu_alta, art.use_usuarios usu_modif, ar' +
        't.use_usuarios usu_baja, comunes.cmv_motivoempresavip'
      ' WHERE mv_usualta = usu_alta.se_usuario(+)'
      '   AND mv_usumodif = usu_modif.se_usuario(+)'
      '   AND mv_usubaja = usu_baja.se_usuario(+)')
    object sdqConsultaMV_ID: TFloatField
      FieldName = 'MV_ID'
      Required = True
    end
    object sdqConsultaMV_DESCRIPCION: TStringField
      FieldName = 'MV_DESCRIPCION'
      Size = 255
    end
    object sdqConsultaMV_USUALTA: TStringField
      FieldName = 'MV_USUALTA'
      Required = True
    end
    object sdqConsultaMV_FECHAALTA: TDateTimeField
      FieldName = 'MV_FECHAALTA'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object sdqConsultaMV_USUMODIF: TStringField
      FieldName = 'MV_USUMODIF'
    end
    object sdqConsultaMV_FECHAMODIF: TDateTimeField
      FieldName = 'MV_FECHAMODIF'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object sdqConsultaMV_USUBAJA: TStringField
      FieldName = 'MV_USUBAJA'
    end
    object sdqConsultaMV_FECHABAJA: TDateTimeField
      FieldName = 'MV_FECHABAJA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object sdqConsultaUSUALTA: TStringField
      FieldName = 'USUALTA'
      Size = 50
    end
    object sdqConsultaUSUMODIF: TStringField
      FieldName = 'USUMODIF'
      Size = 50
    end
    object sdqConsultaUSUBAJA: TStringField
      FieldName = 'USUBAJA'
      Size = 50
    end
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
    Left = 108
    Top = 200
  end
end
