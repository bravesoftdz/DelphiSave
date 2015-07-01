inherited frmUsuAvisoAuditoriaILT: TfrmUsuAvisoAuditoriaILT
  Left = 536
  Top = 139
  Caption = 'Mantenimiento de avisos de auditor'#237'a ILT'
  ClientWidth = 758
  ExplicitLeft = 536
  ExplicitTop = 139
  ExplicitWidth = 766
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 758
    Height = 41
    Visible = True
    ExplicitWidth = 758
    ExplicitHeight = 41
    object gbUsuario: TGroupBox
      Left = 512
      Top = 0
      Width = 245
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Usuario'
      TabOrder = 0
      DesignSize = (
        245
        40)
      inline fraUsuarioFiltro: TfraUsuario
        Left = 5
        Top = 14
        Width = 236
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 14
        ExplicitWidth = 116
        inherited cmbDescripcion: TArtComboBox
          Width = 152
          ExplicitWidth = 32
        end
      end
    end
    object gbMotivo: TGroupBox
      Left = 0
      Top = 0
      Width = 511
      Height = 40
      Caption = 'Motivo'
      TabOrder = 1
      inline fraMotivoFiltro: TfraCodigoDescripcion
        Left = 4
        Top = 12
        Width = 505
        Height = 23
        TabOrder = 0
        ExplicitLeft = 4
        ExplicitTop = 12
        ExplicitWidth = 505
        inherited cmbDescripcion: TArtComboBox
          Width = 438
          ExplicitWidth = 438
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 41
    Width = 758
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 752
      end>
    ExplicitTop = 41
    ExplicitWidth = 758
    inherited ToolBar: TToolBar
      Width = 743
      ExplicitWidth = 743
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 70
    Width = 758
    Height = 366
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    Columns = <
      item
        Expanded = False
        FieldName = 'UA_ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'UA_USUARIO'
        Title.Caption = 'Usuario'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MA_CODIGO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MA_DESCRIPCION'
        Title.Caption = 'Motivo Auditor'#237'a'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Tipo Siniestro'
        Width = -1
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'UA_FECHABAJA'
        Title.Caption = 'Fecha Baja'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 115
    Width = 430
    Height = 121
    ExplicitLeft = 115
    ExplicitWidth = 430
    ExplicitHeight = 121
    inherited BevelAbm: TBevel
      Top = 85
      Width = 422
      ExplicitTop = 117
      ExplicitWidth = 422
    end
    object Label1: TLabel [1]
      Left = 15
      Top = 24
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    object Label2: TLabel [2]
      Left = 15
      Top = 54
      Width = 32
      Height = 13
      Caption = 'Motivo'
    end
    inherited btnAceptar: TButton
      Left = 272
      Top = 91
      ExplicitLeft = 272
      ExplicitTop = 123
    end
    inherited btnCancelar: TButton
      Left = 350
      Top = 91
      ExplicitLeft = 350
      ExplicitTop = 123
    end
    inline fraUsuario: TfraUsuario
      Left = 62
      Top = 19
      Width = 355
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      ExplicitLeft = 62
      ExplicitTop = 19
      ExplicitWidth = 355
      inherited cmbDescripcion: TArtComboBox
        Width = 271
        ExplicitWidth = 271
      end
    end
    inline fraMotivo: TfraCodigoDescripcion
      Left = 61
      Top = 48
      Width = 357
      Height = 23
      TabOrder = 3
      ExplicitLeft = 61
      ExplicitTop = 48
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT ua_id, ua_usuario, ma_codigo, ma_descripcion,'
      '      ua_fechabaja'
      '  FROM din.dua_usuavisoauditoria, din.dma_motivoauditoria'
      ' WHERE ua_idmotivoaudit = ma_id')
    object sdqConsultaUA_ID: TFloatField
      FieldName = 'UA_ID'
      Required = True
    end
    object sdqConsultaUA_USUARIO: TStringField
      FieldName = 'UA_USUARIO'
      Required = True
    end
    object sdqConsultaMA_CODIGO: TStringField
      FieldName = 'MA_CODIGO'
      Required = True
      Size = 3
    end
    object sdqConsultaMA_DESCRIPCION: TStringField
      FieldName = 'MA_DESCRIPCION'
      Required = True
      Size = 150
    end
    object sdqConsultaUA_FECHABAJA: TDateTimeField
      FieldName = 'UA_FECHABAJA'
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
