inherited frmUsuariosPermisoTarifaMinima: TfrmUsuariosPermisoTarifaMinima
  Left = 252
  Top = 166
  Width = 632
  Caption = 'Usuarios con Permiso de Tarifa Minima en las Clonaciones'
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
        FieldName = 'um_usuario'
        Title.Caption = 'Usuario'
        Width = 152
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'um_usubaja'
        Title.Caption = 'Usuario de Baja'
        Width = 110
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'um_fechabaja'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha de Baja'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'um_usualta'
        Title.Caption = 'Usuario de Alta'
        Width = 129
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'um_fechaalta'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Alta'
        Width = 83
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 124
    Width = 440
    Height = 120
    Caption = 'Usuario Permiso TarifaMinima'
    BorderStyle = bsDialog
    ActiveControl = fraUsuario.edCodigo
    Constraints.MaxHeight = 120
    Constraints.MaxWidth = 440
    Constraints.MinHeight = 120
    Constraints.MinWidth = 440
    inherited BevelAbm: TBevel
      Top = 84
      Width = 432
    end
    object Label9: TLabel [1]
      Left = 8
      Top = 12
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    inline fraUsuario: TfraCodDesc [2]
      Left = 56
      Top = 8
      Width = 376
      Height = 23
      TabOrder = 2
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
        FieldID = 'se_usuario'
        TableName = 'use_usuarios'
      end
    end
    inherited btnAceptar: TButton [3]
      Left = 280
      Top = 90
      Width = 72
    end
    inherited btnCancelar: TButton
      Left = 360
      Top = 90
      Width = 72
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
