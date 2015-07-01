inherited frmUsuariosCasosMortales: TfrmUsuariosCasosMortales
  Left = 355
  Top = 156
  Caption = 'Mantenimiento de usuarios de casos mortales'
  ClientWidth = 660
  ExplicitLeft = 355
  ExplicitTop = 156
  ExplicitWidth = 668
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 660
    Height = 49
    Visible = True
    ExplicitWidth = 660
    ExplicitHeight = 49
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 311
      Height = 48
      Caption = 'Usuario'
      TabOrder = 0
      DesignSize = (
        311
        48)
      inline fraUsuariosFiltro: TfraCodigoDescripcion
        Left = 7
        Top = 15
        Width = 296
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 7
        ExplicitTop = 15
        ExplicitWidth = 296
        inherited cmbDescripcion: TArtComboBox
          Width = 231
          ExplicitWidth = 231
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 313
      Top = 1
      Width = 164
      Height = 48
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Sector'
      TabOrder = 1
      DesignSize = (
        164
        48)
      inline fraSectorFiltro: TfraCodigoDescripcion
        Left = 7
        Top = 15
        Width = 149
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 7
        ExplicitTop = 15
        ExplicitWidth = 149
        inherited cmbDescripcion: TArtComboBox
          Width = 84
          ExplicitWidth = 84
        end
      end
    end
    object rgVerBajas: TRadioGroup
      Left = 478
      Top = 1
      Width = 181
      Height = 48
      Anchors = [akTop, akRight]
      Caption = 'Ver Bajas'
      Columns = 3
      ItemIndex = 1
      Items.Strings = (
        'Si'
        'No'
        'Todos')
      TabOrder = 2
    end
  end
  inherited CoolBar: TCoolBar
    Top = 49
    Width = 660
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 656
      end>
    ExplicitTop = 49
    ExplicitWidth = 660
    inherited ToolBar: TToolBar
      Width = 647
      ExplicitWidth = 647
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 78
    Width = 660
    Height = 358
    OnDblClick = nil
    Columns = <
      item
        Expanded = False
        FieldName = 'UM_ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'UM_USUARIO'
        Title.Caption = 'Usuario'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SM_DESCRIPCION'
        Title.Caption = 'Sector'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UM_USUBAJA'
        Title.Caption = 'Usu Baja'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UM_FECHABAJA'
        Title.Caption = 'Fecha Baja'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Height = 121
    ExplicitHeight = 121
    inherited BevelAbm: TBevel
      Top = 85
      ExplicitTop = 85
    end
    object Label1: TLabel [1]
      Left = 21
      Top = 30
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    object Label2: TLabel [2]
      Left = 22
      Top = 59
      Width = 31
      Height = 13
      Caption = 'Sector'
    end
    inherited btnAceptar: TButton
      Top = 91
      ExplicitTop = 91
    end
    inherited btnCancelar: TButton
      Top = 91
      ExplicitTop = 91
    end
    inline fraUsuarios: TfraCodigoDescripcion
      Left = 82
      Top = 24
      Width = 351
      Height = 23
      TabOrder = 2
      ExplicitLeft = 82
      ExplicitTop = 24
      ExplicitWidth = 351
      inherited cmbDescripcion: TArtComboBox
        Width = 286
        ExplicitWidth = 286
      end
    end
    inline fraSector: TfraCodigoDescripcion
      Left = 82
      Top = 53
      Width = 351
      Height = 23
      TabOrder = 3
      ExplicitLeft = 82
      ExplicitTop = 53
      ExplicitWidth = 351
      inherited cmbDescripcion: TArtComboBox
        Width = 286
        ExplicitWidth = 286
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT um_id, um_usuario, sm_descripcion, um_usubaja, um_fechaba' +
        'ja'
      
        '           FROM din.dum_usuariosmortales, din.dsm_sectoresmortal' +
        'es'
      '          WHERE um_idsector = sm_id AND um_fechabaja IS NULL')
    object sdqConsultaUM_ID: TFloatField
      FieldName = 'UM_ID'
      Required = True
    end
    object sdqConsultaUM_USUARIO: TStringField
      FieldName = 'UM_USUARIO'
      Required = True
    end
    object sdqConsultaSM_DESCRIPCION: TStringField
      FieldName = 'SM_DESCRIPCION'
      Required = True
      Size = 100
    end
    object sdqConsultaUM_USUBAJA: TStringField
      FieldName = 'UM_USUBAJA'
    end
    object sdqConsultaUM_FECHABAJA: TDateTimeField
      FieldName = 'UM_FECHABAJA'
    end
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
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end>
    Left = 56
    Top = 316
  end
end
