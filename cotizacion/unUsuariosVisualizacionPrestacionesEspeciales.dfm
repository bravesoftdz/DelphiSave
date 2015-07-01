inherited frmUsuariosVisualizacionPrestacionesEspeciales: TfrmUsuariosVisualizacionPrestacionesEspeciales
  Left = 252
  Top = 166
  Width = 632
  Caption = 'Usuarios con Permiso de Visualizaci'#243'n de Prestaciones Especiales'
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
        FieldName = 'canal'
        Title.Caption = 'Canal'
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'entidad'
        Title.Caption = 'Entidad'
        Width = 165
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'usuariosuscripciones'
        Title.Caption = 'Usuario Suscripciones'
        Width = 155
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'usuarioweb'
        Title.Caption = 'Usuario Web'
        Width = 136
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pe_usualta'
        Title.Caption = 'Usuario Alta'
        Width = 129
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'pe_fechaalta'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Alta'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pe_usubaja'
        Title.Caption = 'Usuario Baja'
        Width = 129
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'pe_fechabaja'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Baja'
        Width = 117
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 116
    Top = 112
    Width = 416
    Height = 280
    Caption = 'Usuario Permiso Descuento'
    BorderStyle = bsDialog
    inherited BevelAbm: TBevel
      Top = 244
      Width = 408
    end
    inherited btnAceptar: TButton
      Left = 256
      Top = 250
      Width = 72
    end
    inherited btnCancelar: TButton
      Left = 336
      Top = 250
      Width = 72
    end
    object rgTipo: TRadioGroup
      Left = 8
      Top = 8
      Width = 400
      Height = 40
      Columns = 2
      Items.Strings = (
        'Por Entidad'
        'Por Usuario')
      TabOrder = 2
      OnClick = rgTipoClick
    end
    object gbPorEntidad: TGroupBox
      Left = 8
      Top = 56
      Width = 400
      Height = 80
      Caption = ' Por Entidad '
      TabOrder = 3
      object Label2: TLabel
        Left = 21
        Top = 20
        Width = 27
        Height = 13
        Caption = 'Canal'
      end
      object Label3: TLabel
        Left = 12
        Top = 48
        Width = 36
        Height = 13
        Caption = 'Entidad'
      end
      inline fraCanal: TfraCanal
        Left = 56
        Top = 16
        Width = 336
        Height = 23
        TabOrder = 0
        inherited cmbDescripcion: TComboGrid
          Width = 273
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja')
          ColWidths = (
            40
            300
            -1
            -1)
        end
      end
      inline fraEntidad: TfraEntidades
        Left = 56
        Top = 44
        Width = 336
        Height = 23
        TabOrder = 1
        inherited cmbDescripcion: TArtComboBox
          Width = 271
        end
      end
    end
    object gbPorUsuario: TGroupBox
      Left = 8
      Top = 144
      Width = 400
      Height = 80
      Caption = ' Por Usuario '
      TabOrder = 4
      object Label4: TLabel
        Left = 12
        Top = 48
        Width = 36
        Height = 13
        Caption = 'Usuario'
      end
      object Label1: TLabel
        Left = 17
        Top = 20
        Width = 31
        Height = 13
        Caption = 'Origen'
      end
      inline fraUsuarioArt: TfraCodDesc
        Left = 56
        Top = 44
        Width = 336
        Height = 23
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Left = 100
          Width = 232
        end
        inherited edCodigo: TPatternEdit
          Width = 96
          MaxLength = 20
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
      inline fraUsuarioWeb: TfraCodDesc
        Left = 56
        Top = 44
        Width = 336
        Height = 23
        TabOrder = 1
        inherited cmbDescripcion: TArtComboBox
          Left = 100
          Width = 232
        end
        inherited edCodigo: TPatternEdit
          Width = 96
          MaxLength = 20
        end
        inherited Propiedades: TPropiedadesFrame
          FieldBaja = 'uw_fechabaja'
          FieldCodigo = 'uw_usuario'
          FieldDesc = 'uw_mail'
          FieldID = 'uw_usuario'
          TableName = 'afi.auw_usuarioweb'
        end
      end
      object rbArt: TRadioButton
        Left = 56
        Top = 20
        Width = 48
        Height = 17
        Caption = 'ART'
        TabOrder = 2
        OnClick = rbArtClick
      end
      object rbWeb: TRadioButton
        Left = 112
        Top = 20
        Width = 48
        Height = 17
        Caption = 'WEB'
        TabOrder = 3
        OnClick = rbWebClick
      end
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
