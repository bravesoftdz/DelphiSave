inherited frmManLiquidadores: TfrmManLiquidadores
  Left = 514
  Top = 189
  Caption = 'Mantenimiento de liquidadores'
  ExplicitLeft = 514
  ExplicitTop = 189
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
        FieldName = 'LIQUIDADOR'
        Title.Caption = 'Liquidador'
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
        FieldName = 'ASIGCASOS'
        Title.Caption = 'Coefic. de asignaci'#243'n'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LC_FECHABAJA'
        Title.Caption = 'Fecha Baja'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 123
    Width = 446
    Height = 185
    OnShow = fpAbmShow
    ExplicitLeft = 123
    ExplicitWidth = 446
    ExplicitHeight = 185
    inherited BevelAbm: TBevel
      Top = 149
      Width = 438
      ExplicitTop = 149
      ExplicitWidth = 438
    end
    object Label1: TLabel [1]
      Left = 21
      Top = 24
      Width = 49
      Height = 13
      Caption = 'Liquidador'
    end
    object Label2: TLabel [2]
      Left = 21
      Top = 59
      Width = 55
      Height = 13
      Caption = 'Tipo Liquid.'
    end
    inherited btnAceptar: TButton
      Left = 288
      Top = 155
      TabOrder = 3
      ExplicitLeft = 288
      ExplicitTop = 155
    end
    inherited btnCancelar: TButton
      Left = 366
      Top = 155
      TabOrder = 4
      ExplicitLeft = 366
      ExplicitTop = 155
    end
    inline fraLiquidador: TfraUsuarios
      Left = 76
      Top = 19
      Width = 351
      Height = 23
      TabOrder = 0
      ExplicitLeft = 76
      ExplicitTop = 19
      ExplicitWidth = 351
      inherited cmbDescripcion: TArtComboBox
        Width = 258
        ExplicitWidth = 258
      end
    end
    inline fraTipoLiquidacionABM: TfraCodigoDescripcion
      Left = 82
      Top = 52
      Width = 345
      Height = 23
      TabOrder = 1
      ExplicitLeft = 82
      ExplicitTop = 52
      ExplicitWidth = 345
      inherited cmbDescripcion: TArtComboBox
        Width = 280
        ExplicitWidth = 280
      end
    end
    object rgCoeficiente: TRadioGroup
      Left = 21
      Top = 87
      Width = 406
      Height = 41
      Caption = 'Coeficiente de asignaci'#243'n'
      Columns = 5
      Items.Strings = (
        '0'
        '1'
        '2'
        '3'
        '4')
      TabOrder = 2
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT lc_usuario liquidador, tl_descripcion tipoliq, '
      
        '             lc_factorasignacion asigcasos, lc_fechabaja, lc_id,' +
        ' '
      '             tl_codigo, tl_id'
      '  FROM din.dlc_liquidadorescasos, din.dtl_tipocasoliq'
      ' WHERE lc_idtipocaso = tl_id'
      '      AND lc_fechabaja IS NULL')
    object sdqConsultaLIQUIDADOR: TStringField
      FieldName = 'LIQUIDADOR'
      Required = True
    end
    object sdqConsultaTIPOLIQ: TStringField
      FieldName = 'TIPOLIQ'
      Required = True
      Size = 100
    end
    object sdqConsultaASIGCASOS: TFloatField
      FieldName = 'ASIGCASOS'
    end
    object sdqConsultaLC_FECHABAJA: TDateTimeField
      FieldName = 'LC_FECHABAJA'
    end
    object sdqConsultaLC_ID: TFloatField
      FieldName = 'LC_ID'
      Required = True
    end
    object sdqConsultaTL_CODIGO: TStringField
      FieldName = 'TL_CODIGO'
      Required = True
      Size = 2
    end
    object sdqConsultaTL_ID: TFloatField
      FieldName = 'TL_ID'
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
