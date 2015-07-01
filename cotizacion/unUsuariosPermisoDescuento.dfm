inherited frmUsuariosPermisoDescuento: TfrmUsuariosPermisoDescuento
  Left = 252
  Top = 166
  Width = 632
  Caption = 'Usuarios con Permiso de Descuento'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 624
  end
  inherited CoolBar: TCoolBar
    Width = 624
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 620
      end>
    inherited ToolBar: TToolBar
      Width = 607
    end
  end
  inherited Grid: TArtDBGrid
    Width = 624
    Columns = <
      item
        Expanded = False
        FieldName = 'origen'
        Title.Caption = 'Origen'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ud_usuario'
        Title.Caption = 'Usuario'
        Width = 152
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ud_usubaja'
        Title.Caption = 'Usuario de Baja'
        Width = 110
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ud_fechabaja'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha de Baja'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ud_usualta'
        Title.Caption = 'Usuario de Alta'
        Width = 129
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 124
    Width = 440
    Height = 128
    Caption = 'Usuario Permiso Descuento'
    BorderStyle = bsDialog
    Constraints.MaxHeight = 128
    Constraints.MaxWidth = 440
    Constraints.MinHeight = 128
    Constraints.MinWidth = 440
    inherited BevelAbm: TBevel
      Top = 92
      Width = 432
    end
    object Label9: TLabel [1]
      Left = 8
      Top = 44
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    object Label1: TLabel [2]
      Left = 8
      Top = 16
      Width = 31
      Height = 13
      Caption = 'Origen'
    end
    inline fraUsuarioArt: TfraCodDesc [3]
      Left = 56
      Top = 40
      Width = 376
      Height = 23
      TabOrder = 5
      inherited cmbDescripcion: TArtComboBox
        Left = 100
        Width = 276
      end
      inherited edCodigo: TPatternEdit
        Width = 96
      end
      inherited Propiedades: TPropiedadesFrame
        ExtraCondition = ' AND se_usuariogenerico = '#39'N'#39' '
        FieldBaja = 'se_fechabaja'
        FieldCodigo = 'se_usuario'
        FieldDesc = 'se_nombre'
        FieldID = 'se_id'
        IdType = ctInteger
        TableName = 'use_usuarios'
      end
    end
    inline fraUsuarioWeb: TfraCodDesc [4]
      Left = 56
      Top = 40
      Width = 376
      Height = 23
      TabOrder = 4
      inherited cmbDescripcion: TArtComboBox
        Left = 100
        Width = 276
      end
      inherited edCodigo: TPatternEdit
        Width = 96
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'uw_fechabaja'
        FieldCodigo = 'uw_usuario'
        FieldDesc = 'uw_mail'
        FieldID = 'uw_id'
        IdType = ctInteger
        TableName = 'afi.auw_usuarioweb'
      end
    end
    inherited btnAceptar: TButton
      Left = 280
      Top = 98
      Width = 72
    end
    inherited btnCancelar: TButton
      Left = 360
      Top = 98
      Width = 72
    end
    object rbArt: TRadioButton
      Left = 56
      Top = 16
      Width = 48
      Height = 17
      Caption = 'ART'
      TabOrder = 2
      OnClick = rbArtClick
    end
    object rbWeb: TRadioButton
      Left = 120
      Top = 16
      Width = 48
      Height = 17
      Caption = 'WEB'
      TabOrder = 3
      OnClick = rbWebClick
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
