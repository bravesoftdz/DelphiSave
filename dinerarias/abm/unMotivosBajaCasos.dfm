inherited frmMotivosBajaCasos: TfrmMotivosBajaCasos
  Left = 580
  Top = 200
  Caption = 'Motivos de baja de casos'
  ExplicitLeft = 580
  ExplicitTop = 200
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Height = 50
    Visible = True
    ExplicitHeight = 50
    object GroupBox1: TGroupBox
      Left = 2
      Top = 1
      Width = 383
      Height = 48
      Caption = 'Tipo Liquidaci'#243'n'
      TabOrder = 0
      DesignSize = (
        383
        48)
      inline fraTipoLiquidacion: TfraCodigoDescripcion
        Left = 7
        Top = 15
        Width = 368
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 7
        ExplicitTop = 15
        ExplicitWidth = 368
        inherited cmbDescripcion: TArtComboBox
          Width = 303
          ExplicitWidth = 303
        end
      end
    end
    object rgVerBajas: TRadioGroup
      Left = 388
      Top = 1
      Width = 181
      Height = 48
      Caption = 'Ver Bajas'
      Columns = 3
      ItemIndex = 1
      Items.Strings = (
        'Si'
        'No'
        'Todos')
      TabOrder = 1
    end
  end
  inherited CoolBar: TCoolBar
    Top = 50
    ExplicitTop = 50
    inherited ToolBar: TToolBar
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 79
    Height = 357
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Caption = 'C'#243'digo'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOLIQ'
        Title.Caption = 'Tipo Liquidaci'#243'n'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTIVO'
        Title.Caption = 'Motivo'
        Width = 400
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ML_FECHABAJA'
        Title.Caption = 'Fecha Baja'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 123
    Top = 128
    Height = 153
    OnShow = fpAbmShow
    ExplicitLeft = 123
    ExplicitTop = 128
    ExplicitHeight = 153
    inherited BevelAbm: TBevel
      Top = 117
      ExplicitTop = 117
    end
    object Label2: TLabel [1]
      Left = 21
      Top = 51
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object Label1: TLabel [2]
      Left = 21
      Top = 81
      Width = 55
      Height = 13
      Caption = 'Tipo Liquid.'
    end
    object Label3: TLabel [3]
      Left = 21
      Top = 23
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    inherited btnAceptar: TButton
      Top = 123
      ExplicitTop = 123
    end
    inherited btnCancelar: TButton
      Top = 123
      ExplicitTop = 123
    end
    inline fraTipoLiquidacionABM: TfraCodigoDescripcion
      Left = 82
      Top = 75
      Width = 351
      Height = 23
      TabOrder = 2
      ExplicitLeft = 82
      ExplicitTop = 75
      ExplicitWidth = 351
      inherited cmbDescripcion: TArtComboBox
        Width = 286
        ExplicitWidth = 286
      end
    end
    object edCodigo: TEdit
      Left = 83
      Top = 18
      Width = 50
      Height = 21
      MaxLength = 2
      TabOrder = 3
    end
    object edDescripcion: TEdit
      Left = 83
      Top = 46
      Width = 350
      Height = 21
      TabOrder = 4
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT tl_descripcion tipoliq, ml_codigo codigo, ml_descripcion ' +
        'motivo, '
      '             ml_fechabaja, ml_id, ml_idtipocaso'
      '  FROM din.dml_motivobajaliq, din.dtl_tipocasoliq'
      ' WHERE ml_idtipocaso = tl_id'
      '       AND ml_fechabaja IS NULL')
    object sdqConsultaTIPOLIQ: TStringField
      FieldName = 'TIPOLIQ'
      Required = True
      Size = 100
    end
    object sdqConsultaCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 2
    end
    object sdqConsultaMOTIVO: TStringField
      FieldName = 'MOTIVO'
      Required = True
      Size = 500
    end
    object sdqConsultaML_FECHABAJA: TDateTimeField
      FieldName = 'ML_FECHABAJA'
    end
    object sdqConsultaML_ID: TFloatField
      FieldName = 'ML_ID'
      Required = True
    end
    object sdqConsultaML_IDTIPOCASO: TFloatField
      FieldName = 'ML_IDTIPOCASO'
      Required = True
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
